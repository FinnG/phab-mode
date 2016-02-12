(require 'json)
(require 'url)


(setq phab-mode-cert  (concat "e5lzmmsjufkp5tcyx5s2ctnmre3ewdt3x46efi7asmz2rxur654gen6"
                              "h2evp5sueysng6pp7neb2rk5fmyp4bea2wbok573gacipj26xudjwaq"
                              "voltuxflighwezh6umhexgxaq56el4d6nqvkzqm6hwy3g455ae66hn2"
                              "uouds47ndinlszx54s3dhvpzzz3gebgevxyvyr7gz2tmumszt74anrf"
                              "w47uza26p3sxehxwgueroq3sv6eoai6frri")
      phab-mode-user "fgrimwood"
      phab-mode-url "http://phabricator")

;;;;;;;;;;;;;;;;;;:TODO sort this code out

(setq phab-mode-keymap (make-sparse-keymap))
(define-key phab-mode-keymap (kbd "TAB") 'outline-toggle-children)

(define-derived-mode phab-mode outline-mode "phab-task"
  (turn-on-auto-fill)
  (use-local-map phab-mode-keymap))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun phab-http-request (url args)
  (let* ((url-request-method "POST")
         (url-request-extra-headers '(("Content-Type" . "application/json")))
         (url-request-data (mapconcat (lambda (arg)
                                        (concat (url-hexify-string (car arg))
                                                "="
                                                (url-hexify-string (cdr arg))))
                                      args
                                      "&")))

    (with-current-buffer (url-retrieve-synchronously url)
      (goto-char (+ 1 url-http-end-of-headers))
      (json-read-object))))


(defun phab-connect ()
  "Return a Phabricator connection. TODO: document the returned alist"
  (let* ((token (format-time-string "%s"))
         (signature (secure-hash 'sha1 (concat token phab-mode-cert)))

         (phab-params (list '("client" . "phabricator.el")
                       '("clientVersion" . 0)
                       (cons "host" phab-mode-url)
                       (cons "user" phab-mode-user)
                       (cons "authToken" token)
                       (cons "authSignature" signature)))

         (post-params (list '("post" . "1")
                            '("__conduit__" . "true")
                            (cons "params" (json-encode-alist phab-params))))

         (response-data (phab-http-request "http://phabricator/api/conduit.connect" post-params)))

    (cdr (assoc 'result response-data))))

(defun phab-sanitize-string (str)
  (setq-local str (replace-regexp-in-string "\*" "-" str)))

(defun phab-print-comment (transaction)
  (let* ((phid  (cdr (assoc 'authorPHID transaction)))
         (name (phab-get-user phid)))
    (format "*** %s wrote:\n%s\n"
            name
            (phab-sanitize-string (cdr (assoc 'comments transaction))))))

(defun phab-print-title (bug-number title-transaction desc-transaction)
  (format "* T%d %s\n** Description\n%s\n"
          bug-number
          (cdr (assoc 'newValue title-transaction))
          (phab-sanitize-string (cdr (assoc 'newValue desc-transaction)))))

(defun phab-print-transaction (transaction)
  (let* ((type (cdr (assoc 'transactionType transaction))))
    (if (string= type "core:comment")
        (phab-print-comment transaction))))

(defun phab-get-last-transaction (type transactions)
  (catch 'last-transaction
    (dotimes (i (length transactions) nil)
      (let* ((transaction (aref transactions (- (length transactions) 1 i)))
             (loop-type (cdr (assoc 'transactionType transaction))))
        (if (string= type loop-type)
            (throw 'last-transaction transaction))))))

(setq phab-user-cache '())

(defun phab-get-user (user-id)
  "TODO"
  (catch 'out
    (if (assoc user-id phab-user-cache)
        (throw 'out (cdr (assoc user-id phab-user-cache))))
    (let* ((params (list (cons "phids" (list user-id))
                         (cons "__conduit__" phab-connection)))

           (post-params (list '("post" . "1")
                              '("output" . "json")
                              (cons "params" (json-encode-alist params))))

           (response-data (phab-http-request "http://phabricator/api/user.query"
                                             post-params))

           (username (cdr (assoc 'realName (aref (cdr (assoc 'result response-data)) 0)))))
      (add-to-list 'phab-user-cache (list user-id username))
      (throw 'out username))))

(defun phab-get-task-full (bug-number)
  "TODO"
  (interactive "nEnter bug number:")
  (let* ((params (list (cons "ids" (list bug-number))
                       (cons "__conduit__" phab-connection)))

         (post-params (list '("post" . "1")
                            '("output" . "json")
                            ;(cons "__conduit__" (json-encode-alist connection))
                            (cons "params" (json-encode-alist params))))

         (response-data (phab-http-request "http://phabricator/api/maniphest.gettasktransactions"
                                           post-params))

         (bug-data (cdr (car (cdr (assoc 'result response-data)))))
    
         (result-buffer (get-buffer-create (format "*Phabricator: T%s (long)*"
                                                   bug-number))))

    (set-buffer result-buffer)
    (setq-local buffer-read-only nil)
    (erase-buffer)
    (turn-on-auto-fill)

    (let ((title-transaction (phab-get-last-transaction "title" bug-data))
          (desc-transaction (phab-get-last-transaction "description" bug-data)))
      (insert (phab-print-title bug-number title-transaction desc-transaction)))

    (insert "** Comments\n")
    
    (dotimes (i (length bug-data) nil)
      (let* ((transaction (aref bug-data i))
             (type (cdr (assoc 'transactionType transaction))))
        (if (string= type "core:comment")
            (insert (phab-print-comment transaction)))))

    (do-auto-fill)

    (switch-to-buffer result-buffer)
    (phab-mode)))

(setq phab-connection (phab-connect))
(message "%s" phab-connection)

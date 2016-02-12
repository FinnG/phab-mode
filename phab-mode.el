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

(defun phab-print-comment (transaction)
  (let* ((phid  (cdr (assoc 'authorPHID transaction)))
         (name (phab-get-user phid)))
    (format "** %s wrote:\n%s\n" name (cdr (assoc 'comments transaction)))))

(defun phab-print-title (bug-number transaction)
  (format "* T%d %s\n" bug-number (cdr (assoc 'newValue transaction))))

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

(defun phab-get-user (user-id)
  "TODO"
  (let* ((params (list (cons "phids" (list user-id))
                       (cons "__conduit__" phab-connection)))

         (post-params (list '("post" . "1")
                            '("output" . "json")
                            (cons "params" (json-encode-alist params))))

         (response-data (phab-http-request "http://phabricator/api/user.query"
                                           post-params))

         (username (cdr (assoc 'realName (aref (cdr (assoc 'result response-data)) 0)))))
    (format "%s" username)))

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

    (insert (phab-print-title bug-number (phab-get-last-transaction "title" bug-data)))
    (dotimes (i (length bug-data) nil)
      (let* ((transaction (aref bug-data i))
             (type (cdr (assoc 'transactionType transaction))))
        (if (string= type "core:comment")
            (insert (phab-print-comment transaction)))))

    (do-auto-fill)

    (switch-to-buffer result-buffer)
    (phab-mode)))

(defun phab-get-task (bug-number)
  "TODO"
  (interactive "nEnter bug number:")
  (let* ((params (list (cons "task_id" bug-number)
                       (cons "__conduit__" phab-connection)))

         (post-params (list '("post" . "1")
                            '("output" . "json")
                            ;(cons "__conduit__" (json-encode-alist connection))
                            (cons "params" (json-encode-alist params))))

         (response-data (phab-http-request "http://phabricator/api/maniphest.info"
                                           post-params))

         (bug-data (assoc 'result response-data))

         (result-buffer (get-buffer-create (format "*Phabricator: T%s*"
                                                   bug-number))))

    (set-buffer result-buffer)
    (setq-local buffer-read-only nil)
    (erase-buffer)
    (insert "* " (cdr (assoc 'objectName bug-data))
            " - " (cdr (assoc 'title bug-data)))
    (insert "\n** Description:\n")
    (insert (replace-regexp-in-string "\*"
                                      "-"
                                      (cdr (assoc 'description bug-data))))
    (message "%s" bug-data)
    (switch-to-buffer result-buffer)
    (phab-mode)))


(setq phab-connection (phab-connect))
(message "%s" phab-connection)

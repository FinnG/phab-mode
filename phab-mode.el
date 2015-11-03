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

(setq phab-connection (phab-connect))

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

    ;; (let* ((result (s-url-http-post "http://phabricator/api/conduit.connect" post-params))
    ;;        (session-key (assoc 'sessionKey result))
    ;;        (connection-id (assoc 'connectionID result)))
    ;;   (message (format "session-key %s" session-key))
    ;;   (message (format "connection-id %s" connection-id))
    ;;   (list session-key connection-id)))) ;Construct an alist to return

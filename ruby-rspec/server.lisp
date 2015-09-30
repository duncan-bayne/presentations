(require 'elnode)

(setq org-present-port 8009)
(setq org-present-host "10.10.10.230")

(setq
 org-present-html
      "<!doctype html>
       <style type=\"text/css\">
         a {
           font-size: 8em;
           margin-right: 1em;
         }
       </style>
       <html>
         <body>
           <a href=\"/prev\">Prev</a>
           <a href=\"/next\">Next</a>
         </body>
       </html>")

(setq elnode-error-log-to-messages nil)

(defun org-present-prev-handler (httpcon)
  (with-current-buffer (get-buffer "ruby-rspec.org") (org-present-prev))
  (elnode-http-start httpcon 200 '("Content-type" . "text/html"))
  (elnode-http-return httpcon org-present-html))

(defun org-present-next-handler (httpcon)
  (with-current-buffer (get-buffer "ruby-rspec.org") (org-present-next))
  (elnode-http-start httpcon 200 '("Content-type" . "text/html"))
  (elnode-http-return httpcon org-present-html))

(defun org-present-default-handler (httpcon)
  (elnode-http-start httpcon 200 '("Content-type" . "text/html"))
  (elnode-http-return httpcon org-present-html))

(setq
 org-present-routes
  '(("^.*//prev$" . org-present-prev-handler)
    ("^.*//next$" . org-present-next-handler)
    ("^.*//$" . org-present-default-handler)))

(defun org-present-root-handler (httpcon)
  (elnode-hostpath-dispatcher httpcon org-present-routes))

(elnode-stop 8009)
(elnode-start 'org-present-root-handler :port org-present-port :host org-present-host)

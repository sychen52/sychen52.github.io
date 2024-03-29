;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path.
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

(require 'org)
(require 'ox-publish)

(message "org-mode version: %s" org-version)

(setq org-html-html5-fancy t                  ;; Use HTML5-style elements
      org-html-validation-link nil            ;; Don't show validation link
      org-html-head-include-scripts nil       ;; Use our own scripts
      org-html-head-include-default-style nil ;; Use our own styles
      org-html-head "<link rel=\"stylesheet\" type=\"text/css\" href=\"https://orgmode.org/worg/style/worg.css\"/>")


(setq org-publish-project-alist
      '(("org" :components ("org-site:main" "org-static"))
        ("org-static"
         :base-directory "./content"
         :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
         :publishing-directory "./public"
         :recursive t
         :publishing-function org-publish-attachment)
        ("org-site:main"
         :recursive t
         :base-directory "./content"
         :publishing-function org-html-publish-to-html
         :publishing-directory "./public"
         :with-author nil           ;; Don't include author name
         :with-creator nil          ;; Include Emacs and Org versions in footer
         :section-numbers nil       ;; Don't include section numbers
         :time-stamp-file nil)))    ;; Don't include time stamp in file

(org-publish-all t)

(provide 'build-site)
;;; build-site.el ends here

;; This is not used. Try: ~/.emacs
(message "Are we here? init.el")

;; Type U after (package-list-packages)
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; https://github.com/hvesalai/emacs-scala-mode
(use-package scala-mode
  :interpreter
    ("scala" . scala-mode))

;; 

;; See some of the stuff I did once and it seems we don't need to re-do them as they are remembered somehow: ~/.emacs.d/init.el

;; also see: ~/defter/.emacs

(message "Are we here? .emacs")

(setq inhibit-startup-message t)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(set-fringe-mode 10)
(menu-bar-mode -1)
(setq visible-bell t)
(set-face-attribute 'default nil :font "Monaco" :height 160)
;(load-theme 'tango-dark)
(load-theme 'wombat)

;; Initialize package sources
(require 'package)
(setq package-archives '( ("org" . "https://orgmode.org/elpa/")
			  ("melpa" . "https://melpa.org/packages/")
                          ("melpa-stable" . "https://stable.melpa.org/packages/")
                          ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))
(require 'use-package)
;; Uncomment this to get a reading on packages that get loaded at startup
(setq use-package-verbose t)
(setq use-package-always-ensure t)
;; do: (global-command-log-mode 'toggle) and (clm/toggle-command-log-buffer nil)
(use-package command-log-mode)

(use-package counsel)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-f" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;(ido-mode 't)
(global-set-key "o" (quote other-frame))
(global-set-key "c" (quote find-file-at-point))
(global-set-key "" (quote compare-windows))
(global-set-key "g" (quote goto-line))

;; used to be: (quoted-insert ARG)
;; (global-set-key "" (quote quoted-insert))
(global-set-key "" (quote bb-scroll-one-line-down))
;; used to be: (suspend-frame)
(global-set-key "" (quote bb-scroll-one-line-up))
(global-set-key "p" (quote bb-previous-window))
;; used to be other-window
(global-set-key "o" (quote bb-next-window))

;;(find-file "/Users/ben/Desktop/HM-coken-kirallik")
;;(make-frame)
;;(find-file "/Users/ben/Desktop/HM-failed-kingdom")

(fset 'bb-send-cmd-to-other-buf
      [?\C-  ?\C-e escape ?w ?\C-x ?o ?\C-y return ?\C-x ?o ?\C-x ?\C-x ?\C-n])
(defun bb-load-myfiles ()
  "Load my favorite files"
  (interactive)
  (load "~/.emacs.d/myfiles.el"))

;;used to be ido-insert-file:
(global-set-key "i" (quote bb-send-cmd-to-other-buf))
;;used to be set-fill-column
(global-set-key "f" (quote bb-load-myfiles))
;; used to be ido-list-directory
(global-set-key "" (quote ediff-buffers))

(add-to-list 'auto-mode-alist '("\\.sc\\'" . scala-mode))
(add-to-list 'auto-mode-alist '("\\.kojo\\'" . scala-mode))

(defun bb-previous-window ()
  "Select the window above or to the left of the window now selected.
From the window at the upper left corner, select the one at the lower right."
  (interactive)
  (select-window (previous-window)))

(defun bb-next-window ()
  "Select the window below or to the right of the window now selected.
From the window at the lower right corner, select the one at the upper left."
  (interactive)
  (select-window (next-window)))

(defun bb-scroll-one-line-up (&optional arg)
  "Scroll the selected window up (forward in the text) one line (or N lines)."
  (interactive "p")
  (scroll-up (or arg 1)))

(defun bb-scroll-one-line-down (&optional arg)
  "Scroll the selected window down (backward in the text) one line (or N)."
  (interactive "p")
  (scroll-down (or arg 1)))

(defun bb-line-to-top-of-window ()
  "Scroll the selected window up so that the current line is at the top."
  (interactive)
  (recenter 0))

;;-------------------------------------------------------------------
;;-------------------------------------------------------------------
;; do % parenthesis matching in emacs, as in vi
;; <From Eric Hendrickson edh@med.umn.edu>
(defun bb-match-paren (arg)
  "Go to the matching parenthesis if on parenthesis."
  (interactive "p")
  (cond ((looking-at "[([{]") (forward-sexp 1) (backward-char))
        ((looking-at "[])}]") (forward-char) (backward-sexp 1))))
(global-set-key [(control %)] (quote bb-match-paren))
;; (global-set-key  "\C-a" 'forward-sexp)  ;; define forward paren match
;; (global-set-key  "\C-q" 'backward-sexp) ;; define backward paren match
;;-------------------------------------------------------------------

;; bbx: KEEP THE FOLLOWING AT THE END (?)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-command-log-mode t)
 '(package-selected-packages
   '(magit counsel ivy use-package scala-mode command-log-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

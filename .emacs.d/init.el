;;; this loads the package manager
(require 'package)

;;; here there's a variable named package-archives, and we are adding the MELPA repository to it
;;(add-to-list 'package-archives
;;             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")
                         ("tromey"    . "http://tromey.com/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

;;; loads packages and activates them
(package-initialize)

(require 'evil)
(evil-mode t)

;; Don't use messages that you don't read
(setq initial-scratch-message "")
(setq inhibit-startup-message t)

;; Who use the bar to scroll?
(scroll-bar-mode 0)

;; Org mode
(require 'org)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)

;; Auto indent
(electric-indent-mode +1)


;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

(load-theme 'solarized-light t)

;; python.el
;; Ignoring electric indentation
(defun electric-indent-ignore-python (char)
  "Ignore electric indentation for python-mode"
  (if (equal major-mode 'python-mode)
      `no-indent'
    t))
(add-to-list 'electric-indent-functions 'electric-indent-ignore-python)

;; Enter key executes newline-and-indent
(defun set-newline-and-indent ()
  "Map the return key with `newline-and-indent'"
  (local-set-key (kbd "RET") 'newline-and-indent))
(add-hook 'python-mode-hook 'set-newline-and-indent)

;; eply
(package-initialize)
(elpy-enable)
(setq elpy-rpc-backend "jedi")

;; jedi
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:setup-keys t)                      ; optional
;;(setq jedi:complete-on-dot t)                 ; optional

;; find file in repository
(global-set-key (kbd "C-x f") 'find-file-in-repository)

;; mmm mode
(require 'mmm-auto)
(add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
(mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)

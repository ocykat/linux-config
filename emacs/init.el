;; PACKAGES {{{
;; Package archives
(require 'package)
;; (setq package-enable-at-startup nil)

; (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/")
;                                '("gnu" . "https://elpa.gnu.org/packages/")
;                                '("org" . "http://orgmode.org/elpa/"))

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu" . "https://elpa.gnu.org/packages/")
        ("org" . "http://orgmode.org/elpa/")))

(package-initialize)

;; "evil" - Evil mode, the cure for my Vim addiction
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)
;; }}}

;; "use-package" - install other packages
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

;; "try" - try other packages
(use-package try
    :ensure t)

;; "which-key" - help with remembering keys
(use-package which-key
    :ensure t
    :config
        (which-key-mode))

;; "doom-themes" - theme packet containing one-dark
(use-package doom-themes
    :ensure t)
(require 'doom-themes)
(load-theme 'doom-one t)

;; "smart-mode-line" - for a stylist mode line
(use-package smart-mode-line-atom-one-dark-theme
  :ensure t)

(use-package smart-mode-line
    :ensure t
    :config
        (setq sml/theme 'atom-one-dark)
        (setq sml/no-confirm-load-theme t)
        (sml/setup))

;; "companny" - autocompletion
(use-package company
    :ensure t
    :defer t
    :init
        (global-company-mode)
    :config
        (setq company-dabbrev-downcase nil)
        (setq company-idle-delay 0.1)
        (setq company-selection-wrap-around t)
        (define-key company-active-map (kbd "ESC") 'company-abort)
        (define-key company-active-map [tab] 'company-complete-common-or-cycle)
        (define-key company-active-map (kbd "C-n") 'company-select-next)
        (define-key company-active-map (kbd "C-p") 'company-select-previous))

;; "org-bullets" - enhanced UI for orgmode
(add-to-list 'load-path "~/.emacs.d/packages/")
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; EDITOR {{{
;; == Font ==
(set-frame-font "Hack Nerd Font 11" nil t)

;; == Line numbers ==
(global-linum-mode t)

;; == Word wrap ==
(global-visual-line-mode t)

;; == Indentation ==
;; * Use spaces for indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
;; * C++ indentation setting
(defun my-c++-mode-hook ()
    (setq c-basic-offset 4)
    (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; * Shifting block keeping selection
(define-key evil-visual-state-map (kbd ">") 'my-evil-shift-right-visual)
(define-key evil-visual-state-map (kbd "<") 'my-evil-shift-left-visual)
;; (define-key evil-visual-state-map [tab] 'my-evil-shift-right-visual)
;; (define-key evil-visual-state-map [S-tab] 'my-evil-shift-left-visual)

(defun my-evil-shift-left-visual ()
    (interactive)
    (evil-shift-left (region-beginning) (region-end))
    (evil-normal-state)
    (evil-visual-restore))

(defun my-evil-shift-right-visual ()
    (interactive)
    (evil-shift-right (region-beginning) (region-end))
    (evil-normal-state)
    (evil-visual-restore))

;; * Resolve conflict of using tab for both indentation and auto-completion
(defun tab-indent-or-complete ()
    (interactive)
    (if (minibufferp)
        (minibuffer-complete)
        (if (or (not yas-minor-mode)
                (null (do-yas-expand)))
            (if (check-expansion)
                (company-complete-common)
            (indent-for-tab-command)))))

(global-set-key [backtab] 'tab-indent-or-complete)

;; }}}

;; UI {{{
;; Disable menubar
(menu-bar-mode -1)

;; Disable toolbar
(tool-bar-mode -1)

;; Add column number to mode line
(setq column-number-mode t)
;; }}}

;; CURSOR {{{
;; Disable cursor blinking
(blink-cursor-mode 0)

;; Evil-mode cursor
(setq evil-insert-state-cursor '(box "grey")
      evil-normal-state-cursor '(box "purple")
      evil-visual-state-cursor '(box "blue"))
;; }}}

;; OTHER PREFERENCES {{{
;; Start Emacs maximized
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Disable startup stuff
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Disable backup~ and #autosave# files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Set custom-file so that emacs will not create garbage in my init file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
;; }}}

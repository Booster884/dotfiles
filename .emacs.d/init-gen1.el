(setq inhibit-startup-message t)

;; Hides unwanted GUI stuff
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

(column-number-mode)
(global-display-line-numbers-mode t)
(setq-default display-line-numbers-width 3)

(global-auto-revert-mode 1)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-face-attribute 'default nil :font "JetBrains Mono" :height 100)
;; (set-face-attribute 'default nil :font "Monoid" :height 90)
;; (set-face-attribute 'default nil :font "Iosevka" :height 100)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Make mousewheel act a little less jankily
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))
      mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-conservatively 10000
      auto-window-vscroll nil
      scroll-step 1
      scroll-margin 3)

;; Disable autosaves and backups
(setq
 make-backup-files nil
 auto-save-default nil
 create-lockfiles nil)

;; Temp files for custom so that doesn't mess with this config
(setq custom-file (make-temp-file ""))
;; Unsafe, but saves headache caused by custom themes and the line above
(setq custom-safe-themes t)

;; Initialize package sources
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)
(unless package-archive-contents
 (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
   (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(define-key evil-motion-state-map " " nil)

(use-package evil-collection
  :after evil
  :config (evil-collection-init))

(use-package evil-commentary
  :config
  (evil-commentary-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-ibuffer)
	 ("C-x C-b" . counsel-switch-buffer)
	 ("C-x C-f" . counsel-find-file)
	 :map minibuffer-local-map
	 ("C-r" . counsel-minibuffer-history))
  :config (setq ivy-initial-inputs-alist nil))

(use-package ivy
  :init
  (ivy-mode 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package helpful
  :commands (helpful-callable helpful-variable helpful-command helpful-key)
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package which-key
  :init (which-key-mode)
  :diminish
  :config (setq which-key-idle-delay 1))

(use-package doom-themes)
(load-theme 'doom-horizon t)

(use-package all-the-icons)
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 12))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package highlight-indent-guides
  :custom (highlight-indent-guides-method 'character)
  :hook (prog-mode . highlight-indent-guides-mode))

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))
  :init (setq markdown-command "multimarkdown"))

(use-package shell-pop
  :bind ("C-\\" . shell-pop)
  :config
  (setq shell-pop-term-shell "/bin/zsh")
  (shell-pop--set-shell-type 'shell-pop-shell-type shell-pop-shell-type))

(define-key evil-normal-state-map (kbd "C-\\") 'shell-pop)
(define-key evil-insert-state-map (kbd "C-\\") 'shell-pop)

(use-package slime
  :config
  (setq inferior-lisp-program "sbcl"))

(use-package fzf)

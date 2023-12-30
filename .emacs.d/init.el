;;; UI config

(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq use-file-dialog nil)

(blink-cursor-mode -1)

(setq line-number-mode t)
(setq column-number-mode t)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq-default display-line-numbers-width 3)

;;; Bootstrap straight.el (package manager)

(defvar bootstrap-version)
(let ((bootstrap-file
    (expand-file-name
      "straight/repos/straight.el/bootstrap.el"
      (or (bound-and-true-p straight-base-dir)
        user-emacs-directory)))
    (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
       'silent 'inhibit-cookies)
    (goto-char (point-max))
    (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)

(setq straight-use-package-by-default t)
;; (setq use-package-always-defer t) ; Lazy load packages

(use-package emacs
  :init
  (defalias 'yes-or-no-p 'y-or-n-p)
  (global-set-key (kbd "<escape>") 'keyboard-escape-quit)

  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)

  (setq make-backup-files nil
        auto-save-default nil
        create-lockfiles nil)

  (set-face-attribute 'default nil
    :font "Iosevka slab"
    :height 100))

(add-hook 'server-after-make-frame-hook
          (lambda ()
            (set-face-attribute 'default nil
              :font "Iosevka slab"
              :height 100)))

(use-package evil
  :demand
  :init
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package evil-commentary
  :demand
  :config
  (evil-commentary-mode))
;; TODO: Doesn't quite handle empty lines in selection how I want it to,
;;       could check out alternatives...

(use-package which-key
  :demand
  :init
  (setq which-key-idle-delay 0.5)
  :config
  (which-key-mode))

(use-package general
  :demand
  :config
  (general-evil-setup)

  (general-create-definer leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  (leader-keys
    "x" '(execute-extended-command :which-key "execute command")
    "r" '(restart-emacs :which-key "restart emacs")
    "i" '((lambda () (interactive) (find-file user-init-file)) :which-key "open init.el")
    "d" 'toggle-debug-on-error

    "b" '(:ignore t :which-key "buffer")
    "bd" 'kill-current-buffer
    )

  )

(use-package doom-themes
  :demand
  :config
  (load-theme 'doom-monokai-pro t))

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))

;; (use-package nerd-icons)

(use-package projectile
  :demand
  :init
  (projectile-mode 1)
  :general
  (leader-keys
    "SPC" '(projectile-find-file :which-key "find file")

    "b b" '(projectile-switch-to-buffer :which-key "switch buffer")

    "p" '(:ignore t :which-key "projects")
    "p p" '(projectile-switch-project :which-key "switch project")
    "p a" '(projectile-add-known-project :which-key "add project")
    "p r" '(projectile-remove-known-project :which-key "remove project")))

(use-package ivy
  :config
  (ivy-mode))

;; (use-package vterm)

;; (use-package vterm-toggle
;;   :general
;;   (leader-keys
;;     "'" '(vterm-toggle :which-key "terminal")))

(use-package rust-mode
  :ensure t)

(use-package nix-mode)

;; (use-package eglot
;;   :hook ((python-mode rust-mode) . eglot)

;;   :custom
;;   (eglot-send-changes-idle-time 0.1)

;;   :config
;;   (fset #'jsonrpc--log-event #'ignore))

(use-package lsp-mode
  :commands
  (lsp lsp-deferred)
  :hook
  ((lsp-mode . lsp-enable-which-key-integration)
   ((rust-mode) . lsp-deferred))
  :general
  (leader-keys
    "l" '(:keymap lsp-command-map :which-key "lsp")
    "r" '(lsp-rename :which-key "rename"))
  (general-nmap
    "gr" 'lsp-find-references
    ; TODO use popup insead of buffer
    "," 'lsp-describe-thing-at-point))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp-deferred))))

;; (use-package lsp-nix
;;   :ensure t
;;   :after lsp-mode)

(use-package lsp-ui
  :hook
  (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-update-mode t))

(use-package magit
  :general
  (leader-keys
    "g" '(:ignore t :which-key "git")
    "g b" '(magit-blame :which-key "blame")
    "g g" '(magit-status :which-key "status")
    "g l" '(magit-log :which-key "log")))

(use-package diff-hl
  :init
  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  :config
  (global-diff-hl-mode))

(use-package hl-todo
  :hook
  (prog-mode . hl-todo-mode))

(use-package magit-todos
  :after magit
  :config (magit-todos-mode 1))

(setq eldoc-echo-area-use-multiline-p nil)

(use-package company
  :ensure t

  :hook (prog-mode . company-mode))

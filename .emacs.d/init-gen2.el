(setq initial-major-mode 'fundamental-mode)

;; Reload file when it changes
(setq auto-revert-interval 1)
(setq auto-revert-check-vc-info t)
(global-auto-revert-mode)

;; Context menu on right click
(when (display-graphic-p)
  (context-menu-mode))

;; Fix archaic defaults
(setq sentence-end-double-space nil)

;; Use <C-arrows> to move through windows
(windmove-default-keybindings 'control)

;; Don't litter file system with *~ backup files; put them all inside
;; ~/.emacs.d/backup or wherever
;; from emacs-bedrock
(defun bedrock--backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let* ((backupRootDir "~/.emacs.d/emacs-backup/")
         (filePath (replace-regexp-in-string "[A-Za-z]:" "" fpath )) ; remove Windows driver letter in path
         (backupFilePath (replace-regexp-in-string "//" "/" (concat backupRootDir filePath "~") )))
    (make-directory (file-name-directory backupFilePath) (file-name-directory backupFilePath))
    backupFilePath))
(setq make-backup-file-name-function 'bedrock--backup-file-name)

;; MELPA setup
(with-eval-after-load 'package
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t))


;;; Discoverability


;; Show possible continuations for key commands
(use-package which-key
  :ensure t
  :config
  (which-key-mode))


;;; Interface stuff


(blink-cursor-mode -1)

(setq line-number-mode t)
(setq column-number-mode t)

(load-theme 'modus-vivendi)

;; (set-face-attribute 'default nil :font "Jetbrains Mono" :height 100)
(set-face-attribute 'default nil :font "Iosevka slab" :height 100)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(setq-default display-line-numbers-width 3)

;; Remove some ui elements
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)


(use-package highlight-indent-guides
  :custom (highlight-indent-guides-method 'character)
  :hook (prog-mode . highlight-indent-guides-mode))


;;; Vim emulation


(use-package evil
  :ensure t

  :init
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-redo)
  
  :config
  (evil-mode)
  (evil-set-initial-state 'vterm-mode 'emacs))

(use-package evil-commentary
  :config
  (evil-commentary-mode))


;;; Development


(use-package emacs
  :hook
  (prog-mode . electric-pair-mode))


(use-package rust-mode
  :ensure t)

;; LSP
(use-package eglot
  ;; Configure hooks to automatically turn-on eglot for selected modes
  :hook ((python-mode . eglot)
	 (rust-mode . eglot))

  :custom
  (eglot-send-changes-idle-time 0.1)

  :config
  (fset #'jsonrpc--log-event #'ignore)  ; massive perf boost---don't log every event
  ;; Sometimes you need to tell Eglot where to find the language server
  ; (add-to-list 'eglot-server-programs
  ;              '(haskell-mode . ("haskell-language-server-wrapper" "--lsp")))
  )

(setq eldoc-echo-area-use-multiline-p nil)

;; Completions
(use-package company
  :ensure t

  :hook (prog-mode . company-mode))


;;; Custom, I'll just let this chill here.


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("dc8285f7f4d86c0aebf1ea4b448842a6868553eded6f71d1de52f3dcbc960039" default))
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(rustic eldoc-overlay company which-key use-package slime shell-pop rainbow-delimiters markdown-mode ivy-rich highlight-indent-guides helpful fzf evil-commentary evil-collection doom-themes doom-modeline counsel all-the-icons)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

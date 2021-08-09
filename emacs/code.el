;; based on ../old_emacs and https://quantumish.github.io/blog/emacsarticle.html
(load "~/.config/emacs/base.el")

;;; BEGIN QUANTUMISH INFLUENCE
(use-package lsp-mode
             :init
             ;; Disable annoying headerline
             (setq lsp-headerline-breadcrumb-enable nil)
             ;; Don't show unneeded function info in completions
             (setq lsp-completion-show-detail nil)
             ;; Disable annoying autoformatting!
             (setq-default lsp-enable-indentation nil)
             (setq-default lsp-enable-on-type-formatting nil)
             :commands lsp
             ;; Add languages of your choice!
             :hook ((c-mode . lsp)
                    (c++-mode . lsp)
                    (python-mode . lsp)
                    (typescript-mode . lsp)
                    (rust-mode . lsp)))

(use-package lsp-ui
             :after lsp
             :init
             (setq lsp-ui-doc-delay 5)
             :hook ((lsp-mode . lsp-ui-mode)))


(use-package company
             :init
             (setq company-idle-delay 0)
             (setq company-tooltip-maximum-width 40)
             :hook
             (prog-mode . company-mode))

(use-package company-quickhelp
             :after company
             :init (company-quickhelp-mode))

(use-package company-quickhelp-terminal
             :after company-quickhelp)

(use-package company-prescient
             :after company prescient
             :init
             (setq-default history-length 1000)
             (setq-default prescient-history-length 1000)
             :init (company-prescient-mode))

(use-package flycheck
             :config 
             (set-face-attribute 'flycheck-error nil :underline t)
             (set-face-attribute 'flycheck-warning nil :underline t)
             (set-face-attribute 'flycheck-info nil :underline t)
             (define-fringe-bitmap 'my-flycheck-fringe-indicator
                                   (vector #b00000000
                                           #b00000000
                                           #b00000000
                                           #b00000000
                                           #b00000000
                                           #b00000000
                                           #b00000000
                                           #b00011100
                                           #b00111110
                                           #b00111110
                                           #b00111110
                                           #b00011100
                                           #b00000000
                                           #b00000000
                                           #b00000000
                                           #b00000000
                                           #b00000000))
             (let ((bitmap 'my-flycheck-fringe-indicator))
               (flycheck-define-error-level 'error
                                            :severity 2
                                            :overlay-category 'flycheck-error-overlay
                                            :fringe-bitmap bitmap
                                            :error-list-face 'flycheck-error-list-error
                                            :fringe-face 'flycheck-fringe-error)
               (flycheck-define-error-level 'warning
                                            :severity 1
                                            :overlay-category 'flycheck-warning-overlay
                                            :fringe-bitmap bitmap
                                            :error-list-face 'flycheck-error-list-warning
                                            :fringe-face 'flycheck-fringe-warning)
               (flycheck-define-error-level 'info
                                            :severity 0
                                            :overlay-category 'flycheck-info-overlay
                                            :fringe-bitmap bitmap
                                            :error-list-face 'flycheck-error-list-info
                                            :fringe-face 'flycheck-fringe-info))
             :hook
             (prog-mode . flycheck-mode)
             (flycheck-mode . (lambda () (set-window-fringes nil 15 0))))



;; The ultimate Git porcelain.
(use-package magit)
;; Show all TODOs in a git repo
(use-package magit-todos)
;; Edit gitignores w/ highlighting
(use-package gitignore-mode)

;;; END QUANTUMISH INFLUENCE

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(setq-default tab-width 4)
(setq-default c-basic-offset 4)
(require 'undo-tree)

;; vim-isms
(use-package vimish-fold
  :ensure
  :after evil)
(use-package evil-vimish-fold
  :ensure
  :after vimish-fold
  :init
  (setq evil-vimish-fold-mode-lighter " ⮒")
  (setq evil-vimish-fold-target-modes '(prog-mode conf-mode text-mode))
  :config
  (global-evil-vimish-fold-mode))

;; indent guides
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; treesitter syntax highlighting
(require 'tree-sitter)
(require 'tree-sitter-langs)

;; visuals
(use-package hl-todo-mode
             :config
             (add-hook 'prog-mode-hook 'hl-todo-mode))


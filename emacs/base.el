;; based on ../old_emacs and https://quantumish.github.io/blog/emacsarticle.html

;;; BEGIN QUANTUMISH INFLUENCE
(setq package-archives '(("ELPA" . "https://tromey.com/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(eval-when-compile
  (require 'use-package))

;; Automatically install all packages if not present.
(setq use-package-always-ensure t)

;; Turn off all unnecessary GUI elements.
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; If you compiled with native compilation, turn off warning popups.
(setq warning-suppress-log-types '((comp)))

;; These keybinds suspend Emacs (in order to mimic terminal behavior).
;; This has *only* caused me trouble in GUI Emacs.
(if (display-graphic-p)
  (progn
    (global-unset-key (kbd "C-z"))
    (global-unset-key (kbd "C-x C-z"))))

;; Stop Emacs from bothering you about disabled commands.
(setq disabled-command-function nil)

;; Prevent any attempts to resize the frame.
(setq frame-inhibit-implied-resize t)

;; Stop Emacs from trying to use dialog boxes.
(setq use-dialog-box nil)

;; Prefer y/n over yes/no.
(fset 'yes-or-no-p 'y-or-n-p)

(use-package doom-themes
             :init
             (setq doom-themes-enable-bold t)
             (setq doom-themes-enable-italic t)
             ;; Flash modeline on error.
             (doom-themes-visual-bell-config)
             (doom-themes-org-config)
             ;; Set default theme.
             (load-theme 'doom-challenger-deep)
            :config
            ;; top padding https://www.reddit.com/r/emacs/comments/5ldmjh/
            (setq header-line-format "eeeeeeeeeeeeeeeeeeeeee")  ;; TODO: doesn't work
            (set-face-attribute 'header-line nil :background (face-background 'default) :height 200)
             )

;; Icons!
(use-package all-the-icons)

(use-package doom-modeline
             :init
             (setq doom-modeline-height 40)
             ;; Don't show text encoding by default.
             (setq doom-modeline-buffer-encoding nil)
             (doom-modeline-mode))

;; Add increased contrast to buffers with code.
(use-package solaire-mode
             :init
             (solaire-global-mode))

;; Tabs showing related buffers!
;(use-package centaur-tabs
;             :init
;             (setq centaur-tabs-height 16)
;             (setq centaur-tabs-style "bar")
;             (setq centaur-tabs-set-icons t)
;             (setq centaur-tabs-icon-scale-factor 0.7)
;             (setq centaur-tabs-set-bar 'left)
;             (setq x-underline-at-descent-line t)
;             (centaur-tabs-mode))

;; A nice file tree for Emacs.
(use-package treemacs
             :after doom-themes
             :init
             (doom-themes-treemacs-config)
             (setq doom-themes-treemacs-theme "doom-colors")
             (setq treemacs-width 30))

;; Icons for Treemacs!
(use-package treemacs-all-the-icons
             :after treemacs
             :init
             (treemacs-load-theme "all-the-icons"))

(use-package prescient
  :init (setq prescient-persist-mode t))

(use-package ivy
  :init
  (use-package counsel :config (counsel-mode 1))
  (use-package swiper :defer t)
  (ivy-mode 1)
  :bind
  (("C-s"     . swiper-isearch)
   ("M-x"     . counsel-M-x)
   ("C-x C-f" . counsel-find-file)))

(use-package ivy-rich
  :after ivy
  :init (ivy-rich-mode))

(use-package all-the-icons-ivy-rich
  :after ivy-rich counsel
  :init (all-the-icons-ivy-rich-mode))

(use-package ivy-prescient
  :after ivy prescient
  :init (ivy-prescient-mode))

(use-package marginalia
  :config (marginalia-mode))

(use-package helpful
  :init
  ;; Advise describe-style functions so that Helpful appears no matter what
  (advice-add 'describe-function :override #'helpful-function)
  (advice-add 'describe-variable :override #'helpful-variable)
  (advice-add 'describe-command :override #'helpful-callable)
  (advice-add 'describe-key :override #'helpful-key)
  (advice-add 'describe-symbol :override #'helpful-symbol)
  :config
  ;; Baseline keybindings, not very opinionated
  (global-set-key (kbd "C-h f") #'helpful-callable)
  (global-set-key (kbd "C-h v") #'helpful-variable)
  (global-set-key (kbd "C-h k") #'helpful-key)
  (global-set-key (kbd "C-c C-d") #'helpful-at-point)
  (global-set-key (kbd "C-h F") #'helpful-function)
  (global-set-key (kbd "C-h C") #'helpful-command)
  ;; Counsel integration
  (setq counsel-describe-function-function #'helpful-callable)
  (setq counsel-describe-variable-function #'helpful-variable))    

(use-package which-key
  :init (which-key-mode))
;;; END QUANTUMISH INFLUENCE

;; keybinds
(global-set-key (kbd "C-S-v") 'clipboard-yank)
(global-set-key (kbd "C-S-c") 'clipboard-kill-ring-save)

;;; clipboard (except keybinds, see keybind section)
(setq x-select-enable-clipboard nil) ; don't touch external clipboard, from https://stackoverflow.com/a/24209883

;; evil mode from https://www.reddit.com/r/emacs/comments/726p7i/evil_mode_and_use_package/
(use-package evil
  :ensure t ;; install the evil package if not installed
  :init ;; tweak evil's configuration before loading it
  ;(setq evil-search-module 'evil-search)
  ;(setq evil-ex-complete-emacs-commands nil)
  ;(setq evil-vsplit-window-right t)
  ;(setq evil-split-window-below t)
  ;(setq evil-shift-round nil)
  ;(setq evil-want-C-u-scroll t)
  (setq evil-want-keybinding nil)
  :config ;; tweak evil after loading it
  (evil-mode 1)
  (define-key evil-normal-state-map "x" nil)
  ;(evilem-default-keybindings "x") ; TODO this doesn't have the two-char search from easymotion.vim 2.0


  ;; example how to map a command in normal mode (called 'normal state' in evil)
  ;(define-key evil-normal-state-map (kbd ", w") 'evil-window-vsplit)
  )
(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

;; mouse/cursor
(setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering
(setq mouse-wheel-scroll-amount '(1)) ;; mouse scroll moves 1 line at a time, instead of 5 lines
(setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line

; olivetti
(load "~/.config/emacs/olivetti.el")
(add-hook 'prog-mode-hook  (lambda ()
						   (olivetti-mode 1)
							(olivetti-set-width 120)
						   ))

;; background
(setq make-backup-files nil)
(setq create-lockfiles nil)
(global-auto-revert-mode t)

;; ability to redo things
;(global-undo-tree-mode)
;(evil-set-undo-system 'undo-tree)

;;; font
(set-face-attribute 'default nil :height 150)
(set-face-attribute 'default t :font "Iosevka Term SS12" :weight 'light)
;; (set-face-attribute 'default t :font "Iosevka Term SS12" :weight 'light)
;; (set-face-attribute 'default t :font "Hack Nerd Font" :weight 'light)
;; (set-face-attribute 'default t :font "Roboto Mono" :weight 'light)
;; (set-face-attribute 'default t :font "Iosevka Nerd Font Mono:light") ; TODO: nerd font

;; gui
(global-display-line-numbers-mode t)
(setq display-line-numbers-width-start t)
(defun display-line-numbers-equalize ()
  "Equalize The width, ala https://emacs.stackexchange.com/a/55166"
  (setq display-line-numbers-width (length (number-to-string (line-number-at-pos (point-max))))))
(add-hook 'find-file-hook 'display-line-numbers-equalize)

;;; visuals - opacity transparency
(add-to-list 'default-frame-alist '(alpha . (92 . 80)))

;;; colors
(use-package rainbow-delimiters
             :config
	         (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
			 ;(add-hook 'org-mode-hook 'rainbow-delimeters-mode)
             )

;; editing
(use-package evil-surround              ; https://github.com/emacs-evil/evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))
(global-evil-surround-mode 1)

(with-eval-after-load 'evil-maps ; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode
  (define-key evil-motion-state-map (kbd "SPC") nil)
  (define-key evil-motion-state-map (kbd "RET") nil)
  (define-key evil-motion-state-map (kbd "TAB") nil))

(use-package yasnippet
  :init (yas-global-mode))

;(server-start)

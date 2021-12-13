;; based on ../old_emacs and https://quantumish.github.io/blog/emacsarticle.html
(load "~/.config/emacs/base.el")
(load "~/.config/emacs/math-at-point/math-at-point.el")

;; org + latex
(require 'org)
(setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))

(use-package org-superstar
             :init
             (add-hook 'org-mode-hook (lambda () (org-superstar-mode)))
             :config
             (custom-set-faces
               '(org-level-1 ((t (:inherit outline-1 :height 2.5))))
               '(org-level-2 ((t (:inherit outline-2 :height 2.1))))
               '(org-level-3 ((t (:inherit outline-3 :height 1.6))))
               '(org-level-4 ((t (:inherit outline-4 :height 1.2))))
               '(org-level-5 ((t (:inherit outline-5 :height 1.0))))
               )
             (setq org-indent-mode-turns-on-hiding-stars nil)
             (setq org-superstar-leading-bullet ?\s)
             (setq org-hide-leading-stars nil)
             (setq org-superstar-headline-bullets-list '("❶" "❷" "❸" "❹" "❺" "❻" "❼" "❽" "❾" "❿"))
             )

;; (use-package org-fragtog
;;              :init
;;              (add-hook 'org-mode-hook 'org-fragtog-mode))

(use-package org-preview-html
  :config
  (setq org-preview-html-refresh-configuration "timer")
  )

;; calculations
(use-package math-at-point
             :load-path "math-at-point"
             :ensure nil
             :bind ("C-x C-z" . math-at-point))

(use-package laas
             :config ; do whatever here
             (add-hook 'org-mode-hook 'laas-mode)
             (aas-set-snippets 'laas-mode
			       ;; tikz snippets
			       ":Z" (lambda () (interactive)
				      (yas-expand-snippet "\n\\begin{tikzpicture}\n    $1\n\\end{tikzpicture}\n\n"))

			       ",,d " (lambda () (interactive)
					(yas-expand-snippet "\\draw[$1] ($2, $3) -- ($4, $5)"))
			       ",,dd " (lambda () (interactive)
					(yas-expand-snippet "\\draw[black, thick] ($1, $2) -- ($3, $4)"))
			       ",,da " (lambda () (interactive)
					(yas-expand-snippet "\\draw[black, thick, ->] ($1, $2) -- ($3, $4)"))
			       ",,nt " (lambda () (interactive) (yas-expand-snippet "node[above] {\$$2\$}"))
			       ",,nb " (lambda () (interactive) (yas-expand-snippet "node[below] {\$$2\$}"))
			       ",,nr " (lambda () (interactive) (yas-expand-snippet "node[right] {\$$2\$}"))
			       ",,nl " (lambda () (interactive) (yas-expand-snippet "node[left] {\$$2\$}"))

			       ",,ntr " (lambda () (interactive) (yas-expand-snippet "node[above right] {\$$2\$}"))
			       ",,ntl " (lambda () (interactive) (yas-expand-snippet "node[above left] {\$$2\$}"))
			       ",,nbr " (lambda () (interactive) (yas-expand-snippet "node[below right] {\$$2\$}"))
			       ",,nbl " (lambda () (interactive) (yas-expand-snippet "node[below left] {\$$2\$}"))

			       ",,nmt " (lambda () (interactive) (yas-expand-snippet "node[midway, above] {\$$2\$}"))
			       ",,nmb " (lambda () (interactive) (yas-expand-snippet "node[midway, below] {\$$2\$}"))
			       ",,nmr " (lambda () (interactive) (yas-expand-snippet "node[midway, right] {\$$2\$}"))
			       ",,nml " (lambda () (interactive) (yas-expand-snippet "node[midway, left] {\$$2\$}"))

			       ",,nmtr " (lambda () (interactive) (yas-expand-snippet "node[midway, above right] {\$$2\$}"))
			       ",,nmtl " (lambda () (interactive) (yas-expand-snippet "node[midway, above left] {\$$2\$}"))
			       ",,nmbr " (lambda () (interactive) (yas-expand-snippet "node[midway, below right] {\$$2\$}"))
			       ",,nmbl " (lambda () (interactive) (yas-expand-snippet "node[midway, below left] {\$$2\$}"))
			       ;; create boxes and things
                               ":B" (lambda () (interactive)
                                      (yas-expand-snippet "\\boxed{\\text{$1}}$0"))
                               ":M" (lambda () (interactive)
                                      (yas-expand-snippet "\n\\[\\begin{aligned}\n    $1\n\\end{aligned}\\]\n$0"))
                               ":m" (lambda () (interactive)
                                      ;; (yas-expand-snippet "\\( $1 \\)$0"))
                                      (yas-expand-snippet "\$$1\$$0"))
                               ";m" (lambda () (interactive)
                                      (yas-expand-snippet "\\( $1 \\)$0"))
                               ;; set condition!
                               :cond #'texmathp ; expand only while in math
                               "supp" "\\supp"
                               "On" "O(n)"
                               "O1" "O(1)"
                               "Olog" "O(\\log n)"
                               "Olon" "O(n \\log n)"

                               "tr " "^\\top "

                               " pi " " \\pi "
                               ";;t" "\\theta"
                               ";T" "\\Tau"

                               " ;c " " \\subseteq "
                               " ;C " " \\subsetneq "

                               " nn" " \\left("
                               "ss " "\\right) "

                               " CC" " \\mathbb{C}"
                               " RR" " \\mathbb{R}"
                               " NN" " \\mathbb{N}"
                               " ZZ" " \\mathbb{Z}"
                               " QQ" " \\mathbb{Q}"
                               " HH" " \\mathbb{H}"
                               " PP" " \\mathbb{P}"
                               " FF" " \\mathbb{F}"

                               " Pp" " \\mathcal{P}"
                               " Ll" " \\mathcal{L}"
                               " Mm" " \\mathcal{M}"
                               " Dd" " \\mathcal{M}"

                               " inf " " \\infty"

                               " sin " " \\sin "
                               " cos " " \\cos "
                               " tan " " \\tan "
                               " cot " " \\cot "
                               " sec " " \\sec "
                               " csc " " \\csc "

                               ":Q"     (lambda () (interactive)
                                          (yas-expand-snippet "\\sqrt{$1}$0"))
                               ":C"     (lambda () (interactive)
                                          (yas-expand-snippet "\\cancel{$1}$0"))
                               ":c"     (lambda () (interactive)
                                          (yas-expand-snippet "\\cancelto{$1}{$2}$0"))
                               ":V"     (lambda () (interactive)
                                          (yas-expand-snippet "\\lVert $1 \\rVert$0"))
                               ":/"     (lambda () (interactive)
                                          (yas-expand-snippet "\\frac{$1}{$2}$0"))
                               ":b"     (lambda () (interactive)
                                          (yas-expand-snippet "\\boxed{$1}$0"))
                               " tt"    (lambda () (interactive)
                                          (yas-expand-snippet " \\begin{$1}$2\\end{$1}$0"))
                               " hh"    (lambda () (interactive)
                                          (yas-expand-snippet " \\left$1\\right$1 $0"))
                               " sum "  (lambda () (interactive)
                                          (yas-expand-snippet " \\sum_{$1}^{$2} $0"))
                               " lim "  (lambda () (interactive)
                                          (yas-expand-snippet " \\lim_{$1} $0"))
                               " int "  (lambda () (interactive)
                                          (yas-expand-snippet " \\int $1 dx $2$0"))
                               " dint " (lambda () (interactive)
                                          (yas-expand-snippet " \\int_{$1}^{$2} $3 dx$0"))
                               " :t"    (lambda () (interactive)
                                          (yas-expand-snippet " \\text{$1}$0"))

                               " ang "    (lambda () (interactive)
                                            (yas-expand-snippet " \\langle $1 \\rangle$0"))

                               ;; bind to functions!
                               ;; "//" (lambda () (interactive)
                               ;;          (yas-expand-snippet "\\frac{$1}{$2}$0"))
                               ;; "Span" (lambda () (interactive)
                               ;;          (yas-expand-snippet "\\Span($1)$0"))))
                               ))

;; based on ../old_emacs and https://quantumish.github.io/blog/emacsarticle.html
(load "~/.config/emacs/base.el")

;; org + latex
;(setq org-format-latex-options (plist-put org-format-latex-options :scale 3.0))

; manual hooks because prev doesn't seem to be working
(add-hook 'org-mode-hook 'laas-mode)
(add-hook 'org-mode-hook 'org-fragtog-mode)

;; calculations
(use-package math-at-point
  :load-path "autoload/math-at-point"
  :ensure nil
  :bind ("C-x C-z" . math-at-point))

(use-package laas
  :config ; do whatever here
  (aas-set-snippets 'laas-mode
                    ":B" (lambda () (interactive)
                           (yas-expand-snippet "\\boxed{\\text{$1}}$0"))
                    ":M" (lambda () (interactive)
                           (yas-expand-snippet "\n\\[\\begin{aligned}\n    $1\n\\end{aligned}\\]\n$0"))
                    ":m" (lambda () (interactive)
                           ;; (yas-expand-snippet "\\( $1 \\)$0"))
                           (yas-expand-snippet "\$$1\$$0"))
                    ";m" (lambda () (interactive)
                           (yas-expand-snippet "\( $1 \)$0"))
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

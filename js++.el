(require 'flymake-jslint)
(add-hook 'js-mode-hook 'flymake-jslint-load)

(require 'js2-mode)
(rename-modeline "js2-mode" js2-mode "JS2")
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; (require 'js2-refactor)
;; (js2r-add-keybindings-with-prefix "C-c C-x")

(require 'jsx-mode)
;;(add-to-list 'auto-mode-alist '("\\.jsx\\'" . jsx-mode))
(setq jsx-indent-level 4)

(require 'flycheck)
;; (flycheck-define-checker jsxhint-checker
;;   "A JSX syntax and style checker based on JSXHint."

;;   :command ("jsxhint" source)
;;   :error-patterns ((error line-start (1+ nonl) ": line " line ", col " column ", " (message) line-end))
;;   :modes (jsx-mode js2-mode))

(defun jsfoo-hook ()
;;  (flycheck-select-checker 'jsxhint-checker)
  (flycheck-mode)
  (auto-complete-mode 1))

(add-hook 'jsx-mode-hook 'jsfoo-hook) 
(add-hook 'js2-mode-hook 'jsfoo-hook)

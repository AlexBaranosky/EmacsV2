;;;; Basic ruby setup

(add-auto-mode 'ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'" "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'")

(setq ruby-use-encoding-map nil)

(after-load 'ruby-mode
  (define-key ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
  (define-key ruby-mode-map (kbd "TAB") 'indent-for-tab-command)

  ;; Stupidly the non-bundled ruby-mode isn't a derived mode of
  ;; prog-mode: we run the latter's hooks anyway in that case.
  (add-hook 'ruby-mode-hook
            (lambda ()
              (unless (derived-mode-p 'prog-mode)
                (run-hooks 'prog-mode-hook)))))

(add-hook 'ruby-mode-hook 'subword-mode)

;; TODO: hippie-expand ignoring : for names in ruby-mode
;; TODO: hippie-expand adaptor for auto-complete sources

;; Inferior ruby
(after-load 'auto-complete
  (add-to-list 'ac-modes 'inf-ruby-mode))
(add-hook 'inf-ruby-mode-hook 'ac-inf-ruby-enable)
(after-load 'inf-ruby
  (define-key inf-ruby-mode-map (kbd "TAB") 'auto-complete))


;; Ruby compilation
(after-load 'ruby-mode
  (let ((m ruby-mode-map))
    (define-key m [S-f7] 'ruby-compilation-this-buffer)
    (define-key m [f7] 'ruby-compilation-this-test)
    (define-key m [f6] 'recompile)))

;; Robe
;; (after-load 'ruby-mode
;;   (add-hook 'ruby-mode-hook 'robe-mode))
;; (after-load 'robe
;;   (add-hook 'robe-mode-hook
;;             (lambda ()
;;               (add-to-list 'ac-sources 'ac-source-robe)
;;               (set-auto-complete-as-completion-at-point-function))))

;; ERB
(defun sanityinc/ensure-mmm-erb-loaded ()
  ;;(require 'mmm-erb)
  )

(defun sanityinc/set-up-mode-for-erb (mode)
  (add-hook (derived-mode-hook-name mode) 'sanityinc/ensure-mmm-erb-loaded)
  ;; (mmm-add-mode-ext-class mode "\\.erb\\'" 'erb)
  )

(let ((html-erb-modes '(html-mode html-erb-mode nxml-mode)))
  (dolist (mode html-erb-modes)
    (sanityinc/set-up-mode-for-erb mode)
    ;;  (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?\\'" 'html-js)
    ;;  (mmm-add-mode-ext-class mode "\\.r?html\\(\\.erb\\)?\\'" 'html-css)
    ))

(mapc 'sanityinc/set-up-mode-for-erb
      '(coffee-mode js-mode js2-mode js3-mode markdown-mode textile-mode))

(after-load 'sgml-mode
  (tagedit-add-paredit-like-keybindings))

;; (mmm-add-mode-ext-class 'html-erb-mode "\\.jst\\.ejs\\'" 'ejs)

(add-auto-mode 'html-erb-mode "\\.rhtml\\'" "\\.html\\.erb\\'")
(add-to-list 'auto-mode-alist '("\\.jst\\.ejs\\'"  . html-erb-mode))
;; (mmm-add-mode-ext-class 'yaml-mode "\\.yaml\\'" 'erb)

;; (dolist (mode (list 'js-mode 'js2-mode 'js3-mode))
;;   (mmm-add-mode-ext-class mode "\\.js\\.erb\\'" 'erb))

(setq ruby-deep-indent-paren nil)

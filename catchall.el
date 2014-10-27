;; (global-auto-complete-mode t) ;; TODO: Alex - Thu, Sep 25, 2014
;; (show-paren-mode 1) ;; ;; TODO: Alex - Thu, Sep 25, 2014
(subword-mode 1)
(winner-mode)

;; (add-hook 'prog-mode-hook (lambda ()
;;                             (guru-mode +1)))

(defun g-blame ()
  (interactive)
  (shell-command
   (format "git show $(git blame '%s' -L %s,%s | awk '{print $1}')"
           (buffer-file-name)
           (line-number-at-pos)
           (line-number-at-pos))))

(defun g-churn ()
  (interactive)
  (shell-command
   "set -e; git log --all -M -C --name-only --format='format:' \"--since='6 months ago'\" | sort | grep -v '^$' | uniq -c | sort | awk 'BEGIN {print \"count\tfile\"} {print $1 \"\t\" $2}' | sort -g | tail -50"))

(defun g-who ()
  (interactive)
  (shell-command
   (concat "git log --format='%an' --since='6 months ago' "
           (buffer-file-name)
           " | sort | uniq -c | sort -rn")))

(global-diff-hl-mode +1)
(add-hook 'dired-mode-hook 'diff-hl-dired-mode)

(key-chord-mode 1)
(key-chord-define-global "ii" 'cursor-jump-up)
(key-chord-define-global "kk" 'cursor-jump-down)
;; (key-chord-define-global ",." 'er/expand-region)
(key-chord-define-global "qq" 'rotate-windows)
(key-chord-define-global "ww" 'wgrep-change-to-wgrep-mode)
(key-chord-define-global "xx" 'gui-diff-last-failure)
;; (key-chord-define-global "uu" 'sqlup-capitalize-keywords-in-region)

(defvar push-mark-before-goto-char nil)

(defadvice goto-char (before push-mark-first activate)
  (when push-mark-before-goto-char
    (push-mark)))

(global-set-key (kbd "C-.") 'mc/mark-next-like-this)
(global-set-key (kbd "C-,") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-!") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

;; (js2r-add-keybindings-with-prefix "C-c C-t")

;; Save point position between sessions
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(rename-modeline "js2-mode" js2-mode "JS2")
(rename-modeline "clojure-mode" clojure-mode "CLJ")
;; (rename-modeline "emacs-lisp-mode" emacs-lisp-mode "ELisp") ;; TODO: does it work?

(add-to-list
 'auto-mode-alist
 '("\\.\\(?:gemspec\\|irbrc\\|gemrc\\|rake\\|rb\\|ru\\|thor\\)\\'" . ruby-mode))
(add-to-list
 'auto-mode-alist
 '("\\(Capfile\\|Gemfile\\(?:\\.[a-zA-Z0-9._-]+\\)?\\|[rR]akefile\\)\\'" . ruby-mode))

(global-set-key (kbd "<S-up>")    'windmove-up)
(global-set-key (kbd "<S-down>")  'windmove-down)
(global-set-key (kbd "<S-left>")  'windmove-left)
(global-set-key (kbd "<S-right>") 'windmove-right)

(idle-highlight-mode +1)

(require 'workgroups)
(workgroups-mode 1)
(wg-load "~/.emacs.d/emacs_workgroups")

;; (require 'mustache-mode)
;; (add-to-list 'auto-mode-alist '("\\.mustache" . mustache-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))


(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))

(require 'floobits)
(key-chord-define-global "fb" 'floobits-summon)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

(add-hook 'neotree-mode-hook (lambda ()
                               (neotree-hidden-file-toggle)))
;; (setq 'neo-show-updir-line nil)

(add-to-list 'load-path "~/.emacs.d/vendor")

;; shell scripts
(setq-default sh-basic-offset 2)
(setq-default sh-indentation 2)

;; Themes
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(add-to-list 'load-path "~/.emacs.d/themes")
;; Uncomment this to increase font size
;; (set-face-attribute 'default nil :height 140)
(load-theme 'solarized-dark t)

;; Flyspell often slows down editing so it's turned off
(remove-hook 'text-mode-hook 'turn-on-flyspell)

(load "~/.emacs.d/vendor/clojure")

;; hippie expand - don't try to complete with file names
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name hippie-expand-try-functions-list))
(setq hippie-expand-try-functions-list (delete 'try-complete-file-name-partially hippie-expand-try-functions-list))

(setq ido-use-filename-at-point nil)

;; Save here instead of littering current directory with emacs backup files
(setq backup-directory-alist `(("." . "~/.saves")))

(require 'wgrep)

(require 'scss-mode)
(add-to-list 'auto-mode-alist '("\\.scss\\'" . scss-mode))
(setq scss-compile-at-save nil)

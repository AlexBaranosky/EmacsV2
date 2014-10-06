(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("tromey" . "http://tromey.com/elpa/") t)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://melpa-stable.milkbox.net/packages") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(load "~/.emacs.d/core.el")
(load "~/.emacs.d/cider-mode++.el")
(load "~/.emacs.d/clojure-mode++.el")
(load "~/.emacs.d/erc++.el")
(load "~/.emacs.d/ido++.el")
(load "~/.emacs.d/magit++.el")
(load "~/.emacs.d/projectile++.el")
(load "~/.emacs.d/ruby++.el")
(load "~/.emacs.d/floobits/floobits.el")
(load "~/.emacs.d/catchall.el")
(load "~/.emacs.d/user.el")

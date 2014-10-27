(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.

This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(set-exec-path-from-shell-PATH)

(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages")
                         ;; ("melpa-stable" . "http://melpa-stable.milkbox.net/packages")
                         ))
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
(load "~/.emacs.d/org-mode++.el")
(load "~/.emacs.d/floobits/floobits.el")
(load "~/.emacs.d/git-timemachine.el")
(load "~/.emacs.d/scss-mode.el")
(load "~/.emacs.d/el/neotree/neotree.el")
(load "~/.emacs.d/catchall.el")
(load "~/.emacs.d/user.el")

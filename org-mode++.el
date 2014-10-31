(require 'org)
(require 'ob-clojure)
(setq org-babel-clojure-backend 'cider)

(define-key org-mode-map "\C-cl" 'org-store-link)
(define-key org-mode-map "\C-ca" 'org-agenda)
(define-key org-mode-map "\C-cc" 'org-capture)
(define-key org-mode-map "\C-cb" 'org-iswitchb)

;; make Excel spreadsheets open in Excel/Numbers/OpenOffice
(add-to-list 'org-file-apps '("\\.xls\\'" . default))
(add-to-list 'org-file-apps '("\\.xlsx\\'" . default))
(add-to-list 'org-file-apps '("\\.png\\'" . default))
(add-to-list 'org-file-apps '("\\.jpg\\'" . default))

(setq org-agenda-include-diary t)
(setq org-src-fontify-natively t)
(setq org-agenda-start-with-follow-mode t)
;;(setq org-startup-with-inline-images t)

(setq org-highest-priority ?G)
(setq org-default-priority ?I)
(setq org-lowest-priority ?O)

(setq org-capture-templates
      '(("w" "Work Notes" plain (file "~/worg/cardsw.org")
         "* %u
** DID
***
** TO DO NEXT
***
** TECH BLOCKERS
***
** BIZ BLOCKERS
***
** TECH THOUGHTS
***
** BIZ THOUGHTS
*** ")))

(setq org-agenda-files '("~/Dropbox/org/cards.txt"
                         "~/Dropbox/org/investment.txt"
                         "~/Dropbox/org/mike.txt"))

(setq org-agenda-sorting-strategy
      '((agenda priority-down todo-state-up)
        (todo priority-down category-up)
        (tags priority-down category-keep)
        (search category-keep)))

(setq org-agenda-custom-commands
      '(("w" "Todo (Work)" todo ""
         ((org-agenda-files (list "~/worg/cardsw.org"))
          (org-agenda-sorting-strategy '(priority-down todo-state-up))))

        ("1" "Deadlines (Work)" agenda ""
         ((org-agenda-files (list "~/worg/cardsw.org"))
          (org-agenda-time-grid nil)
          (org-deadline-warning-days 28)
          (org-agenda-entry-types '(:deadline))))

        ("c" "Current Buffer" todo ""
         ((org-agenda-files (list (buffer-file-name)))
          (org-agenda-sorting-strategy '(priority-down todo-state-up))))

        ("d" "3-month Deadlines" agenda ""
         ((org-agenda-time-grid nil)
          (org-deadline-warning-days 93)
          (org-agenda-entry-types '(:deadline))))

        ("h" "Blocked" todo "BLOCKED_ON"
         ((org-agenda-sorting-strategy '(priority-down todo-state-up))))

        ("g" "Blocked (Work)" todo "BLOCKED_ON"
         ((org-agenda-files (list "~/worg/cardsw.org"))
          (org-agenda-sorting-strategy '(priority-down todo-state-up))))))

(setq org-todo-keywords
      '((sequence "MAYBE" "TODO" "IN_PROGRESS" "BLOCKED_ON" "DELEGATED_PAULA" "|" "DONE")))

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t)
            (org-toggle-inline-images)
            (toggle-truncate-lines)
            (turn-on-font-lock)))

(add-hook 'org-load-hook
          (lambda ()
            (define-key org-mode-map "\C-n" 'org-next-link)
            (define-key org-mode-map "\C-p" 'org-previous-link)))

;; (setq org-footnote-section nil)
;; (setq org-ctrl-c-ctrl-c-hook '(org-babel-hash-at-point
;;                                org-babel-execute-safely-maybe))
;; (setq org-latex-format-headline-function 'org-latex-format-headline-default-function)
;; (setq org-latex-default-class "memoir-MSWordish")
;; (setq org-src-fontify-natively t)
;; (setq org-tab-first-hook '(org-hide-block-toggle-maybe
;;                            org-src-native-tab-command-maybe
;;                            org-babel-hide-result-toggle-maybe
;;                            org-babel-header-arg-expand))
;; (setq org-refile-targets '((nil :maxlevel . 9) (org-agenda-files :maxlevel . 2)))
;; (setq org-modules '(org-habit org-w3m org-bbdb org-bibtex org-docview org-gnus
;;                               org-info
;;                               org-irc org-mhe org-rmail))
;; (setq org-cycle-hook '(org-cycle-hide-archived-subtrees
;;                        org-cycle-hide-drawers
;;                        org-cycle-hide-inline-tasks
;;                        org-cycle-show-empty-lines
;;                        org-optimize-window-after-visibility-change))
;; (setq org-agenda-before-write-hook '(org-agenda-add-entry-text))
;; (setq org-timer-default-timer 25)
;; (setq org-speed-command-hook '(org-speed-command-default-hook
;;                                org-babel-speed-command-hook))
;; (setq org-babel-pre-tangle-hook '(save-buffer))
;; (setq org-agenda-diary-file "~/org/Diary.org")
;; (setq org-occur-hook '(org-first-headline-recenter))
;; (setq org-metaup-hook '(org-babel-load-in-session-maybe))
;; (setq org-confirm-elisp-link-function 'yes-or-no-p)
;; (setq org-capture-templates '(("D" "Diary" entry (file+datetree "~/org/Diary.org")
;;                                "* %?\n  %i\n  %a")
;;                               ("C" "Clocked In" entry (clock) "* %?\n  %i\n  %a")))
;; (setq org-log-into-drawer t)
;; (setq org-columns-default-format "%40ITEM %10TODO %10Effort\n      %20TAGS")
;; (setq org-latex-classes '(("memoir-MSWordish"

;;                            "\\documentclass[12pt,article,oneside]{memoir}\n\\usepackage{times}\n\\usepackage{indentfirst}\n\\usepackage[left=1in,right=1in,top=1in,bottom=1in]{geometry}\n\\linespread{1.6}"
;;                            ("\\section{%s}" . "\\section*{%s}")
;;                            ("\\subsection{%s}" . "\\subsection*{%s}")
;;                            ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;                            ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;                            ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
;;                           ("beamer" "\\documentclass{beamer}" org-beamer-sectioning)))
;; (setq org-src-tab-acts-natively t)
;; (setq org-refile-use-outline-path 'file)
;; (setq org-outline-path-complete-in-steps nil)
;; (setq org-clock-out-hook '(org-clock-remove-empty-clock-drawer))
;; (setq org-completion-use-ido t)
;; (setq org-use-speed-commands t)
;; (setq org-agenda-include-diary t)
;; (setq org-attach-store-link-p t)
;; (setq org-mode-hook '((lambda nil
;;                         (org-add-hook (quote change-major-mode-hook)
;;                                       (quote org-show-block-all) (quote append) (quote local))
;;                         )
;;                       (lambda nil
;;                         (org-add-hook (quote change-major-mode-hook)
;;                                       (quote org-babel-show-result-all) (quote append) (quote
;;                                                                                         local))
;;                         )
;;                       turn-on-flyspell auto-fill-mode
;;                       #[nil "\300\301\302\303\304$\207"
;;                             [org-add-hook change-major-mode-hook org-show-block-all
;;                                           append
;;                                           local]
;;                             5]
;;                       #[nil "\300\301\302\303\304$\207"
;;                             [org-add-hook change-major-mode-hook
;;                                           org-babel-show-result-all
;;                                           append local]
;;                             5]
;;                       org-babel-result-hide-spec org-babel-hide-all-hashes))
;; (setq org-agenda-mode-hook '(org-agenda-to-appt))
;; (setq org-from-is-user-regexp nil)
;; (setq org-metadown-hook '(org-babel-pop-to-session-maybe))
;; (setq org-agenda-files '("~/org"))
;; (setq org-src-mode-hook '(org-src-babel-configure-edit-buffer
;;                           org-src-mode-configure-edit-buffer))
;; (setq org-after-todo-state-change-hook '(org-clock-out-if-current))
;; (setq org-confirm-shell-link-function 'yes-or-no-p)
;; (setq org-datetree-add-timestamp t)

(require 'org)

(define-key org-mode-map "\C-cl" 'org-store-link)
(define-key org-mode-map "\C-ca" 'org-agenda)
(define-key org-mode-map "\C-cb" 'org-iswitchb)

;; make Excel spreadsheets open in Excel/Numbers/OpenOffice
(add-to-list 'org-file-apps '("\\.xls\\'" . default))
(add-to-list 'org-file-apps '("\\.xlsx\\'" . default))

(setq org-src-fontify-natively t)
(setq org-agenda-start-with-follow-mode t)

(setq org-agenda-files '("~/Dropbox/org/cards.txt"
                         "~/Dropbox/org/investment.txt"
                         "~/Dropbox/org/mike.txt"))

(setq org-agenda-sorting-strategy
      '((agenda priority-down todo-state-up)
        (todo priority-down category-up)
        (tags priority-down category-keep)
        (search category-keep)))

(setq org-agenda-custom-commands
      '(("w" "Work" todo ""
         ((org-agenda-files (list "~/worg/cardsw.org"))
          (org-agenda-sorting-strategy '(priority-down todo-state-up))))

        ("1" "Work Deadlines" agenda ""
         ((org-agenda-files (list "~/worg/cardsw.org"))
          (org-agenda-time-grid nil)
          (org-deadline-warning-days 28)
          (org-agenda-entry-types '(:deadline))))

        ("c" "Current Buffer" todo ""
         ((org-agenda-files (list (buffer-file-name)))
          (org-agenda-sorting-strategy '(priority-down todo-state-up))))

        ("d" "Upcoming deadlines" agenda ""
         ((org-agenda-time-grid nil)
          (org-deadline-warning-days 93)
          (org-agenda-entry-types '(:deadline))))))

(setq org-todo-keywords
      '((sequence "MAYBE" "TODO" "IN_PROGRESS" "BLOCKED_ON" "DELEGATED_PAULA" "|" "DONE")))

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t)
            (org-toggle-inline-images)
            (toggle-truncate-lines)
            (turn-on-font-lock)))

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-one)
(setq doom-theme 'doom-gruvbox)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(after! org
  (setq org-log-into-drawer t
        org-log-done 'time
        org-ellipsis " ↴↴↴"
        org-log-done 'note
        org-hide-emphasis-markers t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-deadline-if-done t))

(setq org-mobile-directory "~/Library/Mobile Documents/iCloud~com~mobileorg~mobileorg/Documents")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

(global-set-key (kbd "C-s")      'save-buffer)

;; Configuring the journalling table
(setq org-journal-date-prefix "#+TITLE:"
     org-journal-time-prefix "* "
     org-journal-date-format "%a, %Y-%m-%d"
     org-journal-file-format "%Y-%m-%d.org")

;; Adding pretty org-bullets as per the link  http://mpas.github.io/posts/2020/10/16/20201016-org-bullets-doom-emacs/
(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))

;; start using company
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(set-company-backend! '(company-files company-dabbrev compnay-tabnine))


;; (use-package pdf-view
;;   :hook (pdf-tools-enabled . pdf-view-midnight-minor-mode)
;;   :hook (pdf-tools-enabled . hide-mode-line-mode)
;;   :config
;;   (setq pdf-view-midnight-colors '("#ABB2BF" . "#282C35")))

(use-package pdf-tools
  :commands (pdf-view-mode pdf-tools-installer-os)
  :config
  (pdf-tools-install))

(setq ispell-aspell-dict-dir "/usr/local/bin/ispell")
(setq ispell-dictionary "english")

(map! :leader
      (:desc "trucate lines"
       "t t" #'toggle-truncate-lines)
      (:desc "export table csv"
       "t e" 'org-table-export)
      (:desc "toggle column width"
       "t -" #'org-table-toggle-column-width))

;; These key bindings will casue emcas to act as vim with the letters of jd and ja etc
(setq key-chord-two-keys-delay 0.25)
(key-chord-define evil-insert-state-map "jd" 'evil-delete-backward-word)
(key-chord-define evil-insert-state-map "ja" 'evil-end-of-line-or-visual-line)
(key-chord-define evil-insert-state-map "ji" 'evil-beginning-of-line)
(key-chord-define evil-insert-state-map "jw" 'evil-forward-WORD-end)
(key-chord-define evil-insert-state-map "jb" 'evil-backward-WORD-end)
(key-chord-mode 1)


(use-package python-black
  :demand t
  :after python
  :hook (python-mode . python-black-on-save-mode-enable-dwim))

;; (setq python-black-command "black-macchiato")
;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;;                           (lsp))))  ; or lsp-deferred

;; Standard Jedi.el settindg
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
;; (add-hook 'python-mode 'anaconda-mode)


;; peep-dired
(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(setq large-file-warning-threshold nil)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

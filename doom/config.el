;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Mohammed S. Albatati"
      user-mail-address "mohalbatati@icloud.com")

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
(setq doom-theme 'doom-one)

;; ===============================================================
;; ==================== Org mode ====================================
;; ===============================================================
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(after! org
  (setq org-log-into-drawer t
        org-log-done 'time
        org-ellipsis " ↴↴↴"
        ;; org-log-done 'note
        org-hide-emphasis-markers t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-timestamp-if-done t
        org-agenda-skip-deadline-if-done t))

(setq org-mobile-directory "~/Library/Mobile Documents/iCloud~com~mobileorg~mobileorg/Documents")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(require 'olivetti)
(setq display-line-numbers-type 'nil)
(setq olivetti-body-width .67)

;; Configuring the journalling table
(setq org-journal-date-prefix "#+TITLE:"
     org-journal-time-prefix "* "
     org-journal-date-format "%a, %Y-%m-%d"
     org-journal-file-format "%Y-%m-%d.org")

;; Adding pretty org-bullets as per the link  http://mpas.github.io/posts/2020/10/16/20201016-org-bullets-doom-emacs/
(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))

;; ===============================================================
;; ==================== Company ====================================
;; ===============================================================
;; start using company
(require 'company)
(require 'company-tabnine)
(add-hook 'after-init-hook 'global-company-mode)
(set-company-backend! '(company-files company-dabbrev compnay-tabnine company-capf company-yasnippet))

;; ===============================================================
;; ==================== Dired ====================================
;; ===============================================================

(use-package pdf-tools
  :commands (pdf-view-mode pdf-tools-installer-os)
  :config
  (pdf-tools-install))

(setq ispell-aspell-dict-dir "/usr/local/bin/ispell")
(setq ispell-dictionary "english")

;; short cuts for truncate line, export csv, org table etc
(map! :leader
      (:desc "trucate lines"
       "t t" #'toggle-truncate-lines)
      (:desc "toggle tmux pane"
       "t y" #'tmux-pane-mode)
      (:desc "export table csv"
       "t e" 'org-table-export)
      (:desc "act window select"
       "e w" #'ace-select-window)
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

;; (add-hook 'python-mode-hook 'eglot-ensure)
(use-package lsp-pyright
  ;; :ensure t
  :hook (python-mode . (lambda ()
                          ;; (require 'lsp-pyright)
                          (lsp))))  ; or lsp-deferred
(add-hook 'python-mode-hook #'lsp)

(use-package highlight-symbol
  ;; :ensure t
  :init
  (add-hook 'prog-mode-hook 'highlight-symbol-mode))


(require 'org-download)
;; Drag-and-drop to `dired`
(add-hook 'dired-mode-hook 'org-download-enable)
(setq-default org-download-image-dir "~/org/download-org")

;; ===============================================================
;; ==================== Dired ====================================
;; ===============================================================
;; Dired configurations
;; =================================
;; peep-dired
(evil-define-key 'normal peep-dired-mode-map
  (kbd "j") 'peep-dired-next-file
  (kbd "k") 'peep-dired-prev-file)
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(setq large-file-warning-threshold nil)

;; dired-narrow setup
(use-package dired-narrow
  ;; :ensure t
  :bind (:map dired-mode-map
              ("/" . dired-narrow)))

;; This is the best code ever in dired to avoid navigating to the required folder ivy makes it available after hitting SPC f d
;; ivy-dired-history
(with-eval-after-load 'dired
  (require 'ivy-dired-history)
  (define-key dired-mode-map "," 'dired))

;; map the keys to activate peep and narrwo
(map! :leader
       (:after dired
        (:map dired-mode-map
         :desc "peep mode" "d p" #'peep-dired
         :desc "narrow dired" "d n" #'dired-narrow
         :desc "image dired" "d i" #'image-dired
         :desc "Zoom window" "z z" #'zoom-window-zoom
         :desc "Zoom window next" "z x" #'zoom-window-next
         :desc "open file external" "f x" #'consult-file-externally)))

;; undo tree
(require 'undo-tree)
(global-undo-tree-mode)

;; 0x0
(use-package! 0x0)

;; ===============================================================
;; ==================== Hydra ====================================
;; ===============================================================
;; Use F2 to activate Hydra to swab and move workspaces easly
(defhydra hydra-zoom (global-map "<f2>")
  "workspace"
  ("H" +workspace/swap-left "workspace left")
  ("L" +workspace/swap-right "workspace right")
  ("h" +workspace/switch-left "switch left")
  ("l" +workspace/switch-right "switch right")
  ("d" +workspace/delete "delete")
  ("n" +workspace/new "new")
  ("r" +workspace/rename "rename")
  ("o" olivetti-mode "olivetti")
  ("[" olivetti-shrink "Shriknk")
  ("]" olivetti-expand "expand"))

;; Use Hydra to have a way to navigate to windows and swab them easly Use F5 to start the action
(defhydra hydra-window-move (global-map "<f5>")
  "window-move"
  ("S" window-swap-states "swap")
  ("A" ace-swap-window "ace-swap")
  ("v" evil-window-vsplit "vsplit")
  ("s" evil-window-split "hsplit")
  ("d" +workspace/close-window-or-workspace "close")
  ("=" text-scale-increase "in")
  ("-" text-scale-decrease "out")
  ("H" evil-window-decrease-width "- width")
  ("L" evil-window-increase-width "+ width")
  ("K" evil-window-increase-height "+ height")
  ("o" olivetti-mode "olivetti")
  ("[" olivetti-shrink "Shriknk")
  ("]" olivetti-expand "expand"))

;; (Require 'ox-reveal)
;; (setq org-reveal-root "file:///Users/mohammedalbatati/org/reveal.js")

(use-package marginalia
  ;; :ensure t
  :config
  (marginalia-mode))

;; This enable screen shot to be loaded in emcas org-mode
(require 'org-ros)


;; (require 'zoom-window)
(custom-set-variables
 '(zoom-window-mode-line-color "DarkGreen"))


;; (require 'elfeed-goodies)
;; (elfeed-goodies/setup)
;; (setq elfeed-goodies/entry-pane-size 0.5)
;; ;; elfeed setup
;; (setq elfeed-feeds
;;       '("https://www.reddit.com/r/linux.rss"
;;         "https://www.reddit.com/r/emcas.rss"))

;; (use-package org-brain
;;   :init
;;   (setq org-brain-path "~/org-brain")
;;   ;; For Evil users
;;   (with-eval-after-load 'evil
;;     (evil-set-initial-state 'org-brain-visualize-mode 'emacs))
;;   :config
;;   (bind-key "C-c b" 'org-brain-prefix-map org-mode-map)
;;   (setq org-id-track-globally t)
;;   (setq org-id-locations-file "~/.emacs.d/.org-id-locations")
;;   (add-hook 'before-save-hook #'org-brain-ensure-ids-in-buffer)
;;   (push '("b" "Brain" plain (function org-brain-goto-end)
;;           "* %i%?" :empty-lines 1)
;;         org-capture-templates)
;;   (setq org-brain-visualize-default-choices 'all)
;;   (setq org-brain-title-max-length 12)
;;   (setq org-brain-include-file-entries nil
;;         org-brain-file-entries-use-title nil))



;; (use-package embark
;;   :ensure t
;;   :bind
;;   (("C-." . embark-act)         ;; pick some comfortable binding
;;    ("C-;" . embark-dwim)        ;; good alternative: M-.
;;    ("C-h B" . embark-bindings)) ;; alternative for `describe-bindings'
;;   :init
;;   ;; Optionally replace the key help with a completing-read interface
;;   (setq prefix-help-command #'embark-prefix-help-command)
;;   :config
;;   ;; Hide the mode line of the Embark live/completions buffers
;;   (add-to-list 'display-buffer-alist
;;                '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
;;                  nil
;;                  (window-parameters (mode-line-format . none)))))

;; ;; Consult users will also want the embark-consult package.
;; (use-package embark-consult
;;   :ensure t
;;   :after (embark consult)
;;   :demand t ; only necessary if you have the hook below
;;   ;; if you want to have consult previews as you move around an
;;   ;; auto-updating embark collect buffer
;;   :hook
;;   (embark-collect-mode . consult-preview-at-point-mode))

;; Custom change the block
;; (custom-set-faces
;;  '(org-block-begin-line
;;    ((t (:underline "#A7A6AA" :foreground "#ffffff" :background "#1f1f1f" :extend nil))))
;;  '(org-block
;;    ((t (:background "#1f1f1f" :extend nil))))
;;  '(org-block-end-line
;;    ((t (:overlin  "A7A6AA" :foreground "#404040" :background "#1f1f1f" :extend nil)))))

;; تغيير الخط المسؤول عن عرض النصوص العربية فقط
;; (set-fontset-font "fontset-default"
;;          'arabic
;;          (font-spec :family "Kawkab Mono" :size 30))


;; React set up for emcas

;; (package-initialize)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;; (setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs company avy which-key dap-mode json-mode))
;; (when (cl-find-if-not #'package-installed-p package-selected-packages)
  ;; (package-refresh-contents)
  ;; (mapc #'package-install package-selected-packages))


;; Adding lsp and emmet to programming hooks
(add-hook 'prog-mode-hook #'lsp)
(add-hook 'rjsx-mode-hook #'lsp)
(add-hook 'rjsx-mode-hook #'emmet-mode)
(add-hook 'js-mode-hook #'lsp)
(add-hook 'js-mode-hook #'emmet-mode)
(add-hook 'html-mode-hook #'emmet-mode)
;; (add-hook 'python-mode-hook 'eglot-ensure)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'
(with-eval-after-load 'lsp-mode
  (require 'dap-chrome)
  (yas-global-mode))

  ;; (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  ;; (add-hook 'lsp-mode-hook #'lsp-mode 'lsp-ui-doc-mode 'company-auto-complete)
  ;; (add-hook 'lsp-mode-hook #'lsp-ui-doc-mode)
  ;; (add-hook 'lsp-mode-hook #'lsp-mode)
  ;; (add-hook 'lsp-mode-hook 'company-auto-complete)
;; lsp-mode
;; lsp-ui-doc-mode
;; lsp-ui-mode
;; lsp-completion-mode
;; +company/toggle-auto-completion

;; (defun my/increment-numbers()
  ;; "This function will increment numnbers"
  ;; (interactive)
  ;; (kill-rectangle (point-max) (point-min)))
  ;; (universal-argument (rectangle-number-lines (point-max) (default-value) ("%1d"))))


(require 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)

;; (add-hook 'go-mode-hook #'gofmt-before-save)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
;; (defun lsp-go-install-save-hooks ()
;;   (add-hook 'before-save-hook #'lsp-format-buffer t t)
;;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
;; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; (use-package lsp-mode)
;; :commands (lsp lsp-deferred)
;; :init
;; (setq lsp-keymap-prefix "C-c l")
;; :config
;; (lsp-enable-which-key-integration t)
;; :hook
;; ((go-mode) . lsp)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-enable t))

;; run gofmt before saving the file
;; (add-hook 'go-mode-hook 'gofmt-before-save)

;; (doom-big-font-mode t)


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

;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Mohammed"
      user-mail-address "mohalbatati@icloud.com")

;; change the meta key to to option in the mac
(cond (IS-MAC
       (setq mac-command-modifier      'meta
             mac-option-modifier       'alt
             mac-right-option-modifier 'alt)))

(after! org
  (setq org-log-into-drawer t)
  ;; write the time of the compltion when hitting on done
  (setq org-log-done 'time))

;; Adding pretty org-bullets as per the link  http://mpas.github.io/posts/2020/10/16/20201016-org-bullets-doom-emacs/
(setq
    org-superstar-headline-bullets-list '("⁖" "◉" "○" "✸" "✿"))


;; OrgMode bullets set up
;; (use-package org-bullets
;;   :ensure t
;;   :config
;;   (add-hook 'org-mode-h exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;

(require 'org-tempo)
(add-to-list 'org-structure-template-alist '("sh" . "src shell"))
(add-to-list 'org-structure-template-alist '("el" . "src emacs-lips"))
(add-to-list 'org-structure-template-alist '("py" . "src python"))

;;
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
;; (setq doom-theme 'spacemacs-light)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(use-package pdf-view
  :hook (pdf-tools-enabled . pdf-view-midnight-minor-mode)
  :hook (pdf-tools-enabled . hide-mode-line-mode)
  :config
  (setq pdf-view-midnight-colors '("#ABB2BF" . "#282C35")))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;; (setq display-line-numbers-type t)
(setq display-line-numbers-type 'relative)

;; This code below to try and remove the whole line green
(custom-set-faces
  ;; '(default ((t (:background "#000000"))))
  '(hl-line ((t (:background "#000000")))))

(setq ispell-aspell-dict-dir "/usr/local/bin/ispell")
(setq ispell-dictionary "english")

;; Disable exit confirmation / no more asking for permittion to exit the program
(setq confirm-kill-emacs nil)

(use-package pdf-tools
  :commands (pdf-view-mode pdf-tools-installer-os)
  :config
  (pdf-tools-install))

;; Configuring the journalling table
(setq org-journal-date-prefix "#+TITLE:"
     org-journal-time-prefix "* "
     org-journal-date-format "%a, %Y-%m-%d"
     org-journal-file-format "%Y-%m-%d.org")

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

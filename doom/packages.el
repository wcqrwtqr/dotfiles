;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)
(package! olivetti)
(package! use-package-chords)
(package! orgtbl-aggregate)
(package! dired-rsync)
(package! peep-dired)
(package! dired-open)
(package! ivy-dired-history) ;; best thing happened to me ( use SPC f d ) and all folders you went to will be available to search easliy
(package! company-tabnine)
(package! undo-tree)
;; (package! speed-type)
(package! pdf-tools)
(package! beacon)
(package! highlight-symbol)
(package! rainbow-mode)
(package! marginalia)
(package! org-download)
(package! org-ros)
(package! ox-reveal)
(package! ac-emmet)
(package! org-download)
(package! go-add-tags)
(package! go-gopath)
(package! tldr)
(package! zoom-window)
(package! tmux-pane)
(package! centered-cursor-mode)
(package! org-present)
(package! smooth-scrolling)
;; (package! docker)
;; (package! lsp-jedi)
;; (package! company-anaconda)
;; (package! django-mode)
;; (package! embark-consult)
;; (package! json-mode)
;; (package! dap-mode)
;; (package! react-snippets)
;; (package! js-react-redux-yasnippets)
;; (package! python-insert-docstring)
;; (package! python-docstring)
;; (package! emmet)
(package! 0x0
  :recipe (:host gitlab :repo "willvaughn/emacs-0x0"))

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

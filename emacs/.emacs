(package-initialize)

;; Stuff that i have customized
(custom-set-variables
 '(ansi-color-names-vector
   ["#1B2229" "#ff6c6b" "#98be65" "#ECBE7B" "#51afef" "#c678dd" "#46D9FF" "#DFDFDF"])
 '(custom-safe-themes
   (quote
    ("a94f1a015878c5f00afab321e4fef124b2fc3b823c8ddd89d360d710fc2bddfc" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "6f11ad991da959fa8de046f7f8271b22d3a97ee7b6eca62c81d5a917790a45d9" "4182c491b5cc235ba5f27d3c1804fc9f11f51bf56fb6d961f94788be034179ad" "5900bec889f57284356b8216a68580bfa6ece73a6767dfd60196e56d050619bc" "365d9553de0e0d658af60cff7b8f891ca185a2d7ba3fc6d29aadba69f5194c7f" default)))
 '(fci-rule-color "#5B6268")
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3f444a"))
 '(menu-bar-mode nil)
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(package-selected-packages
   (quote
    (all-the-icons-dired all-the-icons-gnus all-the-icons-ivy org-journal helm quickrun airline-themes nlinum neotree doom-themes)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#1B2229")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#b4be6c")
    (cons 60 "#d0be73")
    (cons 80 "#ECBE7B")
    (cons 100 "#e6ab6a")
    (cons 120 "#e09859")
    (cons 140 "#da8548")
    (cons 160 "#d38079")
    (cons 180 "#cc7cab")
    (cons 200 "#c678dd")
    (cons 220 "#d974b7")
    (cons 240 "#ec7091")
    (cons 260 "#ff6c6b")
    (cons 280 "#cf6162")
    (cons 300 "#9f585a")
    (cons 320 "#6f4e52")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces


;; Editing mode line properties
 '(mode-line ((t (:background "#21242b" :foreground "#bbc2cf" :box nil :overline nil :underline nil :height 1.0 :width ultra-condensed)))))


;; Adding melpa archive
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
   ;; '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   '("melpa" . "http://melpa.milkbox.net/packages/")
   t))


;; Theme i use
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-one t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; Mode used to highlight current buffer than others
(require 'solaire-mode)

;; brighten buffers (that represent real files)
(add-hook 'after-change-major-mode-hook #'turn-on-solaire-mode)
;; To enable solaire-mode unconditionally for certain modes:
(add-hook 'ediff-prepare-buffer-hook #'solaire-mode)

(add-hook 'after-revert-hook #'turn-on-solaire-mode)

;; highlight the minibuffer when it is activated:
(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

;; NOTE: This is necessary for themes in the doom-themes package!
(solaire-mode-swap-bg)


(setq solaire-mode-remap-modeline nil)


;; powerline kindish theme for mode line
(require 'airline-themes)
(load-theme 'airline-doom-one)

;; Adding line number and highlighting current line number
(global-linum-mode t)
(require 'hlinum)
(hlinum-activate)

;; Increasing current font size
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-16"))

;; Fancy Icons
(require 'all-the-icons)

;; For listing file structure
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Making emacs start in full screen
(add-to-list 'default-frame-alist '(fullscreen . maximized))

;; Disabling splash screen
(setq inhibit-splash-screen t)

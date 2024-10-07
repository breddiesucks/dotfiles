;; Breddie's Emacs config
;; Discord - breddie_sucks
;; github - https://www.github.com/breddie-normie

;; steam float or floating in that tag
;; clean your PATH
;; gentoo with xmonad - bdsm and its consequences
;; centaur-mode (tabs)
;; learn rust to bully others with cheesy ass widgets

;; no more crappy startup UI
(setq inhibit-startup-message t)

;; ui improvement for the better
(setq use-dialog-box nil)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
(menu-bar-mode -1)

;; basic syntax necessities
(global-display-line-numbers-mode 1)
(set-default 'truncate-lines t)

;; setting my favorite font coz why the hell not?
(set-face-attribute 'default nil :font "JetBrains Mono" :height 150)

;; prelim disabling package.el
(setq package-enable-at-startup nil)

;; electric pair mode so it feels satisfying
(electric-pair-mode t)

;; I can see how resourceful auto-saving can be, but they are rather bothersome rn
(setq auto-save-default nil)

;; Just use a VSC, baka-BAAAKA
(setq make-backup-files nil)

;; who doesn't love some transparency every once in a while?
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

;; setting up straight.el so you can rest in piss
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; the following lines makes sure the package is installed and enable them recursively

;; use-package coz it's what the cool kids use
(straight-use-package 'use-package)
;; This is only needed once, near the top of the file
(eval-when-compile
  (require 'use-package))

;; e-VI-l mode - a Crazy Mohan joke but necessary for sanity
(straight-use-package 'evil)
(use-package evil
  :config (evil-mode 1))

;; I need a reliable key binding to toggle word wrapping
(use-package visual-line
  :bind
  ("C-x v" . visual-line-mode))

;; doom-themes - yeah, I want a less obnoxious color scheme
(straight-use-package 'doom-themes)

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)
  (load-theme 'doom-tokyo-night t))

;; nerd icons - decided to become a sellout for cool shiny icons
(straight-use-package 'nerd-icons)

(use-package nerd-icons
  :config
  (setq nerd-icons-icon-for-dir t)
  (setq nerd-icons-icon-for-file t))

;; doom-modeline it looks cool, that's all
(straight-use-package 'doom-modeline)

(use-package doom-modeline
  :init
  (doom-modeline-mode 1))

;; Vertico coz the command minibuffer needs serious ergonomic changes
(straight-use-package 'vertico)

(use-package vertico
  :init
  (vertico-mode)
  :bind (:map vertico-map
	      ("C-j" . vertico-next)
	      ("C-k" . vertico-previous)
	      ("M-RET" . vertico-exit-input)))

;; Consult for seamless buffer navigation and minibuffer QoL improvement
(straight-use-package 'consult)

(use-package consult
  :bind
  ("C-x b" . consult-buffer))

;; marginalia coz well, im dumb dumb
(straight-use-package 'marginalia)

(use-package marginalia
  :config
  (marginalia-mode 1))

;; orderless coz fuzzy search is necessary
(straight-use-package 'orderless)

(use-package orderless
  :config
  (setq completion-styles '(orderless basic))
  (setq completetion-category-overrides '((file (styles basic partial-completion)))))

;; nerd fonts but in even more locations
(straight-use-package 'nerd-icons-completion)

(use-package nerd-icons-completion
  :config
  (nerd-icons-completion-mode))

;; spacious padding for more AESTHETIC
(straight-use-package 'spacious-padding)

(use-package spacious-padding
  :init
  (setq frame-resize-pixelwise t)
  (setq frame-inhibit-implied-resize t)
  :config
  (setq spacious-padding-widths
      '( :internal-border-width 15
         :header-line-width 4
         :mode-line-width 6
         :tab-width 4
         :right-divider-width 30
         :scroll-bar-width 8
	 :fringe-width 1))
  (spacious-padding-mode 1))


;; emacs-dashboard - pimp up your rig
(straight-use-package 'dashboard)

(use-package dashboard
  :config
  (dashboard-setup-startup-hook)

  (setq dashboard-banner-logo-title "breddiesucks's Emacs")
  (setq dashboard-image-banner-max-height 430)
  (setq dashboard-image-banner-max-width 557)
  (setq dashboard-center-content t)
  (setq dashboard-vertically-center-content t)
  (setq dashboard-show-shortcuts nil)
  (setq dashboard-startup-banner "~/.config/emacs/subaru.jpg")
  (setq dashboard-items '((recents   . 5)))
  (setq dashboard-startupify-list '(dashboard-insert-banner
                                  dashboard-insert-newline
                                  dashboard-insert-banner-title
                                  dashboard-insert-newline
                                  dashboard-insert-navigator
                                  dashboard-insert-newline
                                  dashboard-insert-init-info
                                  dashboard-insert-items
                                  dashboard-insert-newline)))

;; major modes - they "just" work
(straight-use-package 'haskell-mode)
(straight-use-package 'rust-mode)
(straight-use-package 'slime)
(straight-use-package 'geiser)

;; planning to use: 
;; (straight-use-package 'flycheck) = immediate syntax warnings, very helpful to your sanity
;; (straight-use-package 'projectile) = may come useful when I have to manage a zillion orphan undertakings

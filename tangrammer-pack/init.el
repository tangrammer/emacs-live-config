;; User pack init file
;;
;; Use this file to initiate the pack configuration.
;; See README for more information.

;; Load bindings config
(live-load-config-file "bindings.el")
(remove-if (lambda (x)
             (eq 'font (car x)))
           default-frame-alist)
(cond
 ((and (window-system) (eq system-type 'darwin))
  (add-to-list 'default-frame-alist '(font . "Courier 20"))))

; osx keys
(setq default-input-method "MacOSX")
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'none)
(add-hook 'nrepl-mode-hook 'paredit-mode)

(live-load-config-file "bindings.el")

(live-add-pack-lib "expand-region")
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


(live-load-config-file "hideshow-org.el")
(require 'hideshow-org)

(global-set-key (kbd "M-+") 'hs-show-block)
(global-set-key (kbd "M-*") 'hs-show-all)
(global-set-key (kbd "M--") 'hs-hide-block)
(global-set-key (kbd "M-Ç") 'hs-hide-level)
(global-set-key (kbd "M-:") 'hs-hide-all)

(global-set-key
 (kbd "C-X C-S")
 (lambda ()
   (interactive)
   (save-some-buffers t)))

(add-hook 'clojure-mode-hook 'hs-minor-mode)
(add-hook 'lisp-mode-hook 'hs-minor-mode)

(add-hook 'js2-mode-hook
          (lambda ()

             (auto-fill-mode 0)
            ;; Scan the file for nested code blocks
            (imenu-add-menubar-index)
            ;; Activate the folding mode
            (hs-minor-mode t)))
;; this line is mine, from http://stackoverflow.com/questions/93058/emacs-switching-to-another-frame-mac-os-x
;; it's used for changing the actual frame
(global-set-key (kbd "M-o") 'other-frame)

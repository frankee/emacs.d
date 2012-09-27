;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; tabbar.el
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'tabbar)

(tabbar-mode)

(when *win32*
    (progn 
      (global-set-key (kbd "<H-up>") 'tabbar-backward-group)
      (global-set-key (kbd "<H-down>") 'tabbar-forward-group)
      (global-set-key (kbd "<H-left>") 'tabbar-backward)
      (global-set-key (kbd "<H-right>") 'tabbar-forward)
      )
    (progn
      (global-set-key (kbd "<s-up>") 'tabbar-backward-group)
      (global-set-key (kbd "<s-down>") 'tabbar-forward-group)
      (global-set-key (kbd "<s-left>") 'tabbar-backward)
      (global-set-key (kbd "<s-right>") 'tabbar-forward)
      ))

(setq tabbar-ruler-global-tabbar 't) ; If you want tabbar
(setq tabbar-ruler-global-ruler 't) ; if you want a global ruler
;(setq tabbar-ruler-popup-menu 't) ; If you want a popup menu.
;(setq tabbar-ruler-popup-toolbar 't) ; If you want a popup toolbar

(require 'tabbar-ruler)

(defun tabbar-buffer-groups (buffer)
  "Return the list of group names BUFFER belongs to.
 Return only one group for each buffer."
  (with-current-buffer (get-buffer buffer)
    (cond
     ((string-equal "*" (substring (buffer-name) 0 1))
      '("Emacs Buffer"))
     ((eq major-mode 'dired-mode)
      '("Dired"))
     ((eq major-mode 'c++-mode)
      '("C++"))
     (t
      '("User Buffer"))
     )))


;(setq tabbar-buffer-groups-function 'tabbar-buffer-groups)

(provide 'init-tabbar)

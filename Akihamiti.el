(require 'powerline)

(defface Akihamiti-green
    `((t
          (
              :foreground ,monokai-green
              :background ,monokai-gray
              :inherit mode-line)))
    ""
    :group 'powerline)

(defface Akihamiti-green-var
    `((t
          (
              :foreground "white"
              :background ,monokai-green
              :inherit mode-line)))
    ""
    :group 'powerline)

(defface Akihamiti-red-var
    `((t
          (
              :foreground "white"
              :background ,monokai-red
              :inherit mode-line)))
    ""
    :group 'powerline)

(defface Akihamiti-cyan-var
    `((t
          (
              :foreground "white"
              :background ,monokai-cyan
              :inherit mode-line)))
    ""
    :group 'powerline)

(defface Akihamiti-blue-var
    `((t
          (
              :foreground "white"
              :background ,monokai-blue
              :inherit mode-line)))
    ""
    :group 'powerline)

(defface Akihamiti-red
    `((t
          (
              :foreground ,monokai-red
              :inherit mode-line)))
    ""
    :group 'powerline)

(defface Akihamiti-blue
    `((t
          (
              :foreground ,monokai-blue
              :background ,monokai-comments
              :inherit mode-line)))
    ""
    :group 'powerline)



(defun powerline-Akihamiti ()
    "Setup the default mode-line."
    (interactive)
    (setq-default mode-line-format
        '("%e"
             (:eval
                 (let*
                     ((active (powerline-selected-window-active))
                         (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                         (mode-line (if active 'mode-line 'mode-line-inactive))
                         (face0 (if active 'Akihamiti-green 'powerline-inactive2))
                         (face0var
                             (if
                                 active
                                 (if
                                     (buffer-modified-p)
                                     'Akihamiti-red-var
                                     'Akihamiti-blue-var)
                                 'powerline-inactive2))
                         (face1 (if active 'Akihamiti-red 'powerline-inactive2))
                         (face2 (if active 'Akihamiti-blue 'powerline-inactive2))
                         (face3 (if active 'ieremii-giant-goldfish 'powerline-inactive2))
                         (face4 (if active 'ieremii-unreal-food-pills 'powerline-inactive1))
                         (buffer (or (buffer-file-name) (buffer-name)))
                         (separator-left
                             (intern
                                 (format "powerline-%s-%s"
                                     (powerline-current-separator)
                                     (car powerline-default-separator-dir))))
                         (separator-right
                             (intern
                                 (format "powerline-%s-%s"
                                     (powerline-current-separator)
                                     (cdr powerline-default-separator-dir))))
                         (lhs
                             (list
                                 (when powerline-display-mule-info
                                     (powerline-raw mode-line-mule-info face0 'l))
                                 (funcall separator-left face0 face0var)
                                 (powerline-raw "%* " face0var 'l)
                                 (funcall separator-left face0var face0)
                                 (when powerline-display-buffer-size
                                     (powerline-buffer-size face0 'l))
                                 (powerline-raw " " face0)
                                 (powerline-raw buffer face0)
                                 (when (and (boundp 'which-func-mode) which-func-mode)
                                     (powerline-raw which-func-format nil 'l))
                                 (when (and (boundp 'erc-track-minor-mode) erc-track-minor-mode)
                                     (powerline-raw erc-modified-channels-object face0 'l))
                                 (powerline-major-mode face0 'l)
                                 (powerline-process face0)
                                 (powerline-narrow face0 'l)
                                 (powerline-vc face0 'r)
                                 (funcall separator-left face0 face2)
                                 (powerline-raw (format "%s " (get-char-property (point) 'face)) face2 'l)
                                 (funcall separator-left face2 face0)
                                 (when (bound-and-true-p nyan-mode)
                                     (powerline-raw (list (nyan-create)) face0 'l))))
                         (rhs
                             (list
                                 (powerline-raw global-mode-string face3 'r)
                                 (funcall separator-right face0 face1)
                                 (unless window-system
                                     (powerline-raw (char-to-string #xe0a1) face4 'l))
                                 (powerline-raw "%4l" face1 'l)
                                 (powerline-raw ":" face1 'l)
                                 (powerline-raw "%3c" face1 'r)
                                 (funcall separator-right face1 face0)
                                 (powerline-raw " %6p" face0 'r)
                                 (when powerline-display-hud
                                     (powerline-hud face0var face1 2)))))
                     (concat
                         (powerline-render lhs)
                         (powerline-fill face0 (powerline-width rhs))
                         (powerline-render rhs)))))))
(powerline-Akihamiti)

(provide 'Akihamiti)

;;; packages.el --- yellow layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Mzy <Mzy@bogon>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `yellow-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `yellow/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `yellow/pre-init-PACKAGE' and/or
;;   `yellow/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst yellow-packages
  '(youdao-dictionary
    ;; company
    ;; 修改 emacs 本身的 package 配置
    ;; (occur-mode :location built-in)
    ;; becuase when start emacs, this packages always reload;
    ;; (gulpjs :location (recipe :fetcher github :repo "zilongshanren/emacs-gulpjs"))
    )
  )


;; (defun yellow/init-gulpjs()
;;   (use-package gulpjs
;;     :init))

;; 可以重写 layer 的方法, 在上面的 package 添加好要修改的 layer
;; (defun yellow/post-init-company()
;;   (setq company-minimum-prefix-length 1))


(defun yellow/init-youdao-dictionary()
  (use-package youdao-dictionary
    :defer t
    :init
    (spacemacs/set-leader-keys "op" 'youdao-dictionary-search-at-point+)
    ;; 在有道加载完之后想做一些事, 可以放到 config 里面
    ;; :config
    ;; ()
    )
  )

(defun my-toggle-web-indent ()
  (interactive)
  ;; web development
  (if (eq major-mode 'json-mode)
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))))

  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
        (setq js-indent-level (if (= js-indent-level 2) 4 2))))

  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
             (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
             (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode)
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))

  (setq indent-tabs-mode nil))

(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset 4)    ; web-mode, css in html file
  (setq web-mode-code-indent-offset 2)   ; web-mode, js code in html file
  )
(add-hook 'web-mode-hook 'my-web-mode-indent-setup)
;; (defun yellow/init-occur-mode()
;;   (evilified-state-evilify-map occur-mode-map
;;     :mode occur-mode)
;;   )
;;; packages.el ends here

;; js 多行注释 绑定快捷键: spc o m
(defun my-comment-region()
  (interactive)
  (save-restriction
    (narrow-to-region (region-beginning) (region-end))
    (goto-char (point-max))
    (unless (re-search-backward "\\*\\/" nil t)
      (insert "*/")
      (goto-char (point-min))
      (unless (re-search-forward "\\/\\*" nil t)
        (insert "/*\n")))
    ))

;; 自动填充内容
;; (defun autoinsert-yas-expand()
  ;; "Replace text in yasnippet template."
  ;; (yas-expand-snippet (buffer-string) (point-min) (point-max)))

; (use-package autoinsert
;   :config
;   (define-auto-insert "\\.html?$" ["default-html.html" ha/autoinsert-yas-expand]))


;; (defun my-web-mode-expand ()
;;   (global-set-key 'C-i 'yas-expand))
;; (add-hook 'web-mode-hook 'my-web-mode-expand)


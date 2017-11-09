;;; keybindings.el --- Better Emacs Defaults Layer key bindings File
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; 打开occur模式
(global-set-key (kbd "M-m o o") 'occur-dwim)

;; js 的多行注释
(global-set-key (kbd "M-m o m") 'my-comment-region)

;; package.el 里面的方法, 自动模板的快捷键
;; (global-set-key (kbd "M-m o s") 'autoinsert-yas-expand)


;;; metal-mode.el --- Major mode for Metal shader mode -*- lexical-binding: t; -*-

;; Copyright (C) 2016  m13o

;; Version 1.0 (19 January 2016)
;; Author: m13o
;; Keywords: extensions

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; * Introduction
;; This mode provides syntax highlighting for Metal shader files.
;;
;; * Installation
;; Place this file in your Emacs load path.
;;
;; * FYI
;; https://developer.apple.com/library/ios/documentation/Metal/Reference/MetalShadingLanguageGuide/data-types/data-types.html
;;

;;; Code:

(require 'cc-mode)

;;;###autoload
(define-derived-mode metal-mode c++-mode "Metal"
  "Major mode provides syntax highlighting for Metal shader files."
  (make-local-variable 'font-lock-defaults)
  (setq metal-mode-font-lock-keywords (append c++-font-lock-keywords
                                              c++-font-lock-keywords-1
                                              c++-font-lock-keywords-2
                                              c++-font-lock-keywords-3
                                              '(("\\<\\(fragment\\|constant\\|vertex\\|device\\|Uniforms\\)\\>" . font-lock-keyword-face)
                                                ("\\<\\(\\(packed_\\)?\\(bool\\|u?char\\|u?short\\|u?int\\|harf\\|float\\)[2-4]?\\|harf[2-4]x[2-4]\\|float[2-4]x[2-4]\\|atomic_u?int\\)\\>" . font-lock-type-face)
                                                ("\\<\\(sampler\\|texture\\([1-3]d\\|cube\\)\\(_array\\|_ms\\)?\\|\\(depth\\(2d\\|cube\\)\\(_array\\|_ms\\)?\\)\\)\\>" . font-lock-type-face))))
  (setq font-lock-defaults '(metal-mode-font-lock-keywords)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.metal\\'" . metal-mode))

(provide 'metal-mode)

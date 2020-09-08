;;; solo-jazz-theme.el --- The Solo-Jazz color theme for Emacs.

;; Copyright (C) 2020, Carl Steib

;; Author: Carl Steib

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;; This file is not part of emacs.

;;; Commentary:

;; An original theme inspired by the 1992 Jazz cup design.
;; Original jazz design colors: #3B2685  #9D2DAB #04c4c7

;;; Credits:

;; Gina Ekiss created the original solo-jazz design that inspired this theme.
;; Bozhidar Batsov wrote the Zenburn theme on which this code is based.
;; Ian Y.E Pan's many emacs themes were the starting point for my readme.

;;; Code:

(deftheme solo-jazz "The Solo-Jazz color theme")

;;; Color Palette

(defvar solo-jazz-default-colors-alist
  '(("solo-jazz-white+1"                . "#ffffff")
    ("solo-jazz-white"                  . "#fafafa")
    ("solo-jazz-off-white"              . "#efefef")
    ("solo-jazz-white-1"                . "#eaeafa")
    ("solo-jazz-border"                 . "#d0d0d0")
    ("solo-jazz-black"                  . "#24292e")
    ("solo-jazz-grey"                   . "#778ca3")

    ("solo-jazz-orange"                 . "#ff5200")
    ("solo-jazz-red"                    . "#fe2500")
    ("solo-jazz-pink"                   . "#fa1090")
    ("solo-jazz-violet"                 . "#c71585")
    ("solo-jazz-purple+1"               . "#9d2dab")
    ("solo-jazz-purple"                 . "#3b2685")
    ("solo-jazz-blue"                   . "#005cc5")
    ("solo-jazz-blue+1"                 . "#00afef")
    ("solo-jazz-teal"                   . "#009c9f")
    ("solo-jazz-teal+1"                 . "#04c4c7")
    ("solo-jazz-green"                  . "#10d7ae")
    

    ;; diff
    ("solo-jazz-diff-added"             . "#e6ffed")
    ("solo-jazz-diff-added-highlight"   . "#acf2bd")
    ("solo-jazz-diff-changed"           . "#ffe1b9")
    ("solo-jazz-diff-changed-highlight" . "#ffc86f")
    ("solo-jazz-diff-removed"           . "#ffeef0")
    ("solo-jazz-diff-removed-highlight" . "#fdb8c0"))
  
  "Solo-Jazz color palette.Each element has the form (NAME . HEX).")

(defvar solo-jazz-override-colors-alist
  '()
  "Place to override default theme colors.

You can override a subset of the theme's default colors by
defining them in this alist before loading the theme.")

(defvar solo-jazz-colors-alist
  (append solo-jazz-default-colors-alist solo-jazz-override-colors-alist))

(defmacro solo-jazz-with-color-variables (&rest body)
  "`let' bind all colors defined in `solo-jazz-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   solo-jazz-colors-alist))
     ,@body))

;;; Theme Faces

(solo-jazz-with-color-variables
  (custom-theme-set-faces
   'solo-jazz
   
   ;; font-lock 
   `(font-lock-builtin-face                   ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-comment-face                   ((t (:foreground ,solo-jazz-grey :slant italic))))
   `(font-lock-comment-delimiter-face         ((t (:inherit font-lock-comment-face))))
   `(font-lock-doc-face                       ((t (:inherit font-lock-comment-face))))
   `(font-lock-constant-face                  ((t (:foreground ,solo-jazz-blue))))
   `(font-lock-function-name-face             ((t (:foreground ,solo-jazz-pink))))
   `(font-lock-keyword-face                   ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-negation-char-face             ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-preprocessor-face              ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-regexp-grouping-construct      ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-regexp-grouping-backslash      ((t (:foreground ,solo-jazz-grey))))
   `(font-lock-string-face                    ((t (:foreground ,solo-jazz-blue+1))))
   `(font-lock-type-face                      ((t (:foreground ,solo-jazz-blue))))
   `(font-lock-variable-name-face             ((t (:foreground ,solo-jazz-orange)))) 
   `(font-lock-warning-face                   ((t (:foreground ,solo-jazz-orange))))

   ;; basic
   `(default                                  ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(link                                     ((t (:foreground ,solo-jazz-teal :underline t))))
   `(link-visited                             ((t (:inherit link :underline nil))))
   '(button                                   ((t (:inherit link))))
   `(cursor                                   ((t (:background ,solo-jazz-teal+1))))
   `(escape-glyph                             ((t (:foreground ,solo-jazz-teal))))
   `(shadow                                   ((t (:foreground ,solo-jazz-grey))))
   `(file-name-shadow                         ((t (:foreground ,solo-jazz-grey))))
   `(fringe                                   ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(popup-tip-face                           ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white-1))))
   `(header-line                              ((t (:foreground ,solo-jazz-purple))))
   `(highlight                                ((t (:background ,solo-jazz-white-1))))
   `(success                                  ((t (:foreground ,solo-jazz-green :weight bold))))
   `(warning                                  ((t (:foreground ,solo-jazz-orange :weight bold))))
   `(error                                    ((t (:foreground ,solo-jazz-red :weight bold))))
   `(tooltip                                  ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white)))) 
   `(menu                                     ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(minibuffer-prompt                        ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(mode-line                                ((,class (:foreground ,solo-jazz-purple :background ,solo-jazz-white-1 ))))
   `(mode-line-buffer-id                      ((t (:foreground ,solo-jazz-teal)))) 
   `(mode-line-inactive                       ((t (:foreground ,solo-jazz-grey :background ,solo-jazz-white :box (:line-width -1 :color ,solo-jazz-border)))))
   `(region                                   ((,class (:background ,solo-jazz-white-1))))
   `(secondary-selection                      ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple))))
   `(trailing-whitespace                      ((t (:background ,solo-jazz-red))))
   `(vertical-border                          ((t (:foreground ,solo-jazz-border))))

   ;; avy
   `(avy-background-face                      ((t (:foreground ,solo-jazz-grey :background ,solo-jazz-white))))
   `(avy-lead-face                            ((t (:background ,solo-jazz-purple+1 :foreground ,solo-jazz-white :weight bold))))
   `(avy-lead-face-0                          ((t (:background ,solo-jazz-blue :foreground ,solo-jazz-white :weight bold))))
   `(avy-lead-face-2                          ((t (:background ,solo-jazz-teal :foreground ,solo-jazz-white :weight bold))))
   `(avy-lead-face-1                          ((t (:background ,solo-jazz-purple :foreground ,solo-jazz-white :weight bold))))

   ;; centaur-tabs
   `(centaur-tabs-default                     ((t (:background ,solo-jazz-white :foreground ,solo-jazz-white))))
   `(tab-line                                 ((t (:background ,solo-jazz-white))))
   `(centaur-tabs-selected                    ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :box nil))))
   `(centaur-tabs-unselected                  ((t (:background ,solo-jazz-white-1 :foreground ,solo-jazz-grey :box nil))))
   `(centaur-tabs-selected-modified           ((t (:background ,solo-jazz-white :foreground ,solo-jazz-red :box nil))))
   `(centaur-tabs-unselected-modified         ((t (:background ,solo-jazz-white-1 :foreground ,solo-jazz-red :box nil))))
   `(centaur-tabs-active-bar-face             ((t (:background ,solo-jazz-teal :box nil))))
   `(centaur-tabs-modified-marker-selected    ((t (:inherit 'centaur-tabs-selected-modified :foreground ,solo-jazz-teal :box nil))))
   `(centaur-tabs-modified-marker-unselected  ((t (:inherit 'centaur-tabs-unselected-modified :foreground ,solo-jazz-teal :box nil))))
   
   ;; company
   `(company-tooltip                          ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white-1))))
   `(company-tooltip-annotation               ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white)))) 
   `(company-tooltip-annotation-selection     ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-teal+1))))
   `(company-tooltip-selection                ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-teal+1))))
   `(company-tooltip-mouse                    ((t (:background ,solo-jazz-teal+1))))
   `(company-tooltip-common                   ((t (:foreground ,solo-jazz-blue))))
   `(company-tooltip-common-selection         ((t (:foreground ,solo-jazz-blue))))
   `(company-scrollbar-fg                     ((t (:background ,solo-jazz-purple))))
   `(company-scrollbar-bg                     ((t (:background ,solo-jazz-white-1))))
   `(company-preview                          ((t (:background ,solo-jazz-grey))))
   `(company-preview-common                   ((t (:foreground ,solo-jazz-grey :background ,solo-jazz-teal+1))))

   ;; cider
   `(cider-result-overlay-face                ((t (:forground ,solo-jazz-purple :box (:color ,solo-jazz-purple :line-width -1))))) 
   `(cider-enlightened-face                   ((t (:box (:color ,solo-jazz-purple :line-width -1)))))
   `(cider-enlightened-local-face             ((t (:weight bold :foreground ,solo-jazz-purple))))
   `(cider-deprecated-face                    ((t (:background ,solo-jazz-purple))))
   `(cider-instrumented-face                  ((t (:box (:color ,solo-jazz-blue+1 :line-width -1)))))
   `(cider-traced-face                        ((t (:box (:color ,solo-jazz-pink :line-width -1)))))
   `(cider-test-failure-face                  ((t (:background ,solo-jazz-red :foreground ,solo-jazz-white))))
   `(cider-test-error-face                    ((t (:inherit error))))
   `(cider-test-success-face                  ((t (:background ,solo-jazz-green :foreground ,solo-jazz-black))))

   ;; diff
   `(diff-added                               ((t (:background ,solo-jazz-diff-added :foreground ,solo-jazz-black))))
   `(diff-changed                             ((t (:background ,solo-jazz-diff-changed :foreground ,solo-jazz-black))))
   `(diff-removed                             ((t (:background ,solo-jazz-diff-removed :foreground ,solo-jazz-black))))
   `(diff-refine-added                        ((t (:background ,solo-jazz-diff-added-highlight :foreground ,solo-jazz-black))))
   `(diff-refine-change                       ((t (:background ,solo-jazz-diff-changed-highlight :foreground ,solo-jazz-black))))
   `(diff-refine-removed                      ((t (:background ,solo-jazz-diff-removed-highlight :foreground ,solo-jazz-black))))
   `(diff-header                              ((,class (:background ,solo-jazz-white)) (t (:background ,solo-jazz-purple :foreground ,solo-jazz-white))))
   `(diff-file-header                         ((,class (:background ,solo-jazz-white :foreground ,solo-jazz-purple :bold t)) (t (:background ,solo-jazz-purple :foreground ,solo-jazz-white :bold t))))

   ;; doom-modeline
   `(doom-modeline-buffer-path                ((t (:foreground ,solo-jazz-purple))))
   `(doom-modeline-project-dir                ((t (:foreground ,solo-jazz-blue))))
   `(doom-modeline-buffer-file                ((t (:foreground ,solo-jazz-pink))))
   `(doom-modeline-buffer-major-mode          ((t (:foreground ,solo-jazz-purple))))
   `(doom-modeline-info                       ((t (:foreground ,solo-jazz-teal))))

   ;; ido
   `(ido-first-match                          ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-teal+1 :weight bold))))
   `(ido-only-match                           ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-teal+1 :weight bold))))
   `(ido-subdir                               ((t (:foreground ,solo-jazz-blue))))
   `(ido-indicator                            ((t (:foreground ,solo-jazz-teal :background ,solo-jazz-purple))))

   ;; isearch
   `(isearch                                  ((t (:foreground ,solo-jazz-purple+1 :weight bold :background ,solo-jazz-teal+1))))
   `(isearch-fail                             ((t (:foreground ,solo-jazz-red :background ,solo-jazz-white))))
   `(lazy-highlight                           ((t (:foreground ,solo-jazz-purple :weight bold :background ,solo-jazz-white-1))))

   ;; ivy
   `(ivy-confirm-face                         ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(ivy-current-match                        ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple :weight bold)))) 
   `(ivy-match-required-face                  ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(ivy-remote                               ((t (:foreground ,solo-jazz-blue :background ,solo-jazz-white))))
   `(ivy-subdir                               ((t (:foreground ,solo-jazz-blue :background ,solo-jazz-white))))
   `(ivy-virtual                              ((t (:foreground ,solo-jazz-grey))))
   `(ivy-minibuffer-match-face-1              ((t (:background ,solo-jazz-white-1))))
   `(ivy-minibuffer-match-face-2              ((t (:background ,solo-jazz-grey))))
   `(ivy-minibuffer-match-face-3              ((t (:background ,solo-jazz-grey))))
   `(ivy-minibuffer-match-face-4              ((t (:background ,solo-jazz-purple))))

   ;; keycast
   `(keycast-command                          ((t (:foreground ,solo-jazz-blue))))
   `(keycast-key                              ((t (:foreground ,solo-jazz-teal+1 :background ,solo-jazz-purple))))

   ;; lispy
   `(lispy-command-name-face                  ((t (:background ,solo-jazz-white-1 :inherit font-lock-function-name-face))))
   `(lispy-cursor-face                        ((t (:foreground ,solo-jazz-white :background ,solo-jazz-purple))))
   `(lispy-face-hint                          ((t (:inherit highlight :foreground ,solo-jazz-teal))))

   
   ;; magit
   `(magit-bisect-good                        ((t (:foreground ,solo-jazz-grey))))
   `(magit-bisect-skip                        ((t (:foreground ,solo-jazz-teal))))
   `(magit-bisect-bad                         ((t (:foreground ,solo-jazz-blue+1))))

   `(magit-blame-heading                      ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple))))
   `(magit-blame-hash                         ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple))))
   `(magit-blame-name                         ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple))))
   `(magit-blame-date                         ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple))))
   `(magit-blame-summary                      ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple :weight bold))))

   `(magit-branch-remote                      ((t (:foreground ,solo-jazz-green  :weight bold))))
   `(magit-branch-local                       ((t (:foreground ,solo-jazz-blue+1   :weight bold))))
   `(magit-branch-current                     ((t (:foreground ,solo-jazz-blue+1   :weight bold :box t))))

   `(magit-cherry-unmatched                   ((t (:foreground ,solo-jazz-pink))))
   `(magit-cherry-equivalent                  ((t (:foreground ,solo-jazz-purple))))

   `(magit-diffstat-added                     ((t (:foreground ,solo-jazz-blue))))
   `(magit-diffstat-removed                   ((t (:foreground ,solo-jazz-blue+1))))
   
   `(magit-diff-added                         ((t (:inherit diff-added))))
   `(magit-diff-added-highlight               ((t (:inherit diff-refine-added))))
   `(magit-diff-context-highlight             ((t (:background ,solo-jazz-white :foreground "grey70"))))
   `(magit-diff-file-heading                  ((t (:weight bold))))
   `(magit-diff-file-heading-highlight        ((t (:background ,solo-jazz-white  :weight bold))))
   `(magit-diff-file-heading-selection        ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :weight bold))))
   `(magit-diff-hunk-heading                  ((t (:background ,solo-jazz-white))))
   `(magit-diff-hunk-heading-highlight        ((t (:background ,solo-jazz-white))))
   `(magit-diff-hunk-heading-selection        ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple))))
   `(magit-diff-lines-heading                 ((t (:background ,solo-jazz-purple :foreground ,solo-jazz-white))))
   `(magit-diff-removed                       ((t (:inherit diff-removed))))
   `(magit-diff-removed-highlight             ((t (:inherit diff-refine-removed))))

   `(magit-dimmed                             ((t (:foreground ,solo-jazz-grey))))
   `(magit-hash                               ((t (:foreground ,solo-jazz-pink))))
   `(magit-head                               ((t (:foreground ,solo-jazz-purple   :weight bold))))
   
   `(magit-log-author                         ((t (:foreground ,solo-jazz-blue))))
   `(magit-log-date                           ((t (:foreground ,solo-jazz-purple))))
   `(magit-log-graph                          ((t (:foreground ,solo-jazz-purple))))
   
   `(magit-popup-heading                      ((t (:foreground ,solo-jazz-teal  :weight bold))))
   `(magit-popup-key                          ((t (:foreground ,solo-jazz-grey :weight bold))))
   `(magit-popup-argument                     ((t (:foreground ,solo-jazz-grey   :weight bold))))
   `(magit-popup-disabled-argument            ((t (:foreground ,solo-jazz-purple    :weight normal))))
   `(magit-popup-option-value                 ((t (:foreground ,solo-jazz-purple  :weight bold))))
   
   `(magit-process-ok                         ((t (:inheret success))))
   `(magit-process-ng                         ((t (:inherit error))))

   `(magit-reflog-commit                      ((t (:foreground ,solo-jazz-grey))))
   `(magit-reflog-amend                       ((t (:foreground ,solo-jazz-purple))))
   `(magit-reflog-merge                       ((t (:foreground ,solo-jazz-grey))))
   `(magit-reflog-checkout                    ((t (:foreground ,solo-jazz-purple))))
   `(magit-reflog-reset                       ((t (:foreground ,solo-jazz-blue+1))))
   `(magit-reflog-rebase                      ((t (:foreground ,solo-jazz-purple))))
   `(magit-reflog-cherry-pick                 ((t (:foreground ,solo-jazz-grey))))
   `(magit-reflog-remote                      ((t (:foreground ,solo-jazz-pink))))
   `(magit-reflog-other                       ((t (:foreground ,solo-jazz-pink))))

   `(magit-refname                            ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :weight bold))))
   `(magit-refname-stash                      ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :weight bold))))
   `(magit-refname-wip                        ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :weight bold))))
   
   `(magit-section-highlight                  ((t (:background ,solo-jazz-white-1))))
   `(magit-section-heading                    ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(magit-section-heading-selection          ((t (:foreground ,solo-jazz-purple :weight bold))))
   
   `(magit-sequence-pick                      ((t (:foreground ,solo-jazz-purple))))
   `(magit-sequence-stop                      ((t (:foreground ,solo-jazz-grey))))
   `(magit-sequence-part                      ((t (:foreground ,solo-jazz-teal))))
   `(magit-sequence-head                      ((t (:foreground ,solo-jazz-purple))))
   `(magit-sequence-drop                      ((t (:foreground ,solo-jazz-blue+1))))
   `(magit-sequence-done                      ((t (:foreground ,solo-jazz-purple))))
   `(magit-sequence-onto                      ((t (:foreground ,solo-jazz-purple))))

   `(magit-tag                                ((t (:foreground ,solo-jazz-pink :weight bold))))
   
   `(magit-signature-good                     ((t (:foreground ,solo-jazz-grey))))
   `(magit-signature-bad                      ((t (:foreground ,solo-jazz-blue+1))))
   `(magit-signature-untrusted                ((t (:foreground ,solo-jazz-teal))))

   ;; markdown
   `(markdown-header-face                     ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(markdown-language-keyword-face           ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-pink :weight bold))))
   `(markdown-inline-code-face                ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-blue :background ,solo-jazz-off-white))))
   `(markdown-code-face                       ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-blue :background ,solo-jazz-off-white))))

   ;; neotree
   `(neo-banner-face                          ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(neo-header-face                          ((t (:foreground ,solo-jazz-purple))))
   `(neo-root-dir-face                        ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(neo-dir-link-face                        ((t (:foreground ,solo-jazz-blue))))
   `(neo-file-link-face                       ((t (:foreground ,solo-jazz-purple))))
   `(neo-expand-btn-face                      ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-default-face                      ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-user-face                         ((t (:foreground ,solo-jazz-blue+1 :slant italic))))
   `(neo-vc-up-to-date-face                   ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-edited-face                       ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-needs-merge-face                  ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-unlocked-changes-face             ((t (:foreground ,solo-jazz-blue+1 :background ,solo-jazz-purple))))
   `(neo-vc-added-face                        ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-conflict-face                     ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-missing-face                      ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-ignored-face                      ((t (:foreground ,solo-jazz-purple))))

   ;; pos-tip
   `(pos-tip-foreground-color                 ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(pos-tip-background-color                 ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))

   ;; racket
   `(racket-keyword-argument-face             ((t (:inherit font-lock-constant-face)))) 
   `(racket-selfeval-face                     ((t (:inherit font-lock-type-face))))

   ;; show-paren
   `(show-paren-mismatch                      ((t (:foreground ,solo-jazz-grey :background ,solo-jazz-white :weight bold))))
   `(show-paren-match                         ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-teal+1 :weight bold))))

   
   ;; undo-tree
   `(undo-tree-visualizer-active-branch-face  ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(undo-tree-visualizer-current-face        ((t (:foreground ,solo-jazz-blue :weight bold))))
   `(undo-tree-visualizer-default-face        ((t (:foreground ,solo-jazz-purple))))
   `(undo-tree-visualizer-register-face       ((t (:foreground ,solo-jazz-orange))))
   `(undo-tree-visualizer-unmodified-face     ((t (:foreground ,solo-jazz-pink))))

   ;; web-mode
   `(web-mode-builtin-face                    ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face                    ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face                   ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face                ((t (:foreground ,solo-jazz-orange ))))
   `(web-mode-css-prop-face                   ((t (:foreground ,solo-jazz-orange))))
   `(web-mode-css-pseudo-class-face           ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(web-mode-css-rule-face                   ((t (:foreground ,solo-jazz-teal))))
   `(web-mode-doctype-face                    ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face                     ((t (:underline t))))
   `(web-mode-function-name-face              ((t (:foreground ,solo-jazz-pink))))
   `(web-mode-html-attr-name-face             ((t (:foreground ,solo-jazz-pink))))
   `(web-mode-html-attr-value-face            ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face                   ((t (:foreground ,solo-jazz-teal)))) 
   `(web-mode-keyword-face                    ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face               ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face                     ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face                       ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face              ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face          ((t (:background ,solo-jazz-white))))
   `(web-mode-server-comment-face             ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face              ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face                     ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face                    ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face                ((t (:background ,solo-jazz-blue+1))))))

;;; Theme Variables
(solo-jazz-with-color-variables
  (custom-theme-set-variables
   'solo-jazz

   ;; ansi-color
   `(ansi-color-names-vector [,solo-jazz-white ,solo-jazz-blue+1 ,solo-jazz-grey ,solo-jazz-teal
																							 ,solo-jazz-grey ,solo-jazz-grey ,solo-jazz-pink ,solo-jazz-grey])
   ;; fill-column-indicator
   `(fci-rule-color ,solo-jazz-grey)

   ;; nrepl-client
   `(nrepl-message-colors
     '(,solo-jazz-blue+1 ,solo-jazz-grey ,solo-jazz-teal ,solo-jazz-grey ,solo-jazz-blue
												 ,solo-jazz-pink ,solo-jazz-teal ,solo-jazz-grey))
   ;; pdf-tools
   `(pdf-view-midnight-colors '(,solo-jazz-grey . ,solo-jazz-white-1))

   ;; vc-annotate
   `(vc-annotate-color-map
     '((20 . ,solo-jazz-grey)
       (40 . ,solo-jazz-blue+1)
       (60 . ,solo-jazz-grey)
       (80 . ,solo-jazz-grey)
       (100 . ,solo-jazz-grey)
       (120 . ,solo-jazz-teal)
       (140 . ,solo-jazz-grey)
       (160 . ,solo-jazz-grey)
       (180 . ,solo-jazz-grey)
       (200 . ,solo-jazz-grey)
       (220 . ,solo-jazz-teal)
       (240 . ,solo-jazz-blue)
       (260 . ,solo-jazz-pink)
       (280 . ,solo-jazz-grey)
       (300 . ,solo-jazz-blue)
       (320 . ,solo-jazz-grey)
       (340 . ,solo-jazz-teal)
       (360 . ,solo-jazz-grey)))
   `(vc-annotate-very-old-color ,solo-jazz-grey)
   `(vc-annotate-background ,solo-jazz-teal+1)))

;;; Rainbow Support

(declare-function rainbow-mode 'rainbow-mode)
(declare-function rainbow-colorize-by-assoc 'rainbow-mode)

(defvar solo-jazz-add-font-lock-keywords nil
  "Whether to add font-lock keywords for solo-jazz color names.

In buffers visiting library `solo-jazz-theme.el' the solo-jazz
specific keywords are always added, provided that library has
been loaded (because that is where the code that does it is
definded).  If you visit this file and only enable the theme,
then you have to turn `rainbow-mode' off and on again for the
solo-jazz-specific font-lock keywords to be used.

In all other Emacs-Lisp buffers this variable controls whether
this should be done.  This requires library `rainbow-mode'.")

(defvar solo-jazz-colors-font-lock-keywords nil)

(defun solo-jazz--rainbow-turn-on ()
  "Maybe also add font-lock keywords for solo-jazz colors."
  (when (and (derived-mode-p 'emacs-lisp-mode)
             (or solo-jazz-add-font-lock-keywords
                 (and (buffer-file-name)
                      (equal (file-name-nondirectory (buffer-file-name))
                             "solo-jazz-theme.el"))))
    (unless solo-jazz-colors-font-lock-keywords
      (setq solo-jazz-colors-font-lock-keywords
            `((,(regexp-opt (mapcar 'car solo-jazz-default-colors-alist) 'words)
               (0 (rainbow-colorize-by-assoc solo-jazz-default-colors-alist))))))
    (font-lock-add-keywords nil solo-jazz-colors-font-lock-keywords 'end)))

(defun solo-jazz--rainbow-turn-off ()
  "Also remove font-lock keywords for solo-jazz colors."
  (font-lock-remove-keywords nil solo-jazz-colors-font-lock-keywords))

(when (fboundp 'advice-add)
  (advice-add 'rainbow-turn-on :after  #'solo-jazz--rainbow-turn-on)
  (advice-add 'rainbow-turn-off :after #'solo-jazz--rainbow-turn-off))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'solo-jazz)

;;; solo-jazz-theme.el ends here

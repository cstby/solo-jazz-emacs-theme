;;; solo-jazz-theme.el --- The Solo-Jazz color theme -*- lexical-binding: t; -*-

;; Copyright (C) 2020, Carl Steib

;; Author: Carl Steib
;; URL: https://github.com/cstby/solo-jazz-emacs-theme
;; Version: 0.9.0
;; Package-Requires: ((emacs "24.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;; This file is not part of emacs.

;;; Commentary:

;; An original theme inspired by the 1992 Jazz cup design.
;; Original jazz design colors: #3B2685  #9D2DAB #04c4c7

;;; Credits:

;; Gina Ekiss created the original solo-jazz design that inspired this theme.
;; Bozhidar Batsov's emacs port of the Zenburn theme served as the base for this file.
;; Ian Y.E Pan's many emacs themes were the starting point for my readme.

;;; Code:

(deftheme solo-jazz "The Solo-Jazz color theme")

;;; Color Palette

(eval-and-compile
  (defvar solo-jazz-theme-default-colors-alist
    '(("solo-jazz-white"                  . "#fafafa")
      ("solo-jazz-white-1"                . "#f4f4f4")
      ("solo-jazz-white-2"                . "#efeff1")
      ("solo-jazz-lavender"               . "#eaeafa")
      ("solo-jazz-azure"                  . "#eafafa")
      ("solo-jazz-honeydew"               . "#eafaea")
      ("solo-jazz-rose"                   . "#faeaea")
      ("solo-jazz-grey"                   . "#d0d0d0")
      ("solo-jazz-slate"                  . "#778ca3")
      ("solo-jazz-black"                  . "#24292e")

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
      ("solo-jazz-diff-added-highlight"   . "#ccffd8")
      ("solo-jazz-diff-added-refine"      . "#acf2bc")
      ("solo-jazz-diff-changed"           . "#ffe1b9")
      ("solo-jazz-diff-changed-highlight" . "#ffc86f")
      ("solo-jazz-diff-removed"           . "#ffeef0")
      ("solo-jazz-diff-removed-highlight" . "#ffd7d5")
      ("solo-jazz-diff-removed-refine"    . "#fdb8c0"))

    "Solo-Jazz color palette.Each element has the form (NAME . HEX)."))

(defmacro solo-jazz-theme-with-color-variables (&rest body)
  "`let' bind all colors defined in `solo-jazz-colors-alist' around BODY.
Also bind `class' to ((class color) (min-colors 89))."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@(mapcar (lambda (cons)
                     (list (intern (car cons)) (cdr cons)))
                   solo-jazz-theme-default-colors-alist))
     ,@body))

;;; Theme Faces

(solo-jazz-theme-with-color-variables
  (custom-theme-set-faces
   'solo-jazz

   ;; font-lock
   `(font-lock-builtin-face                  ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-comment-face                  ((t (:foreground ,solo-jazz-slate :slant italic))))
   `(font-lock-comment-delimiter-face        ((t (:inherit font-lock-comment-face))))
   `(font-lock-doc-face                      ((t (:inherit font-lock-comment-face))))
   `(font-lock-constant-face                 ((t (:foreground ,solo-jazz-blue))))
   `(font-lock-function-name-face            ((t (:foreground ,solo-jazz-pink))))
   `(font-lock-keyword-face                  ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-negation-char-face            ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-preprocessor-face             ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-regexp-grouping-construct     ((t (:foreground ,solo-jazz-teal))))
   `(font-lock-regexp-grouping-backslash     ((t (:foreground ,solo-jazz-slate))))
   `(font-lock-string-face                   ((t (:foreground ,solo-jazz-blue+1))))
   `(font-lock-type-face                     ((t (:foreground ,solo-jazz-blue))))
   `(font-lock-variable-name-face            ((t (:foreground ,solo-jazz-orange))))
   `(font-lock-warning-face                  ((t (:foreground ,solo-jazz-orange))))

   ;; basic
   `(default                                 ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(link                                    ((t (:foreground ,solo-jazz-blue+1 :underline t))))
   `(link-visited                            ((t (:foreground ,solo-jazz-blue+1 :underline nil))))
   '(button                                  ((t (:inherit link))))
   `(cursor                                  ((t (:background ,solo-jazz-teal+1))))
   `(escape-glyph                            ((t (:foreground ,solo-jazz-teal))))
   `(shadow                                  ((t (:foreground ,solo-jazz-slate))))
   `(file-name-shadow                        ((t (:foreground ,solo-jazz-slate))))
   `(fringe                                  ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(popup-tip-face                          ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-lavender))))
   `(header-line                             ((t (:foreground ,solo-jazz-purple))))
   `(highlight                               ((t (:background ,solo-jazz-lavender))))
   `(success                                 ((t (:foreground ,solo-jazz-green :weight bold))))
   `(warning                                 ((t (:foreground ,solo-jazz-orange :weight bold))))
   `(error                                   ((t (:foreground ,solo-jazz-red :weight bold))))
   `(tooltip                                 ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(menu                                    ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(minibuffer-prompt                       ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(mode-line                               ((,class (:background ,solo-jazz-white-2 ))))
   `(mode-line-buffer-id                     ((t (:foreground ,solo-jazz-teal))))
   `(mode-line-inactive                      ((t (:foreground ,solo-jazz-slate :background ,solo-jazz-white :box (:line-width -1 :color ,solo-jazz-grey)))))
   `(region                                  ((,class (:background ,solo-jazz-lavender))))
   `(secondary-selection                     ((t (:background ,solo-jazz-honeydew))))
   `(trailing-whitespace                     ((t (:background ,solo-jazz-red))))
   `(vertical-border                         ((t (:foreground ,solo-jazz-grey))))

   ;; avy
   `(avy-background-face                     ((t (:foreground ,solo-jazz-slate :background ,solo-jazz-white))))
   `(avy-lead-face                           ((t (:background ,solo-jazz-purple+1 :foreground ,solo-jazz-white :weight bold))))
   `(avy-lead-face-0                         ((t (:background ,solo-jazz-blue :foreground ,solo-jazz-white :weight bold))))
   `(avy-lead-face-2                         ((t (:background ,solo-jazz-teal :foreground ,solo-jazz-white :weight bold))))
   `(avy-lead-face-1                         ((t (:background ,solo-jazz-purple :foreground ,solo-jazz-white :weight bold))))

   ;; centaur-tabs
   `(centaur-tabs-default                    ((t (:background ,solo-jazz-white :foreground ,solo-jazz-white))))
   `(tab-line                                ((t (:background ,solo-jazz-white))))
   `(centaur-tabs-selected                   ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :box nil))))
   `(centaur-tabs-unselected                 ((t (:background ,solo-jazz-white-2 :foreground ,solo-jazz-slate :box nil))))
   `(centaur-tabs-selected-modified          ((t (:background ,solo-jazz-white :foreground ,solo-jazz-red :box nil))))
   `(centaur-tabs-unselected-modified        ((t (:background ,solo-jazz-white-2 :foreground ,solo-jazz-red :box nil))))
   `(centaur-tabs-active-bar-face            ((t (:background ,solo-jazz-teal :box nil))))
   `(centaur-tabs-modified-marker-selected   ((t (:inherit 'centaur-tabs-selected-modified :foreground ,solo-jazz-teal :box nil))))
   `(centaur-tabs-modified-marker-unselected ((t (:inherit 'centaur-tabs-unselected-modified :foreground ,solo-jazz-teal :box nil))))

   ;; company
   `(company-tooltip                         ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white-1))))
   `(company-tooltip-annotation              ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white-1))))
   `(company-tooltip-annotation-selection    ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-lavender))))
   `(company-tooltip-selection               ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-lavender))))
   `(company-tooltip-mouse                   ((t (:background ,solo-jazz-lavender))))
   `(company-tooltip-common                  ((t (:foreground ,solo-jazz-blue))))
   `(company-tooltip-common-selection        ((t (:foreground ,solo-jazz-blue))))
   `(company-scrollbar-fg                    ((t (:background ,solo-jazz-purple))))
   `(company-scrollbar-bg                    ((t (:background ,solo-jazz-white-1))))
   `(company-preview                         ((t (:background ,solo-jazz-honeydew))))
   `(company-preview-common                  ((t (:foreground ,solo-jazz-teal :background ,solo-jazz-honeydew))))

   ;; cider
   `(cider-result-overlay-face               ((t (:foreground ,solo-jazz-purple :box (:color ,solo-jazz-purple :line-width -1)))))
   `(cider-enlightened-face                  ((t (:box (:color ,solo-jazz-purple :line-width -1)))))
   `(cider-enlightened-local-face            ((t (:weight bold :foreground ,solo-jazz-purple))))
   `(cider-deprecated-face                   ((t (:background ,solo-jazz-purple))))
   `(cider-instrumented-face                 ((t (:box (:color ,solo-jazz-blue+1 :line-width -1)))))
   `(cider-traced-face                       ((t (:box (:color ,solo-jazz-pink :line-width -1)))))
   `(cider-test-failure-face                 ((t (:background ,solo-jazz-red :foreground ,solo-jazz-white))))
   `(cider-test-error-face                   ((t (:inherit error))))
   `(cider-test-success-face                 ((t (:background ,solo-jazz-green :foreground ,solo-jazz-black))))

   ;; diff
   `(diff-added                              ((t (:background ,solo-jazz-diff-added :foreground ,solo-jazz-black))))
   `(diff-changed                            ((t (:background ,solo-jazz-diff-changed :foreground ,solo-jazz-black))))
   `(diff-removed                            ((t (:background ,solo-jazz-diff-removed :foreground ,solo-jazz-black))))
   `(diff-refine-added                       ((t (:background ,solo-jazz-diff-added-refine :foreground ,solo-jazz-black))))
   `(diff-refine-change                      ((t (:background ,solo-jazz-diff-changed-highlight :foreground ,solo-jazz-black))))
   `(diff-refine-removed                     ((t (:background ,solo-jazz-diff-removed-refine :foreground ,solo-jazz-black))))
   `(diff-header                             ((,class (:background ,solo-jazz-white)) (t (:background ,solo-jazz-purple :foreground ,solo-jazz-white))))
   `(diff-file-header                        ((,class (:background ,solo-jazz-white :foreground ,solo-jazz-purple :bold t)) (t (:background ,solo-jazz-purple :foreground ,solo-jazz-white :bold t))))

   ;; dired
   `(dired-directory                         ((t (:foreground ,solo-jazz-blue))))
   `(dired-header                            ((t (:foreground ,solo-jazz-teal))))
   `(dired-perm-write                        ((t (:foreground ,solo-jazz-pink))))
   `(dired-symlink                           ((t (:inherit link))))
   `(dired-subtree-depth-1-face              ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(dired-subtree-depth-2-face              ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(dired-subtree-depth-3-face              ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(dired-subtree-depth-4-face              ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(dired-subtree-depth-5-face              ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(dired-subtree-depth-6-face              ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(all-the-icons-dired-dir-face            ((t (:foreground ,solo-jazz-purple))))

   ;; doom-modeline
   `(doom-modeline-buffer-path               ((t (:foreground ,solo-jazz-purple))))
   `(doom-modeline-project-dir               ((t (:foreground ,solo-jazz-blue))))
   `(doom-modeline-buffer-file               ((t (:foreground ,solo-jazz-pink))))
   `(doom-modeline-buffer-major-mode         ((t (:foreground ,solo-jazz-purple))))
   `(doom-modeline-info                      ((t (:foreground ,solo-jazz-teal))))

   ;; eval-sexp-fu
   `(eval-sexp-fu-flash                      ((t (:background ,solo-jazz-blue :foreground ,solo-jazz-white))))
   `(eval-sexp-fu-flash-error                ((t (:inherit error))))

   ;; hl-line
   `(hl-line-face                            ((,class (:background ,solo-jazz-azure)) (t :weight bold)))
   `(hl-line                                 ((,class (:background ,solo-jazz-azure)) (t :weight bold)))

   ;; ido
   `(ido-first-match                         ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-teal+1 :weight bold))))
   `(ido-only-match                          ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-teal+1 :weight bold))))
   `(ido-subdir                              ((t (:foreground ,solo-jazz-blue))))
   `(ido-indicator                           ((t (:foreground ,solo-jazz-teal :background ,solo-jazz-purple))))

   ;; isearch
   `(isearch                                 ((t (:foreground ,solo-jazz-purple :weight bold :background ,solo-jazz-rose))))
   `(isearch-fail                            ((t (:foreground ,solo-jazz-red :background ,solo-jazz-white))))
   `(lazy-highlight                          ((t (:foreground ,solo-jazz-purple :weight bold :background ,solo-jazz-honeydew))))

   ;; ivy
   `(ivy-confirm-face                        ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(ivy-current-match                       ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-white :weight bold))))
   `(ivy-match-required-face                 ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(ivy-remote                              ((t (:foreground ,solo-jazz-blue :background ,solo-jazz-white))))
   `(ivy-subdir                              ((t (:foreground ,solo-jazz-blue :background ,solo-jazz-white))))
   `(ivy-virtual                             ((t (:foreground ,solo-jazz-slate))))
   `(ivy-minibuffer-match-face-1             ((t (:background ,solo-jazz-lavender))))
   `(ivy-minibuffer-match-face-2             ((t (:background ,solo-jazz-slate))))
   `(ivy-minibuffer-match-face-3             ((t (:background ,solo-jazz-slate))))
   `(ivy-minibuffer-match-face-4             ((t (:background ,solo-jazz-purple))))

   ;; keycast
   `(keycast-command                         ((t (:foreground ,solo-jazz-blue))))
   `(keycast-key                             ((t (:foreground ,solo-jazz-teal+1 :background ,solo-jazz-purple))))

   ;; linum
   `(linum                                   ((t (:foreground ,solo-jazz-slate :background ,solo-jazz-white))))

   ;; line-number
   `(line-number                             ((,class (:inherit fixed-pitch :foreground ,solo-jazz-slate :background ,solo-jazz-white))))
   `(line-number-current-line                ((,class (:inherit fixed-pitch :foreground ,solo-jazz-purple :weight bold :background ,solo-jazz-white))))

   ;; lispy
   `(lispy-command-name-face                 ((t (:background ,solo-jazz-lavender :foreground ,solo-jazz-pink))))
   `(lispy-cursor-face                       ((t (:foreground ,solo-jazz-white :background ,solo-jazz-purple))))
   `(lispy-face-hint                         ((t (:background ,solo-jazz-lavender :foreground ,solo-jazz-purple))))

   ;; magit
   `(magit-bisect-good                       ((t (:foreground ,solo-jazz-slate))))
   `(magit-bisect-skip                       ((t (:foreground ,solo-jazz-teal))))
   `(magit-bisect-bad                        ((t (:foreground ,solo-jazz-blue+1))))

   `(magit-blame-heading                     ((t (:background ,solo-jazz-lavender :foreground ,solo-jazz-purple))))
   `(magit-blame-hash                        ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple))))
   `(magit-blame-name                        ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple))))
   `(magit-blame-date                        ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple))))
   `(magit-blame-summary                     ((t (:background ,solo-jazz-teal+1 :foreground ,solo-jazz-purple :weight bold))))

   `(magit-branch-remote                     ((t (:foreground ,solo-jazz-green  :weight bold))))
   `(magit-branch-local                      ((t (:foreground ,solo-jazz-blue+1   :weight bold))))
   `(magit-branch-current                    ((t (:foreground ,solo-jazz-blue+1   :weight bold :box t))))

   `(magit-cherry-unmatched                  ((t (:foreground ,solo-jazz-pink))))
   `(magit-cherry-equivalent                 ((t (:foreground ,solo-jazz-purple))))

   `(magit-diffstat-added                    ((t (:foreground ,solo-jazz-blue))))
   `(magit-diffstat-removed                  ((t (:foreground ,solo-jazz-blue+1))))

   `(magit-diff-added                        ((t (:inherit diff-added))))
   `(magit-diff-added-highlight              ((t (:background ,solo-jazz-diff-added-highlight :foreground ,solo-jazz-black))))
   `(magit-diff-context                      ((t (:background ,solo-jazz-white :foreground ,solo-jazz-slate))))
   `(magit-diff-context-highlight            ((t (:background ,solo-jazz-white :foreground ,solo-jazz-black))))
   `(magit-diff-file-heading                 ((t (:weight bold))))
   `(magit-diff-file-heading-highlight       ((t (:background ,solo-jazz-lavender  :weight bold))))
   `(magit-diff-file-heading-selection       ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :weight bold))))
   `(magit-diff-hunk-heading                 ((t (:background ,solo-jazz-white-1 :foreground ,solo-jazz-black))))
   `(magit-diff-hunk-heading-highlight       ((t (:background ,solo-jazz-lavender :foreground ,solo-jazz-purple))))
   `(magit-diff-hunk-heading-selection       ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple))))
   `(magit-diff-lines-heading                ((t (:background ,solo-jazz-purple :foreground ,solo-jazz-white))))
   `(magit-diff-removed                      ((t (:inherit diff-removed))))
   `(magit-diff-removed-highlight            ((t (:background ,solo-jazz-diff-removed-highlight :foreground ,solo-jazz-black))))

   `(magit-dimmed                            ((t (:foreground ,solo-jazz-slate))))
   `(magit-hash                              ((t (:foreground ,solo-jazz-pink))))
   `(magit-head                              ((t (:foreground ,solo-jazz-purple   :weight bold))))

   `(magit-log-author                        ((t (:foreground ,solo-jazz-blue))))
   `(magit-log-date                          ((t (:foreground ,solo-jazz-teal))))
   `(magit-log-graph                         ((t (:foreground ,solo-jazz-slate))))

   `(magit-popup-heading                     ((t (:foreground ,solo-jazz-teal  :weight bold))))
   `(magit-popup-key                         ((t (:foreground ,solo-jazz-slate :weight bold))))
   `(magit-popup-argument                    ((t (:foreground ,solo-jazz-slate   :weight bold))))
   `(magit-popup-disabled-argument           ((t (:foreground ,solo-jazz-purple    :weight normal))))
   `(magit-popup-option-value                ((t (:foreground ,solo-jazz-purple  :weight bold))))

   `(magit-process-ok                        ((t (:inheret success))))
   `(magit-process-ng                        ((t (:inherit error))))

   `(magit-reflog-commit                     ((t (:foreground ,solo-jazz-slate))))
   `(magit-reflog-amend                      ((t (:foreground ,solo-jazz-purple))))
   `(magit-reflog-merge                      ((t (:foreground ,solo-jazz-slate))))
   `(magit-reflog-checkout                   ((t (:foreground ,solo-jazz-purple))))
   `(magit-reflog-reset                      ((t (:foreground ,solo-jazz-blue+1))))
   `(magit-reflog-rebase                     ((t (:foreground ,solo-jazz-purple))))
   `(magit-reflog-cherry-pick                ((t (:foreground ,solo-jazz-slate))))
   `(magit-reflog-remote                     ((t (:foreground ,solo-jazz-pink))))
   `(magit-reflog-other                      ((t (:foreground ,solo-jazz-pink))))

   `(magit-refname                           ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :weight bold))))
   `(magit-refname-stash                     ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :weight bold))))
   `(magit-refname-wip                       ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :weight bold))))

   `(magit-section-highlight                 ((t (:background ,solo-jazz-lavender))))
   `(magit-section-heading                   ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(magit-section-heading-selection         ((t (:foreground ,solo-jazz-purple :weight bold))))

   `(magit-sequence-pick                     ((t (:foreground ,solo-jazz-purple))))
   `(magit-sequence-stop                     ((t (:foreground ,solo-jazz-slate))))
   `(magit-sequence-part                     ((t (:foreground ,solo-jazz-teal))))
   `(magit-sequence-head                     ((t (:foreground ,solo-jazz-purple))))
   `(magit-sequence-drop                     ((t (:foreground ,solo-jazz-blue+1))))
   `(magit-sequence-done                     ((t (:foreground ,solo-jazz-purple))))
   `(magit-sequence-onto                     ((t (:foreground ,solo-jazz-purple))))

   `(magit-tag                               ((t (:foreground ,solo-jazz-orange :weight bold))))

   `(magit-signature-good                    ((t (:foreground ,solo-jazz-slate))))
   `(magit-signature-bad                     ((t (:foreground ,solo-jazz-blue+1))))
   `(magit-signature-untrusted               ((t (:foreground ,solo-jazz-teal))))

   ;; marginalia
   `(marginalia-documentation                ((t (:inherit font-lock-comment-face))))
   `(marginalia-file-priv-write              ((t (:inherit dired-perm-write))))
   `(marginalia-file-priv-read               ((t (:foreground ,solo-jazz-purple))))
   `(marginalia-file-priv-exec               ((t (:foreground ,solo-jazz-violet))))
   `(marginalia-key                          ((t (:foreground ,solo-jazz-blue))))

   ;; markdown
   `(markdown-header-face                    ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(markdown-language-keyword-face          ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-slate :weight bold))))
   `(markdown-inline-code-face               ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-violet :background ,solo-jazz-rose))))
   `(markdown-code-face                      ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-purple :background ,solo-jazz-white-1 :extend t))))

   ;; neotree
   `(neo-banner-face                         ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(neo-header-face                         ((t (:foreground ,solo-jazz-purple))))
   `(neo-root-dir-face                       ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(neo-dir-link-face                       ((t (:foreground ,solo-jazz-blue))))
   `(neo-file-link-face                      ((t (:foreground ,solo-jazz-purple))))
   `(neo-expand-btn-face                     ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-default-face                     ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-user-face                        ((t (:foreground ,solo-jazz-blue+1 :slant italic))))
   `(neo-vc-up-to-date-face                  ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-edited-face                      ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-needs-merge-face                 ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-unlocked-changes-face            ((t (:foreground ,solo-jazz-blue+1 :background ,solo-jazz-purple))))
   `(neo-vc-added-face                       ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-conflict-face                    ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-missing-face                     ((t (:foreground ,solo-jazz-purple))))
   `(neo-vc-ignored-face                     ((t (:foreground ,solo-jazz-purple))))

   ;; org
   `(org-agenda-clocking                     ((t (:bold t :background ,solo-jazz-white))))
   `(org-agenda-date-today                   ((t (:foreground ,solo-jazz-purple :slant italic :weight bold))))
   `(org-agenda-done                         ((t (:foreground ,solo-jazz-teal+1 :strike-through t))))
   `(org-agenda-structure                    ((t (:foreground ,solo-jazz-slate))))

   `(org-archived                            ((t (:foreground ,solo-jazz-purple :weight bold))))
   `(org-block                               ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-purple :background ,solo-jazz-white-1 :extend t))))
   `(org-block-begin-line                    ((t (:foreground ,solo-jazz-slate :extend t))))
   `(org-block-end-line                      ((t (:foreground ,solo-jazz-slate :extend t))))
   `(org-checkbox                            ((t (:background ,solo-jazz-white :foreground ,solo-jazz-purple :box (:line-width 1 :style released-button)))))
   `(org-code                                ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-violet :background ,solo-jazz-rose))))
   `(org-column                              ((t (:background ,solo-jazz-teal+1))))
   `(org-column-title                        ((t (:background ,solo-jazz-teal+1 :underline t :weight bold))))
   `(org-date                                ((t (:foreground ,solo-jazz-purple :underline t))))
   `(org-deadline-announce                   ((t (:foreground ,solo-jazz-purple))))
   `(org-document-info                       ((t (:foreground ,solo-jazz-teal))))
   `(org-document-info-keyword               ((t (:inherit font-lock-comment-face))))
   `(org-document-title                      ((t (:foreground ,solo-jazz-blue :weight bold))))
   `(org-done                                ((t (:weight bold :foreground ,solo-jazz-teal+1 :strike-through t))))
   `(org-ellipsis                            ((t (:foreground ,solo-jazz-purple :underline t))))
   `(org-footnote                            ((t (:foreground ,solo-jazz-blue :underline t))))
   `(org-formula                             ((t (:foreground ,solo-jazz-purple))))

   `(org-habit-ready-face                    ((t :background ,solo-jazz-teal+1)))
   `(org-habit-alert-face                    ((t :background ,solo-jazz-pink :foreground ,solo-jazz-white)))
   `(org-habit-clear-face                    ((t :background ,solo-jazz-blue)))
   `(org-habit-overdue-face                  ((t :background ,solo-jazz-red)))
   `(org-habit-clear-future-face             ((t :background ,solo-jazz-blue+1)))
   `(org-habit-ready-future-face             ((t :background ,solo-jazz-green)))
   `(org-habit-alert-future-face             ((t :background ,solo-jazz-violet :foreground ,solo-jazz-white)))
   `(org-habit-overdue-future-face           ((t :background ,solo-jazz-orange)))

   `(org-headline-done                       ((t (:foreground ,solo-jazz-teal+1 :strike-through t))))
   `(org-hide                                ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-white))))
   `(org-indent                              ((t (:inherit 'fixed-pitch :foreground ,solo-jazz-white))))

   `(org-level-1                             ((t (:foreground ,solo-jazz-teal))))
   `(org-level-2                             ((t (:foreground ,solo-jazz-blue))))
   `(org-level-3                             ((t (:foreground ,solo-jazz-pink))))
   `(org-level-4                             ((t (:foreground ,solo-jazz-violet))))
   `(org-level-5                             ((t (:foreground ,solo-jazz-red))))
   `(org-level-6                             ((t (:foreground ,solo-jazz-orange))))
   `(org-level-7                             ((t (:foreground ,solo-jazz-purple+1))))
   `(org-level-8                             ((t (:foreground ,solo-jazz-black))))

   `(org-link                                ((t (:foreground ,solo-jazz-blue+1 :underline t))))
   `(org-meta-line                           ((t (:inherit font-lock-comment-face))))
   `(org-mode-line-clock                     ((t (:foreground ,solo-jazz-teal+1 :background ,solo-jazz-purple))))
   `(org-mode-line-clock-overrun             ((t (:foreground ,solo-jazz-white :background ,solo-jazz-purple))))

   `(org-scheduled                           ((t (:foreground ,solo-jazz-blue))))
   `(org-scheduled-previously                ((t (:foreground ,solo-jazz-blue+1))))
   `(org-scheduled-today                     ((t (:foreground ,solo-jazz-teal))))

   `(org-sexp-date                           ((t (:foreground ,solo-jazz-teal :underline t))))
   `(org-special-keyword                     ((t (:inherit font-lock-comment-face))))
   `(org-table                               ((t (:inherit fixed-width :foreground ,solo-jazz-slate))))
   `(org-tag                                 ((t (:bold t :weight bold))))
   `(org-time-grid                           ((t (:foreground ,solo-jazz-purple))))
   `(org-todo                                ((t (:bold t :foreground ,solo-jazz-pink :weight bold))))
   `(org-upcoming-deadline                   ((t (:foreground ,solo-jazz-pink))))
   `(org-verbatim                            ((t (:foreground ,solo-jazz-slate :weight bold))))
   `(org-warning                             ((t (:bold t :foreground ,solo-jazz-orange :weight bold :underline nil))))

   ;; pos-tip
   `(pos-tip-foreground-color                ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))
   `(pos-tip-background-color                ((t (:foreground ,solo-jazz-purple :background ,solo-jazz-white))))

   ;; racket
   `(racket-keyword-argument-face            ((t (:inherit font-lock-constant-face))))
   `(racket-selfeval-face                    ((t (:inherit font-lock-type-face))))

   ;; show-paren
   `(show-paren-mismatch                     ((t (:foreground ,solo-jazz-red :background ,solo-jazz-white :weight bold))))
   `(show-paren-match                        ((t (:foreground ,solo-jazz-teal+1 :background ,solo-jazz-honeydew :weight bold))))
   `(show-paren-match-expression             ((t (:background ,solo-jazz-honeydew))))

   ;; undo-tree
   `(undo-tree-visualizer-active-branch-face ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(undo-tree-visualizer-current-face       ((t (:foreground ,solo-jazz-blue :weight bold))))
   `(undo-tree-visualizer-default-face       ((t (:foreground ,solo-jazz-purple))))
   `(undo-tree-visualizer-register-face      ((t (:foreground ,solo-jazz-orange))))
   `(undo-tree-visualizer-unmodified-face    ((t (:foreground ,solo-jazz-pink))))

   ;; web-mode
   `(web-mode-builtin-face                   ((t (:inherit ,font-lock-builtin-face))))
   `(web-mode-comment-face                   ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-constant-face                  ((t (:inherit ,font-lock-constant-face))))
   `(web-mode-css-at-rule-face               ((t (:foreground ,solo-jazz-orange ))))
   `(web-mode-css-prop-face                  ((t (:foreground ,solo-jazz-orange))))
   `(web-mode-css-pseudo-class-face          ((t (:foreground ,solo-jazz-teal :weight bold))))
   `(web-mode-current-column-highlight-face  ((t (:background ,solo-jazz-lavender))))
   `(web-mode-current-element-highlight-face ((t (:background ,solo-jazz-azure))))
   `(web-mode-css-rule-face                  ((t (:foreground ,solo-jazz-teal))))
   `(web-mode-doctype-face                   ((t (:inherit ,font-lock-comment-face))))
   `(web-mode-folded-face                    ((t (:underline t))))
   `(web-mode-function-name-face             ((t (:foreground ,solo-jazz-pink))))
   `(web-mode-html-attr-name-face            ((t (:foreground ,solo-jazz-pink))))
   `(web-mode-html-attr-value-face           ((t (:inherit ,font-lock-string-face))))
   `(web-mode-html-tag-face                  ((t (:foreground ,solo-jazz-teal))))
   `(web-mode-keyword-face                   ((t (:inherit ,font-lock-keyword-face))))
   `(web-mode-preprocessor-face              ((t (:inherit ,font-lock-preprocessor-face))))
   `(web-mode-string-face                    ((t (:inherit ,font-lock-string-face))))
   `(web-mode-type-face                      ((t (:inherit ,font-lock-type-face))))
   `(web-mode-variable-name-face             ((t (:inherit ,font-lock-variable-name-face))))
   `(web-mode-server-background-face         ((t (:background ,solo-jazz-white))))
   `(web-mode-server-comment-face            ((t (:inherit web-mode-comment-face))))
   `(web-mode-server-string-face             ((t (:inherit web-mode-string-face))))
   `(web-mode-symbol-face                    ((t (:inherit font-lock-constant-face))))
   `(web-mode-warning-face                   ((t (:inherit font-lock-warning-face))))
   `(web-mode-whitespaces-face               ((t (:background ,solo-jazz-blue+1))))

   ;; whitespace
   `(whitespace-space                        ((t (:background ,solo-jazz-white :foreground ,solo-jazz-slate))))
   `(whitespace-hspace                       ((t (:background ,solo-jazz-white :foreground ,solo-jazz-slate))))
   `(whitespace-newline                      ((t (:background ,solo-jazz-white :foreground ,solo-jazz-slate))))
   `(whitespace-trailing                     ((t (:background ,solo-jazz-red :foreground ,solo-jazz-white))))
   `(whitespace-space-before-tab             ((t (:background ,solo-jazz-red :foreground ,solo-jazz-white))))
   `(whitespace-space-after-tab              ((t (:background ,solo-jazz-red :foreground ,solo-jazz-white))))
   `(whitespace-tab                          ((t (:background ,solo-jazz-red :foreground ,solo-jazz-white))))
   `(whitespace-indentation                  ((t (:background ,solo-jazz-pink :foreground ,solo-jazz-white))))
   `(whitespace-empty                        ((t (:background ,solo-jazz-pink :foreground ,solo-jazz-white))))
   `(whitespace-line                         ((t (:background ,solo-jazz-white-1 :extend t :foreground ,solo-jazz-violet :weight bold)))))

;;; Theme Variables
  (custom-theme-set-variables
   'solo-jazz

   ;; ansi-color
   `(ansi-color-names-vector [,solo-jazz-white ,solo-jazz-blue+1 ,solo-jazz-slate ,solo-jazz-teal
                                               ,solo-jazz-slate ,solo-jazz-slate ,solo-jazz-pink ,solo-jazz-slate])
   ;; fill-column-indicator
   `(fci-rule-color ,solo-jazz-slate)

   ;; nrepl-client
   `(nrepl-message-colors
     '(,solo-jazz-blue+1 ,solo-jazz-slate ,solo-jazz-teal ,solo-jazz-slate ,solo-jazz-blue
                         ,solo-jazz-pink ,solo-jazz-teal ,solo-jazz-slate))
   ;; pdf-tools
   `(pdf-view-midnight-colors '(,solo-jazz-slate . ,solo-jazz-lavender))

   ;; vc-annotate
   `(vc-annotate-color-map
     '((20 . ,solo-jazz-slate)
       (40 . ,solo-jazz-blue+1)
       (60 . ,solo-jazz-slate)
       (80 . ,solo-jazz-slate)
       (100 . ,solo-jazz-slate)
       (120 . ,solo-jazz-teal)
       (140 . ,solo-jazz-slate)
       (160 . ,solo-jazz-slate)
       (180 . ,solo-jazz-slate)
       (200 . ,solo-jazz-slate)
       (220 . ,solo-jazz-teal)
       (240 . ,solo-jazz-blue)
       (260 . ,solo-jazz-pink)
       (280 . ,solo-jazz-slate)
       (300 . ,solo-jazz-blue)
       (320 . ,solo-jazz-slate)
       (340 . ,solo-jazz-teal)
       (360 . ,solo-jazz-slate)))
   `(vc-annotate-very-old-color ,solo-jazz-slate)
   `(vc-annotate-background ,solo-jazz-teal+1)))

;;; Rainbow Support

(declare-function rainbow-mode "rainbow-mode")
(declare-function rainbow-colorize-by-assoc "rainbow-mode")

(defvar solo-jazz-theme-add-font-lock-keywords nil
  "Whether to add font-lock keywords for solo-jazz color names.

In buffers visiting library `solo-jazz-theme.el' the solo-jazz
specific keywords are always added, provided that library has
been loaded (because that is where the code that does it is
definded).  If you visit this file and only enable the theme,
then you have to turn `rainbow-mode' off and on again for the
solo-jazz-specific font-lock keywords to be used.

In all other Emacs-Lisp buffers this variable controls whether
this should be done.  This requires library `rainbow-mode'.")

(defvar solo-jazz-theme-colors-font-lock-keywords nil)

(defun solo-jazz-theme-rainbow-turn-on ()
  "Maybe also add font-lock keywords for solo-jazz colors."
  (when (and (derived-mode-p 'emacs-lisp-mode)
             (or solo-jazz-theme-add-font-lock-keywords
                 (and (buffer-file-name)
                      (equal (file-name-nondirectory (buffer-file-name))
                             "solo-jazz-theme.el"))))
    (unless solo-jazz-theme-colors-font-lock-keywords
      (setq solo-jazz-theme-colors-font-lock-keywords
            `((,(regexp-opt (mapcar #'car solo-jazz-theme-default-colors-alist) 'words)
               (0 (rainbow-colorize-by-assoc solo-jazz-theme-default-colors-alist))))))
    (font-lock-add-keywords nil solo-jazz-theme-colors-font-lock-keywords 'end)))

(defun solo-jazz-theme-rainbow-turn-off ()
  "Also remove font-lock keywords for solo-jazz colors."
  (font-lock-remove-keywords nil solo-jazz-theme-colors-font-lock-keywords))

;;; Footer

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'solo-jazz)
(provide 'solo-jazz-theme)

;;; solo-jazz-theme.el ends here

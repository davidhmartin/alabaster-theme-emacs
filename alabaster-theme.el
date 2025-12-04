;;; alabaster-theme.el --- Alabaster theme for Emacs -*- lexical-binding: t; -*-

;; Copyright (C) 2025

;; Author: Ported to Emacs (Original by Nikita Tonsky)
;; URL: https://github.com/tonsky/vscode-theme-alabaster
;; Version: 1.0.0
;; Package-Requires: ((emacs "24.1"))
;; Keywords: faces, theme, minimal

;; This file is not part of GNU Emacs.

;;; Commentary:

;; Alabaster is a minimalist syntax highlighting theme that deliberately
;; highlights very little.  The philosophy: if everything is highlighted,
;; nothing stands out.
;;
;; Alabaster only highlights FOUR categories:
;; 1. Strings (green) - including regexps and symbols
;; 2. Constants (magenta) - numbers, booleans, language constants
;; 3. Comments (red) - prominently, NOT dimmed
;; 4. Global definitions (blue) - function/class/variable definitions
;;
;; Everything else (keywords, operators, punctuation, variables) uses the
;; default foreground color.  This is intentional.
;;
;; Key principles:
;; - Keywords are NOT highlighted - they are the least important part
;; - Comments ARE prominent - if someone wrote it, you should read it
;; - No font variations - no bold, no italics, just color
;; - Minimal palette - few enough colors to memorize what each means
;;
;; Original theme by Nikita Tonsky: https://tonsky.me/blog/syntax-highlighting/

;;; Code:

(deftheme alabaster
  "Alabaster - A minimalist theme that highlights what matters.
Only strings, constants, comments, and definitions get color.")

(let ((class '((class color) (min-colors 89)))
      ;; Color palette
      (bg           "#F7F7F7")
      (bg-alt       "#EEEEEE")
      (fg           "#000000")
      (fg-dim       "#777777")
      (punctuation  "#777777")
      ;; Core highlighting - the only four categories
      (string       "#448C27")   ; green - strings, regexps, symbols
      (constant     "#7A3E9D")   ; magenta - numbers, booleans, constants
      (comment      "#AA3731")   ; red - comments (prominent!)
      (definition   "#325CC0")   ; blue - function/class/var definitions
      ;; UI colors
      (selection    "#BFDBFE")
      (highlight    "#007ACC")
      (find-hl      "#FFBC5D")
      ;; Status colors
      (error-red    "#E51400")
      (warning-org  "#F09000")
      (success-grn  "#448C27")
      ;; Diff colors
      (diff-add-bg  "#D4EDDA")
      (diff-del-bg  "#F8D7DA")
      (diff-chg-bg  "#FFF3CD"))

  (custom-theme-set-faces
   'alabaster

   ;; === Basic faces ===
   `(default ((,class (:foreground ,fg :background ,bg))))
   `(cursor ((,class (:background ,fg))))
   `(region ((,class (:background ,selection))))
   `(highlight ((,class (:background ,selection))))
   `(hl-line ((,class (:background ,bg-alt))))
   `(fringe ((,class (:background ,bg))))
   `(vertical-border ((,class (:foreground ,fg-dim))))
   `(border ((,class (:foreground ,fg-dim))))
   `(shadow ((,class (:foreground ,fg-dim))))

   ;; === Font-lock faces - THE CORE OF ALABASTER ===
   ;; Strings (green)
   `(font-lock-string-face ((,class (:foreground ,string))))
   `(font-lock-regexp-grouping-construct ((,class (:foreground ,string))))
   `(font-lock-regexp-grouping-backslash ((,class (:foreground ,string))))

   ;; Constants (magenta)
   `(font-lock-constant-face ((,class (:foreground ,constant))))
   `(font-lock-number-face ((,class (:foreground ,constant))))        ; Emacs 29+
   `(font-lock-builtin-face ((,class (:foreground ,constant))))       ; true/false/nil

   ;; Comments (red - PROMINENT, not dimmed!)
   `(font-lock-comment-face ((,class (:foreground ,comment))))
   `(font-lock-comment-delimiter-face ((,class (:foreground ,comment))))
   `(font-lock-doc-face ((,class (:foreground ,comment))))

   ;; Definitions (blue)
   `(font-lock-function-name-face ((,class (:foreground ,definition))))
   `(font-lock-variable-name-face ((,class (:foreground ,definition))))
   `(font-lock-type-face ((,class (:foreground ,definition))))

   ;; NOT highlighted - use default foreground (THIS IS INTENTIONAL)
   `(font-lock-keyword-face ((,class (:foreground ,fg))))
   `(font-lock-operator-face ((,class (:foreground ,fg))))            ; Emacs 29+
   `(font-lock-property-name-face ((,class (:foreground ,fg))))       ; Emacs 29+
   `(font-lock-property-use-face ((,class (:foreground ,fg))))        ; Emacs 29+
   `(font-lock-function-call-face ((,class (:foreground ,fg))))       ; Emacs 29+
   `(font-lock-variable-use-face ((,class (:foreground ,fg))))        ; Emacs 29+
   `(font-lock-misc-punctuation-face ((,class (:foreground ,fg))))    ; Emacs 29+
   `(font-lock-escape-face ((,class (:foreground ,constant))))        ; Emacs 29+

   ;; Punctuation (gray)
   `(font-lock-punctuation-face ((,class (:foreground ,punctuation)))) ; Emacs 29+
   `(font-lock-delimiter-face ((,class (:foreground ,punctuation))))
   `(font-lock-bracket-face ((,class (:foreground ,punctuation))))

   ;; Preprocessor and negation (neutral)
   `(font-lock-preprocessor-face ((,class (:foreground ,fg))))
   `(font-lock-negation-char-face ((,class (:foreground ,fg))))
   `(font-lock-warning-face ((,class (:foreground ,warning-org))))

   ;; === Mode line ===
   `(mode-line ((,class (:foreground ,fg :background ,bg-alt :box (:line-width 1 :color ,fg-dim)))))
   `(mode-line-inactive ((,class (:foreground ,fg-dim :background ,bg :box (:line-width 1 :color ,bg-alt)))))
   `(mode-line-buffer-id ((,class (:foreground ,fg))))
   `(mode-line-emphasis ((,class (:foreground ,fg))))
   `(mode-line-highlight ((,class (:background ,selection))))

   ;; === Minibuffer ===
   `(minibuffer-prompt ((,class (:foreground ,definition))))

   ;; === Search ===
   `(isearch ((,class (:foreground ,fg :background ,find-hl))))
   `(isearch-fail ((,class (:foreground ,fg :background ,diff-del-bg))))
   `(lazy-highlight ((,class (:background ,selection))))
   `(match ((,class (:background ,find-hl))))

   ;; === Links ===
   `(link ((,class (:foreground ,definition :underline t))))
   `(link-visited ((,class (:foreground ,constant :underline t))))

   ;; === Status ===
   `(error ((,class (:foreground ,error-red))))
   `(warning ((,class (:foreground ,warning-org))))
   `(success ((,class (:foreground ,success-grn))))

   ;; === Line numbers ===
   `(line-number ((,class (:foreground ,fg-dim :background ,bg))))
   `(line-number-current-line ((,class (:foreground ,fg :background ,bg-alt))))

   ;; === Parens ===
   `(show-paren-match ((,class (:foreground ,fg :background ,find-hl))))
   `(show-paren-mismatch ((,class (:foreground ,fg :background ,error-red))))

   ;; === Diff ===
   `(diff-added ((,class (:background ,diff-add-bg))))
   `(diff-removed ((,class (:background ,diff-del-bg))))
   `(diff-changed ((,class (:background ,diff-chg-bg))))
   `(diff-header ((,class (:foreground ,fg :background ,bg-alt))))
   `(diff-file-header ((,class (:foreground ,definition :background ,bg-alt))))
   `(diff-hunk-header ((,class (:foreground ,fg-dim :background ,bg-alt))))
   `(diff-indicator-added ((,class (:foreground ,success-grn :background ,diff-add-bg))))
   `(diff-indicator-removed ((,class (:foreground ,error-red :background ,diff-del-bg))))
   `(diff-indicator-changed ((,class (:foreground ,warning-org :background ,diff-chg-bg))))
   `(diff-refine-added ((,class (:foreground ,fg :background "#A6D9A6"))))
   `(diff-refine-removed ((,class (:foreground ,fg :background "#F5A5A5"))))
   `(diff-refine-changed ((,class (:foreground ,fg :background "#FFE082"))))

   ;; === Completions ===
   `(completions-common-part ((,class (:foreground ,definition))))
   `(completions-first-difference ((,class (:foreground ,fg))))
   `(completions-annotations ((,class (:foreground ,fg-dim))))

   ;; === Buttons ===
   `(button ((,class (:foreground ,definition :underline t))))
   `(custom-button ((,class (:foreground ,fg :background ,bg-alt :box (:line-width 1 :color ,fg-dim)))))

   ;; === Org mode ===
   `(org-level-1 ((,class (:foreground ,fg))))
   `(org-level-2 ((,class (:foreground ,fg))))
   `(org-level-3 ((,class (:foreground ,fg))))
   `(org-level-4 ((,class (:foreground ,fg))))
   `(org-level-5 ((,class (:foreground ,fg))))
   `(org-level-6 ((,class (:foreground ,fg))))
   `(org-level-7 ((,class (:foreground ,fg))))
   `(org-level-8 ((,class (:foreground ,fg))))
   `(org-document-title ((,class (:foreground ,definition))))
   `(org-document-info ((,class (:foreground ,fg-dim))))
   `(org-document-info-keyword ((,class (:foreground ,fg-dim))))
   `(org-meta-line ((,class (:foreground ,fg-dim))))
   `(org-block ((,class (:background ,bg-alt))))
   `(org-block-begin-line ((,class (:foreground ,fg-dim :background ,bg-alt))))
   `(org-block-end-line ((,class (:foreground ,fg-dim :background ,bg-alt))))
   `(org-code ((,class (:foreground ,string))))
   `(org-verbatim ((,class (:foreground ,string))))
   `(org-link ((,class (:foreground ,definition :underline t))))
   `(org-date ((,class (:foreground ,constant))))
   `(org-todo ((,class (:foreground ,error-red))))
   `(org-done ((,class (:foreground ,success-grn))))
   `(org-headline-done ((,class (:foreground ,fg-dim))))
   `(org-special-keyword ((,class (:foreground ,fg-dim))))
   `(org-table ((,class (:foreground ,fg))))
   `(org-formula ((,class (:foreground ,constant))))
   `(org-tag ((,class (:foreground ,fg-dim))))

   ;; === Markdown mode ===
   `(markdown-header-face ((,class (:foreground ,fg))))
   `(markdown-header-face-1 ((,class (:foreground ,fg))))
   `(markdown-header-face-2 ((,class (:foreground ,fg))))
   `(markdown-header-face-3 ((,class (:foreground ,fg))))
   `(markdown-header-face-4 ((,class (:foreground ,fg))))
   `(markdown-header-face-5 ((,class (:foreground ,fg))))
   `(markdown-header-face-6 ((,class (:foreground ,fg))))
   `(markdown-code-face ((,class (:foreground ,string))))
   `(markdown-inline-code-face ((,class (:foreground ,string))))
   `(markdown-pre-face ((,class (:foreground ,string))))
   `(markdown-link-face ((,class (:foreground ,definition))))
   `(markdown-url-face ((,class (:foreground ,definition :underline t))))

   ;; === Flycheck / Flymake ===
   `(flycheck-error ((,class (:underline (:style wave :color ,error-red)))))
   `(flycheck-warning ((,class (:underline (:style wave :color ,warning-org)))))
   `(flycheck-info ((,class (:underline (:style wave :color ,definition)))))
   `(flymake-error ((,class (:underline (:style wave :color ,error-red)))))
   `(flymake-warning ((,class (:underline (:style wave :color ,warning-org)))))
   `(flymake-note ((,class (:underline (:style wave :color ,definition)))))

   ;; === Company mode ===
   `(company-tooltip ((,class (:foreground ,fg :background ,bg-alt))))
   `(company-tooltip-selection ((,class (:foreground ,fg :background ,selection))))
   `(company-tooltip-common ((,class (:foreground ,definition))))
   `(company-tooltip-common-selection ((,class (:foreground ,definition))))
   `(company-tooltip-annotation ((,class (:foreground ,fg-dim))))
   `(company-scrollbar-bg ((,class (:background ,bg-alt))))
   `(company-scrollbar-fg ((,class (:background ,fg-dim))))
   `(company-preview ((,class (:foreground ,fg-dim :background ,bg))))
   `(company-preview-common ((,class (:foreground ,definition))))

   ;; === Corfu ===
   `(corfu-default ((,class (:foreground ,fg :background ,bg-alt))))
   `(corfu-current ((,class (:foreground ,fg :background ,selection))))
   `(corfu-bar ((,class (:background ,fg-dim))))
   `(corfu-border ((,class (:background ,fg-dim))))
   `(corfu-annotations ((,class (:foreground ,fg-dim))))

   ;; === Vertico ===
   `(vertico-current ((,class (:background ,selection))))
   `(vertico-group-title ((,class (:foreground ,fg-dim))))
   `(vertico-group-separator ((,class (:foreground ,fg-dim))))

   ;; === Marginalia ===
   `(marginalia-documentation ((,class (:foreground ,fg-dim))))
   `(marginalia-file-name ((,class (:foreground ,fg))))
   `(marginalia-key ((,class (:foreground ,definition))))

   ;; === Orderless ===
   `(orderless-match-face-0 ((,class (:foreground ,definition))))
   `(orderless-match-face-1 ((,class (:foreground ,string))))
   `(orderless-match-face-2 ((,class (:foreground ,constant))))
   `(orderless-match-face-3 ((,class (:foreground ,comment))))

   ;; === Magit ===
   `(magit-section-heading ((,class (:foreground ,definition))))
   `(magit-section-highlight ((,class (:background ,bg-alt))))
   `(magit-branch-local ((,class (:foreground ,definition))))
   `(magit-branch-remote ((,class (:foreground ,string))))
   `(magit-branch-current ((,class (:foreground ,definition :box t))))
   `(magit-diff-added ((,class (:foreground ,success-grn :background ,diff-add-bg))))
   `(magit-diff-added-highlight ((,class (:foreground ,success-grn :background ,diff-add-bg))))
   `(magit-diff-removed ((,class (:foreground ,error-red :background ,diff-del-bg))))
   `(magit-diff-removed-highlight ((,class (:foreground ,error-red :background ,diff-del-bg))))
   `(magit-diff-context ((,class (:foreground ,fg-dim))))
   `(magit-diff-context-highlight ((,class (:foreground ,fg-dim :background ,bg-alt))))
   `(magit-diff-hunk-heading ((,class (:foreground ,fg :background ,bg-alt))))
   `(magit-diff-hunk-heading-highlight ((,class (:foreground ,fg :background ,selection))))
   `(magit-diff-file-heading ((,class (:foreground ,fg))))
   `(magit-diff-file-heading-highlight ((,class (:foreground ,fg :background ,bg-alt))))
   `(magit-hash ((,class (:foreground ,fg-dim))))
   `(magit-log-author ((,class (:foreground ,definition))))
   `(magit-log-date ((,class (:foreground ,fg-dim))))

   ;; === Git gutter ===
   `(git-gutter:added ((,class (:foreground ,success-grn :background ,success-grn))))
   `(git-gutter:deleted ((,class (:foreground ,error-red :background ,error-red))))
   `(git-gutter:modified ((,class (:foreground ,warning-org :background ,warning-org))))
   `(git-gutter-fr:added ((,class (:foreground ,success-grn :background ,success-grn))))
   `(git-gutter-fr:deleted ((,class (:foreground ,error-red :background ,error-red))))
   `(git-gutter-fr:modified ((,class (:foreground ,warning-org :background ,warning-org))))

   ;; === Diff-hl ===
   `(diff-hl-insert ((,class (:foreground ,success-grn :background ,success-grn))))
   `(diff-hl-delete ((,class (:foreground ,error-red :background ,error-red))))
   `(diff-hl-change ((,class (:foreground ,warning-org :background ,warning-org))))

   ;; === Whitespace ===
   `(whitespace-space ((,class (:foreground ,bg-alt))))
   `(whitespace-tab ((,class (:foreground ,bg-alt))))
   `(whitespace-newline ((,class (:foreground ,bg-alt))))
   `(whitespace-trailing ((,class (:background ,diff-del-bg))))
   `(whitespace-line ((,class (:background ,diff-chg-bg))))

   ;; === Rainbow delimiters ===
   `(rainbow-delimiters-depth-1-face ((,class (:foreground ,fg))))
   `(rainbow-delimiters-depth-2-face ((,class (:foreground ,fg-dim))))
   `(rainbow-delimiters-depth-3-face ((,class (:foreground ,definition))))
   `(rainbow-delimiters-depth-4-face ((,class (:foreground ,string))))
   `(rainbow-delimiters-depth-5-face ((,class (:foreground ,constant))))
   `(rainbow-delimiters-depth-6-face ((,class (:foreground ,fg))))
   `(rainbow-delimiters-depth-7-face ((,class (:foreground ,fg-dim))))
   `(rainbow-delimiters-depth-8-face ((,class (:foreground ,definition))))
   `(rainbow-delimiters-depth-9-face ((,class (:foreground ,string))))
   `(rainbow-delimiters-unmatched-face ((,class (:foreground ,error-red))))

   ;; === Which-key ===
   `(which-key-key-face ((,class (:foreground ,definition))))
   `(which-key-separator-face ((,class (:foreground ,fg-dim))))
   `(which-key-command-description-face ((,class (:foreground ,fg))))
   `(which-key-group-description-face ((,class (:foreground ,constant))))

   ;; === Ivy ===
   `(ivy-current-match ((,class (:background ,selection))))
   `(ivy-minibuffer-match-face-1 ((,class (:foreground ,definition))))
   `(ivy-minibuffer-match-face-2 ((,class (:foreground ,string))))
   `(ivy-minibuffer-match-face-3 ((,class (:foreground ,constant))))
   `(ivy-minibuffer-match-face-4 ((,class (:foreground ,comment))))

   ;; === Helm ===
   `(helm-selection ((,class (:background ,selection))))
   `(helm-match ((,class (:foreground ,definition))))
   `(helm-source-header ((,class (:foreground ,fg :background ,bg-alt))))
   `(helm-candidate-number ((,class (:foreground ,constant))))

   ;; === Treemacs ===
   `(treemacs-directory-face ((,class (:foreground ,fg))))
   `(treemacs-file-face ((,class (:foreground ,fg))))
   `(treemacs-git-added-face ((,class (:foreground ,success-grn))))
   `(treemacs-git-modified-face ((,class (:foreground ,warning-org))))
   `(treemacs-git-untracked-face ((,class (:foreground ,fg-dim))))

   ;; === Dired ===
   `(dired-directory ((,class (:foreground ,definition))))
   `(dired-symlink ((,class (:foreground ,constant))))
   `(dired-marked ((,class (:foreground ,string :background ,selection))))
   `(dired-flagged ((,class (:foreground ,error-red))))
   `(dired-header ((,class (:foreground ,definition))))
   `(dired-perm-write ((,class (:foreground ,fg))))

   ;; === Eshell ===
   `(eshell-prompt ((,class (:foreground ,definition))))
   `(eshell-ls-directory ((,class (:foreground ,definition))))
   `(eshell-ls-symlink ((,class (:foreground ,constant))))
   `(eshell-ls-executable ((,class (:foreground ,string))))
   `(eshell-ls-archive ((,class (:foreground ,constant))))

   ;; === Term / Ansi ===
   `(term-color-black ((,class (:foreground ,fg :background ,fg))))
   `(term-color-red ((,class (:foreground ,error-red :background ,error-red))))
   `(term-color-green ((,class (:foreground ,string :background ,string))))
   `(term-color-yellow ((,class (:foreground ,warning-org :background ,warning-org))))
   `(term-color-blue ((,class (:foreground ,definition :background ,definition))))
   `(term-color-magenta ((,class (:foreground ,constant :background ,constant))))
   `(term-color-cyan ((,class (:foreground ,highlight :background ,highlight))))
   `(term-color-white ((,class (:foreground ,bg :background ,bg))))

   ;; === Avy ===
   `(avy-lead-face ((,class (:foreground ,fg :background ,find-hl))))
   `(avy-lead-face-0 ((,class (:foreground ,fg :background ,selection))))
   `(avy-lead-face-1 ((,class (:foreground ,fg :background ,bg-alt))))
   `(avy-lead-face-2 ((,class (:foreground ,fg :background ,diff-add-bg))))

   ;; === Ace window ===
   `(aw-leading-char-face ((,class (:foreground ,error-red :height 1.5))))
   `(aw-background-face ((,class (:foreground ,fg-dim))))

   ;; === Tab bar / Tab line ===
   `(tab-bar ((,class (:foreground ,fg :background ,bg-alt))))
   `(tab-bar-tab ((,class (:foreground ,fg :background ,bg :box (:line-width 1 :color ,fg-dim)))))
   `(tab-bar-tab-inactive ((,class (:foreground ,fg-dim :background ,bg-alt))))
   `(tab-line ((,class (:foreground ,fg :background ,bg-alt))))
   `(tab-line-tab ((,class (:foreground ,fg :background ,bg))))
   `(tab-line-tab-current ((,class (:foreground ,fg :background ,bg :box (:line-width 1 :color ,fg-dim)))))
   `(tab-line-tab-inactive ((,class (:foreground ,fg-dim :background ,bg-alt))))

   ;; === Header line ===
   `(header-line ((,class (:foreground ,fg :background ,bg-alt))))

   ;; === Info ===
   `(info-title-1 ((,class (:foreground ,fg))))
   `(info-title-2 ((,class (:foreground ,fg))))
   `(info-title-3 ((,class (:foreground ,fg))))
   `(info-title-4 ((,class (:foreground ,fg))))
   `(info-menu-header ((,class (:foreground ,fg))))
   `(info-node ((,class (:foreground ,definition))))
   `(info-xref ((,class (:foreground ,definition))))
   `(info-xref-visited ((,class (:foreground ,constant))))

   ;; === Elfeed ===
   `(elfeed-search-feed-face ((,class (:foreground ,definition))))
   `(elfeed-search-tag-face ((,class (:foreground ,string))))
   `(elfeed-search-title-face ((,class (:foreground ,fg))))
   `(elfeed-search-unread-title-face ((,class (:foreground ,fg))))
   `(elfeed-search-date-face ((,class (:foreground ,fg-dim))))

   ;; === Eglot / LSP ===
   `(eglot-highlight-symbol-face ((,class (:background ,selection))))

   ;; === Tree-sitter (for packages using tree-sitter highlighting) ===
   ;; These follow the same philosophy - no keyword highlighting
   `(tree-sitter-hl-face:keyword ((,class (:foreground ,fg))))
   `(tree-sitter-hl-face:operator ((,class (:foreground ,fg))))
   `(tree-sitter-hl-face:punctuation ((,class (:foreground ,punctuation))))
   `(tree-sitter-hl-face:punctuation.bracket ((,class (:foreground ,punctuation))))
   `(tree-sitter-hl-face:punctuation.delimiter ((,class (:foreground ,punctuation))))
   `(tree-sitter-hl-face:string ((,class (:foreground ,string))))
   `(tree-sitter-hl-face:string.special ((,class (:foreground ,string))))
   `(tree-sitter-hl-face:escape ((,class (:foreground ,constant))))
   `(tree-sitter-hl-face:number ((,class (:foreground ,constant))))
   `(tree-sitter-hl-face:constant ((,class (:foreground ,constant))))
   `(tree-sitter-hl-face:constant.builtin ((,class (:foreground ,constant))))
   `(tree-sitter-hl-face:comment ((,class (:foreground ,comment))))
   `(tree-sitter-hl-face:doc ((,class (:foreground ,comment))))
   `(tree-sitter-hl-face:function ((,class (:foreground ,definition))))
   `(tree-sitter-hl-face:function.call ((,class (:foreground ,fg))))
   `(tree-sitter-hl-face:method ((,class (:foreground ,definition))))
   `(tree-sitter-hl-face:method.call ((,class (:foreground ,fg))))
   `(tree-sitter-hl-face:variable ((,class (:foreground ,fg))))
   `(tree-sitter-hl-face:variable.builtin ((,class (:foreground ,constant))))
   `(tree-sitter-hl-face:variable.parameter ((,class (:foreground ,fg))))
   `(tree-sitter-hl-face:property ((,class (:foreground ,fg))))
   `(tree-sitter-hl-face:type ((,class (:foreground ,definition))))
   `(tree-sitter-hl-face:type.builtin ((,class (:foreground ,definition))))
   `(tree-sitter-hl-face:constructor ((,class (:foreground ,definition))))
   `(tree-sitter-hl-face:label ((,class (:foreground ,fg))))

   ;; === Web-mode ===
   `(web-mode-html-tag-face ((,class (:foreground ,fg))))
   `(web-mode-html-tag-bracket-face ((,class (:foreground ,punctuation))))
   `(web-mode-html-attr-name-face ((,class (:foreground ,fg))))
   `(web-mode-html-attr-value-face ((,class (:foreground ,string))))
   `(web-mode-doctype-face ((,class (:foreground ,fg-dim))))
   `(web-mode-comment-face ((,class (:foreground ,comment))))
   `(web-mode-css-selector-face ((,class (:foreground ,definition))))
   `(web-mode-css-property-name-face ((,class (:foreground ,fg))))
   `(web-mode-css-string-face ((,class (:foreground ,string))))

   ;; === JS2-mode ===
   `(js2-function-param ((,class (:foreground ,fg))))
   `(js2-external-variable ((,class (:foreground ,fg))))
   `(js2-jsdoc-tag ((,class (:foreground ,fg-dim))))
   `(js2-jsdoc-type ((,class (:foreground ,definition))))
   `(js2-jsdoc-value ((,class (:foreground ,fg))))
   `(js2-error ((,class (:underline (:style wave :color ,error-red)))))
   `(js2-warning ((,class (:underline (:style wave :color ,warning-org)))))

   ;; === Typescript-mode ===
   `(typescript-jsdoc-tag ((,class (:foreground ,fg-dim))))
   `(typescript-jsdoc-type ((,class (:foreground ,definition))))
   `(typescript-jsdoc-value ((,class (:foreground ,fg))))

   ;; === Clojure ===
   `(clojure-keyword-face ((,class (:foreground ,constant))))
   `(clojure-character-face ((,class (:foreground ,string))))))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'alabaster)

;;; alabaster-theme.el ends here

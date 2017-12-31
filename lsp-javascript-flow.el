;;; lsp-javascript-flow.el --- Language server protocol integration for flow
;;; Version: 0.1.0
;;; URL: https://github.com/stevenremot/emacs-lsp-javascript-flow
;;; Package-Requires: ((lsp-mode "3.4"))

;;; Commentary:
;; This package provides editor support for flow via lsp-mode and the
;; flow-language-server.
;;
;; Be sure to install flow-langauge-server (npm i -g flow-language-server)
;; before using it.
;;; Code:
(require 'lsp-mode)

(defconst lsp-javascript-flow--get-root
  (lsp-make-traverser #'(lambda (dir)
                          (directory-files dir nil ".flowconfig"))))

(lsp-define-stdio-client lsp-javascript-flow "javascript-flow"
                         lsp-javascript-flow--get-root
                         '("flow-language-server" "--stdio"))

(provide 'lsp-javascript-flow)

;;; lsp-javascript-flow.el ends here

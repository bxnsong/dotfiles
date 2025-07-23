-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_python_lsp = "basedpyright"
vim.g.lazyvim_python_ruff = "ruff"

if vim.g.vscode then
  local vscode = require("vscode")
  vscode.update_config("workbench.colorTheme", "Calvera Dark High Contrast", "global")
  vscode.update_config("editor.smoothScrolling", true, "global")
  vscode.update_config("editor.guides.indentation", false, "global")
  vscode.update_config("extensions.autoUpdate", false, "global")
  vscode.update_config("git.autofetch", true, "global")
  vscode.update_config("editor.formatOnSave", true, "global")
  vscode.update_config("editor.lineNumbers", "relative", "global")
  vscode.update_config("editor.scrollbar.horizontal", "hidden", "global")
  vscode.update_config("editor.scrollbar.vertical", "hidden", "global")
  vscode.update_config("workbench.editor.showTabs", "none", "global")
  vscode.update_config("breadcrumbs.enabled", false, "global")
  vscode.update_config("workbench.statusBar.visible", true, "global")
  vscode.update_config("workbench.activityBar.orientation", "vertical", "global")
  vscode.update_config("workbench.activityBar.location", "hidden", "global")
  vscode.update_config("editor.gotoLocation.multipleDefinitions", "goto", "global")
  vscode.update_config("editor.fontFamily", "'FiraCode Nerd Font', Monaco, 'Courier New', monospace", "global")
  vscode.update_config("editor.cursorSmoothCaretAnimation", "on", "global")
  vscode.update_config("editor.cursorBlinking", "smooth", "global")
  vscode.update_config("diffEditor.codeLens", true, "global")
  vscode.update_config("workbench.iconTheme", "material-icon-theme", "global")
  vscode.update_config("window.customTitleBarVisibility", "never", "global")
  vscode.update_config("gitlens.plusFeatures.enabled", false, "global")
end

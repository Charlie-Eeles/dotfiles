vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set clipboard=unnamedplus")
vim.cmd("set nowrap")
vim.g.mapleader = " "
vim.opt.signcolumn = "yes:1"
vim.opt.updatetime = 200

vim.keymap.set("n", "<S-Down>", "<C-o>", { desc = "Go backward in jumplist", silent = true })
vim.keymap.set("n", "<S-Up>", "<C-i>", { desc = "Go forward in jumplist", silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv^", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<", "<gv^", { noremap = true, silent = true })

local x = vim.diagnostic.severity
vim.diagnostic.config({
  virtual_text = false,
  signs = { text = { [x.ERROR] = "󰅙", [x.WARN] = "", [x.INFO] = "󰋼", [x.HINT] = "󰌵" } },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
local hl_groups = { "DiagnosticUnderlineError" }
for _, hl in ipairs(hl_groups) do
  vim.cmd.highlight(hl .. " gui=undercurl")
end

vim.keymap.set("n", "<leader>id", function()
  inline_diagnostics_enabled = not inline_diagnostics_enabled
  vim.diagnostic.config({
    virtual_text = inline_diagnostics_enabled,
  })
end, {})

vim.api.nvim_create_autocmd({ "CursorHold" }, {
  pattern = "*",
  callback = function()
    for _, winid in pairs(vim.api.nvim_tabpage_list_wins(0)) do
      if vim.api.nvim_win_get_config(winid).zindex then
        return
      end
    end
    vim.diagnostic.open_float({
      scope = "cursor",
      focusable = false,
      close_events = {
        "CursorMoved",
        "CursorMovedI",
        "BufHidden",
        "InsertCharPre",
        "WinLeave",
      },
    })
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
  end,
})

vim.api.nvim_create_user_command("FJS", function()
  local file = vim.fn.shellescape(vim.fn.expand("%:p"))
  local job_id = vim.fn.jobstart("npx prettier --write " .. file, {
    stdout_buffered = true,
    stderr_buffered = true,
  })
  vim.fn.jobwait({ job_id })

  vim.cmd("edit!")
  vim.cmd("mode")
  vim.cmd("redraw!")
end, {})

vim.api.nvim_create_user_command("FPY", function()
  local file = vim.fn.shellescape(vim.fn.expand("%:p"))
  local job_id = vim.fn.jobstart("black " .. file, {
    stdout_buffered = true,
    stderr_buffered = true,
  })
  vim.fn.jobwait({ job_id })

  vim.cmd("edit!")
  vim.cmd("mode")
  vim.cmd("redraw!")
end, {})

vim.api.nvim_create_user_command("FRU", function()
  local file = vim.fn.shellescape(vim.fn.expand("%:p"))
  local job_id = vim.fn.jobstart("rustfmt " .. file, {
    stdout_buffered = true,
    stderr_buffered = true,
  })
  vim.fn.jobwait({ job_id })

  vim.cmd("edit!")
  vim.cmd("mode")
  vim.cmd("redraw!")
end, {})

vim.keymap.set("n", "<S-Left>", ":bprevious<CR>", { desc = "Go to previous buffer", silent = true })
vim.keymap.set("n", "<S-Right>", ":bnext<CR>", { desc = "Go to next buffer", silent = true })
vim.keymap.set("n", "<leader>s", ":Navbuddy<CR>", {})

vim.keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<Leader>dc", ':DapContinue<CR>')
vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')

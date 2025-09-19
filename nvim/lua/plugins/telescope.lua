return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<Leader>f", builtin.find_files, {})
      vim.keymap.set("n", "<leader>/", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
      vim.keymap.set("n", "<Leader>tb", builtin.buffers, {})
      vim.keymap.set("n", "<Leader>,", builtin.buffers, {})
      vim.keymap.set("n", "<Leader>tf", builtin.current_buffer_fuzzy_find, {})
      vim.keymap.set("n", "<Leader>ts", builtin.lsp_document_symbols, {})
      vim.keymap.set("n", "<Leader>to", builtin.oldfiles, {})
      vim.keymap.set("n", "<Leader>gd", builtin.lsp_definitions, {})
      vim.keymap.set("n", "<Leader>gr", builtin.lsp_references, {})
      vim.keymap.set("n", "<Leader>td", builtin.diagnostics, {})

      telescope.load_extension("live_grep_args")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          sorting_strategy = "ascending",
          layout_config = {
            prompt_position = "top",
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}

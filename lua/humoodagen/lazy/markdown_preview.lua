return {
  {
    "iamcco/markdown-preview.nvim",
    lazy = false, -- Load immediately
    build = function() vim.fn["mkdp#util#install"]() end,
    init = function()
      -- Default configurations
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_refresh_slow = 0
      vim.g.mkdp_command_for_global = 0
      vim.g.mkdp_open_to_the_world = 0
      vim.g.mkdp_open_ip = ''
      vim.g.mkdp_browser = '' -- Leave empty; we'll set a custom function for Arc
      vim.g.mkdp_echo_preview_url = 0
      vim.g.mkdp_browserfunc = 'OpenMarkdownPreview' -- Use the custom function below
      vim.g.mkdp_preview_options = {
        mkit = {},
        katex = {},
        uml = {},
        maid = {},
        disable_sync_scroll = 0,
        sync_scroll_type = 'middle',
        hide_yaml_meta = 1,
        sequence_diagrams = {},
        flowchart_diagrams = {},
        content_editable = vim.fn.has("nvim-0.9") and true or false,
        disable_filename = 0,
        toc = {}
      }
      vim.g.mkdp_markdown_css = ''
      vim.g.mkdp_highlight_css = ''
      vim.g.mkdp_port = ''
      vim.g.mkdp_page_title = '「${name}」'
      vim.g.mkdp_images_path = ''
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_theme = 'dark'
      vim.g.mkdp_combine_preview = 0
      vim.g.mkdp_combine_preview_auto_refresh = 1

      -- Custom function to open Arc browser
      vim.cmd([[
        function! OpenMarkdownPreview(url)
          execute "silent ! open -a 'Arc' " . a:url
        endfunction
      ]])
    end,
    config = function()
      -- Key mappings
      vim.keymap.set("n", "<leader>mp", ":MarkdownPreview<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>ms", ":MarkdownPreviewStop<CR>", { noremap = true, silent = true })
      vim.keymap.set("n", "<leader>mt", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })
    end,
  }
}

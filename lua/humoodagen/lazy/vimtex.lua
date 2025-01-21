return {
  {
    "lervag/vimtex",
    lazy = false,  -- We don't want to lazy load VimTeX
    init = function()
      -- VimTeX configuration for using Preview on macOS
      vim.g.vimtex_view_method = 'general'
      vim.g.vimtex_view_general_viewer = 'open -a Preview'

      -- Enable shell-escape for minted
      vim.g.vimtex_compiler_latexmk = {
        options = { '-shell-escape' }
      }
    end
  }
}

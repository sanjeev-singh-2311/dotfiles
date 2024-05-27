return {
  {
    "tiagovla/tokyodark.nvim",
    opts = {
      -- custom options here
    },
    config = function()
      require("tokyodark").setup {
        transparent = true,
      } -- calling setup is optional
    end,
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
}

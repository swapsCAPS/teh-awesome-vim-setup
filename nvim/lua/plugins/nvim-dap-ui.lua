return {
  "rcarriga/nvim-dap-ui",
  lazy = true,
  dependencies = {
    "mfussenegger/nvim-dap",
    "nvim-neotest/nvim-nio",
  },
  keys = {
    {
      "<leader>d",
      function(arg)
        require("dapui").float_element(arg)
      end,
      desc = "DAP UI float element",
    },
    {
      "<leader>D",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle DAP UI",
    },
  },
}

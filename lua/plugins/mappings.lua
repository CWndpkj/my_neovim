return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        -- first key is the mode
        n = {
          -- second key is the lefthand side of the map
          -- mappings seen under group name "Buffer"
          ["<Leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
          ["<Leader>bD"] = {
            function()
              require("astroui.status").heirline.buffer_picker(
                function(bufnr) require("astrocore.buffer").close(bufnr) end
              )
            end,
            desc = "Pick to close",
          },
          ["<Leader>ot"] = { "<cmd>OverseerToggle<cr>", desc = "Toggle overseer task list" },
          ["<Leader>or"] = { "<cmd>OverseerRun<cr>", desc = "List overseer run templates" },
          ["<Leader>ru"] = {
            function()
              local cmake_tools = require "cmake-tools"
              if cmake_tools.is_cmake_project() then vim.cmd "CMakeRun" end
            end,
            desc = "Run",
          },
          ["<Leader>rt"] = { "<cmd>CMakeRunTest<cr>", desc = "RunTest" },
          ["H"] = { "<cmd>bprevious<cr>", desc = "Previous buffer" },
          ["L"] = { "<cmd>bnext<cr>", desc = "Next buffer" },
          -- tables with the `name` key will be registered with which-key if it's installed
          -- this is useful for naming menus
          ["<Leader>b"] = { name = "Buffers" },
          ["<Leader>r"] = { name = "Run" },
          -- quick save
          -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
        },
        t = {
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,
        },
      },
    },
  },
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    opts = {
      mappings = {
        n = {
          -- this mapping will only be set in buffers with an LSP attached
          K = {
            function() vim.lsp.buf.hover() end,
            desc = "Hover symbol details",
          },
          -- condition for only server with declaration capabilities
          gD = {
            function() vim.lsp.buf.declaration() end,
            desc = "Declaration of current symbol",
            cond = "textDocument/declaration",
          },
        },
      },
    },
  },
}

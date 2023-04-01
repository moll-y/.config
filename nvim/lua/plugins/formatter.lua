--[[
  Formatter
]]
--
return {
  "mhartington/formatter.nvim",
  keys = {
    { "<leader>F", "<Cmd>Format<CR>" },
  },
  opts = {
    logging = true,
    log_level = 2,
    filetype = (function()
      local filetype = {
        rust = {
          function()
            return {
              exe = "rustfmt",
              args = { "--emit=stdout" },
              stdin = true,
            }
          end,
        },
        lua = {
          function()
            return {
              exe = "stylua",
              args = {
                "--indent-type",
                "Spaces",
                "--indent-width",
                "2",
                "--column-width",
                "80",
                "-",
              },
              stdin = true,
            }
          end,
        },
        cs = {
          function()
            return {
              exe = "dotnet csharpier",
              args = {
                "--write-stdout",
              },
              stdin = true,
            }
          end,
        },
      }

      for _, v in ipairs({
        "yaml",
        "svelte",
        "typescript",
        "javascript",
        "typescriptreact",
      }) do
        filetype[v] = function()
          return {
            exe = "prettier",
            args = {
              "--stdin-filepath",
              vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            },
            stdin = true,
          }
        end
      end

      return filetype
    end)(),
  },
}

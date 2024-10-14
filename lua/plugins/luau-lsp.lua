local defaults = {
  platform = {
    ---@type luau-lsp.PlatformType
    type = "roblox",
  },
  sourcemap = {
    enabled = true,
    autogenerate = true,
    rojo_path = "rojo",
    rojo_project_file = "default.project.json",
    include_non_scripts = true,
  },
  types = {
    ---@type string[]
    definition_files = {},
    ---@type string[]
    documentation_files = {},
    ---@type luau-lsp.RobloxSecurityLevel
    roblox_security_level = "PluginSecurity",
  },
  fflags = {
    enable_by_default = false,
    sync = true,
    ---@type table<string, string>
    override = {},
  },
  plugin = {
    enabled = false,
    port = 3667,
  },
  ---@class luau-lsp.ClientConfig: vim.lsp.ClientConfig
  server = {
    ---@type string[]
    cmd = { "luau-lsp", "lsp" },
    ---@type fun(path: string): string?
    root_dir = function(path)
      return vim.fs.root(path, function(name)
        return name:match ".+%.project%.json$"
      end) or vim.fs.root(path, {
        ".git",
        ".luaurc",
        "stylua.toml",
        "selene.toml",
        "selene.yml",
      })
    end,
  },
}

return {
  "lopi-py/luau-lsp.nvim",
  opts = default,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
}

# TMS (Themes)

My plugin to select themes dynamically

## Installing (lazy)

```lua
{
    "marcos-venicius/tms.nvim",
    name = "tms",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        require("tms").setup({
            "theme1",
            "theme2",
        })
    end
}
```

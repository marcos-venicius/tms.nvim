# TMS (Themes)

My plugin to select themes dynamically

## Installing (lazy)

```lua
{
    "marcos-venicius/tms.nvim",
    name = "tms",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        local m = require("tms")

        m.setup({
            "theme1",
            "theme2",
        })
    end
}
```

Now you can alose have a list of themes but disable theme cycling and select next theme when you want.

```lua
{
    "marcos-venicius/tms.nvim",
    name = "tms",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
        local m = require("tms")

        -- disable theme cycling
        m.disableThemeCycling()

        m.setup({
            "theme1",
            "theme2",
        })
    end
}
```

So, at any time during your editor usage, if you want to select the next theme just call: `TMSNextTheme` and the next theme will be selected.

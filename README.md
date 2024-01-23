# nvim-config

This repository contains my custom NeoVim configuration.

## How to start

Clone this repository in such way, that the contents will
sit in default NeoVim config path or `NVIM_APPNAME` path (mentioned as `CONFIG_PATH`,
for more info, check `:h NVIM_APPNAME`).

```bash
git clone git@github.com:dkostmii/nvim-config.git CONFIG_PATH
```

Next, you might want to clone all your custom Treesitter parsers into
`parsers/` dir and put queries for their languages into `queries/LANG_NAME`.

Finally, start NeoVim and wait until Lazy finishes installing plugins.

To change editor theme and apply its colors to the rest of UI,
proceed to `lua/plugins/colorscheme`.

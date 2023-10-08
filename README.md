<div align="center">

<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Neovim-mark.svg/492px-Neovim-mark.svg.png" alt="Neovim-logo" width="75"/>

# Neovim Setup

Neovim is my favourite editor. It's my daily playground. This is my basic neovim setup.

:bomb: This setup has only been installed and tested
on Windows WSL.

## :camera: Showcase

<img src="https://raw.githubusercontent.com/wiki/soon1995/neovim/images/pikachu-dashboard.png" alt="dashboard" width="400"/>

<img src="https://raw.githubusercontent.com/wiki/soon1995/neovim/images/nvimtree-aerial-whichkey.png" alt="workplace" width="400"/>

Other Showcases see [wiki](https://github.com/soon1995/neovim/wiki/Showcase)

Header Section: [Pikachu](https://medium.com/@shaikzahid0713/alpha-start-up-screen-8e4a6e95804d) and [Monster(?)](https://github.com/goolord/alpha-nvim/discussions/16#discussioncomment-1526050)

I also love the colorthemes: [i3d/vim-jimbothemes](https://github.com/i3d/vim-jimbothemes) and [rose-pine](https://github.com/rose-pine/neovim)

</div>

## :house: Environment

1. Windows 10 OS
2. WSL
3. Neovim v0.8.3

## :bell: Prerequisite

To have fluent experience and prevent frustrations, ensure that the tools listed below are ready.

- [Neovim](https://neovim.io) (for sure)
- Make
- Python
- Pip
- [Nodejs](https://nodejs.org/en) ([Nvm](https://github.com/nvm-sh/nvm) is highly recommended)
- [Npm](https://www.npmjs.com) ([Nvm](https://github.com/nvm-sh/nvm) is highly recommended)
- Zip
- [Ripgrep](https://github.com/BurntSushi/ripgrep)
- [Fd](https://github.com/sharkdp/fd)
- [Lazygit](https://github.com/jesseduffield/lazygit)
- [Wslu](https://github.com/wslutilities/wslu) (WSL User only)
- XClip (WSL User only)

## :evergreen_tree: Project Layout

```bash
~/.config/nvim
├── init.lua
└── lua
    └── neovim
        ├── init.lua
        ├── autocmd.lua # autocmd here
        ├── plugin.lua  # plugin injection here
        ├── remap.lua   # keymap here
        ├── setup.lua   # setup vim option here
        ├── constant
        │   └── # global constant here
        ├── function
        │   └── # global function here
        └── plugins
            └── # plugin setup here
```

:bulb: Focus on `neovim/plugins/which-key.lua` and `neovim/remap.lua`
to familiarize and play with it.

:bulb: `:Telescope keymaps` or `<space>sk` to discover all keymaps

:memo: I am a Lua newbie, do advise and share lua knowledge with me.

## :pill: Environment Variable

| Key                   | Description                                                      |
| --------------------- | ---------------------------------------------------------------- |
| `MY_NEOVIM_CACHE_DIR` | Location of sessions, undodir, and etc. Default `~/.config/nvim` |

## :hammer: Installation

1. Clone this repo and place in `~/.config/nvim`
2. Let's rock with `nvim`

## :speech_balloon: Special Thanks

Thanks to my friend [Yim](https://github.com/yimjiajun) for introducing
Neovim to me. My work efficiency has improved significantly after using Neovim as my IDE.
I am enjoying my workstation so much.

Another thanks to [Christian Chiarulli](https://github.com/ChristianChiarulli) for providing such a pleasant
preset for Neovim beginners. I entered the Neovim environment with zero
knowledge using [LunarVim](https://github.com/LunarVim/LunarVim).
It has been my best companion for one year since
I started exploring Neovim.

Last but not least, thanks to the creators of Vi, Vim, and Neovim, as well as all the creators of the plugins
that have helped build my workplace playground.

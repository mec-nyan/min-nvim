# Min Nvim

An (almost) minimal configuration for **Neovim**.

## What, why, how?

*What:*

This aims to be a minimal configuration for **neovim** (and maybe for *Vim*) that adds useful stuff
and gets out of the way.

I try to change as little as possible so to not interfere with (Neo)Vim's defaults.

*Why:*

Each of (Neo)Vim users has different needs and feels comfortable with different settings and plugins.
For me, I've found out that some configurations replace the key bindings for things that I find
really useful in Vim or add plugins to "add" some functionality that is already present.

Most of the time I find myself in need of a feature and search for a plugin, I end up (reading the
friendly manual and) discovering that (Neo)Vim already has that same functionality.

So I decided to create a configuration from scratch to:

- Add only the plugins and configuration that I need to do the job (but no less).
- Don't rely on external plugins when (Neo)Vim already provides that functionality.
- Don't break (Neo)Vim's functionality with my changes.
- Keep the configuration simple so others can easily change it to their taste and needs.

*How:*

- Use simple **Lua** scripts (or **Vim9script** for **Vim**) for configuration in a simple tree.
- Use (Neo)Vim's native package system (place your plugins under \*pack/\*/start/\*).
- Use **Git** to keep this config updated and available across devices.
- Make it public so others can benefit from it.
- Only the things I need:
    - LSP configuration (general and per language).
    - Keybindings and options of my preference.
    - A nice looking colorscheme. (Neo)Vim packs some nice colorschemes by default but I feel more
    comfortable with the great [Catppuccin](https://github.com/catppuccin/nvim)
    - Statusline.
    - File and grep search.

## TODO

A lot!

> *Why did I started with Neovim instead of Vim?*
> I love **Vim**, but **Neovim**'s builtin LSP makes a huge difference for me.
> Anyway, I miss the possibility of using **vim9script**, which is pretty cool and powerful.
> **Lua** is also something nice to have, but Lua 5.1 is deprecated. So.
> I'm starting with **Neovim** because it added some really nice features to **Vim** and it made
> easier to get started. But I plan to port this config to **Vim** using vim9script and we'll see
> how it goes. Wish me luck!

## Checklist

:warning:  I'll keep adding things in this list as I go!


- [ ] Vim options in a separate file.
    - [x] Add some personalised options.
- [ ] LSP:
    - [x] Firstly, make it work!
    - [ ] Add language servers:
        - [x] Lua
        - [x] Go
        - [x] Rust
        - [ ] C/C++
        - [ ] Python
        - [ ] Vim
        - [ ] Bash
    - [ ] Key bindings for common LSP functionality (check what's already mapped and if possible
    don't create extra key bindings).
    - [ ] "On save" stuff, i.e.
        - [ ] Format
        - [ ] Organise imports
        - [ ] Other
- [ ] Completion:
    - [ ] Trigger completion (maybe fuzzy...).
        - [x] Autotrigger on dot (can improve).
        - [x] Trigger with \<Tab> / \<C-space>.
        - [ ] Organise imports when completion inserts a new module name
        - [x] Silence message "Pattern not found" 😅
- [ ] Key bindings:
    - [x] Add my personal keybindings (i.e. i_CTRL-z to write, etc).
    - [ ] Keep keybindings in one place (Is it a good idea? Maybe it's better to set key bindings
    where they belong i.e. Lsp key bindings in _lsp.lua_ etc).
- [ ] Appearance
    - [x] Diagnostics symbols and borders.
    - [ ] Custom Pmenu colours.
    - [x] Custom Pmenu kind
        BTW I don't particularly like "icons" for this, they don't give me information about the
        item. I would like to use something like this:
        - f(x) (Function)
        - x.() (Method)
        - var  (Variable)
        - text (Text) (duh!)
        - {..} (Struct/Object)
        - \[..] (Array/List)
        - (,)  (Tuple)
        - You get the idea.
- [ ] Smooth scrolling.
    - [x] <C-d> & <C-u>
    - [ ] zz, zt, zb
- [ ] Easily explore mappings.
- [ ] Simple status line.
- [ ] Debugger?
- [ ] Treesitter?
- [ ] Breadcrums?

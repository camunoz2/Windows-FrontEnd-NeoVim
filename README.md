# My definitive NeoVim Experience for WebDev on Windows

Hi guys!, i have made many (MANY) iterations of this configuration for NeoVim for windows. In this readme are all the instructions needed for configuring, and installing this awesome experience.

## Prepare your system

Install powershell 7 (It is so much faster than the core powershell)

Install scoop (we are gonna need this after)
```bash
iwr -useb get.scoop.sh | iex
```
With scoop installed, install the gcc compiler for telescope to work properly
```bash
scoop install gcc
```
Then download NeoVim. I suggest to download the binary from the website and then add that to the your PATH variable.
Or you can install with `Winget`
```bash
winget install Neovim.Neovim
```

Run `gcc --version` on your powershell to make sure that the compiler is installed.  

Install packer
```bash
git clone https://github.com/wbthomason/packer.nvim "$env:LOCALAPPDATA\nvim-data\site\pack\packer\start\packer.nvim"
```
Then, run this command to copy the template files
```bash
git clone https://github.com/camunoz2/Windows-FrontEnd-NeoVim "$env:LOCALAPPDATA\nvim\"
```

You're ready to go, just type `nvim` and run `:PackerSync`. Maybe you need to quit nvim and run `:PackerSync` again to install the missing packages.
Enjoy!!

## Troubleshooting

### Fonts

Download `FiraCode` nerd font to have all the icons! And add it to your Powershell configuration for those FatArrows!

### Filetype

Neovim doesn't mark .astro files with the Astro filetype by default yet, so nvim-treesitter can't tell that tree-sitter-astro must be used for .astro files. Either put

autocmd BufRead,BufEnter *.astro set filetype=astro
in ~/.config/nvim/ftdetect/astro.vim, or put
```bash
vim.filetype.add({
    extension = {
        astro = "astro"
    }
})
```
in ~/.config/nvim/ftdetect/astro.lua.

### Parser dependencies
If the syntax highlighting doesn't work for embedded CSS/JSX, make sure you have all of the following tree-sitter parsers installed:

- css (for CSS in style elements)
- typescript (for the frontmatter)
- tsx (for interpolations)
- If it still doesn't work after that, open an issue.




## Remaps!
The \<leader\> key is remapped to the <space> key

| Hotkey | Action |
| --- | --- |
| \<leader\>e | Open netrw |
| sv | Vertical split |
| \<leader\>a | add to harpoon |
| \<C-e\> | open harpoon list |
| \<C-h/j/k/l> |Harpoon files |
| J | Move selected text in visual mode down |
| K | Move selected text in visual mode up |
| J | Append line without changing cursor |
| \<C-d\> | Navigate down and center |
| \<C-u\> | Navigate up and center |
| n, N | Cycle through search results and center |
| \<leader\>yy | Yank to clipboard |
| \<leader\>yap | Yank paragraph to clipboard |
| \<leader\>d | Delete without affecting register |
| \<leader\>f | Format entire file with LSP |
| \<leader\>s | Replace all occurrences of the hovered word |
| \<leader\><leader> | Source the current file |


### LSP

| Hotkey | Action |
| --- | --- |
| K | Displays hover information about the symbol under the cursor in a floating window |
| gd | Jumps to the definition of the symbol under the cursor |
| gD | Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature |
| gi | Lists all the implementations for the symbol under the cursor in the quickfix window |
| go | Jumps to the definition of the type of the symbol under the cursor |
| gr | Lists all the references to the symbol under the cursor in the quickfix window |
| gs | Displays signature information about the symbol under the cursor in a floating window. If a mapping already exists for this key this function is not bound |
| \<F2\> | Renames all references to the symbol under the cursor |
| \<F3\> | Format code in current buffer |
| \<F4\> | Selects a code action available at the current cursor position |
| gl | Show diagnostics in a floating window |
| \]d | Move to the next diagnostic |
| \<leader\> | Pick the symbol |


## Notes
Note: :TSUpdate will cause Packer to fail upon the first installation. It will run correctly when updating. To avoid this, call nvim-treesitter.install.update() directly:

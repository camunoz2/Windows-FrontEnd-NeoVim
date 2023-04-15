# My definitive NeoVim Experience for WebDev on Windows

Hi guys!, i have made many (MANY) iterations of this configuration for NeoVim for windows. In this readme are all the instructions needed for configuring, and installing this awesome experience.

## Prepare your system

Install powershell 7 (It is so much faster than the core powershell)

Install scoop (we are gonna need this after)
```bash
iwr -useb get.scoop.sh | iex
```
Then you could use scoop to install some dependencies (like fd for telescope to work properly)
Install MSYS2 for the C compiler. Enter the MSYSUCRT64 and run the command
```bash
pacman -S mingw-w64-ucrt-x86_64-gcc
```
Then add those to your PATH variable

Then download NeoVim. I suggest to download the binary from the website and then add that to the your PATH variable. Run `gcc --version` on your powershell to make sure that the compiler is installed.  

Install packer with
```bash
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
## Remaps!
The <leader> key is remapped to the <space> key

| Hotkey | Action |
| --- | --- |
| <leader>e | Open netrw |
| sv | Vertical split |
|<leader>a | add to harpoon |
|<C-e>|open harpoon list|
|<C-h/j/k/l>|Harpoon files|
| e | Open explorer |
| vJ | Move selected text in visual mode down |
| vK | Move selected text in visual mode up |
| J | Append line without changing cursor |
|  | Navigate down and center |
|  | Navigate up and center |
| n | Cycle through search results and center |
| N | Cycle through search results and center |
| y | Yank to clipboard |
| d | Delete without affecting register |
| Q | Disabled |
| f | Format entire file with LSP |
| s | Replace all occurrences of the hovered word |
|  | Source the current file |


### LSP

Key | Functionality | Documentation
K | Displays hover information about the symbol under the cursor in a floating window | :help vim.lsp.buf.hover()
gd | Jumps to the definition of the symbol under the cursor | :help vim.lsp.buf.definition()
gD | Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature | :help vim.lsp.buf.declaration()
gi | Lists all the implementations for the symbol under the cursor in the quickfix window | :help vim.lsp.buf.implementation()
go | Jumps to the definition of the type of the symbol under the cursor | :help vim.lsp.buf.type_definition()
gr | Lists all the references to the symbol under the cursor in the quickfix window | :help vim.lsp.buf.references()
gs | Displays signature information about the symbol under the cursor in a floating window. If a mapping already exists for this key this function is not bound | :help vim.lsp.buf.signature_help()
<F2> | Renames all references to the symbol under the cursor | :help vim.lsp.buf.rename()
<F3> | Format code in current buffer | :help vim.lsp.buf.format()
<F4> | Selects a code action available at the current cursor position | :help vim.lsp.buf.code_action()
gl | Show diagnostics in a floating window | :help vim.diagnostic.open_float()
\]d | Move to the next diagnostic | :help vim.diagnostic.goto_next()

## Notes
Note: :TSUpdate will cause Packer to fail upon the first installation. It will run correctly when updating. To avoid this, call nvim-treesitter.install.update() directly:

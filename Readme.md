# My Vim Configuration

A modern, feature-rich Vim/Neovim configuration optimized for JavaScript/TypeScript and web development.

## Features

- 🚀 Optimized for JavaScript/TypeScript/Vue development
- ⚡ Fast and responsive with performance optimizations
- 🎨 Beautiful UI with code-dark theme and airline statusbar
- 🔍 Powerful search and navigation tools
- 🤖 Smart autocompletion with CoC (Conquer of Completion)
- 🛠️ Built-in support for Git and modern dev tools
- 📦 Plugin management with vim-plug

## Configuration Summary

### Core Settings
- Modern Vim defaults with UTF-8 support
- Clipboard integration
- Mouse support
- Improved window splitting behavior
- Persistent undo history

### UI Enhancements
- Line numbers (absolute + relative)
- Cursor line highlighting
- code-dark color scheme
- Powerline fonts support
- Git gutter indicators

### Editing Experience
- Smart indentation (2 spaces for most files)
- Auto-completion
- Syntax highlighting for JS/TS/Vue/JSX
- Comment toggling
- Surround editing
- Whitespace management

### Plugin Ecosystem
- **Navigation**: NERDTree, FZF
- **Git**: Fugitive, GitGutter
- **LSP**: CoC with TypeScript/JavaScript support
- **Language Support**: JavaScript, TypeScript, Vue, JSX
- **Productivity**: Commentary, Surround, Indent Guides
- **Formatting**: Prettier via CoC

## Installation Guide

### Prerequisites
- Vim 8.0+ or Neovim
- Node.js (for CoC)
- Git
- Nerd Font (recommended for icons)

### Step-by-Step Installation

1. **Backup your existing Vim configuration** (if any):
   ```bash
   mv ~/.vimrc ~/.vimrc.bak
   mv ~/.vim ~/.vim.bak
   ```

2. **Install the configuration**:
   ```bash
   curl -fLo ~/.vimrc https://raw.githubusercontent.com/omid-aghaei/my-vim-setup/main/.vimrc
   ```

3. **Create necessary directories**:
   ```bash
   mkdir -p ~/.vim/undodir
   ```

4. **Install vim-plug** (plugin manager):
   ```bash
   curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

5. **Install the code-dark theme**:

   For Regular Vim:
   ```bash
   mkdir -p ~/.vim/pack/themes/start
   cd ~/.vim/pack/themes/start
   git clone https://github.com/tomasiser/vim-code-dark
   ```

   For Neovim:
   ```bash
   mkdir -p ~/.local/share/nvim/site/pack/themes/start
   cd ~/.local/share/nvim/site/pack/themes/start
   git clone https://github.com/tomasiser/vim-code-dark
   ```

6. **Install plugins**:
   Launch Vim and run:
   ```vim
   :PlugInstall
   ```

7. **Install CoC extensions**:
   After plugin installation, run in Vim:
   ```vim
   :CocInstall coc-tsserver coc-json coc-eslint coc-prettier coc-pairs coc-html coc-css coc-emmet coc-docker coc-prisma coc-highlight coc-snippets coc-yank
   ```

8. **(Optional) Install Nerd Font** for icons:
   - Download from https://www.nerdfonts.com/
   - Set as terminal font

## Key Mappings

### General
- `<leader>w` - Save file
- `<leader>q` - Quit
- `<leader>x` - Save and quit
- `<leader>tn` - Toggle relative numbers

### Window Management
- `Ctrl+h/j/k/l` - Navigate between windows
- `<leader>+/-` - Resize windows

### Navigation
- `<leader>n` - Toggle NERDTree
- `<leader>f` - Find file in NERDTree
- `<C-p>` - Fuzzy file search
- `<leader>b` - Buffer search
- `<leader>rg` - Ripgrep search

### Plugins
- `<leader>p` - Run Prettier (via CoC)
- `gd` - Go to definition (CoC)
- `gy` - Go to type definition (CoC)
- `gi` - Go to implementation (CoC)
- `gr` - Show references (CoC)

## Customization

To override any settings, create a `~/.vimrc.local` file with your customizations. This will be automatically loaded if it exists.

## Troubleshooting

If you encounter issues:
1. Make sure you have all prerequisites installed
2. Verify theme installation in correct directory
3. Run `:checkhealth` in Vim
4. Update plugins with `:PlugUpdate`
5. Check CoC health with `:CocInfo`

## License

MIT © [Omid Aghaei](https://omidaghaei.ir)

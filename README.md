vimfiles
========

My GVim config and keymaps.

Installation
------------

Before you start, remember to backup and remove any existing `.vim` or `vimfiles` directory, as well as the `.vimrc` or `_vimrc` file from your HOME directory.

- Linux

```
cd $HOME
git clone https://github.com/yangyd/vimfiles.git .vim

mkdir .vim/autoload
curl -L -o .vim/autoload/pathogen.vim https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim
```

- Windows (Powershell)

```
PS C:\Users\you> git clone https://github.com/yangyd/vimfiles.git
PS C:\Users\you> mkdir vimfiles\autoload
PS C:\Users\you> iwr -OutFile vimfiles\autoload\pathogen.vim https://github.com/tpope/vim-pathogen/raw/master/autoload/pathogen.vim
```

Plugins
-------

This configuration is supposed to be used along with the following plugins. GVim's Python3 support is required by the Ultisnips plugin.

```
https://github.com/w0rp/ale.git
https://github.com/maralla/completor.vim.git
https://github.com/ctrlpvim/ctrlp.vim.git
https://github.com/mattn/emmet-vim.git
https://github.com/mhartington/oceanic-next.git
https://github.com/junegunn/seoul256.vim.git
https://github.com/ervandew/supertab.git
https://github.com/SirVer/ultisnips.git
https://github.com/vim-airline/vim-airline.git
https://github.com/tpope/vim-commentary.git
https://github.com/terryma/vim-expand-region.git
https://github.com/michaeljsmith/vim-indent-object.git
https://github.com/tpope/vim-repeat.git
https://github.com/honza/vim-snippets.git
https://github.com/tpope/vim-surround.git
https://github.com/HerringtonDarkholme/yats.vim.git
```

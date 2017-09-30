git clone git@github.com:Jellyrick/zxxrc.git --recursive
git submodule update --init --recursive # if forget --recursive in clone

my .vimrc .zshrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim :PluginInstall

### Install zsh master
`sh Util/preconfig`
`./configure --prefix=/usr/local/zsh-master`
`sudo make -j9`
`sudo make install`
`make check`

### Install vim master
`./configure --with-features=huge \    
            --enable-multibyte \
            --enable-rubyinterp=yes \
            --enable-pythoninterp=yes \
            --with-python-config-dir=/usr/lib/python2.7/config \
            --enable-python3interp=yes \
            --with-python3-config-dir=/usr/lib/python3.5/config \
            --enable-perlinterp=yes \
            --enable-luainterp=yes \
            --enable-cscope \
            --prefix=/usr/local/vim-8.x`

`make -j16`
`sudo make install`

### Install tmux master
`sh autogen.sh`
`./configure --prefix=/usr/local/tmux-master`
`make -j16`
`sudo make install`

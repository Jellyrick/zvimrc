### Install zxxrc
1. `git clone git@github.com:Jellyrick/zxxrc.git --recursive`
2. `git submodule update --init --recursive # if forget --recursive in clone`                
3. `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`  
4. `vim :PluginInstall`

### Install zsh master
1. `sh Util/preconfig`
2. `./configure --prefix=/usr/local/zsh-master`
3. `make -j9`
4. `sudo make install`
5. `make check`

### Install vim master
1. `./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-pythoninterp=yes --with-python-config-dir=/usr/lib/python2.7/config --enable-python3interp=yes --with-python3-config-dir=/usr/lib/python3.5/config --enable-perlinterp=yes --enable-luainterp=yes --enable-cscope --prefix=/usr/local/vim-8.x`
2. `make -j16`
3. `sudo make install`

### Install tmux master
1. `sh autogen.sh`
2. `./configure --prefix=/usr/local/tmux-master`
3. `make -j16`
4. `sudo make install`

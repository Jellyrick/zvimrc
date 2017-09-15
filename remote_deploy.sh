#!/bin/bash
if [ $# -lt 1 ]; then
	echo "miss argument"	
	exit 1
fi
MACHINES=$1
pssh -H $MACHINES "cd /home/zhangjiguo; rm -fr ~/.vim"
prsync -avzrH "$MACHINES" /home/zhangjiguo/.vim /home/zhangjiguo/
prsync -avzrH "$MACHINES" /usr/local/zsh-master /home/zhangjiguo/
prsync -avzrH "$MACHINES" /usr/local/tmux-master /home/zhangjiguo/
prsync -avzrH "$MACHINES" /usr/local/vim-8.x /home/zhangjiguo/
prsync -avzrH "$MACHINES" /usr/local/ctags-5.8 /home/zhangjiguo/
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo cp -fr /home/zhangjiguo/tmux-master /usr/local && rm -fr /home/zhangjiguo/tmux-master"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo cp -fr /home/zhangjiguo/zsh-master /usr/local && rm -fr /home/zhangjiguo/zsh-master"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo cp -fr /home/zhangjiguo/vim-8.x /usr/local && rm -fr /home/zhangjiguo/vim-8.x"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo cp -fr /home/zhangjiguo/ctags-5.8 /usr/local && rm -fr /home/zhangjiguo/ctags-5.8"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo chown -R root:root /usr/local/tmux-master /usr/local/zsh-master /usr/local/vim-8.x /usr/local/ctags-5.8"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo chsh -s /usr/local/zsh-master/bin/zsh zhangjiguo"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "cd /home/zhangjiguo/.vim; sh deploy.sh"

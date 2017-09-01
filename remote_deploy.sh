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
prsync -avzrH "$MACHINES" /usr/local/vim-8.0.0599 /home/zhangjiguo/
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo cp -fr /home/zhangjiguo/tmux-master /usr/local && rm -fr /home/zhangjiguo/tmux-master"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo cp -fr /home/zhangjiguo/zsh-master /usr/local && rm -fr /home/zhangjiguo/zsh-master"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo cp -fr /home/zhangjiguo/vim-8.0.0599 /usr/local && rm -fr /home/zhangjiguo/vim-8.0.0599"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo chown -R root:root /usr/local/tmux-master /usr/local/zsh-master /usr/local/vim-8.0.0599"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "sudo chsh -s /usr/local/zsh-master/bin/zsh zhangjiguo"
pssh -t0 -Px '-A -tt' -H "$MACHINES" "cd /home/zhangjiguo/.vim; sh deploy.sh"

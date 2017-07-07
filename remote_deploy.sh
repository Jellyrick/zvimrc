pssh -H '172.25.52.17 172.25.52.18' "cd /home/zhangjiguo; rm -fr ~/.vim"
prsync -H '172.25.52.88 172.25.52.69' /usr/local/zsh-master /home/zhangjiguo/
prsync -H '172.25.52.88 172.25.52.69' /usr/local/tmux-master /home/zhangjiguo/
pssh -H '172.25.52.88 172.25.52.69' "sudo mv /home/zhangjiguo/tmux-master /usr/local"
pssh -H '172.25.52.88 172.25.52.69' "sudo mv /home/zhangjiguo/zsh-master /usr/local"
pssh -H '172.25.52.88 172.25.52.69' "sudo chown -R root:root /usr/local/tmux-master /usr/local/zsh-master"

# Lines configured by zsh-newuser-install
source ~/.vim/util.sh

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob notify HIST_IGNORE_DUPS SHARE_HISTORY INC_APPEND_HISTORY HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST histignorespace

bindkey -v
# End of lines configured by zsh-newuser-install
eval $(dircolors -b)
# The following lines were added by compinstall

autoload -U select-quoted
zle -N select-quoted
for m in visual viopp; do
  for c in {a,i}{\',\",\`}; do
    bindkey -M $m $c select-quoted
  done
done

autoload -U select-bracketed
zle -N select-bracketed
for m in visual viopp; do
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $m $c select-bracketed
  done
done

zstyle ':completion:*' auto-description 'Specify: %d'
zstyle ':completion:*' completer _expand _complete
#zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' expand suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' format '%B%F{green}--- Completing %d ---%f%b'
zstyle ':completion:*' ignore-parents parent pwd directory
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'm:{a-z}={A-Z}'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' menu select
zstyle ':completion:*:commands' list-colors '=*=1;31'
zstyle ':completion:*:builtins' list-colors '=*=1;38;5;142'
zstyle ':completion:*:aliases' list-colors '=*=2;38;5;128'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*:options' list-colors '=^(-- *)=34'

autoload -Uz compinit
compinit -i
# End of lines added by compinstall

bindkey "^F" beginning-of-line
bindkey "^E" end-of-line
bindkey -M viins '^L' vi-forward-blank-word
bindkey -M viins '^H' vi-backward-blank-word
bindkey -M vicmd '^L' vi-forward-blank-word
bindkey -M vicmd '^H' vi-backward-blank-word
bindkey -M vicmd '^J' vi-backward-word
bindkey -M viins '^J' vi-backward-word
bindkey -M vicmd '^K' vi-forward-word-end
bindkey -M viins '^K' vi-forward-word-end
bindkey -M viins "^v" vi-kill-eol
bindkey -M viins "^D" kill-word
# bindkey -M vicmd '/' history-incremental-pattern-search-backward
# bindkey -M vicmd '?' history-incremental-pattern-search-forward
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^S' history-incremental-pattern-search-forward
bindkey "^P" vi-up-line-or-history
bindkey "^N" vi-down-line-or-history

alias vim="/usr/local/vim-8.x/bin/vim"
alias diff="/world/data-gpu-16/zhangjiguo/third-parts/diffutils-3.10/bin/diff"
alias vimdiff="/usr/local/vim-8.x/bin/vimdiff"
alias ls="ls --color=auto --show-control-chars"
alias less="less -r"
alias rm="rm -vi"
alias ll="ls -alh"
alias l="ls -lh"
alias cp="cp -vi"
#alias grep='if [ ! -t 0 ]; then text=$(< /dev/stdin); fi; zgrep() {if [ ! -z "$text" ]; then content=$text; unset text; em=""; for x in $*; do [[ ${x} =~ ^-.*$ ]] && em="$em $x"; done; echo $em; echo "$content" | grep --color=auto $em $1 | grep --color=auto -v grep; else grep --color=auto $*; fi;}; zgrep'
alias grep="grep --color=auto"
alias mv="mv -iv"
alias ping="ping -n"
alias rsync="rsync --no-perms -avzP"
alias msh="mosh"
command -v autossh > /dev/null && alias ssh="autossh -t -A" || alias ssh="ssh -t -A"
alias pssh="/usr/bin/pssh -t0 -P -x '-A -tt'"
alias prsync='prsync -avzr -x "--no-perms"'
alias gdf="git difftool"
alias gck="git checkout"
alias gst="git status -uno"
alias gsta="git status"
alias gad="git add"
alias glg="git log"
alias psauxg="ps aux | grep -v grep | grep -i "
alias watch="watch -d"
alias history="history -i" # history $start_line $end_line
alias gdb="/usr/local/gdb-8.3.1/bin/gdb"
alias cmake="/usr/local/cmake-3.15.4/bin/cmake"
alias wget="/world/data-gpu-16/zhangjiguo/third-parts/wget-1.21/bin/wget"

[ -f /usr/local/tmux-master/bin/tmux ] && alias tmux='/usr/local/tmux-master/bin/tmux -2u' || alias tmux="tmux -2 -u"
# [ -f /usr/local/zsh-master/bin/zsh ] && alias zsh='/usr/local/zsh-master/bin/zsh' || which zsh
[ -f /usr/local/zsh-5.9/bin/zsh ] && alias zsh='/usr/local/zsh-5.9/bin/zsh' || which zsh

# export EDITOR=/usr/local/vim-8.x/bin/vim
alias vi="vim"

mesg n

stty -ixon

[ -s "~/.nvm/nvm.sh" ] && . "~/.nvm/nvm.sh" # This loads nvm



alias ..='cd ..'
alias cd..='cd ..'
alias cd...='cd ../..'
alias cd....='cd ../../..'
alias cd.....='cd ../../../..'
alias cd/='cd /'

alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias d='dirs -v | head -10'

ulimit -c 0

command -v keychain > /dev/null && eval `keychain --eval id_rsa`

CONNECT_IP=$(echo $SSH_CONNECTION | awk '{print $3}')
# PROMPT="%B%F{red}%n%f%K{blue}%F{white}@%f%k%F{magenta}${CONNECT_IP}%f:%F{green}%/%f:%b "
PROMPT="%F{magenta}${CONNECT_IP}%f:%F{green}%/%f:%b "
RPROMPT='%B%F{yellow}%D{%H:%M:%S.%.}%f%b'

#RPROMPT='%B%F{blue}%(?..%? )%(1j.[%j&] .)%f%F{yellow}%D{%H:%M:%S.%.}%f%b'
#function zle-line-init zle-keymap-select {
#    PS1="%B%F{red}%n%f%K{blue}%F{white}@%f%k%F{magenta}${CONNECT_IP}%f:%F{green}%/%f -%b "
#    PS2=$RPS1
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select

function preexec() {
    timer=${timer:-$(date +"%s%3N")}
}

function precmd() {
    export RPROMPT="%B%F{yellow}%D{%H:%M:%S.%.}%f%b"
    if [ $timer ]; then
	timer_show=$(($(date +"%s%3N") - $timer))
	ms2HR $timer_show #assign elapsed_time in util.sh

	export RPROMPT="%F{cyan}${elapsed_time} %B%F{yellow}%D{%H:%M:%S.%.}%f%b"
	unset timer
    fi
}

export LANG=en_HK.UTF-8
export LANGUAGE=en_HK:en
export LC_ALL=en_US.UTF-8  #FIX input chinese garbled in mac tmux

if [ -S $SSH_AUTH_SOCK ] && ! [ -h $SSH_AUTH_SOCK ]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi

export GOPATH=${HOME}/.go
export GO111MODULE=on
export GOPROXY=https://goproxy.cn,direct

# use -Wl,-rpath=xxx,-rpath-link=xxx -L -I代替
# export LD_LIBRARY_PATH=/usr/local/cuda-9.2/lib64:/usr/local/cudnn-v7.2-for-cuda-9.2/lib64:$LD_LIBRARY_PATH
export LD_LIBRARY_PATH=/home/zhangjiguo/cuda-11.3.1/lib64/:/home/zhangjiguo/cudnn-11.3-linux-x64-v8.2.1.32/lib64:/home/zhangjiguo/TensorRT-8.0.3.4/lib
#export CPLUS_INCLUDE_PATH=:/usr/include/mpich-x86_64/:/usr/local/cuda/include:/usr/local/cuda/samples/common/inc:/usr/local/include
# export PATH=~/.local/bin/:/usr/local/tmux-master/bin/:/home/zhangjiguo/apache-jmeter-5.2.1/bin:/home/zhangjiguo/node-v12.16.1-linux-x64/bin:/usr/local/valgrind-3.15.0/bin:/usr/local/go-1.14.15/bin:/usr/local/cmake-3.15.4/bin:/usr/local/vim-8.x/bin:/usr/local/cuda/bin:/usr/lib64/openmpi/bin/:/usr/local/pssh-2.3.1/bin:/usr/local/node-10.15.1/bin:/bin:/usr/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/ibutils/bin:/sbin:/usr/sbin/:/sbin:/usr/sbin/
export PATH=/world/data-gpu-16/zhangjiguo/third-parts/miniconda3/bin1:/world/data-gpu-16/zhangjiguo/third-parts/ffmpeg-4.2.2-amd64-static:/world/data-gpu-16/zhangjiguo/third-parts/cmake-3.15.4/bin:/world/data-gpu-16/zhangjiguo/third-parts/cuda-11.3.1/bin/:/world/data-gpu-16/zhangjiguo/third-parts/ninja-1.11.1/:/world/data-gpu-16/zhangjiguo/third-parts/gcc-9.4/bin/:~/.local/bin/:/usr/local/tmux-master/bin/:/home/zhangjiguo/apache-jmeter-5.2.1/bin:/usr/local/valgrind-3.15.0/bin:/usr/local/go-1.14.15/bin:/usr/local/vim-8.x/bin:/usr/lib64/openmpi/bin/:/usr/local/pssh-2.3.1/bin:/bin:/usr/bin:/usr/local/bin:/usr/local/sbin:/opt/ibutils/bin:/sbin:/usr/sbin/
export UV_THREADPOOL_SIZE=8
export DMLC_INTERFACE=ib0

typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[alias]='fg=cyan,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=blue,bold'
ZSH_HIGHLIGHT_STYLES[path]='fg=grey,bg=blue'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=grey'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=grey'
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'
ZSH_HIGHLIGHT_STYLES[line]='bold'
ZSH_HIGHLIGHT_STYLES[root]='bg=red'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
source ~/.vim/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source ~/.vim/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=10

if [[ `tmux -V` == "tmux master" ]] && [[ `tmux ls` != "" ]]; then
    if [[ `tmux list-keys | grep new-window` != *"new-window -c \"#{pane_current_path}\""* ]]; then
        tmux bind-key c new-window -c "#{pane_current_path}"
        tmux bind-key '_' split-window -c "#{pane_current_path}"
        tmux bind-key '|' split-window -h -c "#{pane_current_path}"
    fi
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="/home/zhangjiguo/.sdkman"
#[[ -s "/home/zhangjiguo/.sdkman/bin/sdkman-init.sh" ]] && source "/home/zhangjiguo/.sdkman/bin/sdkman-init.sh"
#
#export TVM_HOME=/home/zhangjiguo/tvm_server
#export PYTHONPATH=$TVM_HOME/python:$TVM_HOME/topi/python:$TVM_HOME/nnvm/python:${PYTHONPATH}
#export TVM_TRACKER_HOST=0.0.0.0
#export TVM_TRACKER_PORT=7777
#export TVM_NDK_CC=/home/zhangjiguo/work/android-toolchain-arm64/bin/aarch64-linux-android-g++
#export ANDROID_HOME=/home/zhangjiguo/work
#export PATH=/usr/local/gradle-4.10.2/bin:$PATH
#export PATH=/usr/local/apache-maven-3.5.4/bin:$PATH
#export PATH=/home/zhangjiguo/work/android-ndk-r16b/build/:$PATH 
export EDITOR=vim
export PYTHONHTTPSVERIFY=0

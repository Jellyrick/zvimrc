# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd beep extendedglob notify HIST_IGNORE_DUPS SHARE_HISTORY INC_APPEND_HISTORY HIST_SAVE_NO_DUPS HIST_FIND_NO_DUPS EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST histignorespace
bindkey -v
# End of lines configured by zsh-newuser-install
#PROMPT='%{ [01;36m%}%n%{[01;34m%}@%{[01;35m%}%M %{[01;33m%}%D %T %{[01;32m%}%/
#%{[01;31m%}>>%{[m%}'
eval $(dircolors -b)
# The following lines were added by compinstall

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
bindkey "^D" kill-word
bindkey -M vicmd '/' history-incremental-pattern-search-backward
bindkey -M vicmd '?' history-incremental-pattern-search-forward
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^S' history-incremental-pattern-search-forward
bindkey "^P" vi-up-line-or-history
bindkey "^N" vi-down-line-or-history

alias ls="ls --color=auto --show-control-chars"
alias less="less -r"
alias rm="rm -v"
alias ll="ls -alh"
alias l="ls -lh"
alias cp="cp -vi"
alias grep="grep --color=auto" #-nH 
alias mv="mv -iv"
alias ping="ping -n"
alias tmux="tmux -2 -u"
alias rsync="rsync -avzP"
alias msh="mosh"
command -v autossh > /dev/null && alias ssh="autossh -A" || alias ssh="ssh -A"
alias gdf="git difftool"
alias gck="git checkout"
alias gst="git status"
alias gad="git add"
alias psauxg="ps aux | grep -v grep | grep -i "
alias watch="watch -d"

export EDITOR=vim

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

ulimit -c unlimited

command -v keychain > /dev/null && eval `keychain --eval id_rsa`
# source /home/cyclops/work/workenv/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#setopt extended_glob
 TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

    recolor-cmd() {
        region_highlight=()
        colorize=true
        start_pos=0
        for arg in ${(z)BUFFER}; do
            ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
            ((end_pos=$start_pos+${#arg}))
            if $colorize; then
                colorize=false
                res=$(LC_ALL=C builtin type $arg 2>/dev/null)
                case $res in
                    *'reserved word'*)   style="fg=magenta,bold";;
                    *'alias for'*)       style="fg=cyan,bold";;
                    *'shell builtin'*)   style="fg=yellow,bold";;
                    *'shell function'*)  style='fg=green,bold';;
                    *"$arg is"*)
                        [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                    *)                   style='none,bold';;
                    esac
                    region_highlight+=("$start_pos $end_pos $style")

            fi
            [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
            start_pos=$end_pos
        done
    }
    check-cmd-self-insert() { zle .self-insert && recolor-cmd }
    check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

    zle -N self-insert check-cmd-self-insert
    zle -N backward-delete-char check-cmd-backward-delete-char

PROMPT="%B%F{green}%/%f@%F{magenta}%M%f-%K{blue}%F{white}[INS]%f%k-%F{white}%#%f%b "
RPROMPT='%B%F{yellow}%T%f %F{blue}%(?..%? )%(1j.[%j&] .)%f%F{cyan}%n%f %F{red}%f%b'
function zle-line-init zle-keymap-select {
    PS1="%B%F{green}%/%f@%F{magenta}%M%f-%K{blue}%F{white}${${KEYMAP/vicmd/[NOR]}/(main|viins)/[INS]}%f%k-%F{white}%#%f%b "
    PS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select


export LANG=en_HK.UTF-8
export LANGUAGE=en_HK:en
#export KEYTIMEOUT=0.8
source ~/.vim/opp.zsh/opp.zsh

if [ -S $SSH_AUTH_SOCK ] && ! [ -h $SSH_AUTH_SOCK ]; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
fi

export LD_LIBRARY_PATH=/usr/lib/:/usr/lib64/:/usr/local/cuda/lib64/:/usr/lib64/cudnn/:/usr/lib64/atlas:/usr/lib64/mpich/lib
export PATH=/usr/local/cuda/bin:/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin:/opt/ibutils/bin:/sbin:/usr/sbin/:/sbin:/usr/sbin/:/usr/lib64/mpich/bin
export CPLUS_INCLUDE_PATH=:/usr/include/mpich-x86_64/:/usr/local/cuda/include:/usr/local/cuda/samples/common/inc
#export HYDRA_HOST_FILE=/home/zhangjiguo/machinelist
export UV_THREADPOOL_SIZE=128

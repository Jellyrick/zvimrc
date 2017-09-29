MACHINE=NODE
while [ "$1" != "" ]
do
    case "$1" in
        "--machine")
            shift
            MACHINE="$1"
            ;;
        *)
            shift
            ;;
    esac
done

if [ $MACHINE == "NODE" ]; then
	ln -fs ~/.vim/.tmux.conf ~/
	ln -fs ~/.vim/.zshrc ~/
	ln -fs ~/.vim/.ycm_extra_conf.py ~/
elif [ $MACHINE == "MASTER" ]; then
	ln -fs ~/.vim/.tmux.conf.base ~/.tmux.conf
	ln -fs ~/.vim/.zshrc.macos ~/.zshrc
else
	echo "UNKNOWN MACHINE TYPE"
fi
ln -fs ~/.vim/.vimrc ~/
ln -fs ~/.vim/.gitconfig ~/
ln -fs ~/.vim/.jupyter ~/
ln -fs ~/.vim/.config ~/

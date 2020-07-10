# .bashrc

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/quadro/bin" ] ; then
    PATH="$HOME/quadro/bin:$PATH"
fi

more_config_file() {
#More Configuration File
for file in quadro/conf/* ;
do
   if [ -f $file ] ; then
        source $file ;
else
        echo "File configuration QUaDRO not found"
fi
done
}

detect_interactive_shell() {
[[ $- == *i* ]] && echo 'Interactive shell' || echo 'not-interactive shell'
}

more_config_file
detect_interactive_shell

if [ -f "$HOME/quadro/bin/motd.sh" ] ; then
    "$HOME/quadro/bin/motd.sh"
fi

#bash setting

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

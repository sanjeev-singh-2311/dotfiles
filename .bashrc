#
# ~/.bashrc
#

# Environment variables
export EDITOR="/usr/bin/nvim"
export PATH="$HOME/bin:$PATH" # Adds the ~/bin to PATH
export TERM="xterm-256color"
export LC_ALL=en_US.UTF-8 # Tells tmux that UTF-8 is supported
export LANG=en_US.UTF-8 # Same as above

# Comment this out if you don't have oh-my-posh
# Move your theme files to ~/.themes/oh-my-posh/themes
eval "$(oh-my-posh init bash --config ~/.themes/oh-my-posh/themes/tokyonight_storm.omp.json)"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ -f ~/.welcome_screen ]] && . ~/.welcome_screen

# bash nitch

_set_liveuser_PS1() {
    PS1='[\u@\h \W]\$ '
    if [ "$(whoami)" = "liveuser" ] ; then
        local iso_version="$(grep ^VERSION= /usr/lib/endeavouros-release 2>/dev/null | cut -d '=' -f 2)"
        if [ -n "$iso_version" ] ; then
            local prefix="eos-"
            local iso_info="$prefix$iso_version"
            PS1="[\u@$iso_info \W]\$ "
        fi
    fi
}
_set_liveuser_PS1
unset -f _set_liveuser_PS1

ShowInstallerIsoInfo() {
    local file=/usr/lib/endeavouros-release
    if [ -r $file ] ; then
        cat $file
    else
        echo "Sorry, installer ISO info is not available." >&2
    fi
}


# alias ls='ls --color=auto'
# alias ll='ls -lav --ignore=..'   # show long listing of all except ".."
# alias l='ls -lav --ignore=.?*'   # show long listing but no hidden dotfiles except "."

# Eza aliases
alias ls='eza --color=auto --icons=always'
alias ll='eza -la --ignore-glob=.. --icons=always'   # show long listing of all except ".."
alias l='eza -la --ignore-glob=.?* --icons=always'   # show long listing but no hidden dotfiles except "."

[[ "$(whoami)" = "root" ]] && return

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

################################################################################
## Some generally useful functions.
## Consider uncommenting aliases below to start using these functions.
##
## October 2021: removed many obsolete functions. If you still need them, please look at
## https://github.com/EndeavourOS-archive/EndeavourOS-archiso/raw/master/airootfs/etc/skel/.bashrc

_open_files_for_editing() {
    # Open any given document file(s) for editing (or just viewing).
    # Note1:
    #    - Do not use for executable files!
    # Note2:
    #    - Uses 'mime' bindings, so you may need to use
    #      e.g. a file manager to make proper file bindings.

    if [ -x /usr/bin/exo-open ] ; then
        echo "exo-open $@" >&2
        setsid exo-open "$@" >& /dev/null
        return
    fi
    if [ -x /usr/bin/xdg-open ] ; then
        for file in "$@" ; do
            echo "xdg-open $file" >&2
            setsid xdg-open "$file" >& /dev/null
        done
        return
    fi

    echo "$FUNCNAME: package 'xdg-utils' or 'exo' is required." >&2
}

#------------------------------------------------------------

## Aliases for the functions above.
## Uncomment an alias if you want to use it.
##

# alias ef='_open_files_for_editing'     # 'ef' opens given file(s) for editing
# alias pacdiff=eos-pacdiff
################################################################################

alias pwoff="sudo systemctl poweroff"
alias rboot="sudo systemctl reboot"

# Ranger cd to last visited location upon quitting
alias ranger='ranger --choosedir=$HOME/.rangerdir; cd "$(cat $HOME/.rangerdir)"'

# Night light filters using Redshift
alias nighton="redshift -O 5000"
alias nightoff="redshift -x"

# Terminal Clock
alias clock="tty-clock -s -c"

# Krabby instant search
alias krabname="krabby name"

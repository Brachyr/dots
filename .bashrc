# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

export TERM="xterm-256color"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[35m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\xEF\x9E\xA1 \1/')\[\033[00m\]\$ "
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias cp='pycp'
# some more ls aliases
alias lsf='\ls -A'
alias llf='\ls -alhF'
alias ls='lsd'
alias ll='ls -alhF'
alias la='ls -A'

# custom aliases
alias ..='cd ..'
alias cde='cd /mnt/c/dev'
alias cdl='cd /mnt/c/logs'
alias cdb='cd /mnt/e/bash'
alias cdi='cd /mnt/c/Users/savia/.ivy2/local/local/nl.tba'
alias cdd='cd /mnt/c/Users/savia/Downloads'
alias cdn='cd /mnt/c/Users/savia/AppData/Roaming/Notepad++/backup'
alias cdr='cd /mnt/r/projects'
alias cdm='cd /mnt/tmp'
alias cdg='. /home/raul/bin/cdg'
alias cdw='. /home/raul/bin/cdwin'
alias rmr='rm -r'
alias rl='rm /mnt/c/logs/*.log'
alias l='lnav /mnt/c/logs'
alias g='rg -iPN'
alias v='nvim'
alias p='python3'
alias vf='vifm'
alias gj='rg /mnt/c/git/ -e'
alias zl='for log in $(ls | grep "\.zip"); do unzip -p "$log" >> /mnt/c/logs/out.log; done'
alias lm='g "\.(\w+)\(" -o -IN | awk "{ print length, $0 }" | sort -n -s -u'
alias mntr='sudo mount -t drvfs \\\\10.96.5.20\\FileServer /mnt/r'
alias sqll='mysql -u root -h 127.0.0.1 -ptba1096 test'
alias branch='curl -su controls-project-api:pg@fuHluP:QPq~waTV@G -X GET "https://confluence.tba.nl/display/CONTROLSProjects/CONTROLS+Branching+overview" | grep -oP "<h2 id=\"CONTROLSBranchingoverview-Activeprojects\">Active projects</h2><div class=\"table-wrap\"><table.*?table>" | html2text -width 500 | g "OPEN|"'
alias comm='TERM=xterm-color java -Dshell.host="127.0.0.1" -DpluginPaths="nl.tba.sh.xmlrdt.client,nl.tba.sh.bento.client" -cp "/mnt/c/_Temp/commons.shell.client/build/*:/mnt/c/_Temp/commons.shell.client/lib/*" nl.tba.sh.Main'
alias fake='bash /mnt/c/dev/fake/run.sh'
alias ecl='ant -buildfile build.xml eclipse'
alias loc='ant -buildfile build.xml build-publish-local'
alias clp='win32yank.exe -o'
alias clip='clip.exe'
alias code='/mnt/c/Users/savia/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code'
alias sonar='ssh root@10.96.2.175'
alias sonarp='ssh root@10.96.2.50'
alias decompile='java -jar -Xmx4096M /mnt/c/TBA_Workspace/CAS/cfr_0_130.jar --outputdir /mnt/c/_Temp/out --extraclassspath'
# git
alias gc='git commit -m'
alias gp='git push'
alias gs='git status'
alias ga='git add'
alias gu='git pull'
alias gr='git reset'
alias gd='git diff'
alias gl='git log'
alias gf='git fetch --all'

# functions
function cpl() {
  cp $1 /mnt/c/logs
}

function cpb() {
  cp $1 /mnt/c/bash
}

function mon() {
  path=$(pwd)
  cd /mnt/c/dev/kk/mon/agent/
  nohup cmd.exe /c run.bat &
  cd /mnt/c/dev/kk/mon/monitor/
  nohup cmd.exe /c Monitor.exe &
  cd $path
}

function rip() {
  path=$(pwd)
  cd /mnt/c/dev/kk/controls.replay.animator.product/
  nohup cmd.exe /c run.bat &
  cd $path
}

function uzl() {
  path=$(pwd)
  if [ $# -ne 0 ]; then
    cd $1
  fi
  for log in $(ls | grep "\.log"); do
    if echo "$log" | grep -qe "\.zip$"; then
      unzip -q -d "/mnt/c/logs" "$log"
    else
      cp "$log" "/mnt/c/logs"
    fi
  done
  cd $path
}

function ml() {
  uzl "/mnt/c/workspace/"$(ls /mnt/c/workspace | grep -i $1".*product")"/runtime"
}

function gjz() {
  for f in $(ls *.zip); do
    zipgrep "$1" "$f"
  done
}

function gcu() {
  for d in *; do
    git -C $d shortlog -ns --all --no-merges;
  done |
    awk '{name=""; for (i=2; i<=NF; i++) {name=name " " $i}; count_by_user[name]+=$1} END {for (name in count_by_user) print count_by_user[name], name}' | sort -nr
}

export -f cpl
export -f cpb
export -f mon
export -f rip
export -f uzl
export -f ml
export -f gjz
export -f gcu

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#  tmux attach -t default || tmux new -s default
#fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

export EDITOR='/home/raul/squashfs-root/usr/bin/nvim'
export DISPLAY=:0
export FZF_DEFAULT_COMMAND='fd --type f -H'

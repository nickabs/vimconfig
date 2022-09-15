
#
# PATH
#
export PATH=$PATH:/opt/apache-maven/bin
# =============================================================== #
#

#
# Java
#
#/System/Library/Frameworks/JavaVM.framework/Versions/Current/Commands/java_home -V
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home

#
# temp aliases
#

alias start_postgres=~/Docker/postgres/docker_run_postgres.sh
alias psql=~/Docker/postgres/psql.sh
alias start_tomcat=~/docker/tomcat/docker_run_tomcat.sh
alias start_jenkins="~/docker/jenkins/docker_run_jenkins-mvn.sh jenkins/jenkins-mvn:2.107"
alias blah='function _b(){ echo "$PS1";  };_b'
alias sp='_f'
function _f() { PS1=$(echo $PS1|awk '{ if ($0 ~ "\\w") sub("\\w","\W");else sub("\\W","\w"); print}')" "; } 
ulimit -S -c 0      # Don't want coredumps.
set -o vi
set -o notify

# Enable options:
shopt -s cdspell
shopt -s cdable_vars
shopt -s checkhash
shopt -s checkwinsize
shopt -s sourcepath
shopt -s no_empty_cmd_completion
shopt -s cmdhist
shopt -s histappend histreedit histverify
shopt -s extglob       # Necessary for programmable completion.


# Color definitions (taken from Color Bash Prompt HowTo).
# Some colors might look different of some terminals.
# For example, I see 'Bold Red' as 'orange' on my screen,
# hence the 'Green' 'BRed' 'Red' sequence I often use in my prompt.


# Normal Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White

NC="\e[m"               # Color Reset


ALERT=${BWhite}${On_Red} # Bold White on red background

export PS1="\[$BBlue\]\u\[$BWhite\]@\[$BBlue\]\h:\[$BBlue\]\w\[$White\]\$ "
export CLICOLOR=1
export LSCOLORS="ExGxBxDxCxEgEdxbxgxcxd"

alias ls='ls -GFh'


#============================================================
#
#  ALIASES AND FUNCTIONS
#
#
#============================================================

# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

alias h='history'
alias j='jobs -l'
alias which='type -a'
alias ..='cd ..'

# Pretty-print of some PATH variables:
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'


alias du='du -kh'    # Makes a more readable output.

# The ubiquitous 'll': directories first, with alphanumeric sorting:
alias ll="ls -lv --group-directories-first"
alias lm='ll |more'        #  Pipe through 'more'
alias lr='ll -R'           #  Recursive ls.
alias la='ll -A'           #  Show hidden files.
alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...


#-------------------------------------------------------------
# Tailoring 'less'
#-------------------------------------------------------------

alias more='less'
export PAGER=less
export LESSCHARSET='latin1'
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'
                # Use this if lesspipe.sh exists.
export LESS='-i -w  -z-4 -g -e -M -X -F -R -P%t?f%f :stdin .?pb%pb\%:?lbLine %lb:?bbByte %bb:-...'
#
## LESS man page colors (makes Man pages more readable).
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
#

#-------------------------------------------------------------
# Tailoring 'git'
#-------------------------------------------------------------

. ~/.git-completion.bash

. ~/.git-prompt.sh
#-------------------------------------------------------------
# go
#-------------------------------------------------------------

export GOPATH=~/dev/go


#PS1='[\u@\h \W$(__git_ps1 " (%s)")]\$ '
export PS1="\[$BBlue\]\u\[$BWhite\]@\[$BBlue\]\h:\[$BBlue\]\w\[$Green\]\$(__git_ps1) \[$White\]\$ "

#node 14
export PATH="/usr/local/opt/node@14/bin:$PATH"
export PATH="$PATH:~/homebrew/bin"
export GHOST=~/dev/smallworkshop/lightsail/ghost/www/ghost/content/themes/liebling

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

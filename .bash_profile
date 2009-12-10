source ~/.git-completion.sh

export TERM="xterm-color"
export CLICOLOR='true'
export LSCOLORS="cxfxcxdxbxegedabagacad"

PS1='\u@\h:\w$ '
export PATH=$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/mysql/bin:$PATH
export DISPLAY=:0.0
export HISTSIZE=1000

export EDITOR="/usr/bin/vim"

alias fx="rake spec:db:fixtures:load"
alias sss="script/spec spec -c"
alias cd..="cd ../.."
alias cd...="cd ../../.."
alias dir="ls -al"
alias edit=vi
alias help=man
alias path="echo $PATH"
alias ll="ls -la"


# Git aliases for bash
alias gst='git status'
alias gl='git pull'
alias gp='git push'
alias gpr='git pull --rebase origin master'
alias gd='git diff --color'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias gf='git fetch origin master'
alias gro='git rebase origin/master'
alias gcm='git checkout master'



# SVN aliases
alias sst='svn status'
alias sup='svn update'
alias sc='svn commit'
alias sd='svn diff | mate'

# Rails aliases
alias ss='script/server'
alias dbm='rake db:migrate'
alias dbmt='rake db:migrate RAILS_ENV=test'

alias clog='cd $ip; echo > log/development.log; tail -f log/development.log'
alias rdd='rake db:migrate:reset'
alias rtd='rake db:migrate:reset RAILS_ENV=test'
alias l='ls'
alias log='cd $ip; tail -f log/development.log'
alias s='cd $ip; echo > log/development.log; script/server'
alias t='cd $ip'


for a in local $(ls /opt/ | grep -v local | grep -v gentoo); do
    FULLPATH=/opt/$a
    if [ -x $FULLPATH ]; then
        if [ -x $FULLPATH/bin ]; then
            export PATH="$FULLPATH/bin:$PATH" 
        fi
        if [ -x $FULLPATH/sbin ]; then
            export PATH="$FULLPATH/sbin:$PATH" 
        fi
        if [ -x $FULLPATH/share/aclocal ]; then
            export ACLOCAL_FLAGS="-I $FULLPATH/share/aclocal $ACLOCAL_FLAGS" 
        fi
        if [ -x $FULLPATH/man ]; then
            export MANPATH="$FULLPATH/man:$MANPATH" 
        fi
        if [ -x $FULLPATH/share/man ]; then
            export MANPATH="$FULLPATH/share/man:$MANPATH" 
        fi
        if [ -x $FULLPATH/lib/pkgconfig ]; then
            export PKG_CONFIG_PATH="$FULLPATH/lib/pkgconfig/:$PKG_CONFIG_PATH" 
        fi
    fi
done


test -r /sw/bin/init.sh && . /sw/bin/init.sh

# -- start rip config -- #
RIPDIR=/Users/ben/.rip
RUBYLIB="$RUBYLIB:$RIPDIR/active/lib"
PATH="$PATH:$RIPDIR/active/bin"
export RIPDIR RUBYLIB PATH
# -- end rip config -- #

##
# Your previous /Users/ben/.bash_profile file was backed up as /Users/ben/.bash_profile.macports-saved_2009-09-08_at_09:42:59
##

# MacPorts Installer addition on 2009-09-08_at_09:42:59: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
if [ -f /opt/local/etc/bash_completion ]; then
   . /opt/local/etc/bash_completion
fi


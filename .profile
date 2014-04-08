# .profile
#
# created on 07.04.01.
# updated on 14.04.08.
#
# ... by meinside@gmail.com

# for prompt
source ~/.bash/colors
source ~/.bash/git-prompt
export PS1="\[$bldcyn\]\u@\h\[$txtrst\]:\[$bldblu\]\w\[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"; find_git_branch; find_git_dirty'

# other configurations
umask 027
export DISPLAY=:0.0
#export EDITOR="/usr/bin/vim -%d %s"
export EDITOR="/usr/bin/vim"
export SVN_EDITOR="/usr/bin/vim"
export LANG="ko_KR.UTF-8"
export LC_ALL="ko_KR.UTF-8"
#export LANG="en.UTF-8"
#export LC_ALL="en.UTF-8"
export TERM="xterm-color"
export CLICOLOR=true
export HISTCONTROL=erasedups
export HISTSIZE=10000
shopt -s histappend

# common aliases
alias ls="ls -G"
alias ll="ls -G -l"
alias grep="grep --color=auto"
alias ctags='ctags -R --totals=yes'

# custom aliases
alias ngrep="sudo ngrep -q -W byline"
alias npm="sudo npm"
alias pg-start='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias pg-stop='pg_ctl -D /usr/local/var/postgres stop -s -m fast'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# load extra aliases if exist
if [ -f ~/.other_aliases ]; then
	. ~/.other_aliases
fi

# for Xcode
#defaults write com.apple.xcode PBXCustomTemplateMacroDefinitions '{ORGANIZATIONNAME = "some_organization_name" ; }'



#####################
#  for development  #
#####################

# for ruby
#export RUBYOPT="-rubygems"
#export RUBYOPT="-w -rubygems"

# for java
export JAVA_JVM_VERSION="1.6"
export CLASSPATH=.

# for node
export NODE_PATH=/usr/local/lib/node_modules:/usr/local/share/npm/lib/node_modules
export PATH="$PATH:/usr/local/share/npm/bin"

# for RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# custom paths
if [ -d "$HOME/node" ] ; then
	PATH="$PATH:$HOME/node"
fi
if [ -d "$HOME/bin" ] ; then
	PATH="$PATH:$HOME/bin"
fi


# .profile
#
# created on 07.04.01.
# updated on 12.06.26.
#
# ... by meinside@gmail.com


# for prompt and terminal's title
export PS1='\h \w \$ '
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'

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

# common aliases
alias ls="ls -G"
alias ll="ls -G -l"
alias grep="grep --color=auto"
alias ctags='ctags -R --totals=yes'

# custom aliases
alias ngrep="sudo ngrep -q -W byline"
alias npm="sudo npm"

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

# for google android (http://developer.android.com/sdk)
export PATH=$PATH:/Volumes/Data/files/dev/android-sdks/tools
export PATH=$PATH:/Volumes/Data/files/dev/android-sdks/platform-tools

# for node
export NODE_PATH=/usr/local/lib/node_modules

# for RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

# custom paths
if [ -d "$HOME/ruby" ] ; then
	PATH="$PATH:$HOME/ruby"
fi
if [ -d "$HOME/node" ] ; then
	PATH="$PATH:$HOME/node"
fi
if [ -d "$HOME/bin" ] ; then
	PATH="$PATH:$HOME/bin"
fi


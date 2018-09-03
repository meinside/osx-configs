# .zshrc
#
# created on 2014.06.30.
# updated on 2018.09.03.
#
# ... by meinside@gmail.com
#
# >> install oh-my-zsh
# $ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
#
# >> append '/usr/local/bin/zsh' to /etc/shells
# $ sudo vi /etc/shells
#
# >> change shell
# $ chsh -s /usr/local/bin/zsh
#

# Path to your oh-my-zsh installation.
# (https://github.com/robbyrussell/oh-my-zsh)
export ZSH=$HOME/.oh-my-zsh

# If you would like oh-my-zsh to automatically update itself
# without prompting you
DISABLE_UPDATE_PROMPT="true"

# https://github.com/robbyrussell/oh-my-zsh/wiki/themes
#
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
#plugins=(osx git ruby rails)
plugins=(osx brew iterm2 git stack)

# Search for oh-my-zsh.sh
if [ -f $ZSH/oh-my-zsh.sh ]; then
	source $ZSH/oh-my-zsh.sh
else
	echo "> Install oh-my-zsh,"
	echo "$ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
	echo
	echo "> Append '`which zsh`' to /etc/shells,"
	echo "$ sudo vi /etc/shells"
	echo
	echo "> And change shell:"
	echo "$ chsh -s `which zsh`"
	echo
fi

# User configuration
#umask 027
export DISPLAY=:0.0
export EDITOR="/usr/bin/vim"
export SVN_EDITOR="/usr/bin/vim"
export LANG="ko_KR.UTF-8"
export LC_ALL="ko_KR.UTF-8"
export TERM="xterm-256color"
export CLICOLOR=true
export HISTCONTROL=erasedups
export HISTSIZE=10000

# common aliases
alias ls="ls -G"
alias ll="ls -G -l"
alias grep="grep --color=auto"
alias ctags='ctags -R --totals=yes'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# aliases for development
alias ngrep="sudo ngrep -q -W byline"
alias httpserver="ruby -rwebrick -e's=WEBrick::HTTPServer.new(Port:8888,DocumentRoot:Dir.pwd);trap(\"INT\"){s.shutdown};s.start'"

# load zsh functions
. ~/.zshfunc

# load additional aliases if exist
if [ -f ~/.custom_aliases ]; then
	. ~/.custom_aliases
fi

# for Xcode
#defaults write com.apple.xcode PBXCustomTemplateMacroDefinitions '{ORGANIZATIONNAME = "some_organization_name" ; }'


#####################
#  for development  #
#####################

# for ruby
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.

if [[ -z $TMUX ]]; then

	# for ruby
	export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

	# for golang
	if [ -x "`which go`" ] ; then
		export GOROOT=`go env GOROOT`
		export GOPATH=$HOME/srcs/go
		export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
	fi

	# for haskell
	alias ghci="stack exec ghci --"

	# for swift
	if which swiftenv > /dev/null; then
		eval "$(swiftenv init -)"
	fi

	# for java
	export JAVA_JVM_VERSION="1.6"
	export CLASSPATH=.

	# for node
	export NODE_PATH=/usr/local/lib/node_modules:/usr/local/share/npm/lib/node_modules
	export PATH="$PATH:/usr/local/share/npm/bin"

	# for dart
	export PATH="$PATH:$HOME/.pub-cache/bin"

	# additional paths
	export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

fi

# for python (installed with brew)
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export WORKON_HOME=$HOME/.virtualenvs
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

# append additional paths if exist
if [ -f ~/.custom_paths ]; then
	while IFS='' read -r p; do
		export PATH=$PATH:"$p"
	done < ~/.custom_paths
fi


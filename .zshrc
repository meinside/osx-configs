# .zshrc
#
# created on 2014.06.30.
# updated on 2019.11.26.
#
# ... by meinside@gmail.com
#
# >> install oh-my-zsh
# $ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
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
plugins=(osx brew history iterm2 mosh git git-flow docker kubectl copydir)

# Search for oh-my-zsh.sh
if [ -f $ZSH/oh-my-zsh.sh ]; then
	source $ZSH/oh-my-zsh.sh
else
	echo "> Install oh-my-zsh:"
	echo "$ git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh"
	echo
fi

# User configuration
#umask 027
export DISPLAY=:0.0
export EDITOR="/usr/bin/vim"
export SVN_EDITOR="/usr/bin/vim"
export LANG="ko_KR.UTF-8"
export LC_ALL="ko_KR.UTF-8"
export TERM="screen-256color"
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

# for Xcode
#defaults write com.apple.xcode PBXCustomTemplateMacroDefinitions '{ORGANIZATIONNAME = "some_organization_name" ; }'


#####################
#  for development  #
#####################

# brew sbin
export PATH="/usr/local/sbin:$PATH"

# for python (installed with brew)
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export WORKON_HOME=$HOME/.virtualenvs
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

if [[ -z $TMUX ]]; then

	# for dart
	export PATH="$PATH:$HOME/.pub-cache/bin"

	# for golang
	if [ -x "`which go`" ] ; then
		export GOROOT=`go env GOROOT`
		export GOPATH=$HOME/srcs/go
		export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
	fi

	# for Lein (Clojure)
	export LEIN_JVM_OPTS=""
	# https://github.com/venantius/ultra/issues/108
	export LEIN_USE_BOOTCLASSPATH=no

	# for node
	export NODE_PATH=/usr/local/lib/node_modules:/usr/local/share/npm/lib/node_modules
	export PATH="$PATH:/usr/local/share/npm/bin"

	# for rust
	export PATH="$PATH:$HOME/.cargo/bin"

	# additional paths
	export PATH="$PATH:$HOME/bin:$HOME/.local/bin"

fi

# load additional environment variables (like GOPRIVATE, PATH, alias, ...) if exist
if [ -f ~/.custom_env ]; then
	. ~/.custom_env
fi

# remove redundant paths
typeset -aU path

# for zsh-syntax-highlighting
if [ -d /usr/local/share/zsh-syntax-highlighting/ ]; then
	source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


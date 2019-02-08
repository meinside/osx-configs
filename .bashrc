# .bashrc
#
# created on 2007.04.01.
# updated on 2019.02.08.
#
# ... by meinside@gmail.com

# for prompt
source ~/.bash/colors
source ~/.bash/git-prompt
export PS1="\[$bldcyn\]\u@\h\[$txtrst\]:\[$bldblu\]\w\[$txtgrn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}: ${PWD/#$HOME/~}\007"; find_git_branch; find_git_dirty'

# other configurations
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
shopt -s histappend

# common aliases
alias ls="ls -G"
alias ll="ls -G -l"
alias grep="grep --color=auto"
alias ctags='ctags -R --totals=yes'
alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# aliases for development
alias ngrep="sudo ngrep -q -W byline"
alias httpserver="ruby -rwebrick -e's=WEBrick::HTTPServer.new(Port:8888,DocumentRoot:Dir.pwd);trap(\"INT\"){s.shutdown};s.start'"

# load additional aliases if exist
if [ -f ~/.custom_aliases ]; then
	. ~/.custom_aliases
fi

# for Xcode
#defaults write com.apple.xcode PBXCustomTemplateMacroDefinitions '{ORGANIZATIONNAME = "some_organization_name" ; }'


#####################
#  for development  #
#####################

# for python (installed with brew)
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export PYTHON_CONFIGURE_OPTS="--enable-framework"
export WORKON_HOME=$HOME/.virtualenvs
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

# for ruby
# XXX - install ruby from source code, if not, it would complain about ssl certifications
# $ rvm install 2.2.3 --disable-binary

#export RUBYOPT="-w -rubygems"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

if [[ -z $TMUX ]]; then

	# for golang
	if [ `which go` ] ; then
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

# append additional paths if exist
if [ -f ~/.custom_paths ]; then
	while IFS='' read -r p; do
		export PATH=$PATH:"$p"
	done < ~/.custom_paths
fi


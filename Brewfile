# Brewfile of meinside@gmail.com
#
# Usage: 
#
# $ brew tap Homebrew/bundle
# $ brew bundle
# 
# last update: 2019.01.07.

#### formulas
#
# libraries
brew 'coreutils'
#
# utilities
brew 'ffmpeg', args: ['--with-libvpx', '--with-libvorbis', '--with-faac']
brew 'htop'
brew 'lnav'
brew 'm-cli'
brew 'mas'	# for Mac App Store
brew 'mobile-shell'
brew 'ngrep'
brew 'neovim'
brew 'pstree'
brew 'reattach-to-user-namespace'	# for using pbcopy, pbpaste, or mas in tmux
brew 'tmux'
brew 'tree'
brew 'wget'
brew 'zsh'
#
# for programming languages
tap 'dart-lang/dart'
brew 'dart'	# Dart 2.x
# for web development with Dart: https://webdev.dartlang.org/guides/get-started
# $ pub global activate webdev
# $ pub global activate stagehand
brew 'go'
brew 'haskell-stack'
brew 'kotlin'
brew 'node', args: ['--with-full-icu']
tap 'kylef/formulae'
brew 'kylef/formulae/swiftenv'
# $ swiftenv install --list
# $ swiftenv install [version]
# $ git clone https://github.com/jinmingjian/sourcekite.git && cd sourcekite && make install
brew 'swiftlint'
#
# for development tools
brew 'curl', args: ['--with-nghttp2']
brew 'git', args: ['--with-pcre']
brew 'git-flow'
brew 'gnupg'
brew 'heroku-toolbelt'
brew 'imagemagick'
brew 'jq'
brew 'mkcert'
brew 'opencv3', args: ['--HEAD', '--with-python3', '--with-ffmpeg', '--with-tbb', '--with-contrib']
brew 'wrk'

#### cask
#
tap 'caskroom/cask'
#
# utilities
cask 'dropbox'
cask 'google-chrome'
cask 'licecap'
cask 'osxfuse'
cask 'steam'
cask 'visual-studio-code'
cask 'xquartz'
#
# for development
cask 'iterm2'
cask 'java'
#cask 'postico'
cask 'sequel-pro'
cask 'virtualbox'
#
# fonts
tap 'caskroom/fonts'
cask 'font-hack'
cask 'font-fira-code'
#
# etc.
#cask 'gureumkim'	# for hangul input


#### for docker
#
brew tap wagoodman/dive
brew install dive


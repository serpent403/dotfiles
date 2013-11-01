# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby history history-substring-search fasd rails3 rails4 redis-cli themes battery colored-man git-extra extract bundler colorize rvm zsh-syntax-highlighting)


# Customize to your needs...
export PATH=$PATH:/Users/aman/.rvm/gems/ruby-1.9.3-p429@mongotest/bin:/Users/aman/.rvm/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/bin:/bin:/usr/sbin:

for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

export EC2_HOME=~/aws/ec2-api-tools-1.6.7.4
export AWS_ACCESS_KEY=AKIAJQH36Z7MZZWM4MTQ
export AWS_SECRET_KEY=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

export JRUBY_OPTS='--1.9'
# export JAVA_HOME=/usr
export TORQUEBOX_HOME=~/tb/torquebox
export JBOSS_HOME=$TORQUEBOX_HOME/jboss
export JRUBY_HOME=$TORQUEBOX_HOME/jruby
export PATH=$JRUBY_HOME/bin:$PATH
export PATH=$PATH:$EC2_HOME/bin

alias coderails='cd ~/Documents/programming/rails/code/'
alias coderuby='cd ~/Documents/programming/ruby/code/'
alias codebash='cd ~/Documents/programming/bash/code/'
alias copyrvmrc='cp ~/hoppr/hoppr_services/.rvmrc .'
alias coursera='cd ~/Documents/programming/coursera'
alias codejava='cd ~/Documents/programming/java'
alias m='mvim .'

alias mamp='/Applications/MAMP'
alias mampwebroot='/Applications/MAMP/htdocs'
alias mampmysql='/Applications/MAMP/Library/bin/mysql --host=localhost -uroot -proot'


source ~/.oh-my-zsh/oh-my-zsh.sh

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
source ~/.rvm/scripts/rvm





export EC2_HOME=~/aws/ec2-api-tools-1.6.7.4

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export JRUBY_OPTS='--1.9'
#export JAVA_HOME=~/tb/jdk
export JAVA_HOME=/usr
export TORQUEBOX_HOME=~/tb/torquebox
export JBOSS_HOME=$TORQUEBOX_HOME/jboss
export JRUBY_HOME=$TORQUEBOX_HOME/jruby
export PATH=$JRUBY_HOME/bin:$PATH
export PATH=$PATH:$EC2_HOME/bin


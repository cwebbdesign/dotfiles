[ -n "$PS1" ] && source ~/.bash_profile
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=$PATH:~/usr/local/packer # Add PAcker to PATH for scripting
PATH=$PATH:~/usr/local/bin/npm
export NVM_DIR="/Users/chris/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
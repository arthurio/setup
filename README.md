# setup
Easily save/restore/improve dev tools setup

## From scratch

- Install xcode
- Install brew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
- Install apps via brew
```
xargs brew install < brew/list
xargs brew install < brew/cask_list

brew services start redis
echo '[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion' >> ~/.bash_profile
/usr/local/opt/fzf/install
brew services start mysql
mkdir ~/.nvm
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.bash_profile
echo '. "/usr/local/opt/nvm/nvm.sh"' >> ~/.bash_profile
brew services start redis
pip install virtualenv virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh
```

```
brew unlink mysql
brew install mysql-connector-c
brew link --overwrite mysql
```

## GPG

### Export

```
gpg --armor --export arthur.rio@me.com > arthur.pub
gpg --import arthur.pub
gpg --armor --export-secret-keys  arthur.rio@me.com > arthur.private
gpg --import arthur.private
```

## Fonts
git clone git@github.com:gabrielelana/awesome-terminal-fonts.git


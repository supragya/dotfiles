# Dot Files

## Install PreRequisites

Install Homebrew on MacOS if not already done:
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

Download GNU Stow to your machine:
```
brew install stow
```

Then, clone the repository using:
```
git clone git@github.com:supragya/dotfiles.git $HOME/.dotfiles
```

## Stow it!
Use GNU Stow to activate the dotfiles
```
cd $HOME/.dotfiles; stow .
```

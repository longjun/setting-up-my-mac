#!/bin/sh

# Homebrew Script for OSX
# To execute: save and `chmod +x ./brew-install-script.sh` then `./brew-install-script.sh`

echo "Configuring OSX..."

# Enable repeat on keydown
defaults write -g ApplePressAndHoldEnabled -bool false

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Check and update homebrew recipes
brew doctor && brew update

binaries=(
  zsh
  starship
  git
  tree
  wget
  ffmpeg
  pnpm
  nvm
  vim
  go
)

echo "installing binaries..."
brew install ${binaries[@]}


echo "Installing apps..."
brew tap homebrew/cask
apps=(
  iterm2
  arc
  vlc
  keka
  google-chrome
  visual-studio-code
  raycast
  orbstack
  sequel-ace
  imageoptim
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
brew install --cask --appdir="/Applications" ${apps[@]}

echo "Installing fonts..."
brew tap homebrew/cask-fonts
fonts=(
  font-fira-code-nerd-font
  font-jetbrains-mono-nerd-font
)
brew install --cask ${fonts[@]}

# After you're done, you should clean everything up with:
brew cleanup
echo "Bootstrapping complete!"

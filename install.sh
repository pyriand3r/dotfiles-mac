#!/bin/zsh

PS3="What kind of machine you want to install: "

select type in private work; do
    case $type in
    "private")
        echo "Setting up private machine"
        break
        ;;
    "work")
        echo "Setting up work machine"
        break
        ;;
    *)
        echo "not available"
        exit 1
        ;;
    esac
done

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Homebrew
## Install
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

## Taps
echo "Tapping Brew..."
brew tap homebrew/cask-fonts
brew tap koekeishiya/formulae

## Formulae
echo "Installing Brew Formulae..."
brew install jq
brew install mas
brew install skhd
brew install neovim

## Casks
echo "Installing Brew Casks..."
### general stuff
brew install --cask warp
brew install --cask arc
brew install --cask libreoffice
brew install --cask spotify
brew install --cask font-jetbrains-mono
brew install --cask font-monaspace
brew install --cask docker
brew install --cask freetube
brew install --cask hiddenbar
brew install --cask intellij-idea
brew install --cask obsidian
brew install --cask resilio-sync
brew install --cask sf-symbols
brew install --cask stats
brew install --cask uhk-agent

### only work machine
if [ $type = "work" ]; then
    brew install --cask github
    brew install --cask fork
    brew install --cask microsoft-teams
    brew install --cask linphone
    brew install --cask postman
    brew install --cask meetingbar
    brew install --cask figma
    brew install --cask visual-studio-code
fi

### only private machine
if [ $type = "private" ]; then
    brew install --cask calibre
    brew install --cask gimp
    brew install --cask jdownloader
    brew install --cask unified-remote
fi

# Mac App Store Apps
echo "Installing Mac App Store Apps..."
### general
mas install 1544620654 #Pasty
mas install 6443843900 #iBar

### only work machine
if [ $type = "work" ]; then
    mas install 1327661892 #Xmind
    mas install 1295203466 #MS Remote Desktop
    mas install 1221250572 #Xnip
fi

### only private machine
if [ $type = "private" ]; then
    
fi

# Copy german no dead keys keyboard layout
cp ${PWD}/german_noDeadKeys.zip /Library/Keyboard Layouts/
unzip /Library/Keyboard Layouts/german_noDeadKeys.zip
rm /Library/Keyboard Layouts/german_noDeadKeys.zip

# activating german no dead keys keyboard layout
defaults write com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID -string "org.sil.ukelele.keyboardlayout.german_nodeadkeys.german-nodeadkeys"

# macOS Settings
echo "Changing macOS defaults..."
defaults write com.apple.spaces spans-displays -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock "mru-spaces" -bool "false"
defaults write com.apple.dock "show-recent" -bool "false"

defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

defaults write com.apple.screencapture location -string "$HOME/Pictures"
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string "png"

defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Copying and checking out configuration files
echo "Planting Configuration Files..."
ln -s ${PWD}/config/yabai ~/.config/yabai
ln -s ${PWD}/config/skhd ~/.config/skhd
ln -s ${PWD}/config/nvim ~/.config/nvim

ln -s ${PWD}/scripts ~/.scripts

source $HOME/.zshrc
#cfg config --local status.showUntrackedFiles no

# Start Services
echo "Starting Services (grant permissions)..."
skhd --start-service
yabai --start-service

echo "Installation complete...\n"

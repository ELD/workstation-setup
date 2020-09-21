# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Accepting Xcode License"
echo
sudo xcodebuild -license accept

echo
echo "Installing applications"

# Utilities

brew cask install clipy
brew cask install shiftit
echo
echo "configure shiftit to select 1/3 screen width, 1/2 screen width and 2/3 screen width:"
echo "`defaults write org.shiftitapp.ShiftIt multipleActionsCycleWindowSizes YES`"
echo
brew cask install dash
brew cask install fantastical
brew install mas

# Terminals

brew cask install iterm2-nightly

# Browsers

brew cask install google-chrome-beta
brew cask install firefox-developer-edition

# Text Editors

brew cask install sublime-text
brew cask install visual-studio-code-insiders

brew install fonttools
brew install speedtest-cli
brew install youtube-dl

brew cask install intel-power-gadget
brew cask install jetbrains-toolbox

mas install 1107421413 # 1Blocker
mas install 1444383602 # GoodNotes 5
mas install 1458969831 # JSONPeep for Safari
mas install 1160374471 # Pipifier
mas install 904280696 # Things 3
mas install 1482454543 # Twitter
mas install 497799835 # Xcode

brew cask install 1password
brew cask install alfred
brew cask install authy
brew cask install bartender
brew cask install bettertouchtool
brew cask install coconutbattery
brew cask install cyberduck
brew cask install daisydisk
brew cask install font-jetbrains-mono
brew cask install font-jetbrains-mono-nerd-font
brew cask install istat-menus
brew cask install monitorcontrol
brew cask install numi
brew cask install osxfuse
brew cask install paw
brew cask install element
brew cask install sensei
brew cask install skyfonts

set -e

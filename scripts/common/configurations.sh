echo
echo "Configuring iTerm"
cp files/com.googlecode.iterm2.plist ~/Library/Preferences

echo "Configuring ShiftIt"
open /Applications/ShiftIt.app

echo "Configuring FlyCut"
open /Applications/Clipy.app

echo "Installing Ruby"
brew install rbenv
source "$HOME/.config.zsh"
ruby_version='2.7.1'
rbenv install "$ruby_version"
rbenv global "$ruby_version"

echo
echo "Installing vim configuration"
brew install python
pip3 install neovim
gem install neovim

if [ ! -f ~/.local/share/nvim/site/autoload/plug.vim ]; then
    cp -f files/vimrc ~/.vimrc
    cp -f files/vimrc.bundles ~/.vimrc.bundles

    mkdir -p ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim

    echo
    echo "Installing Vim Plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    nvim +PlugInstall +UpdateRemotePlugins +qall
fi


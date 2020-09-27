echo
echo "Updating config files"
echo

cp -f files/com.googlecode.iterm2.plist ~/Library/Preferences/com.googlecode.iterm2.plist

cp -f files/vimrc ~/.vimrc
cp -f files/vimrc.bundles ~/.vimrc.bundles
nvim +PlugInstall +qall

gpg --decrypt files/config.zsh.gpg >! $HOME/.config.zsh
cp -f files/aliases.zsh $HOME/.aliases.zsh

cp -f files/git-commit-template.txt $HOME/.git-commit-template.txt

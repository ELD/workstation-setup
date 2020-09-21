echo
echo "Configuring zsh with prezto"
rm -rf "${HOME}/.zprezto"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

echo
echo "Copying over runcom commands to home directory"
runcoms_to_copy=(zlogin zlogout zshenv)
for rcfile in ${runcoms_to_copy[@]}; do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo
echo "Installing Prezto Contrib"
git clone --recurse-submodules https://github.com/belak/prezto-contrib ${HOME}/.zprezto/contrib

echo
echo "Copying over customized dotfiles"
cp -f files/zpreztorc ~/.zpreztorc
cp -f files/zprofile ~/.zprofile
cp -f files/zshrc ~/.zshrc
cp -f files/aliases.zsh ~/.aliases.zsh

echo "GPG Key required to decrypt config.zsh.gpg"
gpg --recv 0x8973748FFF9B634F
gpg --decrypt --armor --output ~/.config.zsh files/config.zsh.gpg

# TODO: Check /etc/shells first before appending
echo
echo "Setting zsh as the default shell"
if [[ ! $(grep '/usr/local/bin/zsh' /etc/shells) ]]; then
  sudo sh -c 'echo /usr/local/bin/zsh >> /etc/shells'
fi
chsh -s /usr/local/bin/zsh

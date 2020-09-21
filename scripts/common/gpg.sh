echo
echo "Installing and configuring GPG"
brew cask install gpg-suite
brew cask install veracrypt

brew install pinentry
brew install ykman
brew install ykpers
brew install hopenpgp-tools

echo
echo "Copying GPG config"
cp -f files/gpg.conf ~/.gnupg/gpg.conf
cp -f files/gpg-agent.conf ~/.gnupg/gpg-agent.conf

echo
echo "Fetching the public key for the smart card"
echo "Type 'fetch' then 'quit' in the GPG prompt"
gpg --card-edit

echo
echo "Killing gpg-agent to pick up config"
gpgconf --kill gpg-agent


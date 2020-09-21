echo
echo "Installing tools for operations"

brew cask install virtualbox || true # VBox fails to install because of kext issues
brew cask install vagrant

brew install kubernetes-helm
brew install kustomize
brew install terraform

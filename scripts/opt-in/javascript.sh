echo
echo "Installing JavaScript dev tools"

brew install nvm

if [[ ! -d $HOME/.nvm ]]; then
    mkdir $HOME/.nvm
fi

brew install yarn

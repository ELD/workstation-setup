echo
echo "Installing Rustup Init utility"

brew install rustup-init
brew install sccache

eval "$(brew --prefix rustup-init)/bin/rustup-init -y --no-modify-path --default-toolchain nightly"
source "${HOME}/.cargo/env" # Needed to be able to run the following command

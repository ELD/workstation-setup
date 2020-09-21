echo
echo "Installing Docker for containerization support"

# Don't stop if docker fails
set +e

# Docker
brew cask install docker-edge

set -e

#!/usr/bin/env bash
#
# setup.sh:  run the Pivotal workstation setup
#
# Arguments:
#   - a list of components to install, see scripts/opt-in/ for valid options
#
# Environment variables:
#   - SKIP_ANALYTICS:  Set this to 1 to not send usage data to our Google Analytics account
#

# Fail immediately if any errors occur
set -e

echo "Setting path to incldue /usr/local/bin"
export PATH="/usr/local/bin:$PATH"

echo "Pausing until you sign into the Mac App Store"
read -n1 -r -p "Press any key to continue..." key

echo "Caching password..."
sudo -K
sudo true;
clear

MY_DIR="$(dirname "$0")"
SKIP_ANALYTICS=${SKIP_ANALYTICS:-0}
if (( SKIP_ANALYTICS == 0 )); then
    clientID=$(od -vAn -N4 -tx  < /dev/urandom)
    source ${MY_DIR}/scripts/helpers/google-analytics.sh ${clientID} start $@
else
    export HOMEBREW_NO_ANALYTICS=1
fi

# Note: Homebrew needs to be set up first
source ${MY_DIR}/scripts/common/homebrew.sh
source ${MY_DIR}/scripts/common/gpg.sh
source ${MY_DIR}/scripts/common/configuration-shell-utils.sh
source ${MY_DIR}/scripts/common/configuration-zsh.sh

source ${MY_DIR}/scripts/common/git.sh
source ${MY_DIR}/scripts/common/git-aliases.sh
source ${MY_DIR}/scripts/common/applications-common.sh # Utils and whatnot
source ${MY_DIR}/scripts/common/configuration-osx.sh
source ${MY_DIR}/scripts/common/configurations.sh

# For each command line argument, try executing the corresponding script in opt-in/
for var in "$@"
do
    echo "$var"
    FILE=${MY_DIR}/scripts/opt-in/${var}.sh
    echo "$FILE"
    if [ -f $FILE ]; then
        source ${FILE}
    else
       echo "Warning: $var does not appear to be a valid argument. File $FILE does not exist."
    fi
done

source ${MY_DIR}/scripts/common/finished.sh
if (( SKIP_ANALYTICS == 0 )); then
    source ${MY_DIR}/scripts/helpers/google-analytics.sh ${clientID} finish $@
fi

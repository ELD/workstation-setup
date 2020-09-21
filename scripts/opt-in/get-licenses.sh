echo
echo "Decrypting 'licenses.md.gpg' into your home directory"

gpg --decrypt --armor files/licenses.md.gpg > "${HOME}/licenses.md"

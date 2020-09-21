echo
echo "Installing Git and associated tools"

brew install git
brew install hub
brew install gh
brew install diff-so-fancy

echo
echo "Setting global Git configurations"
git config --global core.editor /usr/local/bin/nvim
git config --global core.pager 	"diff-so-fancy | less --tabs=4 -RFX"

cp files/gitignore_global "${HOME}/.gitignore_global"
git config --global core.excludesfile ~/.gitignore_global

git config --global user.email "eric.dattore@gmail.com"
git config --global user.name "Eric Dattore"
git config --global user.signingkey 0x8973748FFF9B634F

git config --global gpg.program /usr/local/bin/gpg
cp files/git-commit-template.txt "${HOME}/.git-commit-template.txt"
git config --global commit.template ~/.git-commit-template.txt

git config --global commit.gpgSign true

git config --global push.default current
git config --global pull.rebase true

echo
echo "Modifying the Mac Dock layout"

# modify appearance of dock: remove standard icons, add chrome and iTerm
curl https://raw.githubusercontent.com/kcrawford/dockutil/master/scripts/dockutil > /usr/local/bin/dockutil
chmod a+rx,go-w /usr/local/bin/dockutil
dockutil --list | awk -F\t '{print "dockutil --remove \""$1"\" --no-restart"}' | sh
dockutil --add /Applications/iTerm.app --no-restart
dockutil --add /Applications/Safari.app --no-restart
dockutil --add /System/Applications/Messages.app --no-restart
dockutil --add /System/Applications/Mail.app --no-restart
dockutil --add /Applications/UlyssesMac.app --no-restart
dockutil --add /Applications/Things3.app --no-restart
dockutil --add /Applications/Slack.app --no-restart
dockutil --add /System/Applications/Music.app --no-restart
dockutil --add /Applications/Fantastical.app --no-restart

echo "Restarting Dock..."
killall Dock


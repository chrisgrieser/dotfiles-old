#!/bin/zsh
KARABINER_CLI="/Library/Application Support/org.pqrs/Karabiner-Elements/bin/karabiner_cli"

if [[ $($KARABINER_CLI --show-current-profile-name) == "Default profile" ]] ; then
	$KARABINER_CLI --select-profile "Default profile"
else
	$KARABINER_CLI --select-profile "turned off"
fi

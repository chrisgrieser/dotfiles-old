#!/usr/bin/env osascript

on run argv
	set theWord to item 1 of argv
	set langArg to ""
	set theFixedWord to do shell script "export PATH=/usr/local/lib:/usr/local/bin:/opt/homebrew/bin/:$PATH
	dym --clean-output -n1 " && langArg && " \"" && theWord && "\""

end run


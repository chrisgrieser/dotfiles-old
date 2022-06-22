-- https://www.hammerspoon.org/go/
-------------------------------------


function blubb ()
	hs.alert.show("foobar")
end

hs.hotkey.bind({"cmd", "alt", "ctrl", "shift"}, "W", blubb)

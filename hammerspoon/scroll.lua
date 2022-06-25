require("utils")

function scrollDown ()
	hs.eventtap.scrollWheel({0, 50})
	notify("test")
end

function scrollUp ()
	hs.eventtap.scrollWheel({0, -50})
	notify("test")
end

hotkey({"alt"}, "J", scrollDown)
hotkey({"alt"}, "K", scrollUp)

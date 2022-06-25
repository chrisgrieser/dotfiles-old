require("utils")

function scrollDown ()
	for i=1,10 do
		hs.eventtap.scrollWheel({0, -1}, {})
	end
end

function scrollUp ()
	for i=1,10 do
		hs.eventtap.scrollWheel({0, 1}, {})
	end
end

hotkey({"alt"}, "J", scrollDown, nil, scrollDown)
hotkey({"alt"}, "K", scrollUp, nil, scrollUp)

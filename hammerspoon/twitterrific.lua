-- https://www.hammerspoon.org/docs/hs.eventtap.html
function twitterrificScrollUp ()
	local previousApp = hs.application.frontmostApplication():name()

	-- needs activation, cause sending to app in bg does not work
	hs.application("Twitterrific"):activate()
	hs.eventtap.keyStroke({"cmd"}, "k") -- mark all as red
	hs.eventtap.keyStroke({"cmd"}, "j") -- scroll up
	hs.eventtap.keyStroke({"cmd"}, "1") -- scroll up failsafe
	hs.eventtap.keyStroke({}, "down") -- enable j/k movement

	hs.application(previousApp):activate()
end

function twitterificAction (keystroke)
	hs.eventtap.keyStroke({}, keystroke, 1, hs.application("Twitterrific"))
end
function iinaAction (keystroke)
	hs.eventtap.keyStroke({}, keystroke, 1, hs.application("IINA"))
end

hs.hotkey.bind({"shift"}, "home", twitterrificScrollUp)
hs.hotkey.bind({}, "home", function() hs.application("Twitterrific"):activate() end)
-- hs.hotkey.bind({}, "pagedown", function() twitterificAction("down") end, nil, function() twitterificAction("j") end)
-- hs.hotkey.bind({}, "pageup", function() twitterificAction("up") end, nil, function() twitterificAction("k") end)
hs.hotkey.bind({}, "pagedown", function() iinaAction("right") end, nil, function() iinaAction("j") end)
hs.hotkey.bind({}, "pageup", function() iinaAction("left") end, nil, function() twitterificAction("k") end)

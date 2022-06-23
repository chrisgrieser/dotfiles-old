-- https://www.hammerspoon.org/docs/hs.eventtap.html
function twitterrificScrollUp ()
	local frontapp = hs.application.frontmostApplication():name()

	hs.application("Twitterrific"):activate()
	hs.eventtap.keyStroke({"command"}, "k")
	hs.eventtap.keyStroke({"command"}, "j")
	hs.eventtap.keyStroke({"command"}, "1")

	hs.application(frontapp):activate()
end

hs.hotkey.bind({}, "", twitterrificScrollUp)

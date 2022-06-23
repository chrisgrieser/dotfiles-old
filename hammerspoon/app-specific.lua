-- https://www.hammerspoon.org/docs/hs.eventtap.html
function twitterrificScrollUp ()
	hs.eventtap.keyStroke({"cmd"}, "j", 0, hs.application("Twitterrific"))
	hs.eventtap.keyStroke({"cmd"}, "k", 0, hs.application("Twitterrific"))
	hs.eventtap.keyStroke({"cmd"}, "j", 0, hs.application("Twitterrific"))
end

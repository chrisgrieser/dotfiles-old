Hyperkey = {"cmd", "alt", "ctrl", "shift"}

function notify (text)
	hs.notify.new({title="Hammerspoon", informativeText=text}):send()
end

function finderIsFrontmost ()
	local frontapp = hs.application.frontmostApplication():name()
	return frontapp == "Finder"
end

hyper = {"cmd", "alt", "ctrl", "shift"}
hotkey = hs.hotkey.bind
keystroke = hs.eventtap.keyStroke

function notify (text)
	hs.notify.new({title="Hammerspoon", informativeText=text}):send()
end

function frontapp ()
	return hs.application.frontmostApplication():name()
end

function appIsRunning (app)
	-- can't use ":isRunning()", since the application object is nil when it's not running
	local runs = hs.application.get(app)
	if runs then
		return true
	else
		return false
	end
end


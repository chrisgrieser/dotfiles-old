hyper = {"cmd", "alt", "ctrl", "shift"}
hotkey = hs.hotkey.bind

function notify (text)
	hs.notify.new({title="Hammerspoon", informativeText=text}):send()
end

function frontapp ()
	return hs.application.frontmostApplication():name()
end

function appIsRunning (app)
	local runs = hs.application.get(app)
	if runs then
		return true
	else
		return false
	end
end


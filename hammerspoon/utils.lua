hyper = {"cmd", "alt", "ctrl", "shift"}

function notify (text)
	hs.notify.new({title="Hammerspoon", informativeText=text}):send()
end

function frontapp ()
	return hs.application.frontmostApplication():name()
end

function isRunning (app)
	if hs.application(app):isRunning() then
		return true
	else
		return false
	end
end

hotkey = hs.hotkey.bind

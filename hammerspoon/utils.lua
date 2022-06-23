Hyperkey = {"cmd", "alt", "ctrl", "shift"}

function notify (text)
	hs.notify.new({title="Hammerspoon", informativeText=text}):send()
end

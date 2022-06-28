hyper = {"cmd", "alt", "ctrl", "shift"}
hotkey = hs.hotkey.bind
keystroke = hs.eventtap.keyStroke

function numberOfScreens()
	return #(hs.screen.allScreens())
end

function notify (text)
	hs.notify.new({title="Hammerspoon", informativeText=text}):send()
end

function frontapp ()
	return hs.application.frontmostApplication():name()
end

function appIsRunning (app)
	-- can't use ":isRunning()", since the application object is nil when it
	-- wasn't wasn't running before
	local runs = hs.application.get(app)
	if runs then return true
	else return false	end
end

function bttBridge (triggerName)
	hs.applescript('tell application "BetterTouchTool" to trigger_named "'..triggerName..'"')
end

function runDelayed (delaySecs, fn)
	hs.timer.delayed.new(delaySecs, function () fn() end):start()
end



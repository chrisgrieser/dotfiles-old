hyper = {"cmd", "alt", "ctrl", "shift"}
hotkey = hs.hotkey.bind
keystroke = hs.eventtap.keyStroke

function numberOfScreens()
	return #(hs.screen.allScreens())
end

function isIMacAtHome ()
	return hs.screen.primaryScreen():name() == "Built-in Retina Display"
end

function isProjector()
	return hs.screen.primaryScreen():name() == "ViewSonic PJ"
end

function isAtOffice()
	local screenOne = hs.screen.primaryScreen():name() == "HP E223"
	local screenTwo = hs.screen.primaryScreen():name() == "Acer CB241HY"
	return (screenOne or screenTwo)
end

function isDarkMode()
	local _, isDark = hs.applescript('tell application "System Events" to return dark mode of appearance preferences')
	return isDark
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

function openIfNotRunning (app)
	local runs = hs.application.get(app)
	if runs then
		return
	else
		hs.application.open(app)
	end
end

function bttBridge (triggerName)
	hs.applescript('tell application "BetterTouchTool" to trigger_named "'..triggerName..'"')
end

function runDelayed (delaySecs, fn)
	hs.timer.doAfter(delaySecs, function () fn() end)
end



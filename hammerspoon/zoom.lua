hs.loadSpoon("Zoom")
spoon.Zoom:start()

zoomStatusMenuBarItem = hs.menubar.new()
zoomStatusMenuBarItem:setClickCallback(function() spoon.Zoom:toggleMute() end)

updateZoomStatus = function(event)
	hs.printf("updateZoomStatus(%s)", event)
	if (event == "from-running-to-meeting") then
		zoomStatusMenuBarItem:returnToMenuBar()
	elseif (event == "muted") then
		zoomStatusMenuBarItem:setTitle("🔴")
	elseif (event == "unmuted") then
		zoomStatusMenuBarItem:setTitle("🟢")
	elseif (event == "from-meeting-to-running") then
		zoomStatusMenuBarItem:removeFromMenuBar()
	end
end

hs.loadSpoon("Zoom")
spoon.Zoom:setStatusCallback(updateZoomStatus)
spoon.Zoom:start()

hs.hotkey.bind('', 'f5', function() spoon.Zoom:toggleMute() end)

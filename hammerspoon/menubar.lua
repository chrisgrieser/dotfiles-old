-- https://www.hammerspoon.org/docs/hs.menubar.html
-- https://www.hammerspoon.org/go/#simplemenubar
--------------------------------------------------------------------------------

require("utils")

weatherStatusBar = hs.menubar.new()
function setWeather()
	local _, weather = hs.http.get("https://wttr.in/Berlin?format=1", nil)
	weatherStatusBar:setTitle(weather)
end
setWeather()





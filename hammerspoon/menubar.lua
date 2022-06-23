-- https://www.hammerspoon.org/docs/hs.menubar.html
-- https://www.hammerspoon.org/go/#simplemenubar
--------------------------------------------------------------------------------

require("utils")

weatherStatusBar = hs.menubar.new()
function setWeather()
	weatherStatusBar:setTitle("blub")
end
setWeather()





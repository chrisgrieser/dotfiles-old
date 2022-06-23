-- https://www.hammerspoon.org/docs/hs.menubar.html
-- https://www.hammerspoon.org/go/#simplemenubar
--------------------------------------------------------------------------------

require("utils")

function setWeather()
	weatherStatusBar = hs.menubar.new()
	local _, weather = hs.http.get("https://wttr.in/Berlin?format=1", nil)
	weather = weather:gsub("\n", ""):gsub("+", "")
	weatherStatusBar:setTitle(weather)
end
setWeather()

updateIntervall = 15
intervalSecs = hs.timer.seconds(tostring(updateIntervall) .. "m")
hs.timer.doEvery(intervalSecs, setWeather)

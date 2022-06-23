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
hs.timer.doEvery(updateIntervall * 60, setWeather)

--------------------------------------------------------------------------------
function setCovidBar()
	covidBar = hs.menubar.new()
	local _, dataJSON = hs.http.get("https://api.corona-zahlen.org/germany", nil)
	local covidNumbers = hs.json.decode(dataJSON)
	local sevenDayIncidence = covidNumbers.weekIncidence:gsub(".%d", "")

	covidBar:setTitle("🦠" .. sevenDayIncidence)
end
setCovidBar()


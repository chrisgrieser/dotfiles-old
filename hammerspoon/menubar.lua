-- https://www.hammerspoon.org/docs/hs.menubar.html
-- https://www.hammerspoon.org/go/#simplemenubar
require("utils")
--------------------------------------------------------------------------------
weatherUpdateMin = 15
weatherLocation = "Berlin"

function setWeather()
	weatherStatusBar = hs.menubar.new()
	local _, weather = hs.http.get("https://wttr.in/" .. weatherLocation .. "?format=1", nil)
	weather = weather:gsub("\n", ""):gsub("+", "")
	weatherStatusBar:setTitle(weather)
end
setWeather()
hs.timer.doEvery(weatherUpdateMin * 60, setWeather)

--------------------------------------------------------------------------------
covidUpdateHours = 12
covidLocationCode = "BE"

function setCovidBar()
	covidBar = hs.menubar.new()
	local _, dataJSON = hs.http.get("https://api.corona-zahlen.org/germany", nil)
	local covidNumbers = hs.json.decode(dataJSON)
	local sevenDayIncidence = math.floor(covidNumbers.weekIncidence)
	local r = covidNumbers.r.rValue7Days.value
	covidBar:setTitle("🦠 " .. sevenDayIncidence .. " (" .. r ..  ")")
end
setCovidBar()
hs.timer.doEvery(covidUpdateHours * 60 * 60, setCovidBar)

-- JS for state numbers
-- const stateID = "BE";
-- const stateData = await getOnlineJson("https://api.corona-zahlen.org/states/" + stateID);
-- const state7DInc = stateData.data[stateID].weekIncidence;
-- const stateName = stateData.data[stateID].name

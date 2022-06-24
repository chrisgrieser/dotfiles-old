-- https://www.hammerspoon.org/docs/hs.menubar.html
-- https://www.hammerspoon.org/go/#simplemenubar
require("utils")
--------------------------------------------------------------------------------

-- reload all menubars when system wakes from sleep
function systemWakeWatcher (eventType)
	if (eventType == hs.caffeinate.watcher.screensDidWake) then
		setWeather()
		setCovidBar()
		notify ("System has woke up.")
	end
end
wakeWatcher = hs.caffeinate.watcher.new(systemWakeWatcher)
wakeWatcher:start()


--------------------------------------------------------------------------------

obsidianStatusBar = hs.menubar.new()
function obsidianCurrentFile()
	local jsonPath = os.getenv("HOME") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/.obsidian/workspace"
	local filename = hs.json.read(jsonPath).lastOpenFiles[1]
	filename = filename:sub(0, -4) -- remove extension
	filename = filename
	obsidianStatusBar:setTitle(filename)
end
obsidianCurrentFile()

--------------------------------------------------------------------------------
weatherUpdateMin = 15
weatherLocation = "Berlin"

weatherStatusBar = hs.menubar.new()
function setWeather()
	local _, weather = hs.http.get("https://wttr.in/" .. weatherLocation .. "?format=1", nil)
	weather = weather:gsub("\n", ""):gsub("+", "")
	weatherStatusBar:setTitle(weather)
end
setWeather()
hs.timer.doEvery(weatherUpdateMin * 60, setWeather)

--------------------------------------------------------------------------------
covidUpdateHours = 12
covidLocationCode = "BE"

-- German Covid-Numbers by the RKI → https://api.corona-zahlen.org/docs/
covidBar = hs.menubar.new()
function setCovidBar()
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

-- https://www.hammerspoon.org/docs/hs.menubar.html
-- https://www.hammerspoon.org/go/#simplemenubar
require("utils")
--------------------------------------------------------------------------------

-- reload all menubars when system wakes from sleep
function systemWakeWatcher (eventType)
	if (eventType == hs.caffeinate.watcher.screensDidWake) then
		setWeather()
		setCovidBar()
		homeWindowLayout()
		local timeHours = hs.timer.localTime() / 60 / 60
		if timeHours < 18 and timeHours > 6 then

		end
	end
end
wakeWatcher = hs.caffeinate.watcher.new(systemWakeWatcher)
wakeWatcher:start()


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
	local _, nationalDataJSON = hs.http.get("https://api.corona-zahlen.org/germany", nil)
	local nationalNumbers = hs.json.decode(nationalDataJSON)
	local national_7D_incidence = math.floor(nationalNumbers.weekIncidence)
	local nationalR = nationalNumbers.r.rValue7Days.value

	local _, stateDataJSON = hs.http.get("https://api.corona-zahlen.org/states/" .. covidLocationCode, nil)
	local stateNumbers = hs.json.decode(stateDataJSON)
	local stateName = stateNumbers.data[covidLocationCode].name
	local state_7D_incidence = math.floor(stateNumbers.data[covidLocationCode].weekIncidence)

	covidBar:setTooltip(stateName..": "..state_7D_incidence)
	covidBar:setTitle("🦠 "..national_7D_incidence.." ("..nationalR..")")
end
setCovidBar()
hs.timer.doEvery(covidUpdateHours * 60 * 60, setCovidBar)

--------------------------------------------------------------------------------

-- obsidianStatusBar = hs.menubar.new()
-- obsiWorkspaceJSON = os.getenv("HOME") .. "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Main Vault/.obsidian/workspace"
-- function obsidianCurrentFile()
-- 	local filename = hs.json.read(obsiWorkspaceJSON).lastOpenFiles[1]
-- 		:sub(0, -4) -- remove extension
-- 		:gsub(".*/", "") -- remove path
-- 	obsidianStatusBar:setTitle(filename)
-- end
-- obsidianCurrentFile()
-- obsiWatcher = hs.pathwatcher.new(obsiWorkspaceJSON, obsidianCurrentFile)
-- obsiWatcher:start()

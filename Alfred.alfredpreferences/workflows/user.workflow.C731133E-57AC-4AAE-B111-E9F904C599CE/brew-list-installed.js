#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";
const jsonArray = [];

// casks
app.doShellScript ("export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH; brew list --casks -1")
	.split("\r")
	.forEach(item => {
		jsonArray.push({
			"title": item,
			"match": alfredMatcher (item),
			"subtitle": "cask",
			"arg": item,
		});
	});

// formulae (installed on request)
app.doShellScript ("export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH; brew leaves --installed-on-request")
	.split("\r")
	.forEach(item => {
		jsonArray.push({
			"title": item,
			"match": alfredMatcher (item),
			"subtitle": "formula",
			"mods": { "cmd": { "arg": item } },
			"arg": item,
		});
	});

JSON.stringify({ items: jsonArray });

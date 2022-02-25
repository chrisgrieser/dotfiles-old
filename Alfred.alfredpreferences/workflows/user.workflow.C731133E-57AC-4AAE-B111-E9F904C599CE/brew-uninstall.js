#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";

const installs = app
	.doShellScript ("brew list --casks -1 ; brew leaves --installed-on-request")
	.split("\r");

const jsonArray = [];

installs.forEach(item => {

	jsonArray.push({
		"title": "",
		"match": alfredMatcher (item),
		"subtitle": "",
		"arg": "",
	});
});

JSON.stringify({ items: jsonArray });

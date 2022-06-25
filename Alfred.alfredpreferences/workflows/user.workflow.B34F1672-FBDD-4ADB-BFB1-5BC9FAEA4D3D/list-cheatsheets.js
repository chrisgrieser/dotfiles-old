#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";

// fill in here
const jsonArray = app.doShellScript("curl 'https://cheat.sh/:list'")
	.split("\r")
	.map(item => {
		return {
			"title": item,
			"match": alfredMatcher (item),
			// "subtitle": item,
			"arg": item,
			"uid": item
		};
	});

JSON.stringify({ items: jsonArray });

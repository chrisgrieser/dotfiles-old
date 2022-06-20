#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";

// fill in here
const VAR = $.getenv("");
const workArray = [];

const jsonArray = workArray.map(item => {
	// fill in here
	return {
		"title": item,
		"match": alfredMatcher (item),
		"subtitle": item,
		"type": "file",
		"icon": {
			"type": "fileicon",
			"path": item
		},
		"arg": item,
		"uid": item,
	};
});

JSON.stringify({ items: jsonArray });

#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
ObjC.import("Foundation");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";

const defaultFolder = $.getenv("default_folder").replace(/^~/, app.pathTo("home folder"));

const workArray = app.doShellScript (`ls -1 '${defaultFolder}'`)
	.split("\r");

workArray.map(item => {
	return {
		"title": item,
		"match": alfredMatcher (item),
		"arg": defaultFolder + "/" + item,
	};
});

JSON.stringify({ items: workArray });

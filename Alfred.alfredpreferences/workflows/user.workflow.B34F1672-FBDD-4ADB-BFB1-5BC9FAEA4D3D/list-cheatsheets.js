#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const alfredMatcher = (str) => str.replace (/[-()_.:]/g, " ") + " " + str + " ";

// fill in here
const jsonArray = app.doShellScript("curl 'https://cheat.sh/:list'")
	.split("\r")
	.filter(l => !l.endsWith(":list") && !l.endsWith("/") && !l.startsWith(":"))
	.concat([":help", ":intro"])
	.map(item => {
		return {
			"title": item,
			"match": alfredMatcher (item),
			"arg": item,
			"uid": item
		};
	});

JSON.stringify({ items: jsonArray });

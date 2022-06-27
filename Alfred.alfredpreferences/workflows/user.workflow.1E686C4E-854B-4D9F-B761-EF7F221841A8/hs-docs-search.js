#!/usr/bin/env osascript -l JavaScript
ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";

const workArray = JSON.parse(app.doShellScript('curl -s "https://api.github.com/repos/Hammerspoon/hammerspoon.github.io/git/trees/master?recursive=1"'))
	.tree
	.filter(file => /^docs\/(?!\d)/.test(file.path))
	.map(item => {
		// fill in here
		return {
			"title": item,
			"match": alfredMatcher (item),
			"subtitle": item,
			"type": "file:skipcheck",
			"icon": {
				"type": "fileicon",
				"path": item
			},
			"arg": item,
			"uid": item,
		};
});

JSON.stringify({ items: workArray });

#!/usr/bin/env osascript -l JavaScript
ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";

const workArray = JSON.parse(app.doShellScript('curl -s "https://api.github.com/repos/Hammerspoon/hammerspoon.github.io/git/trees/master?recursive=1"'))
	.tree
	.filter(file => file.path.startsWith("docs/hs"))
	.map(file => {
		const subsite = file.path.slice(5, -5); // remove "/docs" and ".html"
		return {
			"title": subsite,
			"match": alfredMatcher (subsite),
			"arg": subsite,
			"uid": subsite,
		};
	});

JSON.stringify({ items: workArray });

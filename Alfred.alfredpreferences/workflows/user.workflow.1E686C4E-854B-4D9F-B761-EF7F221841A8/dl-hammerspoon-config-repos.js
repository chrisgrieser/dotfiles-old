#!/usr/bin/env osascript -l JavaScript
ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const onlineJSON = (url) => JSON.parse(app.doShellScript("curl -sL '" + url + "'"));

const jsonArray = onlineJSON("https://api.github.com/search/repositories?q=topic:hammerspoon-configuration")
	.items
	.map(repo => {
		html_url
		return {
			"title": repo,
			"subtitle": "",
			"arg": repo,
		};
	});

JSON.stringify({ items: jsonArray });

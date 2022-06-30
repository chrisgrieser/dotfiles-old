#!/usr/bin/env osascript -l JavaScript
ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const onlineJSON = (url) => JSON.parse(app.doShellScript("curl -sL '" + url + "'"));

const dlFolder = "!wd"

const listOfRepos = onlineJSON("https://api.github.com/search/repositories?q=topic:hammerspoon-configuration")
	.items
	.slice(0, 3)
	.map (item => item.html_url)
	.forEach (repo => {

		app.doShellScript('cdgit clone')
	})


JSON.stringify(listOfRepos);

#!/usr/bin/env osascript -l JavaScript
ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const onlineJSON = (url) => JSON.parse(app.doShellScript("curl -sL '" + url + "'"));

const listofRepos = onlineJSON("https://api.github.com/search/repositories?q=topic:hammerspoon-configuration")
	.items
	.map(item => item.full_name)
	.forEach(repo =>{
		luaFiles = onlineJSON()
	})


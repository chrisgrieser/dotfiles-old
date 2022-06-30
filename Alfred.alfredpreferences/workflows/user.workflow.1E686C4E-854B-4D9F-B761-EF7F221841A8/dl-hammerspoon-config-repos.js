#!/usr/bin/env osascript -l JavaScript
ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const onlineJSON = (url) => JSON.parse(app.doShellScript("curl -sL '" + url + "'"));

const listOfLuaFiles = [];

onlineJSON("https://api.github.com/search/repositories?q=topic:hammerspoon-configuration")
	.items[1]
	.forEach(repo => {
		const repoFiles = onlineJSON("https://api.github.com/repos/" + repo.full_name + "/git/trees/" + repo.default_branch + "?recursive=1");
		if (!repoFiles) return;
		repoFiles
			.tree
			.map(item => item.path)
			.filter(file => file.endsWith(".lua"))
			.forEach(luaFile => listOfLuaFiles.push(repo + "/" + luaFile));
		console.log("done one");
	});

JSON.stringify(listOfLuaFiles);


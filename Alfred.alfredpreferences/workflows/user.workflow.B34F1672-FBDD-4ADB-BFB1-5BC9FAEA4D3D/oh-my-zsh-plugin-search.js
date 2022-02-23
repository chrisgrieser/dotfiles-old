#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;

const onlineJSON = (url) => JSON.parse (app.doShellScript("curl -sL \"" + url + "\""));
const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";
const pluginList = onlineJSON("https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins")
	.tree
	.map(p => p.path)
	.filter(p => p.startsWith ("plugins/"))
	.map (p => p.slice(7));


const jsonArray = [];
pluginList.forEach(plugin => {

	jsonArray.push({
		"title": "",
		"match": alfredMatcher (item),
		"subtitle": "",
		"arg": "",
	});
});

JSON.stringify({ items: jsonArray });

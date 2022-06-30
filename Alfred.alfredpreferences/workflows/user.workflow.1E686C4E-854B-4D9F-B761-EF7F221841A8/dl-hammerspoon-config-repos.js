#!/usr/bin/env osascript -l JavaScript
ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const onlineJSON = (url) => JSON.parse(app.doShellScript("curl -sL '" + url + "'"));

const dlFolder = "/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/File Hub/";
app.doShellScript(`mkdir '${dlFolder}'/hs-repos || true`);

let i = 0;
onlineJSON("https://api.github.com/search/repositories?q=topic:hammerspoon-configuration")
	.items
	.forEach (item => {
		const name = item.full_name + i.toString();
		i++;
		app.doShellScript(`cd '${dlFolder}'/hs-repos ; git clone --depth=1 '${item.html_url}' ${name}`);
		console.log(`done: ${name}`);
	});

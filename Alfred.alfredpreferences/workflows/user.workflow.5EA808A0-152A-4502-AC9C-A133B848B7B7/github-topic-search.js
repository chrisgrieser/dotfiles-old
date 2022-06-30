#!/usr/bin/env osascript -l JavaScript
ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const onlineJSON = (url) => JSON.parse(app.doShellScript("curl -sL '" + url + "'"));

const dlFolder = $.getenv("working_folder").replace(/^~/, app.pathTo("home folder"));

try {
	app.doShellScript(`mkdir '${dlFolder}/hs-repos'`);
} catch {}

onlineJSON("https://api.github.com/search/repositories?q=topic:hammerspoon-configuration")
	.items
	.forEach (item => {
		const name = item.full_name.replaceAll("/", "-");
		app.doShellScript(`cd '${dlFolder}'/hs-repos ; git clone --depth=1 '${item.html_url}' ${name}`);
		console.log(`done: ${item.full_name}`);
	});

app.doShellScript(`open '${dlFolder}/hs-repos'`);

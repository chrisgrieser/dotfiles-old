#!/usr/bin/env osascript -l JavaScript

function run(argv){
	ObjC.import("stdlib");
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;
	const onlineJSON = (url) => JSON.parse(app.doShellScript("curl -sL '" + url + "'"));
	const topic = argv.join("");

	const dlFolder = $.getenv("working_folder").replace(/^~/, app.pathTo("home folder")) + "/" + topic;

	try {
		app.doShellScript(`mkdir -p '${dlFolder}'`);
	} catch {}

	console.log("https://api.github.com/search/repositories?q=topic:" + topic);
	onlineJSON("https://api.github.com/search/repositories?q=topic:" + topic)
		.items
		.forEach (item => {
			const name = item.full_name.replaceAll("/", "-");
			app.doShellScript(`cd '${dlFolder}' ; git clone --depth=1 '${item.html_url}' ${name}`);
			console.log(`done: ${item.full_name}`);
		});

	app.doShellScript(`open '${dlFolder}'`);
}

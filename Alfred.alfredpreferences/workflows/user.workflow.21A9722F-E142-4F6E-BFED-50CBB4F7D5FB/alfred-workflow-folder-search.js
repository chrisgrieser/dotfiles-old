#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;

const jsonArray = [];
const foldersArray = app.doShellScript("ls -1 ../").split("\r");

function readPlist (key, path) {
	return app.doShellScript(
		"plutil -extract '" + key
		+ "' xml1 -o - " + path
		+ " | sed -n 4p | cut -d\">\" -f2 | cut -d\"<\" -f1")
		.replaceAll ("&amp;", "&");
}

foldersArray.forEach(folderHash => {
	const workflowPath = "../" + folderHash;
	const workflowName = readPlist("name", workflowPath + "/info.plist");
	const workflowDesc = readPlist("description", workflowPath + "/info.plist");
	const iconpath = workflowPath + "/icon.png";


	jsonArray.push({
		"title": workflowName,
		"subtitle": workflowDesc,
		"arg": workflowPath,
		"uid": folderHash,
		"icon": { "path": iconpath },
		"mods": { "shift": { "arg": folderHash } }
	});
});

JSON.stringify({ items: jsonArray });

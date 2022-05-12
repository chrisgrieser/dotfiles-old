#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
const app = Application.currentApplication();
app.includeStandardAdditions = true;

const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";
const getEnv = (path) => $.getenv(path).replace(/^~/, app.pathTo("home folder"));

const jsonArray = [];
const dotfileFolder = getEnv ("dotfile_folder");
/* eslint-disable no-multi-str, quotes */
const workArray = app.doShellScript (
	'PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH ;\
	cd "' + dotfileFolder + '" ;\
	fd -H -E "PopClip/*" -E "Alfred.alfredpreferences" -E "FileHistory*.json"'
).split("\r");
/* eslint-enable no-multi-str, quotes */

workArray.forEach(file => {
	const fPath = dotfileFolder + file.slice(1);
	const parts = file.split("/");
	const name = parts.pop();
	let parentFolder = parts.pop();
	if (parentFolder === ".") parentFolder = "";
	jsonArray.push({
		"title": name,
		"subtitle": parentFolder,
		"match": alfredMatcher (name),
		"icon": {
			"type": "fileicon",
			"path": fPath
		},
		"arg": fPath,
	});
});

JSON.stringify({ items: jsonArray });

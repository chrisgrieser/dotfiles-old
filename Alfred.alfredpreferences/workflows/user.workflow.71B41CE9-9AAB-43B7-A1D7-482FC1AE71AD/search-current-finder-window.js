#!/usr/bin/env osascript -l JavaScript

function run () {
	ObjC.import("stdlib");
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;
	const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";
	const jsonArray = [];

	const posixPath = (finderWindow) => $.NSURL.alloc.initWithString(finderWindow.target.url()).fileSystemRepresentation;
	const currentFinderWindow = posixPath(Application("Finder").finderWindows[0]);
	if (!currentFinderWindow) {
		jsonArray.push({ "title": "No Finder Window available" });
		return JSON.stringify({ items: jsonArray });
	}

	/* eslint-disable no-multi-str */
	const workArray = app.doShellScript ("export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH ; \
		cd \"" + currentFinderWindow + "\" ; \
		fd --absolute-path --hidden --exclude \"/.git/*\""
	).split("\r");

	if (!workArray.length) {
		jsonArray.push({ "title": "No file in the current Folder found." });
		return JSON.stringify({ items: jsonArray });
	}

	workArray.forEach(fpath => {
		const name = fpath.split("/").pop();
		const relativeParentFolder = fpath.slice(currentFinderWindow.length, -(name.length + 1));

		jsonArray.push({
			"title": name,
			"match": alfredMatcher (name),
			"subtitle": relativeParentFolder,
			"type": "file",
			"icon": {
				"type": "fileicon",
				"path": fpath
			},
			"arg": fpath,
		});
	});

	return JSON.stringify({ items: jsonArray });
}


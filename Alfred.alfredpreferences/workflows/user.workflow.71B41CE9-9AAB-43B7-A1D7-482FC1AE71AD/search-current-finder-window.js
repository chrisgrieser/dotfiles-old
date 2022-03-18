#!/usr/bin/env osascript -l JavaScript

// requires `fd`

function run () {
	ObjC.import("stdlib");
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;
	const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";
	const jsonArray = [];

	let folderToSearch;

	try {
		// Search for Input Folder
		folderToSearch = $.getenv("folder_to_search");
	} catch (error) {
		// Search Finder
		const posixPath = (finderWindow) => $.NSURL.alloc.initWithString(finderWindow.target.url()).fileSystemRepresentation;
		const currentFinderWindow = posixPath(Application("Finder").finderWindows[0]);
		if (currentFinderWindow) folderToSearch = currentFinderWindow;
		else {
			jsonArray.push({ "title": "No Finder Window available" });
			return JSON.stringify({ items: jsonArray });
		}
	}


	/* eslint-disable no-multi-str */
	const repoArray = app.doShellScript ("export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH ; \
		cd \"" + folderToSearch + "\" ; \
		fd --absolute-path --hidden --exclude \"/.git/*\""
	).split("\r");

	if (!repoArray.length) {
		jsonArray.push({ "title": "No file in the current Folder found." });
		return JSON.stringify({ items: jsonArray });
	}

	repoArray.forEach(fpath => {
		const name = fpath.split("/").pop();
		const relativeParentFolder = fpath.slice(folderToSearch.length, -(name.length + 1));

		const fIcon = {
			"type": "fileicon",
			"path": fpath
		};
		if (fpath.endsWith(".png")) delete fIcon.type;

		jsonArray.push({
			"title": name,
			"match": alfredMatcher (name),
			"subtitle": relativeParentFolder,
			"type": "file",
			"icon": fIcon,
			"arg": fpath,
			"uid": fpath,
		});
	});

	return JSON.stringify({ items: jsonArray });
}


#!/usr/bin/env osascript -l JavaScript

function run(input) {
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;

	const obsidianJsonFilePath = app.pathTo("home folder") + "/Library/Application Support/obsidian/obsidian.json";
	const vaults = JSON.parse(app.read(obsidianJsonFilePath)).vaults;

	let openInObsi = false;
	const toOpen = [];
	const pathArray = input.toString().split(",");

	// if Obsi is frontmost, open in other app,
	// to allow compatibility with "Open with Default app" core plugin
	const obsidianIsFrontmost = Application("Obsidian").frontmost();
	if (obsidianIsFrontmost) return ["false", ...pathArray ]

	pathArray.forEach(filePath => {
		const isFileInObsidianVault = Object.values(vaults).some(v => filePath.startsWith(v.path));
		if (isFileInObsidianVault && !filePath.includes("/.")) { // second condition prevents the opening of files in .obsidian or .trash
			toOpen.push("obsidian://open?path=" + encodeURIComponent(filePath));
			openInObsi = true;
		}
		else toOpen.push(filePath);
	});

	return [openInObsi.toString(), ...toOpen];

}

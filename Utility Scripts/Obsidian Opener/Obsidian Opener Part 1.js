#!/usr/bin/env osascript -l JavaScript

function run(input) {
	// config
	const markdownApp = "Sublime Text";

	// -----------------------
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;

	const obsidianJsonFilePath = app.pathTo("home folder") + "/Library/Application Support/obsidian/obsidian.json";
	const vaults = JSON.parse(app.read(obsidianJsonFilePath)).vaults;

	let openInObsi = false;
	const toOpen = [];
	const pathArray = input.toString().split(",");

	const isFileInObsidianVault = Object.values(vaults)
		.some(v => pathArray[0].startsWith(v.path));
	// if Obsi is frontmost, open in other app, to allow compatibility
	// with "Open with Default app" core plugin
	const obsidianIsFrontmost = Application("Obsidian").frontmost();
	// relevant for '.obsidian' and '.trash'
	const isInHiddenFolder = pathArray[0].includes("/.");

	// eslint-disable-next-line curly
	if (isFileInObsidianVault && !isInHiddenFolder && !obsidianIsFrontmost) {
		app.openLocation ("obsidian://open?path=" + encodeURIComponent(pathArray[0]));
	} else {
		app.doShellScript ("open -a '" + markdownApp + pathArray.join(" "))
	}
}

#!/usr/bin/env osascript -l JavaScript
function run (argv) {
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;
	const clipboardText = app.theClipboard();

	let filePath = argv.join("")
		.replace (/\n$/, "")
		.replace (/\/Users\/.*?\//, "~/");

	if (filePath === clipboardText) {
		filePath = "\"" + filePath + "\"";
		filePath = filePath.replace("\"~", "~\"");
	}

	app.setTheClipboardTo(filePath);
	return filePath;
}

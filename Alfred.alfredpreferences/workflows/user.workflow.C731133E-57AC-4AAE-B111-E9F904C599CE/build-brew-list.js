#!/usr/bin/env osascript -l JavaScript
function run() {
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;

	// read local homebrew files
	const casks = app.doShellScript("ls \"/opt/homebrew/Library/Taps/homebrew/homebrew-cask/Casks/\" | sed -E \"s/.rb$/ --cask/\"");
	const formulae = app.doShellScript("ls \"/opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula\" | sed -E \"s/.rb$/ --formula/\"");
	const searchResults = (casks + formulae).split("\r");

	// build JSON
	const resultsArray = [];
	searchResults.forEach((element) => {
		const resultName = element.split(" --")[0];
		const resultType = element.split(" --")[1];
		const command = element;
		const betterMatching = resultName.replaceAll ("-", " ") + " " + resultName;

		resultsArray.push({
			"title": resultName,
			"subtitle": resultType,
			"arg": command,
			"match": betterMatching,
			"mods": { "cmd": { "arg": resultName } },
		});
	});

	return JSON.stringify({ items: resultsArray });
}

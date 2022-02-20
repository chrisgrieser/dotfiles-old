#!/usr/bin/env osascript -l JavaScript
function run(argv) {
	const app = Application.currentApplication();
	app.includeStandardAdditions = true;
	function jsGrep(array, togrep) {
		return array.filter((element) => element.includes(togrep));
	}

	// read query
	const query = argv.join(" ");

	// read local homebrew files
	const casks = app.doShellScript(
		"ls -1 \"/opt/homebrew/Library/Taps/homebrew/homebrew-cask/Casks/\" | sed -E \"s/.rb$/ --cask/\""
	);
	const formulae = app.doShellScript(
		"ls -1 \"/opt/homebrew/Library/Taps/homebrew/homebrew-core/Formula\" | sed -E \"s/.rb$/ --formula/\""
	);
	const searchresults = (casks + formulae).split("\r");

	// grep only query
	const searchResults = jsGrep(searchresults, query);

	// build JSON
	const resultsArray = [];
	searchResults.forEach((element) => {
		const resultName = element.replace(/(.*) --.*/, "$1");
		const resultType = element.replace(/.* --(.*)/, "$1");
		const command = element;
		const betterMatching = resultName.replaceAll ("-", " ") + " " + resultName;

		resultsArray.push({
			title: resultName,
			subtitle: resultType,
			arg: command,
			match: betterMatching,
			mods: {cmd: {arg: resultName}},
		});
	});

	return JSON.stringify({ items: resultsArray });
}

#!/usr/bin/env osascript -l JavaScript
// requires 'fd' cli

// -----------------------
ObjC.import("stdlib");
ObjC.import("Foundation");
const app = Application.currentApplication();
app.includeStandardAdditions = true;
const home = app.pathTo("home folder");
const finderApp = Application("Finder");
// ---------------------------------------------

const pathsToSearch = [
	$.getenv("alfred_preferences"),
	$.getenv("working_folder").replace("~", home),
	home + "/Library/Mobile Documents/iCloud~md~obsidian/Documents/Development",
	home + "/Library/Mobile Documents/com~apple~CloudDocs/Dokumente/Code",
	home + "/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs"
];

// ---------------------------------------------

const alfredMatcher = (str) => str.replace (/[-()_.]/g, " ") + " " + str + " ";

function readPlist (key, path) {
	return app.doShellScript(
		"plutil -extract " + key
		+ " xml1 -o - '" + path
		+ "' | sed -n 4p | cut -d\">\" -f2 | cut -d\"<\" -f1")
		.replaceAll ("&amp;", "&");
}

function readFile (path, encoding) {
	if (!encoding) encoding = $.NSUTF8StringEncoding;
	const fm = $.NSFileManager.defaultManager;
	const data = fm.contentsAtPath(path);
	const str = $.NSString.alloc.initWithDataEncoding(data, encoding);
	return ObjC.unwrap(str);
}

const jsonArray = [];
let pathString = "";
pathsToSearch.forEach(path => { pathString += "\"" + path + "\" " });
const workArray = app.doShellScript("export PATH=/usr/local/bin/:/opt/homebrew/bin/:$PATH ; fd '\\.git$' --no-ignore --hidden " + pathString)
	.split("\r");

workArray.forEach(item => {
	const repoPath = item.slice(0, -5);
	let repoName;
	let iconpath;
	const isAlfredWorkflow = finderApp.exists(Path(repoPath + "/info.plist"));
	const isObsiPlugin = finderApp.exists(Path(repoPath + "/manifest.json"));

	// Alfred Workflow Repos
	if (isAlfredWorkflow) {
		repoName = readPlist("name", repoPath + "/info.plist");
		iconpath = "alfred.png";

	// Obsidian Plugin Repos
	} else if (isObsiPlugin) {
		const manifest = readFile(repoPath + "/manifest.json");
		repoName = JSON.parse(manifest).name;
		iconpath = "obsidian.png";
	}

	// Other Repos
	else {
		const readme = readFile(repoPath + "/README.md");
		if (readme) {
			repoName = readme
				.split("\n")
				.filter(line => line.startsWith("# "))[0]
				.slice(2);
		}
		else repoName = repoPath;
	}

	jsonArray.push({
		"title": repoName,
		"match": alfredMatcher (repoName),
		"icon": { "path": iconpath },
		"arg": repoPath,
		"uid": repoPath,
	});
});

JSON.stringify({ items: jsonArray });

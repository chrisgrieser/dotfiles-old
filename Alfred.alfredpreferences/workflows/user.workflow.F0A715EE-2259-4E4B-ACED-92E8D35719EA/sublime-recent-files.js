#!/usr/bin/env osascript -l JavaScript
const app = Application.currentApplication();
app.includeStandardAdditions = true;

ObjC.import("Foundation");
function readFile (path, encoding) {
	if (!encoding) encoding = $.NSUTF8StringEncoding;
	const fm = $.NSFileManager.defaultManager;
	const data = fm.contentsAtPath(path);
	const str = $.NSString.alloc.initWithDataEncoding(data, encoding);
	return ObjC.unwrap(str);
}

const sessionFile = "~/Library/Application Support/Sublime Text/Local/Session.sublime_session"
	.replace(/^~/, app.pathTo("home folder"));


const recentFilesArray = JSON.parse(readFile(sessionFile)).windows.file_history;


const workArray = recentFilesArray
	.map(filePath => {
		const name = filePath.split("/").pop();
		return {
			"title": name,
			"subtitle": filePath,
			"arg": filePath
		};
	});

JSON.stringify({ "items": workArray });


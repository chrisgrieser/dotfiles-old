#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
app = Application.currentApplication();
app.includeStandardAdditions = true;
const homepath = app.pathTo("home folder");

var meme_folder = $.getenv("meme_folder").replace(/^~/, homepath);

const work_array =
	app.doShellScript('find "' + meme_folder + '" -not -name "Memes" -not -name ".DS_Store" ')
	.split("\r");

let jsonArray = [];
work_array.forEach(icon_path => {
	let filename = icon_path.replace (/.*\/(.*)\.\w+/,"$1");
	let file_extension = icon_path.replace (/.*\/.*\.(\w+)/,"$1");
	file_extension = file_extension.toLowerCase();
	jsonArray.push({
		'title': filename,
		'subtitle': file_extension,
		'arg': icon_path,
		'icon': {'path': icon_path},
		'type': 'file:skipcheck',
		'uid': icon_path,
	});
});


JSON.stringify({ items: jsonArray });

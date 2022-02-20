#!/usr/bin/env osascript -l JavaScript

ObjC.import("stdlib");
ObjC.import('Foundation');
app = Application.currentApplication();
app.includeStandardAdditions = true;

const readFile = function (path, encoding) {
    !encoding && (encoding = $.NSUTF8StringEncoding);
    const fm = $.NSFileManager.defaultManager;
    const data = fm.contentsAtPath(path);
    const str = $.NSString.alloc.initWithDataEncoding(data, encoding);
    return ObjC.unwrap(str);
};

let jsonArray = [];
const ascii_array =
	readFile('asciis.csv')
	.split("\n")
	.filter(line => line.trim() != "")
	.map (line => [
	   line.split(";")[0],
	   line.split(";")[1].trim(),
	]);

ascii_array.forEach(item => {
	let ascii = item[0];
	let keywords = item[1];
	let iconpath = "";

	jsonArray.push({
		'title': ascii,
		'match': keywords,
		'subtitle': keywords,
		'uid': ascii,
		'arg': ascii,
	});
});

JSON.stringify({ items: jsonArray });

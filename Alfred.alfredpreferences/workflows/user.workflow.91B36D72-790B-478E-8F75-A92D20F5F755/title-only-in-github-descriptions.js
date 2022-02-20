#!/usr/bin/env osascript -l JavaScript

function run (argv){
	var input = argv.join("");

	input = input.replace (/\[GitHub - .*?\/(.*?):.*\]/g, function (gh_descriptions){
		let gh_title = gh_descriptions.replace (/\[GitHub - .*?\/(.*?):.*\]/g, "$1");
		gh_title = gh_title
			.replaceAll ("--","–")
			.replaceAll ("-", " ");
		let titleCased = gh_title.replace (/\w\S*/g, function (word){
			if (word.length > 3) return word.charAt(0).toUpperCase() + word.substr(1).toLowerCase();
			return word.toLowerCase();
		});
		return "[" + titleCased + "]";
	});

	input = input.replace (/\[.* · GitHub\]/g, function (gh_descriptions){
		let gh_title = gh_descriptions.replace (/\[(.*?) at \w+ · .*? · GitHub\]/g, "$1");
		gh_title = gh_title
			.replaceAll ("--","–")
			.replaceAll ("-", " ");
		let titleCased = gh_title.replace (/\w\S*/g, function (word){
			if (word.length > 3) return word.charAt(0).toUpperCase() + word.substr(1).toLowerCase();
			return word.toLowerCase();
		});
		return "[" + titleCased + "]";
	});


	return input;
}

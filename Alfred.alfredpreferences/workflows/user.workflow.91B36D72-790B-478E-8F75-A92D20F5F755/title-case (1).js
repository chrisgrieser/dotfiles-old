#!/usr/bin/env osascript -l JavaScript

function run (argv){
	var input = argv.join("");

	function toTitleCase(str) {
		// capitalize everything, except words with 3 or less characters
		// if its an "I", capitalize it and if its a "with", lowercase it
	   let titleCased = str.replace(/\w\S*/g, function(word){
			if (word.match(/with/i) != null) return "with";
			if (word.match(/without/i) != null) return "without";
			if (word == "i" || word == "I") return "I";
			if (word.length < 4)	return word.toLowerCase();
			return (word.charAt(0).toUpperCase() + word.substr(1).toLowerCase());
	   });

	   // Capitalize the beginning of a sentence,
	   // or the first letter after a markdown heading
	   titleCased = titleCased.replace (/[^#]*?(\n|\.|$)/g, function(sentence){
	   	if (sentence.charAt(0) == " ") return (" " + sentence.charAt(1).toUpperCase() + sentence.substr(2));
			return (sentence.charAt(0).toUpperCase() + sentence.substr(1));
	   });
	   return titleCased;
	};

	return toTitleCase(input);
}


#!/usr/bin/env osascript -l JavaScript

function run (argv){
	//input from Alfred
	textToCheck = argv.join("");

	//match all numbers in text
	let digitMatches = textToCheck.match(/-?\d+(?:[,|\.]\d+)?/gm);

	//addition of all numbers
	var sum = 0;
	var commaAsSep = false;
	digitMatches.forEach(numberAsString => {
		let numberToAdd = parseFloat (numberAsString);
		if (numberAsString.includes (",")){
			commaAsSep = true;
			numberToAdd = parseFloat (numberAsString.replace (",","."));
		}
		sum = sum + numberToAdd;
	});

	// Stringify sum, using "," as seperator when it was used
	let sum_string = String(sum);
	if (commaAsSep == true){
		sum_string = sum_string.replace (".",",");
	}

	return sum_string
}


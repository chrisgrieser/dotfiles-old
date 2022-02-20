#!/usr/bin/env osascript -l JavaScript

function run (argv){
	var input = argv.join("");

	String.prototype.toTitleCase = function () {
		const smallWords = new RegExp(/(?:an?d?|a[st]|because|but|by|en|for|i[fn]|neither|nor|o[fnr]|only|over|per|so|some|tha[tn]|the|to|up|upon|vs?\.?|versus|via|when|with|without|yet)/, 'i');
	   let capitalized = this.replace(/\w\S*/g, function(word){
			if (word.match(smallWords) != null){
				return word.toLowerCase();
			} else if (word == "i" || word == "I"){
				return "I";
			} else if (word.length < 3){
				return word.toLowerCase();
			}  else {
				return word.charAt(0).toUpperCase() + word.substr(1).toLowerCase();
			}
	   });

	   // Capitalize the beginning of a sentence,
	   // or the first letter after a markdown heading
	   capitalized = capitalized.replace (/[^#]*?(\n|\.|$)/g, function(sentence){
	   	if (sentence.charAt(0) == " "){
				return " " + sentence.charAt(1).toUpperCase() + sentence.substr(2);
	   	} else {
				return sentence.charAt(0).toUpperCase() + sentence.substr(1);
	   	}
	   });
	   return capitalized;
	};

	return input.toTitleCase();
}


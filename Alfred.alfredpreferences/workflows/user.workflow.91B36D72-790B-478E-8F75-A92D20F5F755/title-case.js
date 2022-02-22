#!/usr/bin/env osascript -l JavaScript

function run (argv) {
	const input = argv.join("");

	String.prototype.toTitleCase = function () {
		const smallWords = /(?:an?d?|a[st]|because|but|by|en|for|i[fn]|neither|nor|o[fnr]|only|over|per|so|some|tha[tn]|the|to|up|upon|vs?\.?|versus|via|when|with|without|yet)/i;
		let capitalized = this.replace(/\w\S*/g, function(word) {
			if (smallWords.test(word)) return word.toLowerCase();
			if (word.toLowerCase() === "i") return "I";
			if (word.length < 3) return word.toLowerCase();
			return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
		});

		// Capitalize the beginning of a sentence,
		// or the first letter after a markdown heading
		capitalized = capitalized.replace (/[^#]*?(\n|\.|$)/g, function(sentence) {
			if (sentence.charAt(0) === " ")
				return " " + sentence.charAt(1).toUpperCase() + sentence.slice(2);

			return sentence.charAt(0).toUpperCase() + sentence.slice(1);

		});
		return capitalized;
	};

	return input.toTitleCase();
}


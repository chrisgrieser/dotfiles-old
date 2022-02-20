#!/usr/bin/env osascript -l JavaScript

function run (argv){
	var input = argv.join("");

	String.prototype.toSpongebobCase = function () {
		let output = "";
		for (let i = 0; i < this.length; i++) {
			if (Math.random() < 0.5){
				output += this.charAt(i).toUpperCase();
			} else {
				output += this.charAt(i).toLowerCase();
			}
		}
		return output;
	};

	return input.toSpongebobCase();
}
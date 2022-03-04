#!/usr/bin/env osascript -l JavaScript
function run (argv) {

	function toIndentedCodeBlock_multiple (text) {
		const fencedCodeRegex = /```.*?\n(.*?)\n```/gs;

		function toIndentedCodeBlock (fencedCodeBlock) {
			return fencedCodeBlock
				.replace(fencedCodeRegex, "$1")
				.replace(/(.*)/gm, "\t$1");
		}

		if (!fencedCodeRegex.test(text)) return text;
		return text.replace(fencedCodeRegex, toIndentedCodeBlock)
	}

	return toIndentedCodeBlock_multiple(argv.join(""));
}


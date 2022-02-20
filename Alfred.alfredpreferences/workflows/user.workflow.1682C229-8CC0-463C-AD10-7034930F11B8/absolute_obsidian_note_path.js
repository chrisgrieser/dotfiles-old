#!/usr/bin/env osascript -l JavaScript
function run (){
	ObjC.import('stdlib');
	Obsidian = Application("/Applications/Obsidian.app");
	Obsidian.includeStandardAdditions = true;
	const homepath = Obsidian.pathTo('home folder');

	//get vault path
	var vault_path = $.getenv('vault_path');
	vault_path = vault_path.replace(/^~/, homepath);

	// get vault-relative file path
	Obsidian.openLocation("obsidian://advanced-uri?commandid=workspace%253Acopy-path");

	// Short pause, to make sure the path has been copied to the clipboard
	delay (0.1)
	return (vault_path + "/" + Obsidian.theClipboard() );
}

#!/usr/bin/env osascript -l JavaScript

function run(argv) {
	const pwlength = parseInt(argv.join(""));
   const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
   const charactersLength = characters.length;

   var result = '';
   for ( var i = 0; i < pwlength; i++ ) {
      result += characters.charAt(Math.floor(Math.random() * characters.length));
   }
   return result;
}

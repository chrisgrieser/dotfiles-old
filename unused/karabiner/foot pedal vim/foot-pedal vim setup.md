## Default (OSX).sublime-keymap
	// Footpedal
	{
		"keys": ["delete"],
		"command": "nv_feed_key",
		"args": {"key": "<esc>"},
		"context": [
			{"key": "vi_insert_mode_aware"},
			{ "key": "auto_complete_visible", "operator": "not_equal", "operand":  true }
		]
	},

## Karabiner
/Users/chrisgrieser/Library/Mobile Documents/com~apple~CloudDocs/Dotfolder/Configs/.config/karabiner/assets/complex_modifications/foot-pedal.json

## obsidianvimrc
""""""""""""""""""""""
" < Footpedal
""""""""""""""""""""""
" Karabiner maps pedal to <Del>
nmap <Del> i
vmap <Del> <Esc>
imap <Del> <Esc>
rmap <Del> <Esc>

## neovintageousrc
""""""""""""""""""""""
" < Footpedal
""""""""""""""""""""""
" Karabiner maps pedal to <Del>
nnoremap <Del> i
vnoremap <Del> <Esc>
" switches from insert to normal mode via binding in "Default (OSX).sublime-keymap"

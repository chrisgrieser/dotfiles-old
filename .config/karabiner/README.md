# Karabiner: Complex Modifications

To install the rule on your Mac, install [Karabiner Elements](https://karabiner-elements.pqrs.org/), and simply open respective following URL in your browser.

## Table of Contents
<!-- MarkdownTOC -->

- [Capslock to Hyper / Esc](#capslock-to-hyper--esc)
- [Vim Utilities](#vim-utilities)
- [Mouse Click Trickery](#mouse-click-trickery)
- [Shift Utilities](#shift-utilities)
- [Fn App-Switcher](#fn-app-switcher)
- [Miscellaneous](#miscellaneous)

<!-- /MarkdownTOC -->

## Capslock to Hyper / Esc
- This rule turns capslock into `⌘⌥⇧⌃`, the so called [Hyper Key](https://holmberg.io/hyper-key/). The Hyper Key can be used as a fifth modifier key.
- If pressed alone, capslock will become `Esc`, which is convenient for vim users. 

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/capslock-to-hyper-esc.json
```

## Vim Utilities
- Modifies `alt + 5/6/8/9/l/n or ^` from the German layout so that it sends `[]{}@~^` the US layout. 
	- This enables the use of those keys for vim, e.g. for `dt]` or `@`, without ever switching keyboard layout. 
	- When sending `~^`, they also stop awaiting another character and for example transforming `^a` into `â`, similar to the [One Stroke \`´ Mod](#miscellaneous).
- `Hyper + hjkl` is turned to Arrow Keys for global vim-like navigation (requires Capslock to Hyper Key).
- Scroll up/down globally via `alt+j/k`.
- Press `k` and `l` "simultaneously" to send an `enter`.
- Focus window & hide cursor[^2] by tapping `alt-left`. Useful to focus the frontmost app, after another app's window has been closed, e.g. closing the last finder window; and for vim emulators that cannot properly hide the cursor, like e.g. Vimium.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/vim-utilities.json
```

## Mouse Click Trickery
- Middle click to close an app (`cmd + q`) (except for Finder).
- Tapping the Right Mouse Button in a browser[^3] to open link in background. Press with any modifier key for a normal right click. Is triggered only when briefly tapping so that mouse gestures aren't affected. (This rule essentially emulates the [Right Click Open Link Chrome Extensions](https://chrome.google.com/webstore/detail/right-click-opens-link-ne/mhjkeimpgjokbjmioglhlngefbddppnn) extension.)
- Briefly Holding Mouse Button 4 will search for the selected text (or open the url, if a link is selected), tapping will send `F13` (for app-specific automations).

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/mouse-click-trickery.json
```

## Shift Utilities
- `shift-backspace` to delete forwards. 
- Tap `right-shift` alone to search the selected text / open the selected URL.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/shift-utilities.json
```

## Fn App-Switcher
`fn + {letter}` launches/switches to a pre-defined app
- `fn + c` → `C`alendar → BusyCal
- `fn + b` → `B`rowser → Brave Browser
- `fn + o` → `O`bsidian
- `fn + d` → `D`iscord
- `fn + s` → `S`lack
- `fn + r` → `D`rafts
- `fn + f` → `F`inder (with a default folder)
- `fn + r` → D`r`afts
- `fn + e` → `E`ditor → Sublime Text
- `fn + y`[^1] → `Y`ouTube
- `fn + z`[^1] → `Z`oom
- `fn + p` → `P`DF Reader → Highlights
- `fn + i` → `I`noreader
- `fn + m` → `M`ail → Mimestream
- `fn + g` → `G`oogle Docs
- `fn + w` → Microsoft `W`ord
- `fn + a` → `A`lfred Preferences
- `fn + t` → Better`T`ouchTool
- `fn + k` → `K`arabiner Elements
- `fn + shift + k` → `K`arabiner EventViewer

Since pressing `fn` interferes with the built-in macOS emoji insertion key, it needs to be disabled (`System Preferences → Keyboard → "Press 🌐 to" → "Do Nothing"`) . 

If you still want to use the `fn` key to open the emoji insertion modal, you can simply activate the second rule which does exactly that when `fn` is pressed alone.

## Miscellaneous
- **One Stroke \`´ (German Layout)**: Simply makes those characters appear directly, without awaiting another character like `a`, in which case it gets (mostly wrongly) turned into `àá`. (Note that the way this is done, they aren't received properly by vim anymore.)
	- Although the same also applies for `^~`, they are not implemented here, since they are solved by the respective [Vim Utilities Mod](#vim-utilities).
- Spacebar Hack (Obsidian/Sublime) transforms `fn + space` to `f19` and `opt + space` to `f18`, to be able to assign them as bindings in a .vimrc.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://github.com/chrisgrieser/dotfiles/blob/main/.config/karabiner/assets/complex_modifications/one-stroke-characters.json
```

The keys and apps in the JSON can be edited however wanted.

[^1]: On non-German keyboards, `y` and `z` are switched, so the key codes are the other way round.
[^2]: Technically speaking, moves it slightly above to the bottom right (not complete bottom right to avoid triggering the Dock). 
[^3]: Currently supported: Safari, Brave, Chromium, Vivaldi, and Chrome

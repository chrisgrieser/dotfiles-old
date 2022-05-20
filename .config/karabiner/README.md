# Karabiner: Complex Modifications

To install the rule on your Mac, install [Karabiner Elements](https://karabiner-elements.pqrs.org/), and simply open respective following URL in your browser.

## Table of Contents
<!-- MarkdownTOC -->

- [Capslock to Hyper / Esc](#capslock-to-hyper--esc)
- [Vim Utilities](#vim-utilities)
- [Mouse Click Trickery](#mouse-click-trickery)
- [Shift Utilities](#shift-utilities)
- [Fn Leader](#fn-leader)
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
	- This enables the use of those keys for vim, e.g. for `dt]` or `@`, without needing to switching keyboard layout. 
	- When sending `~^`, they also stop awaiting another character and for example transforming `^a` into `â`, similar to the [One Stroke \`´ Mod](#miscellaneous).
- `Hyper + hjkl` is turned to Arrow Keys for global vim-like navigation (requires Capslock to Hyper Key).
- Scroll up/down globally via `alt+j/k`.
- Tap `right-cmd` to send an `enter`.
- Press `kl` simultaneously to send an `enter`.
- Pressing `j` in the Browser[^3] hides the cursor. This is useful for vim emulators for browsers, [which cannot hide the cursor by themselves](https://github.com/philc/vimium/issues/3273).
- Focus window & hide cursor[^2] by tapping `right-alt`. Useful to focus the frontmost app, after another app's window has been closed, e.g. closing the last finder window; and for vim emulators that cannot properly hide the cursor, like e.g. Vimium.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/vim-utilities.json
```

## Mouse Click Trickery
- Middle click to close an app (`cmd + q`) (except for Finder).
- Tapping the Right Mouse Button in a browser[^3] to open link in background. Press with any modifier key for a normal right click. Is triggered only when briefly tapping so that mouse gestures aren't affected. (This rule essentially emulates the [Right Click Open Link Chrome Extensions](https://chrome.google.com/webstore/detail/right-click-opens-link-ne/mhjkeimpgjokbjmioglhlngefbddppnn) extension.)
- Briefly Holding Mouse Button 4 will search for the selected text (or open the url, if a link is selected), tapping will send `F13` (for app-specific automations).
- Briefly Holding Mouse Button 5 will look up the word under the cursor in the macOS dictionary, tapping will send `F16` (for app-specific automations).
	- useful to use with this: [Terminology](https://agiletortoise.com/terminology/) 

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/mouse-click-trickery.json
```

## Shift Utilities
- `shift-backspace` to delete forwards. 
- Tap `right-shift` alone to search the selected text / open the selected URL.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/shift-utilities.json
```

## Fn Leader
`fn` activates the leader key. The key following it launches/switches the following apps
- `c` → `C`alendar → BusyCal
- `b` → `B`rowser → Brave Browser
- `o` → `O`bsidian
- `d` → `D`iscord
- `s` → `S`lack
- `r` → `D`rafts
- `f` → `F`inder (with a default folder)
- `r` → D`r`afts
- `e` → `E`ditor → Sublime Text
- `y`[^1] → `Y`ouTube
- `z`[^1] → `Z`oom
- `p` → `P`DF Reader → Highlights
- `i` → `I`noreader
- `m` → `M`ail → Mimestream
- `g` → `G`oogle Docs
- `w` → Microsoft `W`ord
- `a` → `A`lfred Preferences
- `v` → `V`ideo → `V`LC Player
- `t` → `T`witter → `T`witterific
- `k` → `K`arabiner Elements
- `shift + k` → `K`arabiner EventViewer
- `fn` (= 2x `fn`) → Emoji Insertion Modal

## Miscellaneous
- **One Stroke \`´ (German Layout)**: Simply makes those characters appear directly, without awaiting another character like `a`, in which case it gets (mostly wrongly) turned into `àá`. (Note that the way this is done, they aren't received properly by vim anymore.)
	- Although the same also applies for `^~`, they are not implemented here, since they are solved by the respective [Vim Utilities Mod](#vim-utilities).
- Spacebar Hack (Obsidian/Sublime) transforms `fn + space` to `<PageUp>` and `opt + space` to `<PageDown>`, to be able to assign them as bindings in a .vimrc.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://github.com/chrisgrieser/dotfiles/blob/main/.config/karabiner/assets/complex_modifications/one-stroke-characters.json
```

The keys and apps in the JSON can be edited however wanted.

[^1]: On non-German keyboards, `y` and `z` are switched, so the key codes are the other way round.
[^2]: Technically speaking, moves it slightly above to the bottom right (not complete bottom right to avoid triggering the Dock). 
[^3]: Currently supported: Safari, Brave, Chromium, Vivaldi, and Chrome

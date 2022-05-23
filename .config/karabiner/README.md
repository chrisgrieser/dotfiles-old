# Karabiner: Complex Modifications

To install the rule on your Mac, install [Karabiner Elements](https://karabiner-elements.pqrs.org/), and simply open respective following URL in your browser.

## Table of Contents
<!-- MarkdownTOC -->

- [Capslock to Hyper / Esc](#capslock-to-hyper--esc)
- [Vim Utilities](#vim-utilities)
- [Mouse Click Trickery](#mouse-click-trickery)
- [Global Leader Key](#global-leader-key)
- [Vim Mode](#vim-mode)
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
	- Works in Alacritty, Terminal, Sublime & Obsidian.
- `Hyper + hjklmn` is turned to Arrow Keys/return/backspace for temporary global vim-like navigation (requires Capslock to Hyper Key).
- Scroll up/down globally via `alt+j/k`.
- Press `kl` simultaneously to send an `enter`.
- Pressing `j` or `k` in the Browser[^3] hides the cursor. This is useful for vim emulators for browsers, [which cannot hide the cursor by themselves](https://github.com/philc/vimium/issues/3273).
- Focus window & hide cursor[^2] by tapping `right-cmd`. Useful to focus the frontmost app, after another app's window has been closed, e.g. closing the last finder window; and for vim emulators that cannot properly hide the cursor, like e.g. Vimium.
- Spacebar Hack (Obsidian/Sublime): transforms `opt + space` to `<Home>`, to be able to assign them as bindings in a .vimrc.

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

## Global Leader Key
The most bottom-left key is the leader, `fn` on Apple Keyboards and `left-control` on other keyboards (and foot pedals).The key following it launches/switches the following apps:
- `leader` (= 2x leader) → `F19`
- `Esc` → Cancel leader key sequence
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
- `shift + b` → `B`etterTouchTool
- `shift + p` → `P`assword Manager → MacPass
- `.`/`:` → Emoji Insertion Modal
- `,`/ → System Preferences

## Vim Mode
- A global Vim Mode for every text field in macOS.
- Triggered via tapping `left-shift`, canceled via tapping `left-shift` again, or with `i`/`Esc`/`Capslock`.
- Supported Actions: `hjklHJKLebG` & `xCDi<Esc>` 
- Non-standard supported action: `<Space>` for `ciw` and `<S-Space>` for `daw`.

## Miscellaneous
- **One Stroke ´^~\` (German Layout)**: Simply makes those characters appear directly, without awaiting another character like `a`, in which case it gets (mostly wrongly) turned into `àá`. (Note that the way this is done, they aren't received properly by vim anymore.)
- `shift-backspace` to delete forwards. 
- Tap `right-shift` alone to search the selected text / open the selected URL.
- Minor improvements to speed up [MacPass](https://macpassapp.org/).

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://github.com/chrisgrieser/dotfiles/blob/main/.config/karabiner/assets/complex_modifications/one-stroke-characters.json
```

The keys and apps in the JSON can be edited however wanted.

[^1]: On non-German keyboards, `y` and `z` are switched, so the key codes are the other way round.
[^2]: Technically speaking, moves it slightly above to the bottom right (not complete bottom right to avoid triggering the Dock). 
[^3]: Currently supported: Safari, Brave, Chromium, Vivaldi, and Chrome

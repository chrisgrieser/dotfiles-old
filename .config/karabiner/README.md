# Karabiner: Complex Modifications

To install the rule on your Mac, install [Karabiner Elements](https://karabiner-elements.pqrs.org/), and simply the open respective URL in your browser.

## Table of Contents
<!-- MarkdownTOC -->

- [Caps Lock to Hyper / Esc](#caps-lock-to-hyper--esc)
- [Vim Utilities](#vim-utilities)
- [Mouse Click Trickery](#mouse-click-trickery)
- [Global Leader Key](#global-leader-key)
- [Vim Mode](#vim-mode)
- [Miscellaneous](#miscellaneous)

<!-- /MarkdownTOC -->

## Caps Lock to Hyper / Esc
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
- Press `kl` or `fj` simultaneously to send an `enter`.
- Pressing `j` or `k` in the Browser[^3] hides the cursor. This is useful for vim emulators for browsers, [which cannot hide the cursor by themselves](https://github.com/philc/vimium/issues/3273).
- Focus window & hide cursor[^2] by tapping `right-cmd`. Useful to focus the frontmost app, after another app's window has been closed, e.g. closing the last finder window; and for vim emulators that cannot properly hide the cursor, like e.g. Vimium.
- Spacebar Hack (Obsidian/Sublime): transforms `opt + space` to `<Home>`, to be able to assign them as bindings in a .vimrc.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/vim-utilities.json
```

## Mouse Click Trickery
- Middle click to close an app (`cmd + q`) (except for Finder).
- Tapping the Right Mouse Button in a browser[^3] to open link in background. Press with any modifier key for a normal right click. Is triggered only when briefly tapping so that mouse gestures aren't affected. (This rule essentially emulates the [Right Click Open Link Chrome Extensions](https://chrome.google.com/webstore/detail/right-click-opens-link-ne/mhjkeimpgjokbjmioglhlngefbddppnn) extension.)
- Holding Mouse Button 4 will search for the selected text (or open the url, if a link is selected), tapping will send `F13` (for app-specific automations).
- Holding Mouse Button 5 will open [Charmstone](https://charmstone.app/), tapping will send `F16` (for app-specific automations).
- Mouse Button 6 looks up the word under the cursor in the macOS dictionary. Useful to use with this: [Terminology](https://agiletortoise.com/terminology/) 

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/mouse-click-trickery.json
```

## Global Leader Key
The most bottom-left key is the leader, `fn` on Apple Keyboards and `left-control` on other keyboards (and foot pedals).The key following it launches/switches the following apps:
- `leader` (= 2x leader) → `F19` (for other automations)
- `Esc` → Cancel leader key sequence
- `c` → `C`alendar → BusyCal
- `b` → `B`rowser → Brave Browser
- `o` → `O`bsidian
- `d` → `D`iscord
- `s` → `S`lack
- `l` → Default `L`ocation in Finder
- `r` → D`r`afts
- `e` → `E`ditor → Sublime Text
- `y`[^1] → `Y`ouTube (PWA)
- `z`[^1] → `Z`oom
- `p` → `P`DF Reader → Highlights
- `i` → `I`noreader (PWA)
- `m` → `M`ail → Mimestream
- `g` → `G`oogle Docs (PWA)
- `a` → `A`lfred Preferences
- `v` → `V`ideo → `V`LC Player
- `ö`[^1] → Twitter (`ö` looks like the Twitterific Logo)
- `k` → `K`arabiner Elements
- `w` → `W`hatsApp (in the Browser)
- `t` → `T`elegram (in the Browser)
- `f` → `F`acebook Messenger (in the Browser)
- `x` → Password Manager: `xxx` → MacPass
- `⇧ k` → `K`arabiner EventViewer
- `⇧ b` → `B`etterTouchTool
- `.`/`:` → Emoji Insertion Modal
- `,` → System Preferences

## Vim Mode
- A global Vim Mode for every text field in macOS.
- Triggered via tapping `left-shift`, canceled via tapping `left-shift` again, or with `i`/`Esc`/`Caps Lock`.
- Supported Actions: `hjklHJKLebG` & `xCDi<Esc>` 
- Non-standard supported action: `<Space>` for `ciw` and `<S-Space>` for `daw`.

## Miscellaneous
- **One Stroke ´^~\` (German Layout)**: Simply makes those characters appear directly, without awaiting another character like `a`, in which case it gets (mostly wrongly) turned into `àá`. (Note that the way this is done, they aren't received properly by vim anymore.)
- Minor improvements to various apps.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://github.com/chrisgrieser/dotfiles/blob/main/.config/karabiner/assets/complex_modifications/one-stroke-characters.json
```

The keys and apps in the JSON can be edited however wanted.

[^1]: On non-German keyboards, `y` and `z` are switched, so the key codes are the other way round. `ö` is only found on German Keyboards as such, on US Keyboards it is `;`.
[^2]: Technically speaking, moves it slightly above to the bottom right (not complete bottom right to avoid triggering the Dock). 
[^3]: Currently supported: Safari, Brave, Chromium, Vivaldi, and Chrome

# Karabiner: Complex Modification Descriptions

To install the rule on your Mac, install [Karabiner Elements](https://karabiner-elements.pqrs.org/), and simply open respective following URL in your browser.

## Capslock to Hyper / Esc
- This rule turns capslock into `⌘⌥⇧⌃`, the so called [Hyper Key](https://holmberg.io/hyper-key/). The Hyper Key can be used as a fifth modifier key.
- If pressed alone, capslock will become `Esc`, which is convenient for vim users. 

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/capslock-to-hyper-esc.json
```

## Modifier Key Navigation
When pressed alone:
- `right-shift` moves a word to the right
- `left-shift` moves a word to the left
- `right-command` moves a character to the left (i.e., `right-arrow`)
- `left-command` moves a character to the left (i.e., `left-arrow`)

When not pressed alone, the keys work as usual modifier keys. To avoid accidental triggering, you should probably set `to_if_alone_timeout_milliseconds` (Complex Modifications → Parameters) to a lower value like 400 ms.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/shift-move-per-word.json
```

## Temporary US Layout
As long as `right-option` is held down, the keyboard switches to the US layout. As soon as the key is released, the layout is switched back (in my case to the standard German Layout). 

This is useful to send character events like `[]{}^` for vim emulators (which often have limited remapping capabilities).

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/shift-move-per-word.json
```

## Middle Click to Quit App
- Middle click to close an app (`cmd + q`).
- Use [Right Click Open Link Chrome Extensions](https://chrome.google.com/webstore/detail/right-click-opens-link-ne/mhjkeimpgjokbjmioglhlngefbddppnn) to open links in a new tab in Browsers.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/middle-click-quit.json
```

## fn Launcher
`fn + {letter}` launches/switches to a pre-defined App
- `fn + c` → `C`alendar → BusyCal
- `fn + b` → `B`rowser → Brave Browser
- `fn + o` → `O`bsidian
- `fn + d` → `D`iscord
- `fn + s` → `S`lack
- `fn + r` → `D`rafts
- `fn + f` → `F`inder (with a default folder)
- `fn + r` → D`r`afts
- `fn + e` → `E`ditor → Sublime Text
- `fn + y` → `Y`ouTube
- `fn + k` → `K`arabiner Elements
- `fn + shift + k` → `K`arabiner Event Viewer

Since pressing `fn` interferes with the built-in macOS emoji insertion key, you will have to disable it (`System Preferences → Keyboard → "Press 🌐 to" → "Do Nothing"`) . If you still want to use the `fn` key 
- `fn` pressed alone opens the emoji insertion modal (optional)

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/fn-launcher.json
```

Edit the keys and apps in the JSON to your liking.

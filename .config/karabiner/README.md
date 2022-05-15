# Karabiner: Complex Modifications

To install the rule on your Mac, install [Karabiner Elements](https://karabiner-elements.pqrs.org/), and simply open respective following URL in your browser.

## Capslock to Hyper / Esc
- This rule turns capslock into `⌘⌥⇧⌃`, the so called [Hyper Key](https://holmberg.io/hyper-key/). The Hyper Key can be used as a fifth modifier key.
- If pressed alone, capslock will become `Esc`, which is convenient for vim users. 

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/capslock-to-hyper-esc.json
```

## `Hyper + hjkl` to Arrow Keys


```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/shift-move-per-word.json
```

## Brackets sent in US layout
Modifies `alt + 5/6/8/9` from the German so that it sends `[]{}`, but from the US layout. then, immediately switches back to German layout. This enables the use of those keys for vim, e.g. for `dt]`, without ever switching keyboard layout.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/brackets-sent-in-us-layout.json
```

## Mouse Click Improvements
- Middle click to close an app (`cmd + q`).
- Tapping Right Mouse Button in Safari/Brave to open link in background. Press with any modifier key for a normal right click. Is triggered only when briefly tapping so that mouse gesture extensions aren't affected. (This rule essentially emulates the [Right Click Open Link Chrome Extensions](https://chrome.google.com/webstore/detail/right-click-opens-link-ne/mhjkeimpgjokbjmioglhlngefbddppnn) extension.)

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/mouse-click-improvements.json
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
- `fn + y`[^1] → `Y`ouTube
- `fn + z`[^1] → `Z`oom
- `fn + k` → `K`arabiner Elements
- `fn + a` → `A`lfred Preferences
- `fn + shift + k` → `K`arabiner Event Viewer

Since pressing `fn` interferes with the built-in macOS emoji insertion key, you will have to disable it (`System Preferences → Keyboard → "Press 🌐 to" → "Do Nothing"`) . If you still want to use the `fn` key.

`fn` pressed alone opens the emoji insertion modal (optional)

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/fn-launcher.json
```

Edit the keys and apps in the JSON to your liking.

[^1]: On non-German keyboards, `y` and `z` are switched.

# Rule Descriptions

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

When not pressed alone, the keys work as usual modifier keys.

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/shift-move-per-word.json
```

## fn Launcher
`fn + {letter}` launches/switches to a pre-defined App
- `fn + c` → Calendar → BusyCal
- `fn + b` → Browser → Brave Browser
- `fn + o` → Obsidian
- `fn + d` → Discord
- `fn + s` → Slack
- `fn + r` → Drafts
- `fn + f` → Finder (with a default folder)
- `fn + r` → Drafts
- `fn + e` → Editor → Sublime Text
- `fn + k` → Karabiner Elements

Since pressing `fn` interferes with the built-in macOS emoji insertion key, you will have to disable it (`System Preferences → Keyboard → "Press 🌐 to" → "Do Nothing"`) . If you still want to use the `fn` key 
- `fn` pressed alone opens the emoji insertion modal (optional)

```text
karabiner://karabiner/assets/complex_modifications/import?url=https://raw.githubusercontent.com/chrisgrieser/dotfiles/main/.config/karabiner/assets/complex_modifications/fn-launcher.json
```

Edit the keys and apps in the JSON to your liking.

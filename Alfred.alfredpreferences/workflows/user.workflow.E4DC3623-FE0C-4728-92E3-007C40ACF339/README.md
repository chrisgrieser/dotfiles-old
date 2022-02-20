# Weekly Date Generator for Alfred
_Generate weekly dates, e.g. for syllabi creation_

<img src="https://user-images.githubusercontent.com/73286100/137104617-66de6646-3b72-4174-bd16-5207a33a267e.gif" alt="Screen Recording 2021-10-13 at 00 12 21" width=40%>

## Download
[Doanload the latest release here.](https://github.com/chrisgrieser/Alfred-weekly-date-generator/releases/latest)

## Usage
- keyword `weekly`: set a starting date in the ISO-Format (YYYY-MM-DD)
- hotkey (configurable by double-clicking the hotkey field): paste the date. Every time you use the hotkey, the date increases by one week
- use the `weekly` keyword to set a new starting date.

## Workflow Configuration (Alfred Environment Variables)
- Set the language of the months via `lang`. Use the [BCP-47 language tags](https://www.techonthenet.com/js/language_tags.php).
- Get the holidays of a German state (Bundesland) by setting a state via `bundesland_feiertage`. Use the [shortcodes listed here](https://feiertage-api.de/), e.g. `BE` for Berlin. _**Leave this empty**, if you do not want to use German state holidays._

## Credits
Created by [Chris Grieser](https://chris-grieser.de/).

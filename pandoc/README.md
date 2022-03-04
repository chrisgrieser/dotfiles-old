# Pandoc Notes

## Priority of Options

Higher overwrites lower.

1. Direct CLI arguments
2. CLI arguments from the defaults-file (`--defaults`)
3. CLI arguments written to metadata (`--metadata`)
4. YAML of the Document ("Metadata")
5. `--metadata-file` (default location: `~/.pandoc/metadata`)

> `--metadata=KEY[:VAL]`: […] A value specified on the command line overrides a value specified in the document using YAML metadata blocks. […]
>
> `--metadata-file=FILE`: […] Generally, the input will be handled the same as in YAML metadata blocks. This option can be used repeatedly to include multiple metadata files; values in files specified later on the command line will be preferred over those specified in earlier files. Metadata values specified inside the document, or by using -M, overwrite values specified with this option.
>
> – [Pandoc Docs](https://pandoc.org/MANUAL.html#option--metadata)

## Automatically Insert Date

```shell
# Insert today's date
--metadata=date:"$(date "+%e. %B %Y")"
```

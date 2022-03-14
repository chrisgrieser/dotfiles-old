# Pandoc Notes

## Priority of Options

Higher overwrites lower.

1. Direct CLI arguments
2. Arguments from the defaults-file (`--defaults`) (default location: `~/.pandoc/defaults`)
3. Another defaults file imported in the defaults file. (`defaults: entry`)
4. Metadata set as CLI argument (`--metadata`)
5. YAML of the Document (in the docs mostly referred to as "Metadata")
6. `--metadata-file` (default location: `~/.pandoc/metadata`)

> Options specified in a defaults file itself always have priority over those in another file included with a `defaults: entry`.  
> – [Pandoc Docs](https://pandoc.org/MANUAL.html#defaults-files)

> `--metadata=KEY[:VAL]`: […] A value specified on the command line overrides a value specified in the document using YAML metadata blocks. […]  
> `--metadata-file=FILE`: […] Generally, the input will be handled the same as in YAML metadata blocks. This option can be used repeatedly to include multiple metadata files; values in files specified later on the command line will be preferred over those specified in earlier files. Metadata values specified inside the document, or by using -M, overwrite values specified with this option.  
> – [Pandoc Docs](https://pandoc.org/MANUAL.html#option--metadata)

## Priority of Filters
> Filters, Lua-filters, and citeproc processing are applied in the order specified on the command line.
> – [Pandoc Docs](https://pandoc.org/MANUAL.html#option--filter)

## Automatically Insert Date

```shell
# Insert today's date
--metadata=date:"$(date "+%e. %B %Y")"
```

## Batch Conversion

```shell
for f in *.html ; do 
	pandoc ${f} -f html -t markdown -s -o ${f}.md
done
```

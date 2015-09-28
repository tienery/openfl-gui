## Patch Notes (v2.0.0-alpha.7)
### Additions
The "canvas" package has been added with a styler that can read JSON-formatted text files.

* The `StyleReader` class is used to set a style. This currently does not apply to existing controls, as it is there for testing.
* You will still need to use `Styles` from the `gui.styles` package until the `canvas` package is fully complete.
* The `Color` class can be used to get known colors or to create your own that has variables for values with or without alpha, or alpha on its own.

### Changes

* CheckedListBox is almost complete, but should not be used yet.
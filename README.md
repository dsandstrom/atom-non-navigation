# Non Navigation
###### An Atom Package - [Atom.io](https://atom.io/packages/non-navigation) : [Github](https://github.com/dsandstrom/atom-non-navigation) : [![Build Status](https://travis-ci.org/dsandstrom/atom-non-navigation.svg?branch=master)](https://travis-ci.org/dsandstrom/atom-non-navigation)
Allows navigation of words and non-word characters.  It will skip over whole words, but only skips over one non-word character at a time.  The purpose of this packages is to be like the core command: `editor:move-to-end-of-word`, but not skip all consecutive non-word characters.  So you can jump into quotes or parenthesis with ease.

### Non-word characters
The defaults are: /\()"':,.;<>~!@#$%^&*|+=[]{}`?-, but they can be changed in your settings, globally or per syntax.

### Instructions
Add a keymap.  I use this on Linux:
```cson
'.workspace .editor':
  'ctrl-space': 'non-navigation:move-right'
```
However, this is the same command as `autocomplete:toggle` so I don't want to add a conflict.  I'm open to suggestions on what to set in the package settings.

### Commands
```cson
'non-navigation:move-right'
```

### Notes
In beta

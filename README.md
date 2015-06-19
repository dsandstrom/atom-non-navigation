# Non Navigation
###### An Atom Package - [Atom.io](https://atom.io/packages/non-navigation) : [Github](https://github.com/dsandstrom/atom-non-navigation) : [![Build Status](https://travis-ci.org/dsandstrom/atom-non-navigation.svg?branch=master)](https://travis-ci.org/dsandstrom/atom-non-navigation)

Allows you to skip over words to jump into parenthesis or quotes. It is like the core command `editor:move-to-end-of-word`, but only traverses one non-word character at a time. 

### Non-word characters
The defaults are: /\()"':,.;<>~!@#$%^&*|+=[]{}`?-, but they can be changed in your settings, globally or per syntax.

### Instructions
There are no default keymaps, you must add one yourself. Here are mine:
```cson
'.platform-linux atom-text-editor':
  'ctrl-space': 'non-navigation:move-right'

'.platform-win32 atom-text-editor':
  'ctrl-space': 'non-navigation:move-right'

'.platform-darwin atom-text-editor':
  'cmd-space': 'non-navigation:move-right'
```
### Commands
```cson
'non-navigation:move-right'
```

### Dependencies
Requires Atom v0.168.0 and up

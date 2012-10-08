# Chris's dotfiles.

This repo contains my personal dotfiles and are heavily based on [addy](https://github.com/addyosmani/dotfiles), [paul](https://github.com/paulirish/dotfiles/) and [mathias](https://github.com/mathiasbynens/dotfiles/)'s. Most documentation has been modified from Addy's version.

## Some differences
- Stripped down to just what I use
- Sample [`.editorconfig`](http://editorconfig.org/)
- .gitignore includes Ruby specific ignores

## install the neccessary apps

My basic setup is captured in `install-deps.sh` which adds homebrew, z, nave, etc.

## private config

Toss it into a file called `.extra` which you do not commit to this repo and just keep in your `~/`


## Syntax highlighting

…is really important. even for these files.

add the below to this file: `~/Library/Application Support/Sublime Text 2/Packages/ShellScript/Shell-Unix-Generic.tmLanguage`

```xml
<string>.aliases</string>
<string>.bash_profile</string>
<string>.bash_prompt</string>
<string>.bashrc</string>
<string>.brew</string>
<string>.exports</string>
<string>.functions</string>
<string>.git</string>
<string>.gitattributes</string>
<string>.gitconfig</string>
<string>.gitignore</string>
<string>.inputrc</string>
<string>.osx</string>
<string>.vim</string>
<string>.vimrc</string>
```

### OS X defaults

When setting up a new Mac, this sets some basic defaults:

```bash
./.osx
```

## overview of files

####  Automatic config
* `.ackrc` - for ack (better than grep)
* `.vimrc`, `.vim` - vim config, obv.

#### shell environement
* `.aliases`
* `.bash_profile`
* `.bash_prompt`
* `.bashrc`
* `.exports`
* `.functions`
* `.extra`

#### manual run
* `install-deps.sh` - random apps i need installed
* `.osx` - run on a fresh osx machine
* `.brew` - homebrew intialization

#### git
* `.git`
* `.gitattributes`
* `.gitconfig`
* `.gitignore`

* `.inputrc` - config for bash readline


## Installation

```bash
git clone https://github.com/cwebbdesign/dotfiles.git && cd dotfiles && ./sync.sh
```

To update later on, just run the sync again.

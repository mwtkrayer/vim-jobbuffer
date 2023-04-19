# vim-jobbuffer
Executes a command in `/bin/sh` in the background, i.e. VIM does not wait for it to finish.
The output is written into a new buffer.

## Installation
Using [vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'mwtkrayer/vim-jobbuffer'
```

## Usage
To execute a shell command, use the `JobBuffer` command, e.g.
```vim
:JobBuffer echo tast | sed s/a/e/g
```
The command and process ID will be written to a new buffer, followed by the screen 
output of the execution.

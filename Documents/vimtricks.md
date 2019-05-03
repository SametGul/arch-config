# VIM Tricks

## Movement

zz - move current line to the middle of the screen
zt - move current line to the top of the screen
zb - move current line to the bottom of the screen

ctrl-y Moves screen up one line
ctrl-e Moves screen down one line
ctrl-u Moves cursor & screen up ½ page
ctrl-d Moves cursor & screen down ½ page
ctrl-b Moves screen up one page, cursor to last line
ctrl-f Moves screen down one page, cursor to first line

## Variables

:let x=100
:let x=x+30
:put x - put x content to new line
:echo x

{insert mode}: ctrl+r =x - put x content at cursor position

## Misc

ZZ - if you happen to have Caps Lock on accidentally, you will save and exit vim

## Registers

"{reg}dd - "xdd - put content of this line to register and also delete the line
"{reg}p - "xp - put content of register to current cursor position

## Spell Check

Move between errors `[s ]s`
Fix them `z=`
Add unknown word to dictionary `zg`
`:set nospell` to disable checking

## Vimdiff

To avoid whitespace comparison:
:set diffopt+=iwhite

]c :        - next difference
[c :        - previous difference
do          - diff obtain
dp          - diff put
zo          - open folded text
zc          - close folded text
:diffupdate - re-scan the files for differences
zr	    - open all folds
zm	    - close all folds

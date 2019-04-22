#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export XDG_CONFIG_HOME=~/.config

alias ls='ls --color=auto'
alias ll='ls -alF'
#PS1='[\u@\h \W]\$ '
PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\w \$\[\033[00m\] '

alias batprtcon='sudo tpacpi-bat -v -s ST 0 70; sudo tpacpi-bat -v -s SP 0 80; sudo tlp-stat -b'
alias batprtcoff='sudo tpacpi-bat -v -s ST 0 0; sudo tpacpi-bat -v -s SP 0 0; sleep 1; sudo tlp-stat -b'

alias youtube-dl360='youtube-dl -i -f "bestvideo[height<=360]+bestaudio/best[height<=360]" -o "%(title)s.%(ext)s"'
alias youtube-dl480='youtube-dl -i -f "bestvideo[height<=480]+bestaudio/best[height<=480]" -o "%(title)s.%(ext)s"'
youtube-mp3(){
	youtube-dl -i --audio-format mp3 -x -o "%(title)s.%(ext)s" --download-archive archive.txt "$1"
}
youtube-opus(){
	youtube-dl -i --audio-format opus -x -o "%(title)s.%(ext)s" --download-archive archive.txt "$1"
}

duu(){
    sudo du -h -d "$1" > /tmp/size; ll -hS | awk '{print $5"\t"$9}' >> /tmp/size; cat /tmp/size | grep -P '^[0-9,.]+[G]' | sort -t, -n -r; cat /tmp/size | grep -P '^[0-9,.]+[M]' | sort -t, -n -r; rm /tmp/size
}

h2d () {
    printf "%03d\n" `echo "obase=10; ibase=16; $1" | bc`
}
d2h () {
    printf "0x%02X\n" $1
}
h2b () {
    printf "b%08d\n" `echo "obase=2; ibase=16; $1" | bc`
}
d2b () {
    printf "b%08d\n" `echo "obase=2; ibase=10; $1" | bc`
}
b2h () {
    printf "0x%02X\n" `echo "obase=10; ibase=2; $1" | bc`
}
b2d () {
    printf "%03d\n" `echo "obase=10; ibase=2; $1" | bc`
}

alias bckphdd='sudo rsync -aAX --delete  --info=progress2 / --exclude={"/dev/*","/proc/*","/sys/*","/tmp/*","/run/*","/mnt/*","/media/*","/lost+found"} /media/mesih/hdd1/backupArch/ '

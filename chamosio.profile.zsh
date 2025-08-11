setopt autocd

alias b='run'

kyb() {$EDITOR ~/.dotfiles/keybinds.zsh}

stfu() { python -c "import os;os.system(\"echo no u\")"; }

re() { [[ $1 = '--boot' ]] && reboot; }

alias z='zsh'

tag() {mv $1 _$1}

alias bug='moon-buggy'

alias c='clear;ls'

profile() {
    nano ~/.dotfiles/$USER.profile.zsh
    [[ "$1" == "--and-quit-after" ]] && exit
}
no.() {}

newdot() {
    nano ~/.dotfiles/$1
}
alias nd='newdot'

dot() {
    nano ~/.dotfiles/$1
    thingy=`pwd`
    cd ~/.dotfiles
    git add .
    git commit -a
    git push
    cd $thingy
}

alias pq='profile --and-quit-after'

alias cb='cargo build'

k() {uname -r}

update-yogev() {
    cp ~/Code/MinecraftMods/Fabric/Yogev-Fabric-1.21.5/build/libs/yogev-1.0.0.jar ~/mc/cfh/Instances/s/mods
}

commit-suicide() {
    x=`pwd`
    cd ~/mc/cfh/Instances/s/saves/"New World"
    git commit -a
    cd $x
}

ds() {
    cd ~/mc/cfh/Instances/s/saves/"New World"
}

dk() {
    ds;
    git reset --hard;
}

alias cs='commit-suicide'
alias uy='update-yogev'

alias rm='trash'
alias u='umlaut'

cmps() {
    gcc -static -nostdlib $1 -o $2
}

alias lsu=lsusb;
alias lsb=lsblk;

dev() {
    cd Code
    [[ $1 != "" ]] &&cd $1
}

x() { chmod +x $1; }
edit() { $EDITOR $1; }

uninstall() {
    sudo dnf remove $1
}

alias us='uninstall'

os() {
    cat /etc/system-release
}

ipa() { ip a; }

ps1() {
    nano ~/.dotfiles/$USER.ps1.zsh
}

bashrc() { nano ~/.bashrc; }
zshrc() {nano ~/.zshrc}
alias rc='zshrc'

umlaut() { cd ..; }

run() {
    [[ -f `pwd`/run.zsh ]] && . `pwd`/run.zsh
}

psx() {
    if [[ $1 != "" ]]; then
        ps auxcef | grep $1 | grep -v grep | grep -v "ps auxcef"
    else
        ps auxcef
    fi
}

cdto() {
    mkdir $1
    cd $1
}

alias clr='clear'

alias w='exit'

alias y='yes'

alias p='psx'

alias rm='rm -i'

[[ -f ~/.config/hyfetch.json ]] && hyfetch
[[ -d ~/.cargo ]] && export RUST_BACKTRACE=1

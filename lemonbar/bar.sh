##!/bin/sh
volup=
voldown=
clock () {
    date +"%a %b %d %r"
}

monitor(){
    bspc query -M -m .focused --names
}
desktop(){
    bspc query -D -d .focused --names
}
pkgs(){
    #$(( $(apk version | wc -l) - 1 ))    
    apk version | tail -n +2 |wc -l
    #echo  "$(apk version | wc -l) - 1" |bc
}
window(){
    xtitle
}
volume(){
    vol="%{F#CCCCCC} $(pamixer --get-volume)"
    pamixer --get-mute > /dev/null && echo "$voldown$vol" || echo "$volup$vol"
}
song(){
    mpc current
}
mpc_toggle(){
    case $( mpc status | awk -F'[][]' 'NR==2 {print $2}') in

        playing)
            echo 
            ;;
        paused)
            echo 
            ;;
    esac
}
while true ; do
    bar="%{c}%{F#CCCCCC}$(clock)%{l}%{F#AE81FF}$(monitor)%{F#CCCCCC}:%{F#82B414}$(desktop) %{F#66D9Ef}$(window)%{r}%{F#82b414}$(song)  %{F#266C98}%{A:prev:} %{A}%{A:ptoggle:}$(mpc_toggle)%{A}%{A:next:}  %{A}  %{F#Fd971F} %{F#CCCCCC}$(pkgs) %{F#f92672}$(volume)"
    echo "%{S0}$bar%{S1}$bar"
    sleep 1
done |lemonbar -p -B#1b1d1e -F#cccccc -f "firamono-11" -f 'Font Awesome 5 Free Solid-13'| ~/.config/lemonbar/handle_buttons 

#!/bin/bash

## Author : Aditya Shakya (adi1090x)
## Mail : adi1090x@gmail.com
## Github : @adi1090x
## Reddit : @adi1090x

rofi_command="rofi -theme card.rasi"

uptime=$(uptime -p | sed -e 's/up //g')

# Options
shutdown=""
reboot=""
lock=""
suspend=""
logout=""
dir="$HOME/.config/rofi"

# Variable passed to rofi
options="$shutdown\n$reboot\n$lock\n$suspend\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -selected-row 2)"
case $chosen in
    $shutdown)
		ans=$($dir/confirm.sh)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
	doas poweroff
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $reboot)
		ans=$($dir/confirm.sh)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
	doas reboot
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $lock)
        betterlockscreen -l
        ;;
    $suspend)
		ans=$($dir/confirm.sh)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
        playerctl pause
        loginctl suspend
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
        fi
        ;;
    $logout)
		ans=$($dir/confirm.sh)
		if [[ $ans == "yes" ]] || [[ $ans == "YES" ]] || [[ $ans == "y" ]]; then
        killall dwm
		elif [[ $ans == "no" ]] || [[ $ans == "NO" ]] || [[ $ans == "n" ]]; then
        exit
        else
        rofi -theme "$dir/message.rasi" -e "Available Options  -  yes / y / no / n"
        fi
        ;;
esac

#!/bin/bash

bluetooth_connect() {
	if bluetoothctl show | grep -q "Powered: yes"; then
		devices_paired=$(bluetoothctl devices | grep Device | cut -d ' ' -f 2)
		devices_name=$(bluetoothctl devices | grep Device | cut -d ' ' -f 3)
		for ((i=0; i<${#devices_paired[@]}; i++)); do
		#for device in $devices_paired; do
			#>> /dev/null
			notify-send -i "bluetooth" "Trying to connect: ${devices_name[$i]}"
			connected=$(bluetoothctl connect ${devices_paired[$i]} )
			if ! [[ "$connected" =~ .*"Failed to connect".* ]]; then
				notify-send -i "bluetooth" "Connection established with ${devices_name[$i]}"
			else
				notify-send -i "bluetooth" "Connection failed with ${devices_name[$i]}"
			fi
		done
	else
		notify-send -i "bluetooth" "Bluetooth powered off, activate it first"
	fi
}

bluetooth_print() {
	if bluetoothctl show | grep -q "Powered: yes"; then
        devices_paired=$(bluetoothctl devices | grep Device | cut -d ' ' -f 2)
        device_alias=""

        for device in $devices_paired; do
            device_info=$(bluetoothctl info "$device")

            if echo "$device_info" | grep -q "Connected: yes"; then
                device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)
            fi
        done

        if [ "$device_alias" == "" ]; then
            printf ' No device'
        else
            printf ' %s' "$device_alias"
        fi
	else
		printf ' Disconnected'
	fi
}

bluetooth_toggle() {
    if bluetoothctl show | grep -q "Powered: no"; then
        bluetoothctl power on >> /dev/null
        notify-send -i "bluetooth" "Powered on"

    else
        devices_paired=$(bluetoothctl devices | grep Device | cut -d ' ' -f 2)
        echo "$devices_paired" | while read -r line; do
            bluetoothctl disconnect "$line" >> /dev/null
        done

        bluetoothctl power off >> /dev/null
        notify-send -i "bluetooth" "Powered off"
    fi
}

case "$1" in
    '--toggle')
        bluetooth_toggle;;
    '--connect')
		bluetooth_connect;;
    *)
        bluetooth_print;;
esac

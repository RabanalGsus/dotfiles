#!/bin/bash

# Your interface names
ETH_IFACE="enx644ed70d2189"
WLAN_IFACE="wlp2s0"

# Check Ethernet status
if [ "$(cat /sys/class/net/$ETH_IFACE/operstate 2>/dev/null)" = "up" ]; then
    echo "󰈀 Wired"
# Check WiFi status
elif [ "$(cat /sys/class/net/$WLAN_IFACE/operstate 2>/dev/null)" = "up" ]; then
    # Get the SSID (WiFi Name)
    SSID=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d: -f2)
    echo " $SSID"
# Both disconnected
else
    echo " Disconnected"
fi

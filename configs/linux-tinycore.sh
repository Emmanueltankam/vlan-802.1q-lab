#!/bin/sh
# Configuration des VMs Tiny Core Linux pour le TP réel (ESXi + switch physique)
# Lancer uniquement le bloc correspondant à la VM.

sudo pkill udhcpc   # pas de serveur DHCP dans le TP

# --- VM 1-1 / 1-2 / 2-1 / 2-2 : une carte, pas de tag ---
# sudo ifconfig eth0 192.168.10.11 netmask 255.255.255.0 up   # VM 1-1
# sudo ifconfig eth0 192.168.10.12 netmask 255.255.255.0 up   # VM 1-2
# sudo ifconfig eth0 192.168.20.21 netmask 255.255.255.0 up   # VM 2-1
# sudo ifconfig eth0 192.168.20.22 netmask 255.255.255.0 up   # VM 2-2

# --- VM 3-1 : une carte, VLAN 10 et 20 tagués (802.1Q) ---
# sudo modprobe 8021q
# sudo ip link set eth0 up
# sudo ip link add link eth0 name eth0.10 type vlan id 10
# sudo ip link add link eth0 name eth0.20 type vlan id 20
# sudo ifconfig eth0.10 192.168.10.31 netmask 255.255.255.0 up
# sudo ifconfig eth0.20 192.168.20.31 netmask 255.255.255.0 up

# --- VM 3-2 : deux cartes, pas de tag ---
# sudo ifconfig eth0 192.168.10.32 netmask 255.255.255.0 up
# sudo ifconfig eth1 192.168.20.32 netmask 255.255.255.0 up

# Vérification
# ifconfig
# cat /proc/net/vlan/config
# ping -c 4 192.168.10.12

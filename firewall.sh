#!/bin/bash

#Flush rules
iptables -F

#Set default policies for INPUT, FORWARD, OUTPUT chains

#iptables -P INPUT DROP
#iptables -P FORWARD DROP
#iptables -P OUTPUT ACCEPT

# Allow access for localhost
iptables -A INPUT -i lo -j ACCEPT

# Accept packets belonging to established and related connections
iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Add access from other computers on our network
#iptables -A INPUT -s <IP Address 1> -j ACCEPT
#iptables -A INPUT -s <IP Address n> -j ACCEPT

# Open port for HTTP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT

# Deny All
iptables -A INPUT -j DROP

# List iptables chains
iptables -L --line-numbers

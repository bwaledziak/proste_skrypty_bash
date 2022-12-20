#!/bin/bash
# Generator statystyk serwera
# Autor: Bolesław Walędziak

wynik_uptime=$(uptime -p | cut -d " " -f 2-)
uzycie_dysku=$(df -t ext4|grep "/"|cut -d " " -f 10)
uzycie_inodow=$(df -i -t ext4|grep "/"|cut -d " " -f 7)
pamiec_total=$(free -h|grep "Mem:"|cut -d " " -f 11)
pamiec_wolna=$(free -h|grep "Mem:"|cut -d " " -f 26)
wynik_ping=$(ping -c 3 dns.google.com 2>/dev/null|grep "rtt"|cut -d "/" -f 5)
procesy=$(ps axu|wc -l)

if [[ $wynik_ping == "" ]]; then
    wynik_ping="Ping nieudany"
else
    wynik_ping+="ms"
fi

echo "Statystyki serwera z godziny $(date +%T) dnia $(date +%d-%m-%Y)" 
echo "Uptime: $wynik_uptime"
echo -e "Wykorzystanie miejsca na dysku:\t$uzycie_dysku"
echo -e "Wykorzystanie inodów:\t\t$uzycie_inodow"
echo -e "Dostępnosc pamięci:\t\t$pamiec_wolna z $pamiec_total"
echo -e "Uruchomionych procesow:\t\t$((procesy-1))"
echo -e "Średni ping do DNS Google:\t${wynik_ping}"
exit 0

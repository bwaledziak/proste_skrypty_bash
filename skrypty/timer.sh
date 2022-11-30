#!/bin/bash
# Autor: Bolesław Walędziak

czas=$1

if ! [[ $czas =~ ^[0-9]+$ ]]; then
    echo "Prawdłowe wywołanie skrytu: timer.sh [czas w s] np: timer.sh 10"
    exit 1
fi

while [ $czas -gt 0 ]; do
    echo $czas
    sleep 1
    ((czas--))
done

echo "0 - KONIEC, wyznaczony czas (${czas}s) upłynął."

exit 0

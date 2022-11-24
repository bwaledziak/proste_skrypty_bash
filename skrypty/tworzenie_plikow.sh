#!/bin/bash
#Autor: Bolesław Walędziak

echo -n "Ile plików chcesz utworzyć?: "
read ile

#Program sprawdza czy podana zmienna jest liczbą
if ! [[ $ile =~ ^[0-9]+$ ]]; then 
    echo "To nie jest liczba" 
    exit 1
fi

echo -n "Jak ma się rozpoczynać ich nazwa? (np. plik, test, file): "
read nazwa


#Program sprawdza czy istnieją już pliki w tym zakresie nazw
echo -n "Sprawdzam czy nie występuje konflikt nazw... "
licznik=1
while [ $licznik -le $ile ]; do
    if [ -f "${nazwa}_${licznik}" ]; then
        echo "BŁĄD"
        echo "W tym katalogu istnieje już plik ${nazwa}_${licznik}, który jest w wybranym zakresie nazw."
        echo "Nie tworzę plików. Uruchom program ponownie i wprowadź nazwę bez konfliktu z istniejącymi."
        exit 1
    fi
    ((licznik++))
done
echo "OK"

#Program tworzy pliki
echo -n "Tworzę pliki... "
licznik=1
while [ $licznik -le $ile ]; do
    touch "${nazwa}_${licznik}"
    ((licznik++))
done
echo "OK"

#Tworzenie poprawnej formy gramatycznej
reszta=$((ile%10))
if [ $ile -eq 1 ]; then 
    koncowka=""
elif [ $ile -lt 10 ] || [ $ile -gt 20 ] && ( [ $reszta -eq 2 ] || [ $reszta -eq 3 ] || [ $reszta -eq 4 ] ); then 
        koncowka="i"
else 
    koncowka="ów"
fi

echo "Utworzono $ile plik${koncowka}."
exit 0


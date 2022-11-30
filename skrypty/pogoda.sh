#!/bin/bash
# Autor: Bolesław Walędziak

echo -n "Sprawdzam połączenie..."
if ! ping -c 2 pl.wttr.in >/dev/null 2>&1; then
    echo "BŁĄD"
    echo "Nie mogę się połączyć z serwisem wttr.in"
    echo "Sprawdź połączenie internetowe i uruchom skrypt ponownie"
    exit 1
fi

echo "OK"

miasta=(Gdańsk Katowice Kraków Łódź Poznań Warszawa Wrocław)

for miasto in "${miasta[@]}"; do
    curl -s pl.wttr.in/$miasto?format="%l:+%C+%t\n";
done

exit 0

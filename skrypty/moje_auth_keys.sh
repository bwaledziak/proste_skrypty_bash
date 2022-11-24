#!/bin/bash
#Autor: Bolesław Walędziak

plik=~/.ssh/authorized_keys
if ! [ -f "$plik" ]; then
    echo "Brak pliku authorized_keys w katalogu .ssh"
    echo "Nie masz ustawionego logowania kluczami ssh na to konto."
    exit 0
fi

wierszy=$(cat "$plik" | wc -l)
echo "W pliku authorized_keys zapisanych jest $wierszy kluczy."

echo "Są to klicze SSH oznaczone nazwami:"
echo "$(cut -d " " -f 3 "$plik")"

exit 0



#!/bin/bash

if [ "$1" = "--date" ]; then
    date
elif [ "$1" = "--logs" ]; then
    if [ -z "$2" ]; then
        echo "Podaj liczbę plików jako drugi argument."
        exit 1
    fi
    
    re='^[0-9]+$'
    if ! [[ $2 =~ $re ]] ; then
        echo "Drugi argument musi być liczbą całkowitą."
        exit 1
    fi

    for ((i=1; i<=$2; i++)); do
        filename="log${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done
else
    echo "Użycie: $0 --date"
    echo "Użycie: $0 --logs <liczba_plików>"
fi
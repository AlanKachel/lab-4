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
elif [ "$1" = "--help" ]; then
    echo "Użycie: $0 --date"
    echo "       $0 --logs <liczba_plików>"
    echo "       $0 --help"
else
    echo "Nieznana opcja: $1"
    echo "Użycie: $0 --help, aby uzyskać pomoc."
fi
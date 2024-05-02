#!/bin/bash

if [[ "$1" = "--date" || "$1" = "-d" ]]; then
    date
elif [[ "$1" = "--logs" || "$1" = "-l" ]]; then
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
elif [[ "$1" = "--help" || "$1" = "-h" ]]; then
    echo "Użycie: $0 --date (-d)"
    echo "       $0 --logs <liczba_plików> (-l)"
    echo "       $0 --help (-h)"
    echo ""
    echo "Opis:"
    echo "  -d, --date        Wyświetla bieżącą datę."
    echo "  -l, --logs        Tworzy określoną liczbę plików logów."
    echo "  -h, --help        Wyświetla pomoc."
else
    echo "Nieznana opcja: $1"
    echo "Użycie: $0 --help, aby uzyskać pomoc."
fi
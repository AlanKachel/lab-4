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
elif [[ "$1" = "--error" || "$1" = "-e" ]]; then
    if [ -z "$2" ]; then
        count=100
    else
        count=$2
    fi
    
    re='^[0-9]+$'
    if ! [[ $count =~ $re ]] ; then
        echo "Drugi argument musi być liczbą całkowitą."
        exit 1
    fi
    
    mkdir -p errorx
    
    for ((i=1; i<=$count; i++)); do
        filename="errorx/error${i}.txt"
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done
elif [[ "$1" = "--init" ]]; then
    git clone https://github.com/AlanKachel/lab-4.git

    export PATH="$PATH:$(pwd)"
elif [[ "$1" = "--help" || "$1" = "-h" ]]; then
    echo "Użycie: $0 --date (-d)"
    echo "       $0 --logs <liczba_plików> (-l)"
    echo "       $0 --error [liczba_plików] (-e)"
    echo "       $0 --init"
    echo "       $0 --help (-h)"
    echo ""
    echo "Opis:"
    echo "  -d, --date        Wyświetla bieżącą datę."
    echo "  -l, --logs        Tworzy określoną liczbę plików logów."
    echo "  -e, --error       Tworzy określoną liczbę plików w katalogu errorx."
    echo "      --init        Klonuje repozytorium do bieżącego katalogu i dodaje go do PATH."
    echo "  -h, --help        Wyświetla pomoc."
else
    echo "Nieznana opcja: $1"
    echo "Użycie: $0 --help, aby uzyskać pomoc."
fi

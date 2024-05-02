#!/bin/bash

if [ "$1" = "--date" ]; then
    date
elif [ "$1" = "--logs" ]; then
    for ((i=1; i<=100; i++)); do
        # Tworzenie nazwy pliku
        filename="log${i}.txt"
        # Wypełnienie pliku danymi
        echo "Nazwa pliku: $filename" > "$filename"
        echo "Nazwa skryptu: $0" >> "$filename"
        echo "Data utworzenia: $(date)" >> "$filename"
    done
else
    echo "Użycie: $0 --date"
    echo "Użycie: $0 --logs"
fi
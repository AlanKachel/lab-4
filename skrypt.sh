#!/bin/bash

# Sprawdź, czy podano argument "--date"
if [ "$1" = "--date" ]; then
    # Jeśli tak, wyświetl bieżącą datę
    date
else
    # Jeśli nie, wyświetl komunikat o poprawnym użyciu
    echo "Użycie: $0 --date"
fi
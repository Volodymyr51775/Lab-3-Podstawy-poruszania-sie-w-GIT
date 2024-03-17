#!/bin/bash
show_date(){
    date
}

create_log(){
    for i in $(seq 1 $1); do
        echo "log$i.txt - Utworzone przez skrypt skrypt.sh w dniu $(date)" > "log$i.txt"
    done
}

show_help(){
    echo "Dostepne opcje:"
    echo "--date wyswietli dzisiejsza date"
    echo "--logs utworzy automatycznie 100 plikow logx.txt, x numer pliku od 1 100"
    echo "--logs 30 utworzenie automatycznie 30 plikow, analogicznie jak wyzej, ale z obsluga argumentu liczby plikow"
    echo "--help wyswietlenie wszystkich dostepnych opcji"
}

case "$1" in
    --date)
    show_date
    ;;
    --logs)
    count=${2:-100}
    create_log $count
    ;;
    --help)
    show_help
    ;;
    *)
    echo "Nieznana opcja: $1"
    show_help
    ;;
esac

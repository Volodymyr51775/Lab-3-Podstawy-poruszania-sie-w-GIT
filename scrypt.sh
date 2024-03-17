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
    echo "--date, -d: wyswietli dzisiejsza date"
    echo "--logs, -l: utworzy automatycznie 100 plikow logi.txt, i numer pliku od 1 do 100"
    echo "--logs 30, -l 30: utworzenie automatycznie 30 plikow, analogicznie jak wyzej, ale z obsluga argumentu liczby plikow"
    echo "--help, -h: wyswietlenie wszystkich dostepnych opcji"
    echo "--init, -i: klonuje repozytorium"
    echo "--error, -e: tworzy errorx/errorx.txt"
}

init_repo() {
    git clone https://github.com/Volodymyr51775/Lab-4-Podstawa-praca-z-GIT.git
    repo_name=$(basename "https://github.com/Volodymyr51775/Lab-4-Podstawa-praca-z-GIT.git" .git)
    export PATH=$PATH:$(pwd)/$repo_name
    echo "Repozytorium $repo_name sklonowane i dodane do PATH"
}

create_errors(){
    mkdir -p errorx
    for i in $(seq 1 ${1:-100}); do
        echo "error$i.txt - utworzony przez skrypt skrypt.sh" > "errorx/error$i.txt"
    done
}

case "$1" in
    --date|-d)
    show_date
    ;;
    --logs|-l)
    count=${2:-100}
    create_log $count
    ;;
    --help|-h)
    show_help
    ;;
    --error|-e)
    count=${2:-100}
    create_errors $count
    ;;
    --init|-i)
    init_repo
    ;;
    *)
    echo "Nieznana opcja: $1"
    show_help
    ;;
esac

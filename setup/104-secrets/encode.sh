#!/bin/bash


(return 0 2>/dev/null) && sourced=1 || { echo "Error: Script must be sourced"; exit 1; }


set_database_values() {
    read -p "$1 database name: " input
    declare -x -g "$1"_DB=$(echo -n $input | base64)

    read -p "$1 database user: " input
    declare -x -g "$1"_USR=$(echo -n $input | base64)

    read -p "$1 database password: " input
    declare -x -g "$1"_PWD=$(echo -n $input | base64)
}


echo "Available action"
echo "1 - Set all database variables"
echo "2 - Set Plik database variables"
echo "3 - Set Wiki database variables"
echo "4 - Set EJBCA database variables"
echo "5 - Set default password (not included in 1)"
read -p "Enter an option -> " option

if [ $option == 1 ]; then
    DB=( PLIK WIKI EJBCA )
    for x in "${DB[@]}"
    do
        set_database_values $x
    done
elif [ $option == 2 ]; then
    set_database_values PLIK
elif [ $option == 3 ]; then
    set_database_values WIKI
elif [ $option == 4 ]; then
    set_database_values EJBCA
elif [ $option == 5 ]; then
    read -p "Default database password: " input
    declare -x -g DEFAULT_PWD=$(echo -n $input | base64)
else
    echo "Invalid action"
fi

unset option







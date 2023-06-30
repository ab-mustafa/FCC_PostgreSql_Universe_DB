#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --no-align --tuples-only -c"

if [[ -z $1 ]]
then
    echo "Please provide an element as an argument."
    exit
fi








PRINT_DATA_BY_ATOMIC_NUMBER () {
    ATOMIC_NUMBER=$1
    ELEMENT_NAME=$($PSQL "select name from elements where atomic_number=$ATOMIC_NUMBER")
    ELEMENT_SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ATOMIC_NUMBER")
    ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT_CELSIUS=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT_CELSIUS=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    ELEMENT_TYPE=$($PSQL "select type from properties inner join types on types.type_id=properties.type_id where atomic_number=$ATOMIC_NUMBER")
    
    if [[ -z $ELEMENT_NAME ]]
    then
        echo -e "I could not find that element in the database."
        exit
    fi
    
    echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    exit
}



PRINT_DATA_BY_SYMBOL () {
    ELEMENT_SYMBOL=$1
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where symbol='$ELEMENT_SYMBOL'")
    ELEMENT_NAME=$($PSQL "select name from elements where atomic_number=$ATOMIC_NUMBER")
    ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT_CELSIUS=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT_CELSIUS=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    ELEMENT_TYPE=$($PSQL "select type from properties inner join types on types.type_id=properties.type_id where atomic_number=$ATOMIC_NUMBER")
    
    if [[ -z $ELEMENT_NAME ]]
    then
        echo -e "I could not find that element in the database."
        exit
    fi
    
    echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    exit
}


PRINT_DATA_BY_NAME () {
    
    ELEMENT_NAME=$1
    ATOMIC_NUMBER=$($PSQL "select atomic_number from elements where name='$ELEMENT_NAME'")
    ELEMENT_SYMBOL=$($PSQL "select symbol from elements where atomic_number=$ATOMIC_NUMBER")
    ATOMIC_MASS=$($PSQL "select atomic_mass from properties where atomic_number=$ATOMIC_NUMBER")
    MELTING_POINT_CELSIUS=$($PSQL "select melting_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    BOILING_POINT_CELSIUS=$($PSQL "select boiling_point_celsius from properties where atomic_number=$ATOMIC_NUMBER")
    ELEMENT_TYPE=$($PSQL "select type from properties inner join types on types.type_id=properties.type_id where atomic_number=$ATOMIC_NUMBER")
    
    if [[ -z $ATOMIC_NUMBER ]]
    then
        echo -e "I could not find that element in the database."
        exit
    fi
    
    echo -e "The element with atomic number $ATOMIC_NUMBER is $ELEMENT_NAME ($ELEMENT_SYMBOL). It's a $ELEMENT_TYPE, with a mass of $ATOMIC_MASS amu. $ELEMENT_NAME has a melting point of $MELTING_POINT_CELSIUS celsius and a boiling point of $BOILING_POINT_CELSIUS celsius."
    exit
}


#Check if the atomic number is provided.
if [[ $1 =~ ^[0-9]+$ ]]
then
    PRINT_DATA_BY_ATOMIC_NUMBER $1
    exit
elif [[ $1 =~ (^[A-Za-z]$|^[A-Za-z][A-Za-z]$) ]]
then
    PRINT_DATA_BY_SYMBOL $1
    exit
else
    PRINT_DATA_BY_NAME $1
    exit
fi





#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ MY SALON ~~~~~\n"

SERVICE_MENU(){
    if [[ -z $1 ]]
    then
        echo -e "Welcome to My Salon, how can I help you?\n"
    else
        echo -e "\n$1"
    fi
    SERVICES=$($PSQL "select * from services")
    echo "$SERVICES" | while read ID BAR SERVICE
    do
        echo "$ID) $SERVICE"
    done
    read SERVICE_ID_SELECTED
    # Check if selected option Not Number.
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then
        SERVICE_MENU "I could not find that service. What would you like today?"
    fi
    # Check if it exist
    SERVICE_SEARCH_RESULT=$($PSQL "select service_id from services where service_id=$SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_SEARCH_RESULT ]]
    then
        SERVICE_MENU "I could not find that service. What would you like today?"
    fi
    SELECTED_SERVICE_NAME=$($PSQL "select name from services where service_id=$SERVICE_ID_SELECTED")
    echo -e "\nWhat's your phone number?"
    read  CUSTOMER_PHONE

    #check if user exist
    CUSTOMER_NAME=$($PSQL "select name from customers where phone='$CUSTOMER_PHONE'")
    if [[ -z $CUSTOMER_NAME ]]
    then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER_RESULT=$($PSQL "Insert into customers(phone,name) values('$CUSTOMER_PHONE','$CUSTOMER_NAME')")
    fi
    CUSTOMER_ID=$($PSQL "select customer_id from customers where phone='$CUSTOMER_PHONE'")
    #Check Time
    echo -e "\nWhat time would you like your $SELECTED_SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    APPOINTMENT_RESULT_ID=$($PSQL "Insert into appointments (customer_id,service_id,time) values($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
    echo -e "\nI have put you down for a $SELECTED_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
    exit
}



SERVICE_MENU
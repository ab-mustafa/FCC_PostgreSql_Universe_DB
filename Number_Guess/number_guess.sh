#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"
echo "Enter your username:"
read USER_NAME
PLAYER_ID=$($PSQL "select player_id from players where username='$USER_NAME'")
GAMES_PLAYED=$($PSQL "select games_played from players where username='$USER_NAME'")
PLAYER_BEST_GAME=$($PSQL "select best_game from players where username='$USER_NAME'")

if [[ -z $PLAYER_ID ]]
then
    echo  "Welcome, $USER_NAME! It looks like this is your first time here."
else
    echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $PLAYER_BEST_GAME guesses."
fi
# SET TARGET NUMBER TO GUESS
TARGET_NUMBER=$((1 + $RANDOM % 1000))
GUESS_COUNTER=0
echo "Guess the secret number between 1 and 1000:"
#Start the game
MAIN (){
      read GUESS_NUMBER
      ((GUESS_COUNTER=GUESS_COUNTER+1))
      if ! [[ $GUESS_NUMBER =~ ^[0-9]+$ ]]
      then
          echo "That is not an integer, guess again:"
          MAIN
      elif [[ $GUESS_NUMBER -lt $TARGET_NUMBER ]]
      then
            echo "It's lower than that, guess again:"
            MAIN
      elif [[ $GUESS_NUMBER -gt $TARGET_NUMBER ]]
      then
           echo "It's higher than that, guess again:"
           MAIN
      else
           #HIT THE TARGET
           echo "You guessed it in $GUESS_COUNTER tries. The secret number was $TARGET_NUMBER. Nice job!"
           # SAVE THE DATA
           # check if new user
           if [[ -z $PLAYER_ID ]]
           then
              # Add user to Database
              INSERT_USER=$($PSQL "Insert into players(username,games_played,best_game) values ('$USER_NAME',1,$GUESS_COUNTER)")
           else
              #increae number of games
              ((GAMES_PLAYED=GAMES_PLAYED+1))
              #Check if current game is the best
              if [[ $GUESS_COUNTER -lt  $PLAYER_BEST_GAME ]]
              then
                  PLAYER_BEST_GAME=$GUESS_COUNTER
              fi
              UPDATE_USER_GAME=$($PSQL "update players set games_played=$GAMES_PLAYED ,best_game=$PLAYER_BEST_GAME where player_id=$PLAYER_ID")
           fi
           exit      
      fi
}
# CALL MAIN FUNCTION
MAIN
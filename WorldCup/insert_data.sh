#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.
# Clear the DataBase
echo $($PSQL "Truncate teams,games")
cat games.csv | while IFS=',' read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
if [[ $YEAR != year ]]
then
	WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")
	OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")

	if [[ -z $WINNER_ID ]]
	then
	  #Check if Winner ID exist.
		INSERT_WINNER=$($PSQL "Insert into teams(name) values('$WINNER')")
		# Get the id again
		WINNER_ID=$($PSQL "select team_id from teams where name='$WINNER'")	
	fi
	# Check if OPPONENT ID exist.
	if [[ -z $OPPONENT_ID ]]
	then
		# Insert the name
		INSERT_OPPONENT=$($PSQL "Insert into teams(name) values('$OPPONENT')")
		# Get the ID again
		OPPONENT_ID=$($PSQL "select team_id from teams where name='$OPPONENT'")
	fi

	#Insert the Game Into the Game table
	INSERT_GAME=$($PSQL "INSERT INTO games(year,round,winner_id,opponent_id,winner_goals,opponent_goals) values ($YEAR,'$ROUND',$WINNER_ID,$OPPONENT_ID,$WINNER_GOALS,$OPPONENT_GOALS)")
fi
done



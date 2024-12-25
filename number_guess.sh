#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=guess_number -t --no-align -c"
RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

echo "Enter your username:"
read USERNAME
USER_VALIDATION=$($PSQL "select games_played,best_games from user_info where username='$USERNAME'")
if [[ -z $USER_VALIDATION ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
else
  echo $USER_VALIDATION | while IFS=" |" read GAMES_PLAYED BEST_GAMES
  do
    echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAMES guesses."

    #number_guess
    echo -e "\nGuess the secret number between 1 and 1000:"
    NUMBER_OF_GUESSES=0
    while [[ true ]]
    do
      read USER_GUESS
      NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
      if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
      then
        echo "It's lower than that, guess again:"
      elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
      then
        echo "It's higher than that, guess again:"
      else
        TOTAL_GUESS=$(($GAMES_PLAYED + 1))
        if [[ $BEST_GAMES -gt $NUMBER_OF_GUESSES ]]
        then
          INSERT_USER_INFO=$($PSQL "insert into user_info(games_played,best_games) values($TOTAL_GUESS,$NUMBER_OF_GUESSES);")
        else
          INSERT_USER_INFO=$($PSQL "insert into user_info(games_played) values($TOTAL_GUESS);")
        fi      
        echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
        break
      fi 
    done
  done
fi
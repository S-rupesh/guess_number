#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=guess_number -t --no-align -c"
RANDOM_NUMBER=$(( ( RANDOM % 1000 ) + 1 ))

echo "Enter your username:"
read USERNAME
USER_VALIDATION=$($PSQL "select games_played,best_game from user_info where username='$USERNAME'")

if [[ -z $USER_VALIDATION ]]
then
  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  echo -e "\nGuess the secret number between 1 and 1000:"
  NUMBER_OF_GUESSES=0
  while read USER_GUESS; do
    if [[ $USER_GUESS =~ ^-?[0-9]+$ ]]
    then
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    if [[ $USER_GUESS -gt $RANDOM_NUMBER ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $USER_GUESS -lt $RANDOM_NUMBER ]]
    then
      echo "It's higher than that, guess again:"
    else
      INSERT_USER_INFO=$($PSQL "insert into user_info(username,games_played,best_game) values('$USERNAME',1,$NUMBER_OF_GUESSES);")
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      break
    fi
    else
        #if input is not null
     echo "That is not an integer, guess again:"
    fi
  done
else
  # Instead of piping, directly read into variables
  IFS=" |" read GAMES_PLAYED BEST_GAMES <<< "$USER_VALIDATION"
  
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAMES guesses."

  # number_guess
  echo -e "\nGuess the secret number between 1 and 1000:"
  NUMBER_OF_GUESSES=0
  while read USER_GUESS; do
  if [[ $USER_GUESS =~ ^-?[0-9]+$ ]]
  then
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
        INSERT_USER_INFO=$($PSQL "update user_info set games_played=$TOTAL_GUESS, best_game=$NUMBER_OF_GUESSES where username='$USERNAME'")
      else
        INSERT_USER_INFO=$($PSQL "update user_info set games_played=$TOTAL_GUESS where username='$USERNAME';")
      fi      
      echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
      break
    fi
    else
    #if input is not null
      echo "That is not an integer, guess again:"
    fi
  done
fi

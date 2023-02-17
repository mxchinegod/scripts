#!/bin/bash

# Define the rainbow characters
rainbow=("\033[38;5;196m" "\033[38;5;202m" "\033[38;5;208m" "\033[38;5;214m" "\033[38;5;220m" "\033[38;5;226m" "\033[38;5;190m" "\033[38;5;154m" "\033[38;5;118m" "\033[38;5;82m" "\033[38;5;46m" "\033[38;5;47m" "\033[38;5;48m" "\033[38;5;49m" "\033[38;5;50m" "\033[38;5;51m")

# Define the matrix characters
matrix_chars=(A B C D E F G H I J K L M N O P Q R S T U V W X Y Z 0 1 2 3 4 5 6 7 8 9)

# Define the number of columns
cols=$(tput cols)

# Define the number of rows
rows=$(tput lines)

# Define the sleep time between each frame
sleep_time=0.1

# Clear the terminal
clear

# Create an infinite loop to continuously display the falling characters
while true; do
  for ((i=1; i<=rows; i++)); do
    # Choose a random character from the matrix characters array
    char=${matrix_chars[$RANDOM % ${#matrix_chars[@]}]}
    # Choose a random color from the rainbow characters array
    color=${rainbow[$RANDOM % ${#rainbow[@]}]}
    # Print the character with the chosen color in a random column
    tput cup $((RANDOM % rows)) $((RANDOM % cols))
    echo -ne "$color$char "
    # Sleep for a specified amount of time before displaying the next frame
    sleep $sleep_time
  done
  # Clear the terminal after each iteration
  clear
done

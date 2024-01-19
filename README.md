# Rock-Paper-Scissors
This Java program is a simple implementation of the Rock, Paper, Scissors game where the user plays against the computer.
Here are the key components:

### Game Logic:
- The game runs in a loop, allowing the user to play multiple rounds.
- The computer randomly selects a move ("r" for rock, "p" for paper, or "s" for scissors).
- The user is prompted to enter their move, and input validation ensures that only valid moves are accepted.

### Outcome Determination:
- The program then compares the user's move with the computer's move to determine the winner or declare a tie.
- The possible outcomes are printed to the console.

### Play Again Option:
After each round, the user is asked if they want to play again. If the response is not "y," the program exits the loop, ending the game.

### Scanner Usage:
The Scanner class is used to get input from the user, and the scanner.nextLine() method is used to read user input.

### Random Move Selection:
The computer's move is randomly selected using the Random class.

### Loop Control:
The main loop continues until the user chooses not to play again (playAgain is not "y").

### Resource Cleanup:
The scanner.close() method is called to close the Scanner and release associated resources when the program ends.

Overall, this program provides a simple and interactive Rock, Paper, Scissors game for the user to play against the computer.

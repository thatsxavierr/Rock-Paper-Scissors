import java.util.Random;
import java.util.Scanner;

public class RockPaperScissors {

    private static final String ROCK = "r";
    private static final String PAPER = "p";
    private static final String SCISSORS = "s";

    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            boolean playAgain = true;

            while (playAgain) {
                playRound(scanner);

                System.out.println("Play again? (y/n)");
                String playAgainInput = scanner.nextLine();
                playAgain = playAgainInput.equalsIgnoreCase("y");
            }
        } catch (Exception e) {
            e.printStackTrace(); // Handle exceptions appropriately
        }
    }

    private static void playRound(Scanner scanner) {
        String[] rps = {ROCK, PAPER, SCISSORS};
        String computerMove = rps[new Random().nextInt(rps.length)];

        String playerMove;

        while (true) {
            System.out.println("Please enter your move (r, p, or s)");
            playerMove = scanner.nextLine().toLowerCase();

            if (isValidMove(playerMove)) {
                break;
            }

            System.out.println(playerMove + " is not a valid move.");
        }

        System.out.println("Computer played: " + computerMove);
        determineWinner(playerMove, computerMove);
    }

    private static boolean isValidMove(String move) {
        return move.equals(ROCK) || move.equals(PAPER) || move.equals(SCISSORS);
    }

    private static void determineWinner(String playerMove, String computerMove) {
        if (playerMove.equals(computerMove)) {
            System.out.println("The game was a tie!");
        } else if ((playerMove.equals(ROCK) && computerMove.equals(SCISSORS)) ||
                   (playerMove.equals(PAPER) && computerMove.equals(ROCK)) ||
                   (playerMove.equals(SCISSORS) && computerMove.equals(PAPER))) {
            System.out.println("You win!");
        } else {
            System.out.println("You lose!");
        }
    }
}

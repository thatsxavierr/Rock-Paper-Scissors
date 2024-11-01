/*REXX*/
say "Welcome to the Rock-Paper-Scissors Game!"

call initializeGame


do while game.rounds.played < 5
    say "Type 'ROCK', 'PAPER', or 'SCISSORS' to make your move."
    say "Type 'QUIT' to end the game.";
    pull playerChoice
    playerChoice = strip(playerChoice)
    playerChoice = translate(playerChoice)

    if playerChoice = 'QUIT' then leave

    if playerChoice \= 'ROCK' &,
       playerChoice \= 'PAPER' &,
       playerChoice \= 'SCISSORS' then do
        say 'Player choice is:' playerChoice
        say 'Invalid choice. Please try again.'
        iterate
    end
    game.rounds.played = game.rounds.played + 1


    say 'Player choice is:' playerChoice
    call getComputerChoice

    call determineWinner playerChoice computerChoice
    call displayScore

    if game.rounds.played = 5 then leave
end

call endGameSummary
exit


initializeGame:
    game.score.player = 0
    game.score.computer = 0
    game.score.draws = 0
    game.rounds.played = 0
    return


getComputerChoice:
    choiceNum = random(1, 3)
    select
        when choiceNum = 1 then computerChoice = 'ROCK'
        when choiceNum = 2 then computerChoice = 'PAPER'
        otherwise computerChoice = 'SCISSORS'
    end
    say 'Computer chose' computerChoice'.'
    return


determineWinner:
    parse arg playerChoice computerChoice
    if playerChoice = computerChoice then do
        say "It's a draw!"
        game.score.draws = game.score.draws + 1
    end
    else if (playerChoice = 'ROCK' & computerChoice = 'SCISSORS') |,
        (playerChoice = 'SCISSORS' & computerChoice = 'PAPER') |,
        (playerChoice = 'PAPER' & computerChoice = 'ROCK') then do
        say 'You win this round!'
        game.score.player = game.score.player + 1
    end
    else do
        say 'You lose this round!'
        game.score.computer = game.score.computer + 1
    end
    return


displayScore:
    say 'Current Score: Player -' game.score.player ',',
    'Computer -' game.score.computer ', Draws -' game.score.draws
    return


endGameSummary:
    say 'All the rounds are over.'
    say 'Total rounds played:' game.rounds.played
    say 'Final Score: Player -' game.score.player,
    ', Computer -' game.score.computer ', Draws -' game.score.draws
    say 'Thank you for playing!'
    return
    

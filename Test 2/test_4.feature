Feature: If a player do a high score similar to one that is already in the board does both of them stay on the board ?
    This test is to test if when a player does a same high score with a high score that is already in the board, the program keeps both high scores
    
Background: There are already some high scores in the table 

Scenario: a player scores a high score A which is the same as scoreB
    Given that the scoreB is already in the high score table
    When scoreA is going to be put in the table
    Then scoreA should not replace scoreB
    But scoreA should be placed bellow scoreB (respect to the player who did that score first)
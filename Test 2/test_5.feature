Feature: A negative score should not be inputed in the board

Background: Given that there is a high score table

Scenario: The server receive a request to insert in the high score board one negative score
    Given That all the scores have to be possitive 
    When A negative score appears
    Then the system should print a error message 
    And erase the score
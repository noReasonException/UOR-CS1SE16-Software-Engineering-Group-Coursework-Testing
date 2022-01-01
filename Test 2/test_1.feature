Feature : Did the high score actually passed in the high score board
  This test is to see if the high score was added to the board

  Scenario: A playerA did a high score
    Given that these score should be in the high score board
    When someone is looking in the high score board
    Then the score of the playerA should be visible


    

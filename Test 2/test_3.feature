Feature : Checking if the order of the score board is correct
    The purpose of this test is too check if every score that was passed
    was placed in the correct order
# This is just a double check for if all the scores are placed in the correct position.
#The first test been in the test_2 file (Scenario: A high score was placed in the correct position)

Background:There are some scores in the high score board


Scenario: a person is looking in the high score table
  Given All the high scores are placed in the correct
  When This person is looking at each high score separately
  Then it should see that every test is above a lower score
  And every test is below a higher score 
  And or equal with the score above or below

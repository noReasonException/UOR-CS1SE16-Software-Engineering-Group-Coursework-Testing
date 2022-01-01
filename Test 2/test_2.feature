Feature: Did the high score passed correctly


  The test here is to see if when a new high score is added, that
  high score goes in to the right position and in the right name

Background: There already some high scores in the table
                And there are no same high scores

#A first test in these feature
Scenario: A high score was placed in the correct position
  Given a person did a scoreA
  When that scoreA is a high score
  Then scoreA should be placed between a score which is higher from scoreA
  And between score which is lower from scoreA

#A second test in these feature
Scenario: A person did a high score(when his name is not in the table)
  Given that his name is not in the table yet
  When he is doing a high score
  Then his score should be placed in the correct position
  And a new name should appeared in the high score board

#A third test in these feature
Scenario: A person did a high score(when his name is on the table)
  Given that his name is on the table
  When he is doing a high score
  Then his score should be placed in the correct position
  And his previous score should be removed

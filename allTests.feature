#Tests
#Validation Tests
#Test 1 (Tests for a valid/invalid login attempts)
Feature: Test theuser-login procedure under normal circumstances (Validation Tests) 

#This test reflects and tries to discover various problems due to normal user-login procedure 

Background: There are already deployed and functional database , 
exposed by a single interface , a method named .attemtLogin(usrname,passwd). This method accepts two mandatory parameters 

#param usrname: The users name
#param passwd: The hashed password (The hashing algorithm is not yet specified)
            

#This is a typical first test , is not a very useful one , because 
#"tests can only reveal errors , not to prove their absence" . However we need to check every time this procedure, 
#to avoid a "whack-a-mole" situations (fixing or changing a part of our code, breaks other parts of our system)


Scenario: The user gives all the nessesary credentials , who perfectly qualify the credentials filters(@see scenario 2)
    Given @param usrname : The users name
        And password The password given by user
        And Theese credentials is already exist in our database
        And System preconditions allows a normal log-in operation to be completed(Network connection , Availabillity , etc(@See scenario 3))
    When The user clicks the "log in" button
    Then The given password needs to be hashed , and the .attemtLogin(usr,pass) needs to be called, 	
        And The .attemtLogin(usr,pass) needs to return "success" and the test is success
	
#(Def1)We define a user credential , any evidence for the identity of the user , such as username or #password

#(Det1)In our system , The user confirms his identity given a combination of credentials , their username #and ther personal password

#(Def 2)We define as"credential filter" a condition that a user credential needs to be qualify , #in order to be secure enough , in order our system to maintain its integrity

#(Exp1)For example , a password credential filter may be "A password needs to have at least 2 #LowerCase symbols , 3 UpperCase , 4 Numbers , and qualify under a simple dictionary test"

#(Def3)We define as dictionary test , a credential analysis that proves that there are no common #words inside a password (that makes the guess easier)

#(Exp2)The password “catsAreFunny”  it will fail a credential tests , but the “A98j2qe” not

#(Note): This test is performed on server , we cannot trust the client to do that for obvious security #reasons 
Scenario: The user gives their credentials , but they fail on our credential filters (The exact 	credential filters remain a abstract mechanism , we can apply all of them as test without 	knowing exactly their operation (example through a Credentials static class))
    Given the name and the password of the user
    When The user clicks the "login button"
    Then The credentials are sent into our server(calling the API), but before our service actually calls the .attemptLogin(usr,passd) we need to check for the filters , The 			result of the call needs to be FAIL in order to succeed the test
	
#(Def 4)We define as “System Preconditions” the conditions that are need to be fullfilled in order a #smooth #log in procedure to take place , Examples are : Network connection of the client , #Available #Bandwidth of our server , Backend service availabilliy etc < br />

Scenario: System preconditions for a smooth log-in procedure are non existent
    Given The username and the password
    When The user clicks"log in" 
    Then The client sends a request to our service , after a fixed amount of time ,
        And if the service hasnt respond or has responded anything else than <SUCCESS>
        And The client needs to handle it appropiately, informing the user with some a brief error description .
        And If the handling is okay and nothing bad happends as the result of the service un-availabillity (such as the client crashes) 
        And the test is successfull



#Test 2 (Tests for adding a new high score entry)

Feature : Did the high score actually passed in the high score board
  This test is to see if the high score was added to the board

  Scenario: A playerA did a high score
    Given that these score should be in the high score board
    When someone is looking in the high score board
    Then the score of the playerA should be visible
    
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

Feature : Checking if the order of the score board is correct
    The purpose of this test is too check if every score that was passed
    was placed in the correct order
 #This is just a double check for if all the scores are placed in the correct position.
 #The first test been in the test_2 file (Scenario: A high score was placed in the correct position)

Background:There are some scores in the high score board


Scenario: a person is looking in the high score table
  Given All the high scores are placed in the correct
  When This person is looking at each high score separately
  Then it should see that every test is above a lower score
    And every test is below a higher score 
    And or equal with the score above or below
  
  Feature: If a player do a high score similar to one that is already in the board does both of them stay on the board ?
    This test is to test if when a player does a same high score with a high score that is already in the board, the program keeps both high scores
    
Background: There are already some high scores in the table 

Scenario: a player scores a high score A which is the same as scoreB
    Given that the scoreB is already in the high score table
    When scoreA is going to be put in the table
    Then scoreA should not replace scoreB
    And scoreA should be placed bellow scoreB (respect to the player who did that score first)



##### Test 3 (Tests for sanitising user entered text)
Feature: Sanitising user-entered text
	Given User cannot enter a text that can cause a system to crush
	    And a text that insult another user
	    And a text that is of inappropriate lengths
		
Background: Provided that there is already a text box that works as the requirements ask

#The first test is intended to avoid unnecessary errors due to a complicated symbol inserted by a user
Scenario: User enters text in unicode symbols
    Given User is asked to enter a text answer
    When User enters a text with <Unicode Symbol>
        And User submits the answer
    Then System should prevent this answer from being submitted
        And User should see [Invalid text]
        And User should be redirected to enter text again


Examples:
|   Unicode Symbols     |
|   åß∂ƒ©˙∆˚¬…æ	        |
|     œ∑´®†¥¨ˆøπ“‘   	|
|   ¡™£¢∞§¶•ªº–≠    	|
|	¸˛Ç◊ı˜Â¯˘¿      |
|    ÅÍÎÏ˝ÓÔÒÚÆ        |    
|       Œ„´‰ˇÁ¨ˆØ∏”’    |
|   `⁄€‹›ﬁﬂ‡°·‚—±       |
|	⅛⅜⅝⅞            |
|    ЁЂЃЄЅІЇЈЉЊЋЌЍЎЏ	|
|    АБВГДЕЖЗИЙКЛМНО	|
|    ПРСТУФХЦЧШЩЪЫЬЭ	|
|    ЮЯабвгдежзийклм	|
|    нопрстуфхцчшщъы	|
|	ьэюя	        |
|	٠١٢٣٤٥٦٧٨٩      |

#The second test allowes user to enter only numbers and to sanitize any punctuation signs the user might have inserted
Scenario: User enters numbers containing ASCII Punctuation
    Given User is asked to enter some numeric answer
    When User enters number containing <ASCII Punctuation>
    Then <ASCII Punctuation> should be banned by the system
        And <ASCII Punctuation> should not appear in the imputes window

Examples:
|  ASCII Punctuation  |
|		,		|
|		.		|
|		/		|
|		;		|
|		'		|
|		[		|
|		]		|
|		\		|
|                  -            |
|		=		|
|		<		|
|		>		|
|		?		|
|		:		|
|		“		|
|		{		|
|		}		|
|		|		|
|		_		|
|		+		|
|		!		|
|		@		|
|		#		|
|		$		|
|		%		|
|		^		|
|		&		|
|		*		|
|		(		|
|		)		|
|		`		|
|		~		|

#The next test sanitize the users' speech during a chat in the chat room. 
#As our main auditory is going to be students therefore it's essential not to 
# let them use rude vocabulary and insult each other.
Scenario: User is chatting in the in-line chat/forum facility and uses rude words
    Given Users 1 and 2 are in the forum chat
    When User 1 enters <Bad Word>
        And User1 sends it to User 2
    Then System should stop the User 1 message from sending
        And User 1 should see [Rude vocabulary is not allowed in this chat]

Examples:
|           Bad Word		    |
|     really bad word		    |
|     terribly bad word		    |
|     extremely bad word	    |
|     tremendously bad word	    |
|     highly bad word		    |
|     exceedingly bad word	    |
|     awfully bad word		    |
|     extraordinarily bad word      |
|     exceptionally bad word    	|
|     incredibly bad word	    |
|     very bad word                 |
|     severely bad word             |
|     particularly bad word	    |
|     unusually bad word	    |
|     intensely bad word	    |
|     enormously bad word	    |
|     uncommonly bad word	    |
|     utterly bad word		    |

#The las test sanitize the lengths of the inserted text as it might also 
#crash the system
Scenario: User enters more characters than is allowed
    Given User is asked to provide an answer of lengths = 10 characters
    When User enters a text of lengths > 10 characters
        And User submits the answer
    Then System should prevent this answer from being submitted
        And User should see [Text exceeds the allowed lengths. The allowed lengths is 10 characters]
        And User should be redirected to enter text again

#### Defect Tests
##### Test 1 (Tests for a valid/invalid login attempts)
Feature: These are test to exploit any defects(Defect testing)

Background: There are already deployed and functional database , exposed by an service.
 And This service cals the given interface , a method named .attemtLogin(usrname,passwd).
 And This method accepts two mandatory parameters.

#@param usrname The users name

#@param passwd  The hashed password (The hashing algorithm is not yet specified)


  # Parametrised test using the “Big List of Naugthy Strings”
  # We define as Security Credentials Filters any filter that ensures that the given credential is not 
  # suspect to known code-injection attacks(Sql-Injection , XSS Attack , etc)

Scenario: A user enters their credentials(username,password)
Given suspect name and password of the user
    And System preconditions allows a smooth log-in procedure
When The user clicks "log-in"
Then The service applies the filters on the suspect user-input 
    And If the service returns "failed" then the test is successful 
    And if we have any side effects , then the test is non-successfull

 #(we can easily write a schema-verifier to test the database if the schema is maintained after the return of the API)

 #Bruteforce test 
 #We define the maximum connection limit(MCL) as the maximum number of attempts in a 
 #particular unit of time that the user can is allowed to try to perform an operation. After that number 
 #we declare that this user attemts are malicious and performed by some kind of robot.
 #For maximum security , these attemts are per user , and NOT per I.P 
 #This approach also protects from probabillistic-typed attacks (Birthday Attack, etc) 

Scenario: A user enters their credentials (username,password)
    Given name and password of the user
        And System preconditions allows a smooth log-in procedure
    When The user clicks "log-in"
    Then  If the MCL is bigger that the allowed value , then the service must return fail 
        And If thats the case , our test is successful


##### Test 2 (Tests for adding a new high score entry)
Feature: A negative score should not be inputed in the board

Background: Given that there is a high score table

Scenario: The server receive a request to insert in the high score board one negative score
    Given That all the scores have to be possitive 
    When A negative score appears
    Then the system should print a error message 
        And erase the score
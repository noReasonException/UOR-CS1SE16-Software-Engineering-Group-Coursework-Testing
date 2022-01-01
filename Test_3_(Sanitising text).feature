Feature: Sanitising user-entered text
	Given User cannot enter a text that can cause a system to crush
	And a text that insult another user
	And a text that is of inappropriate lengths
		
Background: Provided that there is already a text box that works as the requirements ask

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
|	¸˛Ç◊ı˜Â¯˘¿	|
|       ÅÍÎÏ˝ÓÔÒÚÆ☃    |
|       Œ„´‰ˇÁ¨ˆØ∏”’    |
|   `⁄€‹›ﬁﬂ‡°·‚—±       |
|	⅛⅜⅝⅞    	|
|    ЁЂЃЄЅІЇЈЉЊЋЌЍЎЏ	|
|    АБВГДЕЖЗИЙКЛМНО	|
|    ПРСТУФХЦЧШЩЪЫЬЭ	|
|    ЮЯабвгдежзийклм	|
|    нопрстуфхцчшщъы	|
|	ьэюя	    	|
|	٠١٢٣٤٥٦٧٨٩      |


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
|    		-		|
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


Scenario: User is chatting in the in-line chat/forum facility and uses rude words
    Given Users 1 and 2 are in the forum chat
    When User 1 enters <Bad Word>
    And User1 sends it to User 2
    Then System should stop the User 1 message from sending
    And User 1 should see [Rude vocabulary is not allowed in this chat]

Examples:
|           Bad Word		|
|     really bad word		|
|     terribly bad word		|
|     extremely bad word	|
|     tremendously bad word	|
|     highly bad word		|
|     exceedingly bad word	|
|     awfully bad word		|
|     extraordinarily bad word	|
|     exceptionally bad word	|
|     incredibly bad word	|
|     very bad word		|
|     severely bad word         |
|     particularly bad word	|
|     unusually bad word	|
|     intensely bad word	|
|     enormously bad word	|
|     uncommonly bad word	|
|     utterly bad word		|


Scenario: User enters more characters than is allowed
    Given User is asked to provide an answer of lengths = 10 characters
    When User enters a text of lengths > 10 characters
    And User submits the answer
    Then System should prevent this answer from being submitted
    And User should see [Text exceeds the allowed lengths. The allowed lengths is 10 characters]
    And User should be redirected to enter text again
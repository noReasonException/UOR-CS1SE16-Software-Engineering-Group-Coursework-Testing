Feature: Test theuser-login procedure under normal circumstances (Validation Tests)

	This test reflects and tries to discover various problems due to normal user-login procedure

	Background:There are already deployed and functional database , exposed by a single 	interface , a method named .attemtLogin(usrname,passwd) . This method accepts two 	mandatory parameters 
		@param usrname : The users name
		@param passwd   : The hashed password (The hashing algorithm is not yet specified)
            

#This is a typical first test , is not a very useful one , because <<tests can only reveal errors , not to #prove their absence>> . However we need to check every time this procedure , to avoid a #<<whack-a-mole>> situation (fixing or changing a part of our code , breaks other parts of our #system)

Scenario: The user gives all the nessesary credentials , who perfectly qualify the credentials filters(@see scenario 2)
  Given : @param usrname : The users name
  AND  : password  : The password given by user
  AND  : Theese credentials is already exist in our database
  AND  : System preconditions allows a normal log-in operation to be 						completed(Network connection , Availabillity , etc(@See scenario 3))
  When : The user clicks the <<log in>> button
  Then  :The given password needs to be hashed , and the .attemtLogin(usr,pass) needs to be called, 	
		the .attemtLogin(usr,pass) needs to return <<success>> and the test is success
	



#(Def1)We define a user credential , any evidence for the identity of the user , such as username or #password

#(Det1)In our system , The user confirms his identity given a combination of credentials , their username #and ther personal password

#(Def 2)We define as <<credential filter>> a condition that a user credential needs to be qualify , #in order to be secure enough , in order our system to maintain its integrity

#(Exp1)For example , a password credential filter may be <<A password needs to have at least 2 #LowerCase symbols , 3 UpperCase , 4 Numbers , and qualify under a simple dictionary test

#(Def3)We define as dictionary test , a credential analysis that proves that there are no common #words inside a password (that makes the guess easier)

#(Exp2) , The password “catsAreFunny”  it will fail a credential tests , but the “A98j2qe” not

#(Note) : This test is performed on server , we cannot trust the client to do that for obvious security #reasons
Scenario: The user gives their credentials , but they fail on our credential filters (The exact 	credential filters remain a abstract mechanism , we can apply all of them as test without 	knowing exactly their operation (example through a Credentials static class))
 	
	Given :the name and the password of the user
  	When :The user clicks the <<login button>>
  	Then   :The credentials are sent into our server(calling the API), but before our service 			actually calls the .attemptLogin(usr,passd) we need to check for the filters , The 			result of the call needs to be FAIL in order to succeed the test
	


#(Def 4)We define as “System Preconditions” the conditions that are need to be fullfilled in order a #smooth #log in procedure to take place , Examples are : Network connection of the client , #Available #Bandwidth of our server , Backend service availabilliy etc

Scenario:System preconditions for a smooth log-in procedure are non existent
  Given : The username and the password
  When : The user clicks <<log in>> 
  Then  : The client sends a request to our service , after a fixed amount of time , if the service hasnt 		respond , or has responded anything else than <<SUCCESS>> the client needs to 		handle it appropiately , informing the user with some a brief error description . If the 
		handling is okay and nothing bad happends as the result of the service un-			availabillity (such as the client crashes) the test is successfull



## Feature : These are test to exploit any defects(Defect testing)

### Background:
1. There are already deployed and functional database , exposed by an service.

2. This service cals the given interface , a method named .attemtLogin(usrname,passwd).

3. This method accepts two mandatory parameters.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@param usrname : The users name

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;@param passwd   : The hashed password (The hashing algorithm is not yet specified)


####  #Parametrised test using the “Big List of Naugthy Strings”
  # We define as Security Credentials Filters any filter that ensures that the given credential is not 
  # suspect to known code-injection attacks(Sql-Injection , XSS Attack , etc)
  
  
  <div style="text-align:center"> <img src ="https://csgitlab.reading.ac.uk/SoftwareEngineering_2018-19/Coursework3-Testing/Iota/Testing/raw/a1a79078fd1642fb00a55310f18f66a25067ffd9/Test1/exploits_of_a_mom.png" /></div>
  
  
Scenario: A user enters their credentials(username,password)
  
Given: suspect name and password of the user
    
AND : System preconditions allows a smooth log-in procedure
	   
When : The user clicks <<log-in>>
    
Then  :The service applies the filters on the suspect user-input .
If the service returns <<failed>> then the test is successful , if we have any side effects , then the test is non-successfull
(we can easily write a schema-verifier to test the database if the schema is 		maintained after the return of the API)

#Bruteforce test 
#We define the maximum connection limit(MCL) as the maximum number of attempts in a #particular unit of time that the user can is allowed to try to perform an operation. After that number #we declare that this user attemts are malicious and performed by some kind of robot.
#For maximum security , these attemts are per user , and NOT per I.P 
#This approach also protects from probabillistic-typed attacks (Birthday Attack, etc) 
Scenario : A user enters their credentials (username,password)
	Given : name and password of the user
	AND  : System preconditions allows a smooth log-in procedure
	
	When : The user clicks <<log-in>>
	Then  :  If the MCL is bigger that the allowed value , then the service must return fail . If 			thats the case , our test is successful


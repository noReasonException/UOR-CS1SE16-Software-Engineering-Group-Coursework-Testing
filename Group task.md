# Test plan and the importance of Testing

## Introduction 
Driving and maintaining quality is essential within software engineering. In
order to check quality levels, there are several methodologies, which serve their
own unique and important purpose. One of the tools used to enhance quality
and check if the product is functioning as per client’s requirements is testing.
This can be done is many ways in order to check that the product is meeting quality
standards and is bug free. Testing will highlight any issues with the software
allowing developers to resolve the issues whilst developing the software
(development testing) and after the initial development. The following quality 
plan encompasses a product plan highlighting what processes are to be used to
drive quality, a detailed process descriptions including quality plans and
identification of risk and contingencies in place. As per requirement some test 
cases and test examples outlining issues and test case scenarios using gherkin 
code have been provided.

 
 
## Product plans
The product plan needs to be as much realistic as possible (Due to deadlines, and various rules of the contract), according to the real-world scenarios. 
We need be efficient and to ensure our main aims are achieved. Firstly, we need to create a detailed sequence diagram for our project,
and starting from this, describe the internal processes that the user will encounter. 
This, of course, affects the testing procedure because the parts that our user encounters first, 
tends to have more validation tests.This user-experience first approach comes in line with our quality goals (see below).
Definitely, as the analysis progresses, the order, in which our product is developed, is also affected because of the dependencies 
of each system as well as every subsystem priority. Firstly, we would need to figure out what the dependencies of each of the 
elements are, possibly creating a dependency graph. 
As an example, with the aforementioned plan, the first part of the process which needs to be completed first is the login system, 
the menu subsystem and vice versa. Every system will have a priority based on the user-experience sequence diagram, 
and then will be analyzed to its fundamentals elements. The dependencies will determine the priority of each element and vice versa.



## Process descriptions 
The reasons behind the selection of the proper testing development method to be used in our project, were mainly the consideration and target of our ultimate goal,to achieve Validation and Verification (V&V) confidence.
The most efficient by means of time and productivity method in order to develop our solution
is the Test Driven Development (TDD). We will have a “Test-first” policy on our tasks, using a short-time development period 
per feature (“Agile-Style”). Every period will end by testing everything (From individual methods of a class up to Sub-System testing).
In order to have a efficient and (whatever it is possible) bug-free solution, we need to split our system into simple and testable** components, avoiding over-complicated designs. Tests need to exist everywhere. From every method, to every class, to every subsystem 
and finally to every exposed API to other subsystems (using mocks with some framework, such as mockito).
Every Testable unit*** will be tested using both static and dynamic testing. A dedicated Quality Assurance (QA) team will have the task of analyzing 
statically every element of the staged project until now and propose possibly breaks or bugs. The elements of the project is not, 
of course, only the code. Static analysis can be applied to almost anything relating to a actual product (requirements, code, Object Oriented Programming (OOP)**** design, configuration and deploy scripts and even database schema). Dynamic testing will be performed minor by QA team, 
but mainly by every individual developer. Our policy will enforce some kind of test framework (for example J Unit) with automated tests in order to ensure that every time the automated tests will run, detecting problems as soon as possible and possibly reducing costs to minimum*****.

** Over complicated design with a lot of dependencies and high object-coupling tends to make the testing process harder

*** Everything is a testable unit , from the simplest method to the most complete subsystems

**** Here is focused on the Object Oriented design

***** Detecting bugs earlier, means less systems depend on this code. As a consequence of it, less hours (time=money) will spent on the solving this issue.

![Trelo pictures](https://csgitlab.reading.ac.uk/SoftwareEngineering_2018-19/Coursework3-Testing/Iota/Testing/raw/master/Pictures/Screenshot%20from%202019-02-17%2008-55-33.png)
![Trelo pictures](https://csgitlab.reading.ac.uk/SoftwareEngineering_2018-19/Coursework3-Testing/Iota/Testing/raw/master/Pictures/Screenshot%20from%202019-02-17%2008-55-38.png)
![Trelo pictures](https://csgitlab.reading.ac.uk/SoftwareEngineering_2018-19/Coursework3-Testing/Iota/Testing/raw/master/Pictures/Screenshot%20from%202019-02-17%2008-55-44.png)

As you can see in the pictures we used Trello to organize the task that each member took and the time allocated for each task.The GoogleDocs link is added for a refference to our discussion from the meeting.



## Tests
The gherkin code of both defect and validations tests can be found [here](https://csgitlab.reading.ac.uk/SoftwareEngineering_2018-19/Coursework3-Testing/Iota/Testing/blob/master/allTests.feature)
        

## Quality goals
Generally the V&V confidence are our ultimate goal. But our goals must be realistic and also ethically correct**. 
Finding the best balance assures the best quality possible of the product, as well as our company’s reputation. 
Ethically and ideally our product must be bug-free, meeting every client expectations, even those that our client doesn’t know they wanted.
In real world this is not achievable. Every project comes with a contract and this contract has some deadlines.
This leaves us with no choice other than to adapt in this real-world environment. This means that we need to adjust our development on the early stages, 
using a good testing plan, emphasizing on validation tests and user-cases rather than defect testing. Of course this is only an "emphasize".
Testing for defects is important, but at the early stages with the deadlines approaching
the validation testing needs to be our priority. When we release our first complete version we can catch up with updates and patches later.
Secondly, a good design of the system is flexibility as it is essential in order to have good maintainability. 
Fulfilling this two goals at the very beginning of our project ensures that this project will be viable and possible.
So our "real-world" goals finally at first, the contract and the user expectations will met as soon as possible, 
with the best-possible quality for our contract deadlines and secondly a good and flexible design in order the maintaining process in the near future will achieve strong V&V.

** Ethically correct is the software that is tested and well coded, and as complete as possible. We can't deliver something to our client without basic testing or without a basic security layer.


## Risks
A risk is defined as ‘Future uncertain events with a probability of occurrence
and a potential loss’. In Software development tasks, it is crucial that we
identify all the possible risks associated with the product so the program meets
the desired requirements and we can create a smooth user experience for the 
client. Risks are split up into two categories product and project risks. The 
product risks concern the risks posed by the system we are producing, the test
object. Whilst the project risk relates to activities that can delay the progress
of the project; it can be due to management issues or even time constraints.

|Risk Identification        |Risk Assesment             |Risk Mitigation            |
|---------------------------|---------------------------|---------------------------|
|Data Integrity Corruption/ Security Breach/ Bugs|If the integrity of the data is compromised, it puts the reliability of the system at risk. This poses a large problem as we could potentially put the sensitive information of our clients at risk. This could mean we face legal issues and a huge monetary loss. Finding bugs in the system can extend the length of the project meaning the system may not be delivered to the client on time.|To mitigate this issue, we need to make sure the data is attributable and legible, so it is easily understood, and the creator of the data is known. We also need to make sure that we have a constant back-up cycle; keeping multiple versions of the data. Computer systems must be compliant with the recognised industry standards. We need to make sure sensitive information is protected and have an active team who are able to identify suspicious behaviour in the software.|
|Weak Management|A weak management team can greatly impact the progression of the project. Issues can trickle from the top down to the employees and negatively affect their operations. It doesn’t present the company in a good light and makes them look unprofessional, this could deter clients in the future which results in a loss of money for the company.|To avoid this, we must make sure that the communication between all members of the team as well as the clients is clear and that the goals of the project are understood. All members if the leadership team should have the correct qualifications to guide the project in the right direction. It is also essential to make sure that the role of each member is defined for future reference, everyone knows who is responsible for specific issues.|
|Tight testing schedule|Having a tight testing schedule could mean that the tests conducted are not thorough enough as they are trying to meet tight deadlines which results in a rushed testing process. This leads to unresolved bug which could potentially run up the costs of the whole project. It could also mean that we don’t have enough time to fix the bugs effectively.|To combat this issue, we need to make sure a realistic plan is defined at the start of the project with realistic goals. This can be done using a Product Breakdown Structure or a Gannt Chart.  The Product Breakdown Structure is effective as it is an easy way to see step-by-step what needs to be completed and from there, you can clearly work towards the deliverables.|
|Budget misestimation|This is a dangerous issue because if we under-estimate the budget, we may be in a situation where we are having to compromise the level of security we can implement on the program and it could also mean that we will not have enough resources to aid us with our testing as it will take us over our maximum budget spend. A lack of resources means our testing will not be that extensive and will probably lead to an unreliable system.|To overcome this, we need to create a detailed budget plan which highlights the areas where our budget expenditure will be the highest. Through this, we will be able to manage our remaining budget more effectively. We must also make sure that everything being bought is necessary for the project to succeed as opposed to something that we want but is not essential.|
|New features affecting multiple areas of the system|As a result of this, we can get emergent properties from the computer system. This can affect the reliability of the system and can make the system extremely difficult to repair as it will be hard to find the actual root of the issue. It also effects the usability of the system|We can create an isolated system for testing to prevent the data on the system from being damaged. This means that if one part is corrupt, it wont effect the rest of the system.|  
|Unrealistic testing environments|Having unrealistic test environments means that the tests we are carrying out are invalid as they don’t meet the specifications of the actual project. This will delay the release of the product as the bugs and errors will remain.|To avoid this, we need to make sure the testing team and the team of developers work closely together so the testing environments can be as close as possible to the actual software.|



## References
[https://docs.cucumber.io/gherkin/reference/](https://docs.cucumber.io/gherkin/reference/)

[https://docs.cucumber.io/gherkin/reference/#steps](https://docs.cucumber.io/gherkin/reference/#steps)

[https://docs.google.com/document/d/161u59QGZyeHLaQWf-IlGn94Vb5M5bTHLTYWFRhG132s/edit?usp=sharing](https://docs.google.com/document/d/161u59QGZyeHLaQWf-IlGn94Vb5M5bTHLTYWFRhG132s/edit?usp=sharing)

[https://github.com/minimaxir/big-list-of-naughty-strings/blob/master/blns.txt](https://github.com/minimaxir/big-list-of-naughty-strings/blob/master/blns.txt)

Parslow, P. (2018). Testing. [PowerPoint presentation]. SE1SE11-Software Engineering.<br />
<br />
Sommerville, I. (2015). Software Enginnering. 10th edition. pp. 226-249.

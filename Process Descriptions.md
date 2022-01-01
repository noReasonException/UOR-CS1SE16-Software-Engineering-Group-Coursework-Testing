The reasons behind the selection of the proper testing development method to be used in our project, were mainly the consideration and target of our ultimate goal,to achieve V&V confidence
The most efficient by means of time and productivity method in order to develop our solution
is the TDD(Test Driven Development). We will have a “Test-first” policy on our tasks , using a short-time development period per feature(“Agile-Style”). Every period will end by testing everything(From individual methods of a class up to Sub-System testing) .
In order to have a efficient and (whatever it is possible) bug-free solution , we need to split our system into simple and testable* components, avoiding over-complicated designs. Tests need to exist everywhere. From every method , to every class , to every subsystem and finally to every exposed API to other subsystems (using mocks with some framework , such as mockito)
Every Testable unit* will tested using both static and dynamic testing . A dedicated QA* team will have the task of analyzing statically every element of the staged project until now and propose possibly breaks or bugs. The elements of the project is not of course only the code . Static analysis can be applied to almost anything relating to a actual product (requirements , code , OOP* design,configuration and deploy scripts and even database schema).Dynamic testing will performed minor by QA team , but mainly by every individual developer. Our policy will enforce some kind of test framework(for example J Unit) with automated tests in order to ensure that every time the automated tests will run , detecting problems as soon as possible and possibly reducing costs to minimum*.
 
 
*Over complicated design with a lot of dependencies and high object-coupling tends to make the testing process harder

*Everything is a testable unit , from the simplest method to the most complete subsystems

*Quality Assurance

*Object Oriented Programming(here is focused on the Object Oriented design)

*Detecting bugs earlier , means less systems depend on this code . As a consequence of it , less hours(time=money) will spent on the solving this issue

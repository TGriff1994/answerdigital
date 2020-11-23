@standard @login
Feature: Login

Background:
	
	#access the login section
	Given I open chrome with URL "http://the-internet.herokuapp.com/"
	When I click the element with xpath "/html/body/div[2]/div/ul/li[21]/a"
 	Then the current URL is "http://the-internet.herokuapp.com/login"	

Scenario Outline: test
	
	#enter details
	When I enter "<username>" into the element with id "username"
	And I enter "<password>" into the element with id "password"
	And I click the element with xpath "/html/body/div[2]/div/div/form/button"
	
	#verify output
	Then the element with id "flash" has text "<message>" between characters 0 and <length>
	And the current URL is "<URL>"
	When <Logout>
	Then the current URL is "http://the-internet.herokuapp.com/login"
	And I end scenario

Examples:
	| test			| username	| password				| message						| URL										|length	| Logout														|
	| WrongUserName	| tomjones	| SuperSecretPassword!	| Your username is invalid!		| http://the-internet.herokuapp.com/login	|25		| NULL															|
	| WrongPassword	| tomsmith	| SuperSecretUsername!	| Your password is invalid!		| http://the-internet.herokuapp.com/login	|25		| NULL															|
	| Correct		| tomsmith	| SuperSecretPassword!	| You logged into a secure area!| http://the-internet.herokuapp.com/secure	|30		| I click the element with xpath "/html/body/div[2]/div/div/a"	|




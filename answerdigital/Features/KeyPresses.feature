@standard @press
Feature: KeyPress

Scenario: KeyPress

	
	#access the KeyPress section
	Given I open chrome with URL "http://the-internet.herokuapp.com/"
	When I click the element with xpath "/html/body/div[2]/div/ul/li[31]/a"
 	Then the current URL is "http://the-internet.herokuapp.com/key_presses"
 	
 	#key press 1
 	When I enter "A" into the element with id "target"
 	Then the element with id "result" is "You entered: A"
 	
 	#key press 2
 	When I enter "i" into the element with id "target"
 	Then the element with id "result" is "You entered: I"
 	
 	#key press 3
 	When I press SHIFT to the element with id "target"
 	Then the element with id "result" is "You entered: SHIFT"
 	
 	#key press 4
 	When I press CONTROL to the element with id "target"
 	Then the element with id "result" is "You entered: CONTROL"
 	
 	And I end scenario
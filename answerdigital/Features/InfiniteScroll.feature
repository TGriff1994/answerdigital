@standard @scroll
Feature: InfiniteScroll

 
 Scenario: InfiniteScroll
 	
 	
 	#access the infinite scroll section
 	Given I open chrome with URL "http://the-internet.herokuapp.com/"
	When I click the element with xpath "/html/body/div[2]/div/ul/li[26]/a"
 	Then the current URL is "http://the-internet.herokuapp.com/infinite_scroll"
 	
 	#scroll to bottom of page twice and then scroll to top
 	And I wait 2000 	 	
 	When I scroll to bottom
 	And I wait 2000
 	And I scroll to bottom
 	And I wait 2000
 	And I scroll to top
 	
 	#assert "Infinite Scroll" text
 	Then the element with xpath "/html/body/div[2]/div/div/h3" is "Infinite Scroll"
 	
 	And I end scenario
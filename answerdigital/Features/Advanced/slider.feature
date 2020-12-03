@advanced @slider
Feature: Slider
#this scenario fails as there seems to be a problem when you make changes in the catalog section. It will continuously load and never update.
Scenario: Slider

Given I open chrome with URL "http://automationpractice.com/index.php"
	
	Then the element with id "block_top_menu" is visible
	
	
	When I hover over element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a"
	
	Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul" is visible
	And I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a"
	And the current URL is "http://automationpractice.com/index.php?id_category=11&controller=category"
	
	When I press LEFT 75 times to the element with xpath "/html/body/div/div[2]/div/div[3]/div[1]/div[1]/div[1]/form/div/div[9]/ul/div/div/a[2]"
	
	
	#check that the element has finished loading
	Then the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/p" is not visible
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li/div/div[2]/div[1]/span[1]" is "$16.40"
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li[2]" is not visible
	
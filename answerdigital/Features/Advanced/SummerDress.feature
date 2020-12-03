@advanced @summer
Feature: Summer Dress

Scenario Outline: Summer Dress

	Given I open chrome with URL "http://automationpractice.com/index.php"
	
	Then the element with id "block_top_menu" is visible
	And the element with xpath <HoverXpath> is <HoverName>
	
	When I hover over element with xpath <HoverXpath>
	
	Then the element with xpath <navigation> is visible
	And I click the element with xpath <summer>
	And the current URL is "http://automationpractice.com/index.php?id_category=11&controller=category"
	
	#verify that there are only 3 summer dressses
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li[1]" is visible
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li[1]/div/div[2]/h5/a" is "Printed Summer Dress"
	
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li[2]" is visible
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li[2]/div/div[2]/h5/a" is "Printed Summer Dress"
	
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li[3]" is visible
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li[3]/div/div[2]/h5/a" is "Printed Chiffon Dress"
	
	And the element with xpath "/html/body/div/div[2]/div/div[3]/div[2]/ul/li[4]" is not visible
	
	And I end scenario

Examples:
| HoverName	| HoverXpath																													|	navigation																												|	summer																																						|
|	"WOMEN"		|"/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/a"			|	"/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul"	|	"/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[1]/ul/li[2]/ul/li[3]/a"	|
|	"DRESSES"	|"/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[2]/a"			|	"/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[2]/ul"	|	"/html/body/div/div[1]/header/div[3]/div/div/div[6]/ul/li[2]/ul/li[3]/a"					|
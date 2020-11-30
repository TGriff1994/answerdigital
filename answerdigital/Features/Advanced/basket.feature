@advanced @basket
Feature: basket
 

Background:
	
	Given I open chrome with URL "http://automationpractice.com/index.php"
	

  @empty
  Scenario: empty
  	#check basket is empty when you first enter the page
  
  	And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[5]" is "(empty)"
  	And I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a"
  	Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is visible
  	And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is "Your shopping cart is empty."
  	And I end scenario  

	@D1I
	Scenario Outline: delete one item
		#test with deteting one item with both quantities of one and two
		When I click the element with xpath "/html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[2]/div/div[2]/div[2]/a[2]"
		Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button" is visible
		#add item
		And <second>
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a" is visible
		#go to checkout
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a"
		Then the element with id "product_2_7_0_0" is visible
		And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is not visible
		And the element with xpath "/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[5]/input[2]" has value "<quantity>"
		
		#delete items
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[7]/div/a"
		Then the element with id "product_2_7_0_0" is not visible
		And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is visible
  	And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is "Your shopping cart is empty."
	
		And I end scenario
	
	Examples:
		| quantity	|	second																																																					|
		|	1					| NULL																																																						|
		| 2					| I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]"	|


  @D2I
  Scenario Outline: Delete two Items
  	
  	When I click the element with xpath "/html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[2]/div/div[2]/div[2]/a[2]"
		Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button" is visible
		#add item 1
		And <secondA>
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a" is visible
	  
	  When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/span"
	  And I click the element with xpath "/html/body/div/div[2]/div/div[1]/a[1]"
	  Then the current URL is "http://automationpractice.com/index.php"
	  
	  When I click the element with xpath "/html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[3]/div/div[2]/div[2]/a[2]"
	  Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button" is visible
		#add item 2
		And <secondB>
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a" is visible
		
		#go to checkout
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a/span"
		Then the element with id "product_2_7_0_0" is visible
		And the element with id "product_3_13_0_0" is visible
		And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is not visible
		And the element with xpath "/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr[1]/td[5]/input[2]" has value "<quantityA>"
		And the element with xpath "/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr[2]/td[5]/input[2]" has value "<quantityB>"
		
		#delete item 1
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr[1]/td[7]/div/a"
		Then the element with id "product_2_7_0_0" is not visible
		And the element with id "product_3_13_0_0" is visible
		And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is not visible
		
		#delete item 2
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div[2]/table/tbody/tr/td[7]/div/a"
		Then the element with id "product_3_13_0_0" is not visible
		And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is visible
  	And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is "Your shopping cart is empty."
		
		And I end scenario
		
    Examples: 
      | quantityA | quantityB | secondA 																																																											|	secondB																																																							|
      | 1					|     1 		| NULL																																																													|	NULL																																																								|
      | 2 				|     1 		|	I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]/span"						|	NULL																																																								|
      | 1					|			2			|	NULL																																																													| I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]/span"	|
      | 2					|			2			| I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]/span"						| I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]/span"	|

      
    @D1IH
	Scenario Outline: delete one item hover
		#test with deteting one item with both quantities of one and two
		When I click the element with xpath "/html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[2]/div/div[2]/div[2]/a[2]"
		Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button" is visible
		#add item
		And <second>
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a" is visible
		
		#verify cart icon
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[1]/span"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[5]" is ""
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[1]" is "<quantity>"
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt" is visible
		
		#delete from cart
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt/span"
		
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt" is not visible
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[5]" is "(empty)"
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[1]" is ""
		
		#check cart
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a"
  	Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is visible
  	And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is "Your shopping cart is empty."
  	And the element with id "product_2_7_0_0" is not visible
  	
  	And I end scenario  
		
		
		
		
	Examples:
		| quantity	|	second																																																					|
		|	1					| NULL																																																						|
		| 2					| I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]"	|
		
	@D2IH
	Scenario Outline: delete two items hover
		When I click the element with xpath "/html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[2]/div/div[2]/div[2]/a[2]"
		Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button" is visible
		#add item 1
		And <secondA>
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a" is visible
	  
	  When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/span"
	  And I click the element with xpath "/html/body/div/div[2]/div/div[1]/a[1]"
	  Then the current URL is "http://automationpractice.com/index.php"
	  
	  When I click the element with xpath "/html/body/div/div[2]/div/div[2]/div/div[1]/ul[1]/li[3]/div/div[2]/div[2]/a[2]"
	  Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button" is visible
		#add item 2
		And <secondB>
		When I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[3]/div[1]/p/button"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[2]/div[4]/a" is visible
		
		#verify cart icon
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[4]/div[1]/div[1]/span"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[5]" is ""
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[1]" is "<quantity>"
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt[1]" is visible
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt[2]" is visible
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt[1]/div/div[1]/span/span" is "<quantityA>"
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt[2]/div/div[1]/span/span" is "<quantityB>"
		
		#delete item 1
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt[1]/span/a"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt[1]" is not visible
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt" is visible
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[1]" is "<quantityB>"
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[5]" is ""
		
		#delete item 2
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt/span"
		Then the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/div/div/div/dl/dt" is not visible
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[5]" is "(empty)"
		And the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a/span[1]" is ""
		
		#check cart
		When I click the element with xpath "/html/body/div/div[1]/header/div[3]/div/div/div[3]/div/a"
  	Then the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is visible
  	And the element with xpath "/html/body/div/div[2]/div/div[3]/div/p" is "Your shopping cart is empty."
  	And the element with id "product_2_7_0_0" is not visible
		And the element with id "product_3_13_0_0" is not visible
  	And I end scenario 
		
	 Examples: 
      |quantity		| quantityA | quantityB | secondA 																																																											|	secondB																																																							|
      |	2					| 1					|     1 		| NULL																																																													|	NULL																																																								|
      |	3					| 2 				|     1 		|	I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]/span"						|	NULL																																																								|
      |	3					| 1					|			2			|	NULL																																																													| I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]/span"	|
      |	4					| 2					|			2			| I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]/span"						| I click the element with xpath "/html/body/div/div[2]/div/div[3]/div/div/div/div[4]/form/div/div[2]/p[1]/a[2]/span"	|
			
		
		
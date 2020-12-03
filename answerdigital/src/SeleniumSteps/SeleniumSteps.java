package SeleniumSteps;


import static org.junit.Assert.fail;

import java.util.concurrent.TimeUnit;

import org.junit.internal.runners.statements.Fail;
import org.openqa.selenium.By;
import org.openqa.selenium.Dimension;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.interactions.Actions;
import org.openqa.selenium.support.ui.ExpectedCondition;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.Select;
import org.openqa.selenium.support.ui.WebDriverWait;

import cucumber.api.java.en.Given;

import cucumber.api.java.en.Then;		
import cucumber.api.java.en.When;
import cucumber.api.java.en.And;


public class SeleniumSteps {
	public static WebDriver driver;
	
	//Open web driver
    @Given("^I open chrome with URL \"([^\"]*)\"$")    
    public void Open_Chrome(String URL) throws Throwable 
    {
    	System.setProperty("webdriver.chrome.driver" ,  "chromedriver_win32/chromedriver87.exe");
    	driver = new ChromeDriver();
    	driver.manage().timeouts().implicitlyWait(10, TimeUnit.SECONDS);
    	driver.get(URL);
    	
    }
	
    
    
    
    //click and element (id)
    @When ("^I click the element with id \"([^\"]*)\"$")
    public void Click_element_id (String id) throws Throwable
    {
    	try {
			WebElement Input = driver.findElement(By.id(id));
			Actions cursor= new Actions(driver);
			cursor.moveToElement(Input).click().build().perform();
			System.out.println("clicked the element with id \""+id+"\"");
			
		}
		catch (org.openqa.selenium.NoSuchElementException e){
			driver.close();
			System.out.println("unable to click element with id \""+id+"\" as it does not appear");
			fail("cannot find element with id \""+id+"\"");
		}
    }
    
    //click an element (xpath)
    @When ("^I click the element with xpath \"([^\"]*)\"$")
    public void Click_element_xpath (String xpath) throws Throwable
    {
    	try {
			WebElement Input = driver.findElement(By.xpath(xpath));							
			Actions cursor= new Actions(driver);
			cursor.moveToElement(Input).click().build().perform();
			System.out.println("clicked the element with xpath \""+xpath+"\"");
		}
		catch (org.openqa.selenium.NoSuchElementException e){
			driver.close();
			System.out.println("Unable to click element with xpath \""+xpath+"\" as it does not appear");
			fail("cannot find element with xpath \""+xpath+"\"");
		}
    }
    
    @When ("^I hover over element with xpath \"([^\"]*)\"$")
    public void hover (String xpath) throws Throwable
    {
    	try {
			WebElement Input = driver.findElement(By.xpath(xpath));							
			Actions cursor= new Actions(driver);
			cursor.moveToElement(Input).perform();
			System.out.println("hover over the element with xpath \""+xpath+"\"");
		}
		catch (org.openqa.selenium.NoSuchElementException e){
			driver.close();
			System.out.println("Unable to hover over element with xpath \""+xpath+"\" as it does not appear");
			fail("cannot find element with xpath \""+xpath+"\"");
		}
    	
    }
    
    
    //enter text into an element (id)
    @When ("^I enter \"([^\"]*)\" into the element with id \"([^\"]*)\"$")
    public void Enter_value_id (String value, String id) throws Throwable
    {
    	try {
			WebElement Input = driver.findElement(By.id(id));
			Input.click();
			Input.sendKeys(value);
			System.out.println("entered \""+value+"\" in the element with id \""+id+"\"");
		}
		catch (org.openqa.selenium.NoSuchElementException e) {
			driver.close();
			System.out.println("unable to enter text into element with id \""+id+"\" as it does not appear");
			fail("cannot find element with id \""+id+"\"");
		}
    }
    
    //enter text into an element (xpath)
    @When ("^I enter \"([^\"]*)\" into the element with xpath \"([^\"]*)\"$")
    public void Enter_value_xpath (String value, String xpath) throws Throwable
    {
    	try {
			WebElement Input = driver.findElement(By.xpath(xpath));
			Input.click();
			Input.sendKeys(value);
			System.out.println("entered \""+value+"\" in the element with xpath \""+xpath+"\"");
		}
		catch (org.openqa.selenium.InvalidSelectorException e) {
			driver.close();
			System.out.println("unable to enter text into element with xpath \""+xpath+"\" as it does not appear");
			fail("cannot find element with xpath \""+xpath+"\"");
			
		}
    }
    
    //Press the shift key to an element 
    @When ("^I press SHIFT to the element with id \"([^\"]*)\"$")
    public void Press_key_SHIFT_id (String id) throws Throwable
    {
    	try {
			WebElement Input = driver.findElement(By.id(id));
			Input.click();
			Input.sendKeys(Keys.SHIFT);
			System.out.println("entered SHIFT key into the element with id \""+id+"\"");
		}
		catch (org.openqa.selenium.InvalidSelectorException e) {
			driver.close();
			System.out.println("element with id \""+id+"\" does not appear");
			fail("cannot find element with id \""+id+"\"");
			
		}
    }
    //Press the control key to an element 
    @When ("^I press CONTROL to the element with id \"([^\"]*)\"$")
    public void Press_key_CONTROL_id (String id) throws Throwable
    {
    	try {
			WebElement Input = driver.findElement(By.id(id));
			Input.click();
			Input.sendKeys(Keys.CONTROL);
			System.out.println("entered CONTROL key into the element with id \""+id+"\"");
			
		}
		catch (org.openqa.selenium.InvalidSelectorException e) {
			driver.close();
			System.out.println("element with id \""+id+"\" does not appear");
			fail("cannot find element with id \""+id+"\"");
			
		}
    }
    
    
    //verify the text of the element using the id
    @Then("^the element with id \"([^\"]*)\" is \"([^\"]*)\"$")
    public void Verify_text_id(String id, String text) throws Throwable
    {
    	try {
			String output= driver.findElement(By.id(id)).getText();
			if (output.equals(text)){
				System.out.println("Text of element with id \""+id+"\" is \""+text+"\"");
			}
			else {
				driver.close();
				System.out.println("Text of element with id \""+id+"\" is \""+output+"\"");
				System.out.println("It should be \""+text+"\"");
				fail("Waiting for Text currently \""+output+"\" to be \""+text+"\"");
			}
		}
		catch (org.openqa.selenium.NoSuchElementException e) {
			driver.close();
			System.out.println("unable to verify the text of element with id \""+id+"\" as it does not appear");
			
			fail("cannot find element with id \""+id+"\"");
		}
    }
    
    
    //verify the text of the element using the xpath
    @When("^the element with xpath \"([^\"]*)\" is \"([^\"]*)\"$")
    public void Verify_text_xpath(String xpath, String text) throws Throwable
    {
    	try {
			String output= driver.findElement(By.xpath(xpath)).getText();
			if (output.equals(text)){
				System.out.println("Text of element with xpath \""+xpath+"\" is \""+text+"\"");
			}
			else {
				driver.close();
				System.out.println("Text of element with xpath \""+xpath+"\" is \""+output+"\"");
				System.out.println("It should be \""+text+"\"");
				
				fail("Waiting for Text currently \""+output+"\" to be \""+text+"\"");
			}
		}
		catch (org.openqa.selenium.NoSuchElementException e) {
			driver.close();
			System.out.println("unable to verify the text of element with xpath \""+xpath+"\" as it does not appear");
			
			fail("cannot find element with xpath \""+xpath+"\"");
		}
    }
    //verify part of the text of an element using the id
    @Then("^the element with id \"([^\"]*)\" has text \"([^\"]*)\" between characters (\\d+) and (\\d+)$")
    public void Verify_partOfText_id(String id, String text, int start, int finish) throws Throwable
    {
    	try {
			String output= driver.findElement(By.id(id)).getText();
			String SubOutput = output.substring(start, finish);
			
			if (SubOutput.equals(text)) {
				System.out.println("Text of element with id \""+id+"\" Match");
			}
			else {
				driver.close();
				System.out.println("Text of element with id \""+id+"\" is \""+SubOutput+"\"");
				System.out.println("It should be \""+text+"\"");
				fail("Waiting for Text currently \""+SubOutput+"\" to be \""+text+"\"");
				
			}
			
			
		}
		catch (org.openqa.selenium.NoSuchElementException e) {
			driver.close();
			System.out.println("unable to verify the text of elemtn with id \""+id+"\" as it does not appear");
			fail("cannot find element with id \""+id+"\"");
			
		}
    }
    
    
    @Then ("^the element with xpath \"([^\"]*)\" has value \"([^\"]*)\"$")
    public void Verify_value(String xpath, String value) throws Throwable
    {
    	
    	try {
    	
    		WebElement Input = driver.findElement(By.xpath(xpath));
    		String Output = Input.getAttribute("value");
    		if (Output.equals(value)){
    			System.out.println("value of element with xpath \""+xpath+"\" is \""+value+"\"");
			}
			else {
				driver.close();
				System.out.println("Value of element with xpath \""+xpath+"\" is \""+Output+"\"");
				System.out.println("It should be \""+value+"\"");
			
				fail("Waiting for Value currently \""+Output+"\" to be \""+value+"\"");
			}
    	}
    	catch (org.openqa.selenium.NoSuchElementException e) {
    		driver.close();
			System.out.println("unable to verify the value of element with xpath \""+xpath+"\" as it does not appear");
			
			fail("cannot find element with xpath \""+xpath+"\"");
    	}
    	
    }
    
    
    
    
    //check the URL of the current page
    @Then ("^the current URL is \"([^\"]*)\"$")
    public void Verify_URL(String input) throws Throwable
    {
    	String output= driver.getCurrentUrl();
		if (output.equals(input)) {
			System.out.println("Current URL is \""+output+"\". This is correct");
		}
		else {
			driver.close();
			System.out.println("Current URL is \""+output+"\"");
			System.out.println("It should be \""+input+"\"");
			fail("waiting URL currently \""+output+"\" to be \""+input+"\"");
		}
    }
    //scroll to the bottom of the page
    @When ("I scroll to bottom")
    public void scroll_bottom() throws Throwable
    {
    	JavascriptExecutor scroll = (JavascriptExecutor)driver;
    	
    	scroll.executeScript("window.scrollTo(0, document.body.scrollHeight)");
    	System.out.println("scrolled to bottom of page");	
    		
    		
    	
    	
    	
    	
    }
    //scroll to the top of the page
    @When ("I scroll to top")
    public void scroll_top() throws Throwable
    {
    	JavascriptExecutor scroll = (JavascriptExecutor)driver;
    	scroll.executeScript("window.scrollTo(0, 0)");
    	System.out.println("scrolled to top of page");
    }
    
  
    
    //wait for a set time in ms
    @And ("^I wait (\\d+)$")
    public void Wait(int time) throws Throwable
    {
    	    	
    	//I know this method isn't ideal, but I'm unsure of how to wait until the scroll bar has fully load
    	System.out.println("Waiting "+time+"ms");
    	Thread.sleep(time);
    }
    
    @And ("^the element with xpath \"([^\"]*)\" is visible")
    public void visible_xpath(String xpath) throws Throwable
    {
    	
    	try {
    		System.out.println("looking for element with xpath\""+xpath+"\"");
    		WebDriverWait wait = new WebDriverWait(driver, 20);
    		wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.xpath(xpath)));
    	}
    	
    	catch(org.openqa.selenium.TimeoutException e){
    		driver.close();
			System.out.println("unable to find the element with xpath \""+xpath+"\"");
			fail("cannot find element with xpath \""+xpath+"\"");
    		
    	}
    }
    
    @And ("^the element with id \"([^\"]*)\" is visible$")
    public void visible_id(String id) throws Throwable
    {
    	
    	try {
    		System.out.println("looking for element with id\""+id+"\"");
    		WebDriverWait wait = new WebDriverWait(driver, 20);
    		wait.until(ExpectedConditions.visibilityOfAllElementsLocatedBy(By.id(id)));
    	}
    	
    	catch(org.openqa.selenium.TimeoutException e){
    		driver.close();
			System.out.println("unable to find the element with id \""+id+"\"");
			fail("cannot find element with id \""+id+"\"");
    		
    	}
    }
    
    @And ("^the element with xpath \"([^\"]*)\" is not visible$")
    public void invisible_xpath(String xpath) throws Throwable
    {
    	try {
    		System.out.println("verifying that the element with xpath\""+xpath+"\" is not visible");
    		WebDriverWait wait = new WebDriverWait(driver, 20);
    		wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath(xpath)));
    	}
    	
    	catch(org.openqa.selenium.TimeoutException e){
    		driver.close();
			System.out.println("the element with xpath \""+xpath+"\" is still visible");
			fail("the element with xpath \""+xpath+"\" is still visible");
    		
    	}
    }
    
    @And ("^the element with id \"([^\"]*)\" is not visible$")
    public void invisible_id(String id) throws Throwable
    {
    	
    	try {
    		System.out.println("waiting for element with id\""+id+"\" to not be visible");
    		WebDriverWait wait = new WebDriverWait(driver, 20);
    		wait.until(ExpectedConditions.invisibilityOfElementLocated(By.id(id)));
    	}
    	
    	catch(org.openqa.selenium.TimeoutException e){
    		driver.close();
			System.out.println("the element with id \""+id+"\" is still visible");
			fail("the element with id \""+id+"\" is still visible");
    		
    	}
    }
    
    //this function will do nothing. Can be used for scenario outlines.
    @And ("NULL")
    public void NULL() throws Throwable
    {
    	
    }
    
    //closes the web driver
    @Then ("I end scenario")
    public void End() throws Throwable
    {
    	driver.close();
    }
    
    
    
}
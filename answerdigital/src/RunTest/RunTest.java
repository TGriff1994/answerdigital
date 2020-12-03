package RunTest;		

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;		

@RunWith(Cucumber.class)				
@CucumberOptions(
	features = "features", glue={"SeleniumSteps"}, tags = {"@summer"})						
public class RunTest 				
{		

}
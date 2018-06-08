package serviceContractTests.session.functional;

import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;


@RunWith(Karate.class)
@CucumberOptions(plugin = {"pretty", "json:target/cucumber.json"}, tags = {"@dev","~@ignore"})
public class SessionFunctionalTestRunner {

}
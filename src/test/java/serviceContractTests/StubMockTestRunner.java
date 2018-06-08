package serviceContractTests;

import com.intuit.karate.junit4.Karate;
import cucumber.api.CucumberOptions;
import org.junit.runner.RunWith;

@RunWith(Karate.class)
@CucumberOptions(plugin = {"pretty", "json:target/cucumber.json"}, tags = {"@stubs","~@ignoreIfMock","~@ignore"})
public class StubMockTestRunner {
    // refer to https://github.com/intuit/karate#naming-conventions
    // for folder-structure recommendations and naming conventions
}
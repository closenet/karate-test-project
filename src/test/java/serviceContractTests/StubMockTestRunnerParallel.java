package serviceContractTests;

        import com.intuit.karate.cucumber.CucumberRunner;
        import com.intuit.karate.cucumber.KarateStats;
        import cucumber.api.CucumberOptions;
        import static org.junit.Assert.assertTrue;
        import org.junit.Test;

@CucumberOptions()
public class StubMockTestRunnerParallel {

    @Test
    public void StubMockTestRunnerParallel() {
        KarateStats stats = CucumberRunner.parallel(getClass(), 5, "target/surefire-reports");
        assertTrue("scenarios failed", stats.getFailCount() == 0);
    }

}
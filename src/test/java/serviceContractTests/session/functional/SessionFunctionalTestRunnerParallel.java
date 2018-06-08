package serviceContractTests.session.functional;

        import com.intuit.karate.cucumber.CucumberRunner;
        import com.intuit.karate.cucumber.KarateStats;
        import cucumber.api.CucumberOptions;
        import static org.junit.Assert.assertTrue;
        import org.junit.Test;

@CucumberOptions()
public class SessionFunctionalTestRunnerParallel {

    @Test
    public void SessionFunctionalTestRunnerParallel() {
        KarateStats stats = CucumberRunner.parallel(getClass(), 5, "target/surefire-reports");
        assertTrue("scenarios failed", stats.getFailCount() == 0);
    }

}
package com.iii.sierra.api.bdd.jbehave.demo.tests.stepDefinitions;

/**
 * Created by ssatelle on 19/09/14.
 */

import com.iii.sierra.api.bdd.jbehave.demo.tests.steps.RestfulSteps;
import net.thucydides.core.annotations.Steps;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.json.JSONException;
import org.skyscreamer.jsonassert.JSONAssert;
import org.skyscreamer.jsonassert.JSONCompareMode;

@SuppressWarnings("unused")
public class ProcessingRestQueries {

    String providedUrl;
    String returnedMessage;

    @Steps
    RestfulSteps restfulSteps;

    @Given("a url <providedUrl>")
    @Alias("a url $providedUrl")
    public void givenUrl(String providedUrl) {
        this.providedUrl = providedUrl;
    }

    @When("I request a list of items")
    public void getJSONResponse() {
        returnedMessage = restfulSteps.getRestObject(providedUrl);
    }

    @Then("I should obtain a list of items like: $expectedJSONResponse")
    public void confirmJSONResponse(String expectedJSONResponse) throws JSONException {
        JSONAssert.assertEquals(expectedJSONResponse, returnedMessage, JSONCompareMode.LENIENT);
    }
}

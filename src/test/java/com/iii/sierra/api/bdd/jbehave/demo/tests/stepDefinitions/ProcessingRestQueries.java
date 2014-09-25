package com.iii.sierra.api.bdd.jbehave.demo.tests.stepDefinitions;

/**
 * Created by ssatelle on 19/09/14.
 */

import com.iii.sierra.api.bdd.jbehave.demo.tests.helpers.JSONHelpers;
import com.iii.sierra.api.bdd.jbehave.demo.tests.steps.LoginSteps;
import com.iii.sierra.api.bdd.jbehave.demo.tests.steps.RestfulSteps;
import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;
import net.thucydides.core.annotations.Steps;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.json.JSONException;
import org.json.JSONObject;
import org.skyscreamer.jsonassert.JSONAssert;
import org.skyscreamer.jsonassert.JSONCompareMode;
import org.springframework.http.ResponseEntity;

public class ProcessingRestQueries {
    ResponseEntity returnedMessage;
    JSONHelpers helper;
    SessionMap session;
    String providedUrl;
    JSONObject returnedJSONMessage;

    @Steps
    RestfulSteps restfulSteps;
    LoginSteps login;

    public ProcessingRestQueries() {
        helper = new JSONHelpers();
        session = Thucydides.getCurrentSession();
        login = new LoginSteps();
        restfulSteps = new RestfulSteps();
    }



    @Given("a url <providedUrl>")
    @Alias("a url $providedUrl")
    public void givenUrl(String providedUrl) {
        this.providedUrl = providedUrl;
        Thucydides.getCurrentSession().put("baseUrl", providedUrl);
    }

    @When("I authenticate at <locator> with credentials <credentials>")
    @Alias("I authenticate at $locator with credentials $credentials")
    public void givenAuthenticationPage(String locator, String credentials) {
        String siteUrl = Thucydides.getCurrentSession().get("baseUrl").toString();
        returnedMessage = login.postLogin(siteUrl + locator, credentials);
    }

    @Then("I should obtain a JSON AUTH message containing my access_token")
    public void shouldObtainJsonAuthMessage() throws JSONException {
        JSONObject json = helper.getJSON(returnedMessage);
        assert (json.has("access_token"));
        Thucydides.getCurrentSession().put("default_auth_token", json.getString("access_token"));
    }

    @When("I request items from <locator>")
    @Alias("I request items from $locator")
    public void getJSONResponse(String locator) {
        returnedJSONMessage = restfulSteps.getRestObject(providedUrl + locator);
    }

    @Then("I should obtain a list of items like: $expectedJSONResponse")
    public void confirmJSONResponse(String expectedJSONResponse) throws JSONException {
        JSONAssert.assertEquals(expectedJSONResponse, returnedJSONMessage, JSONCompareMode.LENIENT);
    }
}

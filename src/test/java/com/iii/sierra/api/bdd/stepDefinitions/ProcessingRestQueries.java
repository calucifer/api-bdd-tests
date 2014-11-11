package com.iii.sierra.api.bdd.stepDefinitions;

/**
 * Created by ssatelle on 19/09/14.
 */

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.json.JSONException;
import org.json.JSONObject;
import org.skyscreamer.jsonassert.JSONAssert;
import org.skyscreamer.jsonassert.JSONCompareMode;

public class ProcessingRestQueries extends AbstractProcessor {

    public ProcessingRestQueries() {
        super();
    }

    @Given("a url <providedUrl>")
    @Alias("a url $providedUrl")
    public void givenUrl(String providedUrl) throws Exception {
        this.setUrl(providedUrl);
    }

    @Given("my default url is defined")
    public void defaultUrlDefined() throws Exception {
        setDefaultUrl();
    }

    @Given("my default credentials are defined")
    public void defaultCredentialsDefined() throws Exception {
        setDefaultCredentials();
    }

    @Given("my default url and credentials are defined")
    public void defaultUrlAndCredentialsDefined() throws Exception {
        setDefaultUrl();
        setDefaultCredentials();
    }
    @Given("my default url is defined and I have an access token")
    public void defaultUrlAndCurrentTokenDefined() throws Exception {
        this.defaultUrlDefined();
        if(this.authToken.isEmpty()) {
            throw new Exception("Auth Token not defined");
        }
    }

    @When("I authenticate at $slug with my default credentials")
    @Alias(("I authenticate at <slug> with my default credentials"))
    public void whenIAuthenticateAtSlugWithMyDefaultCredentials(String slug) throws Exception {
        setDefaultCredentials();
        returnedMessage = login.postLogin(baseUrl + slug, this.providedCredentials);
    }

    @When("I authenticate at <slug> with credentials <credentials>")
    @Alias("I authenticate at $slug with credentials $credentials")
    public void authenticate(String slug, String credentials) throws Exception{
        setCredentials(credentials);
        returnedMessage = login.postLogin(baseUrl + slug, this.providedCredentials);
    }

    @Then("I should obtain a JSON AUTH message containing my access_token")
    public void shouldObtainJsonAuthMessage() throws JSONException {
        JSONObject json = helper.getJSON(returnedMessage);
        assert (json.has("access_token"));
        authToken = json.getString("access_token");
    }

    @When("I request items from <slug>")
    @Alias("I request items from $slug")
    public void getJSONResponse(String slug) {
        returnedJSONMessage = restfulSteps.getRestObject(baseUrl + slug, authToken);
    }

    @When("I post items from <slug>")
    @Alias("I post items from $slug")
    public void getPostJSONResponse(String slug) {
        returnedJSONMessage = restfulSteps.postRestObject(baseUrl + slug, authToken);
    }

    @Then("I should get a response of: $expectedJSONResponse")
    public void confirmJSONResponse(String expectedJSONResponse) throws JSONException {
        JSONAssert.assertEquals(expectedJSONResponse, returnedJSONMessage, JSONCompareMode.LENIENT);
    }
}

package com.iii.sierra.api.bdd.stepDefinitions;

import com.iii.sierra.api.bdd.steps.LoginSteps;
import net.thucydides.core.Thucydides;
import net.thucydides.core.annotations.Steps;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by ssatelle on 25/09/14.
 * for the project api-bdd-tests
 */
public class ProcessingSwagger extends AbstractProcessor  {

    @Steps
    LoginSteps login;

    public ProcessingSwagger() {
        super();
    }

    @Given("my default swagger url is defined")
    public void defaultUrlDefined() throws Exception {
        setDefaultUrl();
    }

    @Given("my default swagger credentials are defined")
    public void defaultCredentialsDefined() throws Exception {
        setDefaultCredentials();
    }

    @Given("my default swagger url and credentials are defined")
    public void defaultUrlAndCredentialsDefined() throws Exception {
        setDefaultUrl();
        setDefaultCredentials();
    }
    @Given("my default swagger url is defined and I have an access token")
    public void defaultUrlAndCurrentTokenDefined() throws Exception {
        this.defaultUrlDefined();
        if(this.authToken.isEmpty()) {
            throw new Exception("Auth Token not defined");
        }
    }

    @Given("a swagger base url <providedUrl>")
    @Alias("a swagger base url $providedUrl")
    public void givenUrl(String providedUrl) throws Exception{
        setUrl(providedUrl);
    }


    @When("I authenticate on swagger at <slug> with credentials <credentials>")
    @Alias("I authenticate on swagger at $slug with credentials $credentials")
    public void authenticate_on_swagger(String slug, String credentials) throws Exception {
        setCredentials(credentials);
        returnedMessage = login.postLogin(this.baseUrl + slug, credentials);
    }


    @Then("I should obtain a JSON AUTH message containing my swagger access_token")
    public void shouldObtainJsonAuthMessageFromSwagger() throws JSONException {
        JSONObject json = helper.getJSON(returnedMessage);
        assert (json.has("access_token"));
        Thucydides.getCurrentSession().put("swagger_auth_token", json.getString("access_token"));
    }
}

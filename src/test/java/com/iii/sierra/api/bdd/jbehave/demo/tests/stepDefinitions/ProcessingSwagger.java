package com.iii.sierra.api.bdd.jbehave.demo.tests.stepDefinitions;

import com.iii.sierra.api.bdd.jbehave.demo.tests.helpers.JSONHelpers;
import com.iii.sierra.api.bdd.jbehave.demo.tests.steps.LoginSteps;
import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;
import net.thucydides.core.annotations.Steps;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;

/**
 * Created by ssatelle on 25/09/14.
 * for the project api-bdd-tests
 */
public class ProcessingSwagger {

    ResponseEntity returnedMessage;
    JSONHelpers helper;
    SessionMap session;

    @Steps
    LoginSteps login;

    public ProcessingSwagger() {
        helper = new JSONHelpers();
        session = Thucydides.getCurrentSession();
    }

    @Given("a swagger url <providedUrl>")
    @Alias("a swagger url $providedUrl")
    public void givenUrl(String providedUrl) {
        Thucydides.getCurrentSession().put("swaggerBaseUrl", providedUrl);
    }


    @When("I authenticate on swagger with credentials <credentials>")
    @Alias("I authenticate on swagger with credentials $credentials")
    public void authenticate_on_swagger(String credentials) {
        String url = Thucydides.getCurrentSession().get("swaggerUrl").toString();
        returnedMessage = login.postLogin(Thucydides.getCurrentSession().get("swaggerUrl").toString(), credentials);
    }


    @Then("I should obtain a JSON AUTH message containing my swagger access_token")
    public void shouldObtainJsonAuthMessageFromSwagger() throws JSONException {
        JSONObject json = helper.getJSON(returnedMessage);
        assert (json.has("access_token"));
        Thucydides.getCurrentSession().put("swagger_auth_token", json.getString("access_token"));
    }

}

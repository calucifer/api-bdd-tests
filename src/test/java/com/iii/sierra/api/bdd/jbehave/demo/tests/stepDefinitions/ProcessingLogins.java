package com.iii.sierra.api.bdd.jbehave.demo.tests.stepDefinitions;

import com.iii.sierra.api.bdd.jbehave.demo.tests.helpers.JSONHelpers;
import com.iii.sierra.api.bdd.jbehave.demo.tests.steps.LoginSteps;
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
 * Created by ssatelle on 15/09/14.
 */
public class ProcessingLogins {
    String authenticationCredentials;
    ResponseEntity returnedMessage;
    JSONHelpers helper;

    public ProcessingLogins() {
        helper = new JSONHelpers();
    }

    @Steps
    LoginSteps login;

    @Given("an authentication url <url>")
    @Alias("an authentication url $url")
    public void givenBaseUrl(String url) {
        Thucydides.getCurrentSession().put("url", url);
    }

    @When("I authenticate with credentials <credentials>")
    @Alias("I authenticate with credentials $credentials")
    public void myCredentials(String credentials) {
        returnedMessage = login.login(credentials, Thucydides.getCurrentSession().get("url").toString());
    }

//    @When("I authenticate at this url")
//    public void authenticateAtUrl() throws JSONException {
//        returnedMessage = login.login(authenticationCredentials, apiUrl);
//
//        System.out.println("d");
//    }

    @Then("I should obtain a JSON AUTH message containing my access_token")
    public void shouldObtainJsonAuthMessage() throws JSONException {
        assert (returnedMessage.getStatusCode().is2xxSuccessful());
        JSONObject json = helper.getJSON(returnedMessage);
        assert (json.has("access_token"));
        Thucydides.getCurrentSession().put("default_auth_token", json.getString("access_token"));
        System.out.println("***** AUTH TOKEN=" + Thucydides.getCurrentSession().get("default_auth_token"));
    }
}

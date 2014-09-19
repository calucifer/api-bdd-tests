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
@SuppressWarnings("unused")
public class ProcessingLogins {
    ResponseEntity returnedMessage;
    JSONHelpers helper;

    public ProcessingLogins() {
        helper = new JSONHelpers();
    }

    @Steps
    LoginSteps login;

    @Given("an authentication url <url>")
    @Alias("an authentication url $url")
    public void givenAuthenticationUrl(String url) {
        Thucydides.getCurrentSession().put("authenticationUrl", url);
    }

    @When("I authenticate with credentials <credentials>")
    @Alias("I authenticate with credentials $credentials")
    public void authenticate(String credentials) {
        returnedMessage = login.login(Thucydides.getCurrentSession().get("authenticationUrl").toString(), credentials);
    }


    @Then("I should obtain a JSON AUTH message containing my access_token")
    public void shouldObtainJsonAuthMessage() throws JSONException {
        JSONObject json = helper.getJSON(returnedMessage);
        assert (json.has("access_token"));
        Thucydides.getCurrentSession().put("default_auth_token", json.getString("access_token"));
    }
}

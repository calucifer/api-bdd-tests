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
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.util.Properties;

/**
 * Created by ssatelle on 15/09/14.
 */
public class ProcessingLogins {
    String apiUrl;
    String authenticationCredentials;
    String authToken;
    ResponseEntity returnedMessage;
    JSONHelpers helper;

    public ProcessingLogins() {
        helper = new JSONHelpers();
    }

    @Steps
    LoginSteps login;

    @Given("a url <apiUrl>")
    @Alias("a url $apiUrl")
    public void givenUrl(String apiUrl) {
        this.apiUrl = apiUrl;
    }

    @When("post my credentials <credentials>")
    @Alias("I authenticate with credentials  $credentials")
    public void myCredentials(String credentials) {
        this.authenticationCredentials = credentials;
        returnedMessage = login.login(authenticationCredentials, apiUrl);
    }

//    @When("I authenticate at this url")
//    public void authenticateAtUrl() throws JSONException {
//        returnedMessage = login.login(authenticationCredentials, apiUrl);
//
//        System.out.println("d");
//    }

    @Then("I should obtain a JSON AUTH message containing my access_token")
    public void shouldObtainJsonAuthMessage() throws JSONException {
        try {
            Properties properties = helper.parse(returnedMessage);
            Thucydides.getCurrentSession().put("auth_token", properties.getProperty("access_token"));
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("***** AUTH TOKEN=" + Thucydides.getCurrentSession().get("auth_token"));
        assert (!returnedMessage.isEmpty());
    }
}

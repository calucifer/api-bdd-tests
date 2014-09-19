package com.iii.sierra.api.bdd.jbehave.demo.tests.stepDefinitions;

import com.iii.sierra.api.bdd.jbehave.demo.tests.helpers.JSONHelpers;
import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;
import net.thucydides.core.annotations.WithTag;
import org.jbehave.core.annotations.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

/**
 * Created by ssatelle on 18/09/14.
 */
@WithTag(name="Patrons", type="functionality")
public class processingPatrons {
    private SessionMap sessionMap;
    private HttpHeaders header;
    private JSONHelpers jsonHelper;
    private RestTemplate restTemplate;

    public processingPatrons() {
        restTemplate = new RestTemplate();
        jsonHelper = new JSONHelpers();
        sessionMap = Thucydides.getCurrentSession();
    }


    @Given("a patron url <patronUrl>")
    @Alias("a patron url $patronUrl")
    public void patronUrl(String patronUrl) {
        sessionMap.put("basePatronUrl", patronUrl);
    }


    @When("I request a list of patrons")
    public void getListOfPatrons() {
        header = new HttpHeaders();
        String authToken = sessionMap.get("default_auth_token").toString();
        String url = sessionMap.get("basePatronUrl").toString();

        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);
        ResponseEntity response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        JSONObject json = jsonHelper.getJSON(response);
        sessionMap.put("listOfPatrons", json);

    }

    @Pending
    @When("I get the patron $patID")
    public void getParticularPatron(String patID) {

    }

    @Then("I should obtain a list of patrons")
    public void checkListOfPatrons() {
        JSONObject json = (JSONObject) sessionMap.get("listOfPatrons");
        try {
            JSONArray patronArray = json.getJSONArray("entries");

            System.out.println(patronArray.toString());

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @Pending
    @Then("the patron returned should have id $patID")
    public void checkIndividualPatron(String patID) {

    }
}

package com.iii.sierra.api.bdd.jbehave.demo.tests.stepDefinitions;

import com.iii.sierra.api.bdd.jbehave.demo.tests.helpers.JSONHelpers;
import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

/**
 * Created by ssatelle on 16/09/14.
 */
public class ProcessingBibs {
    private HttpHeaders header;
    private RestTemplate restTemplate;
    private JSONHelpers jsonHelper;
    private SessionMap sessionMap;


    public ProcessingBibs() {
        restTemplate = new RestTemplate();
        jsonHelper = new JSONHelpers();
        sessionMap = Thucydides.getCurrentSession();


    }

    @Given("a url <Url>")
    @Alias("a url $Url")
    public void givenBaseUrl(String url) {
        sessionMap.put("baseBibUrl", url);
    }

    @When("I request a list of bibs")
    public void requestAListOfBib() {
        header = new HttpHeaders();
        String authToken = sessionMap.get("default_auth_token").toString();
        String url = sessionMap.get("baseBibUrl").toString();

        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);
        ResponseEntity response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        JSONObject json = jsonHelper.getJSON(response);
        sessionMap.put("listOfBibs", json);

    }

    @Then("I should obtain a list of bibs")
    public void getAListOfBibs() {
        JSONObject json = (JSONObject) sessionMap.get("listOfBibs");
        try {
            JSONArray bibArray = json.getJSONArray("entries");

            System.out.println(bibArray.toString());

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @When("I request a particular bib with id $bib")
    public void requestAParticularBib(String bib) {
        header = new HttpHeaders();
        String url = sessionMap.get("baseBibUrl").toString() + "/" + bib;
        String authToken = sessionMap.get("default_auth_token").toString();

        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);
        ResponseEntity response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);
        JSONObject json = jsonHelper.getJSON(response);
        sessionMap.put("particularBibAsJSON", json);

    }

    @Then("The bib returned should have an id <bibID>")
    @Alias("The bib returned should have an id $bibID")
    public void CheckTHeParticularBib(String bibID) {
        JSONObject json = (JSONObject) sessionMap.get("particularBibAsJSON");
        try {
            String gottenBib = json.get("id").toString();
            bibID.equals(gottenBib);
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }
}

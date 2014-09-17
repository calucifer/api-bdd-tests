package com.iii.sierra.api.bdd.jbehave.demo.tests.stepDefinitions;

import net.thucydides.core.Thucydides;
import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Then;
import org.jbehave.core.annotations.When;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

/**
 * Created by ssatelle on 16/09/14.
 */
public class ProcessingBibs {

    private String siteUrl;
    private String authToken;
    private HttpHeaders header;
    private String bibs;
    private RestTemplate restTemplate;

    public ProcessingBibs() {
        restTemplate = new RestTemplate();
        header = new HttpHeaders();
    }

    @Given("a rest token <siteUrl>")
    @Alias("a rest token $siteUrl")
    public void givenRestUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }

    @When("I authenticate on site using credentials I have")
    public void authenticate_on_site_with_credentials() {
        System.out.println("***** AUTH TOKEN=" + Thucydides.getCurrentSession().get("auth_token"));
        authToken = Thucydides.getCurrentSession().get("auth_token").toString();
        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);
        ResponseEntity resp = restTemplate.exchange(siteUrl, HttpMethod.GET, entity, String.class);
    }

    @Then("I should obtain a list of bibs")
    public void a_list_of_bibs() {
        String newS = new String("Haa");
        String pause = new String();


    }

}

package com.iii.sierra.api.bdd.jbehave.demo.tests.steps;

import com.iii.sierra.api.bdd.jbehave.demo.tests.helpers.JSONHelpers;
import net.thucydides.core.steps.ScenarioSteps;
import org.apache.commons.codec.binary.Base64;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;


/**
 * Created by ssatelle on 15/09/14.
 */
public class LoginSteps extends ScenarioSteps {

    RestTemplate restTemplate;
    HttpHeaders header;
    JSONHelpers helper;

    public LoginSteps() {
        restTemplate = new RestTemplate();
        header = new HttpHeaders();
        helper = new JSONHelpers();
    }

    public ResponseEntity login(String providedCredentials, String providedUrl) {
        byte[] bytesEncoded = Base64.encodeBase64(providedCredentials.getBytes());
        header.add("Authorization", "Basic " + new String(bytesEncoded ));
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);
        return restTemplate.exchange(providedUrl, HttpMethod.POST, entity, String.class);
    }



}

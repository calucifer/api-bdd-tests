package com.iii.sierra.api.bdd.jbehave.demo.tests.steps;

import com.iii.sierra.api.bdd.jbehave.demo.tests.helpers.JSONHelpers;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;
import org.apache.commons.codec.binary.Base64;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;


/**
 * Created by ssatelle on 15/09/14.
 * for the project ${PROJECT_NAME}
 */
public class LoginSteps extends ScenarioSteps {
    JSONHelpers helper;

    public LoginSteps() {
    }

    @Step("Login to {0} using credentials {1} using Post request")
    public ResponseEntity postLogin(String providedUrl, String providedCredentials) {
        byte[] bytesEncoded = Base64.encodeBase64(providedCredentials.getBytes());
        HttpHeaders header = new HttpHeaders();
        header.add("Authorization", "Basic " + new String(bytesEncoded));
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity ent = restTemplate.exchange(providedUrl, HttpMethod.POST, entity, String.class);
        return ent;
    }

    @Step("Login to {0} using credentials {1} using Get request")
    public ResponseEntity getLogin(String providedUrl, String providedCredentials) {
        byte[] bytesEncoded = Base64.encodeBase64(providedCredentials.getBytes());
        HttpHeaders header = new HttpHeaders();
        header.add("Authorization", "Basic " + new String(bytesEncoded));
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);
        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity ent = restTemplate.exchange(providedUrl, HttpMethod.GET, entity, String.class);
        return ent;
    }


}

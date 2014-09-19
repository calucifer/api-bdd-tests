package com.iii.sierra.api.bdd.jbehave.demo.tests.steps;

import com.iii.sierra.api.bdd.jbehave.demo.tests.helpers.JSONHelpers;
import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;
import net.thucydides.core.annotations.Step;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

/**
 * Created by ssatelle on 19/09/14.
 */
public class RestfulSteps {
    private SessionMap sessionMap;
    private RestTemplate restTemplate;
    private JSONHelpers jsonHelpers;

    public RestfulSteps() {
        sessionMap = Thucydides.getCurrentSession();
        restTemplate = new RestTemplate();
        jsonHelpers = new JSONHelpers();
    }

    @Step("get json object from url={0}")
    public String getRestObject(String url) {
        HttpHeaders header = new HttpHeaders();
        String authToken = sessionMap.get("default_auth_token").toString();

        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);

        ResponseEntity response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

        JSONObject jsonObject = jsonHelpers.getJSON(response);

        return jsonObject.toString();
    }

    @Step("post json object from url={0}")
    public String postRestObject(String url) {
        HttpHeaders header = new HttpHeaders();
        String authToken = sessionMap.get("default_auth_token").toString();

        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity<String>("parameters", header);

        ResponseEntity response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

        JSONObject jsonObject = jsonHelpers.getJSON(response);
        jsonObject.toString();


        return jsonObject.toString();
    }
}

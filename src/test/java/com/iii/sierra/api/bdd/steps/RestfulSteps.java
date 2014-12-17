package com.iii.sierra.api.bdd.steps;

import com.iii.sierra.api.bdd.helpers.JSONHelpers;
import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;
import net.thucydides.core.annotations.Step;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

/**
 * Created by ssatelle on 19/09/14.
 */
public class RestfulSteps {
    private RestTemplate restTemplate;
    private JSONHelpers jsonHelpers;

    public RestfulSteps() {
        restTemplate = new RestTemplate();
        jsonHelpers = new JSONHelpers();
    }

    @Step("get json object from url={0}")
    public JSONObject getRestObject(String url, String authToken) {
        HttpHeaders header = new HttpHeaders();

        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity("parameters", header);

        ResponseEntity response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

        JSONObject jsonObject = jsonHelpers.getJSON(response);

        return jsonObject;
    }

    @Step("post json object from url={0}")
    public JSONObject postRestObject(String url, String authToken) {
        HttpHeaders header = new HttpHeaders();

        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity("parameters", header);

        ResponseEntity response = restTemplate.exchange(url, HttpMethod.POST, entity, String.class);

        JSONObject jsonObject = jsonHelpers.getJSON(response);
        jsonObject.toString();

        return jsonObject;
    }

    @Step("get http object from url={0}")
    public ResponseEntity getHttpResponseObject(String url, String authToken) throws HttpClientErrorException {
        HttpHeaders header = new HttpHeaders();

        header.add("Authorization", "Bearer  " + authToken);
        header.add("Content-Type", "application/json");
        HttpEntity<String> entity = new HttpEntity("parameters", header);

        ResponseEntity response = restTemplate.exchange(url, HttpMethod.GET, entity, String.class);

        return response;
    }
}

package com.iii.sierra.api.bdd.jbehave.demo.tests.helpers;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;

/**
 * Created by ssatelle on 16/09/14.
 */
public class JSONHelpers {

    public JSONObject getJSON(ResponseEntity resp) {
        assert (resp.getStatusCode().is2xxSuccessful());
        try {
            JSONObject json = new JSONObject(resp.getBody().toString());
            return json;
        } catch (JSONException e) {
            e.printStackTrace();
        }
        return null;
    }
}

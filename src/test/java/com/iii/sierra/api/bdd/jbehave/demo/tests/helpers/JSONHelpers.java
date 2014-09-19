package com.iii.sierra.api.bdd.jbehave.demo.tests.helpers;

import org.codehaus.jackson.JsonFactory;
import org.codehaus.jackson.JsonNode;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;

import java.io.IOException;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

/**
 * Created by ssatelle on 16/09/14.
 */
public class JSONHelpers {

    public Properties parse(ResponseEntity json) throws IOException {

        JsonFactory factory = new JsonFactory();
        Properties properties = new Properties();

        ObjectMapper mapper = new ObjectMapper(factory);
        JsonNode rootNode = mapper.readTree(json.getBody().toString());
//        String test = rootNode.get("auth_token").getTextValue();

        Iterator<Map.Entry<String,JsonNode>> fieldsIterator;
        fieldsIterator = rootNode.getFields();
        while (fieldsIterator.hasNext()) {

            Map.Entry<String,JsonNode> field = fieldsIterator.next();
            properties.setProperty(field.getKey().toString(), field.getValue().toString());
//            System.out.println("Key:" + field.getKey() + "\tValue:" + field.getValue());
        }

        return properties;
    }

    public JSONObject getJSON(ResponseEntity resp) {
        try {
            if (!resp.getStatusCode().is2xxSuccessful()) {
                throw new Exception();
            }
            return new JSONObject(resp.getBody().toString());
        } catch (JSONException e) {
            e.printStackTrace();
        } catch (Exception x) {
            System.out.println("Error with the response: status code is: " + resp.getStatusCode().toString());
        }
        return new JSONObject();
    }
}

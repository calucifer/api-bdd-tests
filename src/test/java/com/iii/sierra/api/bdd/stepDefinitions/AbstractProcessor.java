package com.iii.sierra.api.bdd.stepDefinitions;

import com.iii.sierra.api.bdd.helpers.JSONHelpers;
import com.iii.sierra.api.bdd.steps.LoginSteps;
import com.iii.sierra.api.bdd.steps.RestfulSteps;
import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;
import net.thucydides.core.annotations.Steps;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;

/**
 * Created by ssatelle on 10/11/14.
 * for the project api-bdd-tests
 */
public abstract class AbstractProcessor {
    ResponseEntity returnedMessage;
    JSONHelpers helper;
    SessionMap session;
    String baseUrl;
    String providedCredentials;
    String authToken;
    JSONObject returnedJSONMessage;

    private static String DEFAULT_SITE_URL="https://dev-api.iii.com/iii/sierra-api";
    private static String DEFAULT_USER="iii";
    private static String DEFAULT_PASSWORD="94400dev";

    @Steps
    RestfulSteps restfulSteps;
    LoginSteps login;

    public AbstractProcessor() {
        helper = new JSONHelpers();
        session = Thucydides.getCurrentSession();
        login = new LoginSteps();
        restfulSteps = new RestfulSteps();
    }

    protected void setDefaultUrl() throws Exception {
        this.setUrl(DEFAULT_SITE_URL);
    }

    protected void setUrl(String url) throws Exception {
        if (url.isEmpty() || url.equalsIgnoreCase("")) {
            throw new Exception("Base URL is not defined");
        }
        this.baseUrl = url;
    }

    protected void setDefaultCredentials() throws Exception {
        this.setCredentials(DEFAULT_USER + ":" + DEFAULT_PASSWORD);
    }

    protected void setCredentials(String credentials) throws Exception {

        if (credentials.isEmpty() || credentials.equalsIgnoreCase("")) {
            throw new Exception("Provided User:Password is not defined");
        }
        this.providedCredentials = credentials;
    }



}

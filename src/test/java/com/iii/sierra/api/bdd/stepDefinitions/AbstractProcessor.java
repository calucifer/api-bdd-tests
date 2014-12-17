package com.iii.sierra.api.bdd.stepDefinitions;

import com.iii.sierra.api.bdd.helpers.JSONHelpers;
import com.iii.sierra.api.bdd.steps.DatabaseSteps;
import com.iii.sierra.api.bdd.steps.LoginSteps;
import com.iii.sierra.api.bdd.steps.RestfulSteps;
import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;
import net.thucydides.core.annotations.Steps;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.HttpClientErrorException;

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
    String dbConnectString;
    String dbUsername;
    String dbPasswd;
    String authToken;
    JSONObject returnedJSONMessage;
    HttpClientErrorException httpErr;

    private static String DEFAULT_SITE_URL="https://dev-api.iii.com/iii/sierra-api";
    private static String DEFAULT_USER="iii";
    private static String DEFAULT_PASSWORD="45727dev";

    private static String DEFAULT_DB_SERVER = "devdb-api.iii.com";
    private static String DEFAULT_DB_PORT = "1032";
    private static String DEFAULT_DB_SCHEMA = "iiirecord";
    private static String DEFAULT_DB_USER = "iiiapp";
    private static String DEFAULT_DB_PASSWD = "devdb-apiU2007";



    @Steps
    RestfulSteps restfulSteps;
    LoginSteps login;
    DatabaseSteps dbSteps;

    public AbstractProcessor() {
        helper = new JSONHelpers();
        session = Thucydides.getCurrentSession();
        login = new LoginSteps();
        restfulSteps = new RestfulSteps();
        dbSteps = new DatabaseSteps();
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

    protected void setDefaultDBUserAndPasswd() throws Exception {
        this.setDBUserAndPasswd(DEFAULT_DB_USER, DEFAULT_DB_PASSWD);

    }

    protected void setDBUserAndPasswd(String dbUsername, String dbPasswd) throws Exception {
        if (dbUsername.isEmpty() || dbUsername.equalsIgnoreCase("")) {
            throw new Exception("Provided Username String is not defined");
        }
        if (dbPasswd.isEmpty() || dbPasswd.equalsIgnoreCase("")) {
            throw new Exception("Provided Password String is not defined");
        }
        this.dbUsername = dbUsername;
        this.dbPasswd = dbPasswd;
    }
    protected void setDefaultDBConnectString() throws Exception{
        this.setDBConnectString("jdbc:postgresql://" + DEFAULT_DB_SERVER + ":" + DEFAULT_DB_PORT + "/" + DEFAULT_DB_SCHEMA);
//                DEFAULT_DB_USER, DEFAULT_DB_PASSWD);
    }

    protected void setDBConnectString(String dbConnectString) throws Exception {
        if (dbConnectString.isEmpty() || dbConnectString.equalsIgnoreCase("")) {
            throw new Exception("Provided DBConnect String is not defined");
        }
        this.dbConnectString = dbConnectString;
    }

    public String getDbConnectString() {
        return dbConnectString;
    }

    public String getDbUsername() {
        return dbUsername;
    }

    public String getDbPasswd() {
        return dbPasswd;
    }
}

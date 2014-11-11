package com.iii.sierra.api.bdd.stepDefinitions;

import org.jbehave.core.annotations.Alias;
import org.jbehave.core.annotations.Given;
import org.jbehave.core.annotations.Pending;
import org.jbehave.core.annotations.When;

/**
 * Created by ssatelle on 04/11/14.
 * for the project api-bdd-tests
 */
public class ProcessingSQLSteps {

    private String dbServer;
    private String holdID;

    public ProcessingSQLSteps() {

    }

    @Given("Given a db server $dbServer and a $holdID")
    @Alias("Given a db server <dbServer> and a <holdID>")
    public void givenDBServerHoldID(String dbServer, String holdID) {
        this.dbServer = dbServer;
        this.holdID = holdID;
    }

    @When("I update the hold status to $status")
    @Alias("I update the hold status to <status>")
    @Pending
    public void updateHoldStatus(String status) {

    }

}

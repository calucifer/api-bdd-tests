package com.iii.sierra.api.bdd.stepDefinitions;

import com.iii.sierra.api.bdd.steps.DatabaseSteps;
import org.jbehave.core.annotations.*;

import java.sql.SQLException;

/**
 * Created by ssatelle on 04/11/14.
 * for the project api-bdd-tests
 */
public class ProcessingSQLSteps extends AbstractProcessor {

    private String holdID;


    public ProcessingSQLSteps() {
        super();
    }

    @Given("My Default dbConnectString is defined")
    public void defaultDBConnectDefined() throws Exception {
        setDefaultDBConnectString();
        dbSteps.setConnectString(getDbConnectString());


    }

    @Given("My Default dbConnectString, username and password are defined")
    public void defaultDBConnectStringAndCredentials() throws Exception {
        setDefaultDBConnectString();
        setDefaultDBUserAndPasswd();
        dbSteps.setConnectString(getDbConnectString());
        dbSteps.setDbPasswd(getDbPasswd());
        dbSteps.setDbUser(getDbUsername());
    }



    @Given("Given a db connect string $dbConnectString a username $user a password $password and a holdID $holdID")
    @Alias("Given a db server <dbConnectString>, <user>, <password> and a <holdID>")
    public void givenDBServerHoldID(String dbConnectString, String holdID) {
        this.dbConnectString = dbConnectString;
        this.holdID = holdID;
    }

    @When("I update the hold $holdID to a status of $holdStatus")
    public void updateHoldStatus(String holdID, String status) throws ClassNotFoundException, SQLException, InterruptedException {
        String statement = "update iiirecord.hold set status = '" + status + "' where id = " + holdID;
        dbSteps.updateStatement(dbConnectString, statement);
//        Thread.sleep(30 * 1000);
    }

    @When("I update the hold status to $status")
    @Alias("I update the hold status to <status>")
    @Pending
    public void updateHoldStatus(String status) throws ClassNotFoundException, SQLException {
        String statement = "update iiirecord.hold set status = '" + status + "' where id = " + holdID;
        dbSteps.updateStatement(dbConnectString, statement);
    }

    @When("I update the database entry for the hold $holdID to a priority of $priority")
    @Alias("I update the database entry for the hold <holdID> to a priority of <priority>")
    public void updateHoldPriority(String holdId, String priority) throws ClassNotFoundException, SQLException {
        String statement = "update iiirecord.hold set patron_records_display_order = " + priority + " where id = " + holdId;
        dbSteps.updateStatement(dbConnectString, statement);
    }

    @Then("the hold status is now $status in the database")
    @Alias("the hold status is now <status> in the database")
    public void holdStatusIsSet(String status) {

    }

}

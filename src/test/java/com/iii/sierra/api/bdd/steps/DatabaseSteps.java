package com.iii.sierra.api.bdd.steps;

import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

import java.sql.*;

/**
 * Created by ssatelle on 12/11/14.
 * for the project api-bdd-tests
 */
public class DatabaseSteps extends ScenarioSteps {
    private Connection conn;
    private String connectString;
    private String dbUser;
    private String dbPasswd;

    public DatabaseSteps() {
        super();
    }


    public DatabaseSteps(String connectString, String dbUser, String dbPasswd) throws ClassNotFoundException, SQLException  {
        this.connectString = connectString;
        this.dbUser = dbUser;
        this.dbPasswd = dbPasswd;
        this.conn = openDb();
    }

    private Connection getConnection(String connectString) throws ClassNotFoundException, SQLException {
        if (conn == null || conn.isClosed()) {
            conn = this.openDb();
        }
        conn.setAutoCommit(false);
        return conn;
    }

    private Connection openDb() throws ClassNotFoundException, SQLException {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager
//                .getConnection("jdbc:postgresql://" + this.connectString, this.dbUser, this.dbPasswd);
//                .getConnection("jdbc:postgresql://localhost:1033/iii" this.connectString, this.dbUser, this.dbPasswd);
                .getConnection("jdbc:postgresql://localhost:1032/iii", this.dbUser, this.dbPasswd);
        return conn;
    }


    @Step("Select data from {0} using statement {1}")
    public ResultSet selectStatement(String connectString, String statement) throws ClassNotFoundException, SQLException {
        Statement stat = this.getConnection(connectString).createStatement();
        ResultSet rs = stat.executeQuery(statement);
        return rs;
    }

    @Step("Update data on {0} using statement {1}")
    public void updateStatement(String connectString,String statement) throws ClassNotFoundException, SQLException {
        Statement stat = this.getConnection(connectString).createStatement();
        stat.executeUpdate(statement);
        conn.commit();
    }

    @Step("Delete data from {0} using statement {1}")
    public void deleteStatement(String connectString,String statement) throws ClassNotFoundException, SQLException {
        Statement stat = this.getConnection(connectString).createStatement();
        stat.executeUpdate(statement);
        conn.commit();
    }


    public String getConnectString() {
        return connectString;
    }

    public void setConnectString(String connectString) {
        this.connectString = connectString;
    }

    public String getDbUser() {
        return dbUser;
    }

    public void setDbUser(String dbUser) {
        this.dbUser = dbUser;
    }

    public String getDbPasswd() {
        return dbPasswd;
    }

    public void setDbPasswd(String dbPasswd) {
        this.dbPasswd = dbPasswd;
    }
}

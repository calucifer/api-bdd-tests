//package com.iii.sierra.api.bdd.helpers;
//
///**
// * Created by ssatelle on 11/11/14.
// * for the project api-bdd-tests
// */
//
//import java.sql.*;
//
//public class PostgresHelper {
//    private Connection conn;
//    private String dbServer;
//    private String dbSchema;
//    private String dbUser;
//    private String dbPasswd;
//    private String dbPort;
//
//    public PostgresHelper(String dbServer, String dbSchema, String dbPort, String dbUser, String dbPasswd ) {
//        this.setDbServer(dbServer);
//        this.setDbSchema(dbSchema);
//        this.setDbPort(dbPort);
//        this.setDbUser(dbUser);
//        this.setDbPasswd(dbPasswd);
//    }
//
//    private Connection getConnection() throws ClassNotFoundException, SQLException {
//        if (conn.isClosed()) {
//            this.openDb();
//        }
//        conn.setAutoCommit(false);
//        return conn;
//    }
//
//    private void openDb() throws ClassNotFoundException, SQLException {
//        Class.forName("org.postgresql.Driver");
//        conn = DriverManager
//                .getConnection("jdbc:postgresql://" + this.getDbServer() + ":" + this.getDbPort() + "/" + this.getDbSchema(),
//                        this.getDbUser(), this.getDbPasswd());
//    }
//
//    public ResultSet selectStatement(String statement) throws ClassNotFoundException, SQLException {
//        Statement stat = this.getConnection().createStatement();
//        ResultSet rs = stat.executeQuery(statement);
//        return rs;
//    }
//
//    public void updateStatement(String statement) throws ClassNotFoundException, SQLException {
//        Statement stat = this.getConnection().createStatement();
//        stat.executeUpdate(statement);
//        conn.commit();
//    }
//
//    public void deleteStatement(String statement) throws ClassNotFoundException, SQLException {
//        Statement stat = this.getConnection().createStatement();
//        stat.executeUpdate(statement);
//        conn.commit();
//    }
//
//
//    public String getDbServer() {
//        return dbServer;
//    }
//
//    public void setDbServer(String dbServer) {
//        this.dbServer = dbServer;
//    }
//
//    public String getDbUser() {
//        return dbUser;
//    }
//
//    public void setDbUser(String dbUser) {
//        this.dbUser = dbUser;
//    }
//
//    public String getDbPasswd() {
//        return dbPasswd;
//    }
//
//    public void setDbPasswd(String dbPasswd) {
//        this.dbPasswd = dbPasswd;
//    }
//
//    public String getDbPort() {
//        return dbPort;
//    }
//
//    public void setDbPort(String dbPort) {
//        this.dbPort = dbPort;
//    }
//
//    public String getDbSchema() {
//        return dbSchema;
//    }
//
//    public void setDbSchema(String dbSchema) {
//        this.dbSchema = dbSchema;
//    }
//
//}

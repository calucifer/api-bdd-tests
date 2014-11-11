package com.iii.sierra.api.bdd.helpers;

/**
 * Created by ssatelle on 11/11/14.
 * for the project api-bdd-tests
 */

import java.sql.Connection;
import java.sql.DriverManager;

public class PostGresHelper {
    public static void main(String args[]) {
        Connection c = null;
        try {
            Class.forName("org.postgresql.Driver");
            c = DriverManager
                    .getConnection("jdbc:postgresql://localhost:1033/iii",
                            "iii", "apiPGR2007");
        } catch (Exception e) {
            e.printStackTrace();
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            System.exit(0);
        }
        System.out.println("Opened database successfully");
    }
}

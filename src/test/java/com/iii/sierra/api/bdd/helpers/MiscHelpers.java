package com.iii.sierra.api.bdd.helpers;

import net.thucydides.core.SessionMap;
import net.thucydides.core.Thucydides;

import java.util.Properties;

/**
 * Created by ssatelle on 04/11/14.
 * for the project api-bdd-tests
 */
public class MiscHelpers {



    SessionMap sessionMap = Thucydides.getCurrentSession();
    Properties prop = System.getProperties();
}

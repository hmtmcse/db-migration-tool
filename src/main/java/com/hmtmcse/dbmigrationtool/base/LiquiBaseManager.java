package com.hmtmcse.dbmigrationtool.base;

import java.sql.Connection;

public class LiquiBaseManager {

    private Connection connection;
    public LiquiBaseManager(Connection connection){
        this.connection = connection;
    }

}

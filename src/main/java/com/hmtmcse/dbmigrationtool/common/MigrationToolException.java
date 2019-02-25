package com.hmtmcse.dbmigrationtool.common;

/**
 * Created by Touhid Mia on 11/09/2014.
 */
public class MigrationToolException extends Exception {

    public MigrationToolException(){
        super("DB Migration Tool Exception Occurred!");
    }

    public MigrationToolException(String message){
        super(message);
    }
}

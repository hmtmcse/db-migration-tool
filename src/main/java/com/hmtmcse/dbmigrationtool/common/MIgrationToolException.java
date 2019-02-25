package com.hmtmcse.dbmigrationtool.common;

/**
 * Created by Touhid Mia on 11/09/2014.
 */
public class MIgrationToolException extends Exception {

    public MIgrationToolException(){
        super("DB Migration Tool Exception Occurred!");
    }

    public MIgrationToolException(String message){
        super(message);
    }
}

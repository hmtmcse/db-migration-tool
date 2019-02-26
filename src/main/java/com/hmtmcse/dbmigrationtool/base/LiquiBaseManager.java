package com.hmtmcse.dbmigrationtool.base;

import liquibase.integration.commandline.Main;


public class LiquiBaseManager {

    public static void main(String[] args) {
        String[] generateChangeLog = {
                "--changeLogFile=current-changelog.xml",
                "--url=jdbc:mysql://localhost/task_manager",
                "--username=root",
                "--password=",
                "generateChangeLog"
        };

        String[] dbDoc = {
                "--changeLogFile=current-changelog.xml",
                "--url=jdbc:mysql://localhost/task_manager",
                "--username=root",
                "--password=",
                "dbDoc",
                "./dbDoc",
        };


        Main.main(dbDoc);
    }

}

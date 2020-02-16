package com.hmtmcse.dbmigrationtool.base;

import liquibase.integration.commandline.Main;


public class LiquiBaseManager {

    public static void main(String[] args) {
        String[] generateChangeLog = {
                "--changeLogFile=current-changelog.json",
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

        String[] updateSQL = {
                "--changeLogFile=current-changelog.xml",
                "--url=jdbc:mysql://localhost/task_manager1",
                "--username=root",
                "--password=",
                "--outputFile=./dbDoc/updateSql.sql",
                "updateSQL"
        };

        String[] diff = {
                "--url=jdbc:mysql://localhost/task_manager1",
                "--username=root",
                "--password=",
                "--outputFile=./dbDoc/diff.sql",
                "--referenceUrl=jdbc:mysql://localhost/task_manager",
                "--referenceUsername=root",
                "--referencePassword=",
                "diff"
        };

        String[] update = {
                "--changeLogFile=current-changelog.xml",
                "--url=jdbc:mysql://localhost/task_manager",
                "--username=root",
                "--password=",
                "--outputFile=./dbDoc/updateSql.sql",
                "update"
        };


        Main.main(generateChangeLog);
//        Main.main(generateChangeLog);
    }

}

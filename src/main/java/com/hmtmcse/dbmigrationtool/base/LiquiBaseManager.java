package com.hmtmcse.dbmigrationtool.base;

import liquibase.integration.commandline.Main;


public class LiquiBaseManager {

    public static void main(String[] args) {
        String[] generateChangeLog = {
                "--changeLogFile=current-changelog1.json",
                "--url=jdbc:mysql://localhost/task_manager1",
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
                "--changeLogFile=./dbDoc/diffChangeLog.json",
                "--url=jdbc:mysql://localhost/task_manager",
                "--username=root",
                "--password=",
                "--outputFile=./dbDoc/updateSql.sql",
                "updateSQL"
        };

        String[] diff = {
                "--url=jdbc:mysql://localhost/task_manager",
                "--username=root",
                "--password=",
                "--outputFile=./dbDoc/diff.txt",
                "diff",
                "--referenceUrl=jdbc:mysql://localhost/task_manager",
                "--referenceUsername=root",
                "--referencePassword="
        };

        String[] diffChangeLog = {
                "--changeLogFile=./dbDoc/diffChangeLog.json",
                "--url=jdbc:mysql://localhost/task_manager",
                "--username=root",
                "--password=",
                "--outputFile=./dbDoc/diff.txt",
                "diffChangeLog",
                "--referenceUrl=jdbc:mysql://localhost/task_manager1",
                "--referenceUsername=root",
                "--referencePassword="
        };

        String[] update = {
                "--changeLogFile=current-changelog1.json",
                "--url=jdbc:mysql://localhost/task_manager",
                "--username=root",
                "--password=",
                "--outputFile=./dbDoc/updateSql.sql",
                "update"
        };


        Main.main(updateSQL);
//        Main.main(generateChangeLog);
    }

}

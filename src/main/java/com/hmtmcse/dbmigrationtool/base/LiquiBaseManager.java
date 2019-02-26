package com.hmtmcse.dbmigrationtool.base;

import liquibase.integration.commandline.Main;


public class LiquiBaseManager {



    public void start(){
        String[] myList = {
                "--changeLogFile=current-changelog.xml",
                "--url=jdbc:mysql://localhost/task_manager",
                "--username=root",
                "--password=",
                "generateChangeLog"};

        Main.main(myList);
    }

}

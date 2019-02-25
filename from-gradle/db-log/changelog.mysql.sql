--liquibase formatted sql

--changeset hmtmc:1551114893992-1
CREATE TABLE assignee (id BIGINT AUTO_INCREMENT NOT NULL, task_type VARCHAR(255) NOT NULL, date_created datetime NOT NULL, uuid VARCHAR(255) NOT NULL, assign_to_id INT NOT NULL, last_updated datetime NOT NULL, todo_id BIGINT NOT NULL, created_by_id INT NOT NULL, CONSTRAINT PK_ASSIGNEE PRIMARY KEY (id));

--changeset hmtmc:1551114893992-2
CREATE TABLE bug_report (id BIGINT AUTO_INCREMENT NOT NULL, date_created datetime NOT NULL, is_deleted BIT(1) NOT NULL, uuid VARCHAR(255) NOT NULL, last_updated datetime NOT NULL, bug_type VARCHAR(255) NULL, other_info LONGTEXT NULL, parent_issue_id BIGINT NOT NULL, reporter_id INT NOT NULL, json_data LONGTEXT NULL, related_issue_id BIGINT NULL, name VARCHAR(255) NOT NULL, status VARCHAR(255) NOT NULL, `description` LONGTEXT NULL, step_id BIGINT NULL, CONSTRAINT PK_BUG_REPORT PRIMARY KEY (id));

--changeset hmtmc:1551114893992-3
CREATE TABLE bug_report_user (bug_report_assignee_id BIGINT NOT NULL, user_id INT NULL);

--changeset hmtmc:1551114893992-4
CREATE TABLE bug_work_log (id BIGINT AUTO_INCREMENT NOT NULL, bug_report_id BIGINT NOT NULL, date_created datetime NOT NULL, last_updated datetime NOT NULL, task_owner_id INT NOT NULL, log_type VARCHAR(255) NOT NULL, started_moment datetime NULL, `description` LONGTEXT NULL, end_moment datetime NULL, CONSTRAINT PK_BUG_WORK_LOG PRIMARY KEY (id));

--changeset hmtmc:1551114893992-5
CREATE TABLE change_log (id BIGINT AUTO_INCREMENT NOT NULL, json_data LONGTEXT NULL, is_deleted BIT(1) NOT NULL, date_created datetime NOT NULL, uuid VARCHAR(255) NOT NULL, last_updated datetime NOT NULL, name VARCHAR(255) NOT NULL, todo_id BIGINT NOT NULL, other_info LONGTEXT NULL, `description` LONGTEXT NULL, CONSTRAINT PK_CHANGE_LOG PRIMARY KEY (id));

--changeset hmtmc:1551114893992-6
CREATE TABLE complexity (id BIGINT AUTO_INCREMENT NOT NULL, estimated_hour DOUBLE NULL, is_deleted BIT(1) NOT NULL, date_created datetime NOT NULL, uuid VARCHAR(255) NOT NULL, last_updated datetime NOT NULL, todo_id BIGINT NOT NULL, other_info LONGTEXT NULL, json_data LONGTEXT NULL, task_type VARCHAR(255) NOT NULL, sort_order INT NULL, name VARCHAR(255) NOT NULL, is_lock BIT(1) NOT NULL, type VARCHAR(255) NULL, status VARCHAR(255) NOT NULL, started_moment datetime NULL, `description` LONGTEXT NULL, `reference` LONGTEXT NULL, CONSTRAINT PK_COMPLEXITY PRIMARY KEY (id));

--changeset hmtmc:1551114893992-7
CREATE TABLE data_change_history (id BIGINT AUTO_INCREMENT NOT NULL, rowid BIGINT NULL, rowuuid VARCHAR(255) NULL, changed_data_json LONGTEXT NOT NULL, date_created datetime NOT NULL, uuid VARCHAR(255) NOT NULL, last_updated datetime NOT NULL, domain_name VARCHAR(255) NOT NULL, changed_by_id BIGINT NULL, CONSTRAINT PK_DATA_CHANGE_HISTORY PRIMARY KEY (id));

--changeset hmtmc:1551114893992-8
CREATE TABLE notes (id BIGINT AUTO_INCREMENT NOT NULL, json_data LONGTEXT NULL, is_deleted BIT(1) NOT NULL, date_created datetime NOT NULL, uuid VARCHAR(255) NOT NULL, last_updated datetime NOT NULL, name VARCHAR(255) NOT NULL, user_id INT NULL, todo_id BIGINT NULL, `description` LONGTEXT NULL, CONSTRAINT PK_NOTES PRIMARY KEY (id));

--changeset hmtmc:1551114893992-9
CREATE TABLE steps (id BIGINT AUTO_INCREMENT NOT NULL, estimated_hour DOUBLE NULL, date_created datetime NOT NULL, is_deleted BIT(1) NOT NULL, uuid VARCHAR(255) NOT NULL, last_updated datetime NOT NULL, todo_id BIGINT NULL, other_info LONGTEXT NULL, json_data LONGTEXT NULL, sort_order INT NULL, name VARCHAR(255) NOT NULL, is_lock BIT(1) NOT NULL, status VARCHAR(255) NOT NULL, complexity_id BIGINT NULL, started_moment datetime NULL, `description` LONGTEXT NULL, `reference` LONGTEXT NULL, CONSTRAINT PK_STEPS PRIMARY KEY (id));

--changeset hmtmc:1551114893992-10
CREATE TABLE todo (id BIGINT AUTO_INCREMENT NOT NULL, estimated_hour DOUBLE NULL, is_deleted BIT(1) NOT NULL, date_created datetime NOT NULL, uuid VARCHAR(255) NOT NULL, last_updated datetime NOT NULL, private_for_id INT NULL, external_info LONGTEXT NULL, due_date datetime NULL, parent_issue_id BIGINT NULL, json_data LONGTEXT NULL, todo_type VARCHAR(255) NOT NULL, priority VARCHAR(255) NULL, name VARCHAR(255) NOT NULL, is_lock BIT(1) NOT NULL, created_by_id INT NOT NULL, status VARCHAR(255) NOT NULL, started_moment datetime NULL, `description` LONGTEXT NULL, execute_date datetime NULL, external_id VARCHAR(255) NULL, `reference` LONGTEXT NULL, CONSTRAINT PK_TODO PRIMARY KEY (id));

--changeset hmtmc:1551114893992-11
CREATE TABLE user (id INT AUTO_INCREMENT NOT NULL, date_created datetime NOT NULL, first_name VARCHAR(255) NOT NULL, uuid VARCHAR(255) NULL, last_updated datetime NOT NULL, password VARCHAR(255) NOT NULL, last_name VARCHAR(255) NULL, email VARCHAR(255) NOT NULL, user_role VARCHAR(255) NOT NULL, is_active BIT(1) NOT NULL, is_deleted BIT(1) NOT NULL, is_external_user BIT(1) NOT NULL, CONSTRAINT PK_USER PRIMARY KEY (id), UNIQUE (email));

--changeset hmtmc:1551114893992-12
CREATE TABLE work_log (id BIGINT AUTO_INCREMENT NOT NULL, date_created datetime NOT NULL, last_updated datetime NOT NULL, task_owner_id INT NOT NULL, log_type VARCHAR(255) NOT NULL, started_moment datetime NULL, `description` LONGTEXT NULL, end_moment datetime NULL, CONSTRAINT PK_WORK_LOG PRIMARY KEY (id));

--changeset hmtmc:1551114893992-13
CREATE INDEX FK1ago4b0mgtxnt0a04qaeco7yb ON bug_report_user(bug_report_assignee_id);

--changeset hmtmc:1551114893992-14
CREATE INDEX FK1jaudkrlytn99js2leicjd7xj ON bug_report(parent_issue_id);

--changeset hmtmc:1551114893992-15
CREATE INDEX FK57a50ldgo07hgq2fa3tjh2lqy ON bug_work_log(bug_report_id);

--changeset hmtmc:1551114893992-16
CREATE INDEX FK58yqhir7gnuk875936ltx3eua ON change_log(todo_id);

--changeset hmtmc:1551114893992-17
CREATE INDEX FK5nilntnpbstgkspb646pvio9c ON complexity(todo_id);

--changeset hmtmc:1551114893992-18
CREATE INDEX FK81y6xsq90m50jmops9o6t5ngk ON bug_report_user(user_id);

--changeset hmtmc:1551114893992-19
CREATE INDEX FK886k20yvp6ikroxcojn1ikd6p ON todo(created_by_id);

--changeset hmtmc:1551114893992-20
CREATE INDEX FK8k5kxo1je4v67j5g20pll6stg ON bug_work_log(task_owner_id);

--changeset hmtmc:1551114893992-21
CREATE INDEX FKcapa0lprq1rkgru2fydcw9bxs ON assignee(created_by_id);

--changeset hmtmc:1551114893992-22
CREATE INDEX FKei4htn8mr4qmbsq8d837ql90b ON steps(todo_id);

--changeset hmtmc:1551114893992-23
CREATE INDEX FKfesq4vni0yujefn5s404ae0o9 ON assignee(todo_id);

--changeset hmtmc:1551114893992-24
CREATE INDEX FKfv4yskjtpqax7c8klfw25lly6 ON steps(complexity_id);

--changeset hmtmc:1551114893992-25
CREATE INDEX FKjmtcdwq3hk3c1g7eqgcfekpao ON notes(todo_id);

--changeset hmtmc:1551114893992-26
CREATE INDEX FKjqwxc4dfyondk0dt2rb5tuag5 ON bug_report(related_issue_id);

--changeset hmtmc:1551114893992-27
CREATE INDEX FKn1k134st415fs1h1kicujql9r ON assignee(assign_to_id);

--changeset hmtmc:1551114893992-28
CREATE INDEX FKnww9ckb6iguhwrq9ybj4y7v40 ON todo(private_for_id);

--changeset hmtmc:1551114893992-29
CREATE INDEX FKpbat1htii9ulwltx0ujg9b5k2 ON todo(parent_issue_id);

--changeset hmtmc:1551114893992-30
CREATE INDEX FKs5tgl2dojg5t8bsk55yssmuqv ON bug_report(step_id);

--changeset hmtmc:1551114893992-31
CREATE INDEX FKsncua5ftnqcfg0q2pg8ylcs3x ON notes(user_id);

--changeset hmtmc:1551114893992-32
CREATE INDEX FKssrbhmsrusa9owb39jx6c3lfy ON work_log(task_owner_id);

--changeset hmtmc:1551114893992-33
CREATE INDEX FKt5p7ltmjo7g0m5m32c8o1axip ON bug_report(reporter_id);

--changeset hmtmc:1551114893992-34
ALTER TABLE bug_report_user ADD CONSTRAINT FK1ago4b0mgtxnt0a04qaeco7yb FOREIGN KEY (bug_report_assignee_id) REFERENCES bug_report (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-35
ALTER TABLE bug_report ADD CONSTRAINT FK1jaudkrlytn99js2leicjd7xj FOREIGN KEY (parent_issue_id) REFERENCES todo (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-36
ALTER TABLE bug_work_log ADD CONSTRAINT FK57a50ldgo07hgq2fa3tjh2lqy FOREIGN KEY (bug_report_id) REFERENCES bug_report (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-37
ALTER TABLE change_log ADD CONSTRAINT FK58yqhir7gnuk875936ltx3eua FOREIGN KEY (todo_id) REFERENCES todo (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-38
ALTER TABLE complexity ADD CONSTRAINT FK5nilntnpbstgkspb646pvio9c FOREIGN KEY (todo_id) REFERENCES todo (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-39
ALTER TABLE bug_report_user ADD CONSTRAINT FK81y6xsq90m50jmops9o6t5ngk FOREIGN KEY (user_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-40
ALTER TABLE todo ADD CONSTRAINT FK886k20yvp6ikroxcojn1ikd6p FOREIGN KEY (created_by_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-41
ALTER TABLE bug_work_log ADD CONSTRAINT FK8k5kxo1je4v67j5g20pll6stg FOREIGN KEY (task_owner_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-42
ALTER TABLE assignee ADD CONSTRAINT FKcapa0lprq1rkgru2fydcw9bxs FOREIGN KEY (created_by_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-43
ALTER TABLE steps ADD CONSTRAINT FKei4htn8mr4qmbsq8d837ql90b FOREIGN KEY (todo_id) REFERENCES todo (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-44
ALTER TABLE assignee ADD CONSTRAINT FKfesq4vni0yujefn5s404ae0o9 FOREIGN KEY (todo_id) REFERENCES todo (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-45
ALTER TABLE steps ADD CONSTRAINT FKfv4yskjtpqax7c8klfw25lly6 FOREIGN KEY (complexity_id) REFERENCES complexity (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-46
ALTER TABLE notes ADD CONSTRAINT FKjmtcdwq3hk3c1g7eqgcfekpao FOREIGN KEY (todo_id) REFERENCES todo (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-47
ALTER TABLE bug_report ADD CONSTRAINT FKjqwxc4dfyondk0dt2rb5tuag5 FOREIGN KEY (related_issue_id) REFERENCES todo (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-48
ALTER TABLE assignee ADD CONSTRAINT FKn1k134st415fs1h1kicujql9r FOREIGN KEY (assign_to_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-49
ALTER TABLE todo ADD CONSTRAINT FKnww9ckb6iguhwrq9ybj4y7v40 FOREIGN KEY (private_for_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-50
ALTER TABLE todo ADD CONSTRAINT FKpbat1htii9ulwltx0ujg9b5k2 FOREIGN KEY (parent_issue_id) REFERENCES todo (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-51
ALTER TABLE bug_report ADD CONSTRAINT FKs5tgl2dojg5t8bsk55yssmuqv FOREIGN KEY (step_id) REFERENCES steps (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-52
ALTER TABLE notes ADD CONSTRAINT FKsncua5ftnqcfg0q2pg8ylcs3x FOREIGN KEY (user_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-53
ALTER TABLE work_log ADD CONSTRAINT FKssrbhmsrusa9owb39jx6c3lfy FOREIGN KEY (task_owner_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;

--changeset hmtmc:1551114893992-54
ALTER TABLE bug_report ADD CONSTRAINT FKt5p7ltmjo7g0m5m32c8o1axip FOREIGN KEY (reporter_id) REFERENCES user (id) ON UPDATE NO ACTION ON DELETE NO ACTION;


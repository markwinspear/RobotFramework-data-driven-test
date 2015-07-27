*** Settings ***
Documentation  These are some MySql Database tests
Resource  ../Resources/DB/MySql.robot
Suite Setup         Connect To Database    pymysql    ${DBName}    ${DB_USER_NAME}    ${DB_USER_PASSWORD}    ${DB_HOST}    ${DB_PORT}
Suite Teardown      Disconnect From Database

# Many ways to run:
# pybot -d results/my-sql tests/MySql_Tests.robot
# pybot -d results/my-sql -i MySqlDB tests
# pybot -d results tests

*** Variables ***


*** Test Cases ***
Insert a Record
    [Tags]  MySqlDB
    MySql.Save Current Row Count
    MySql.Get Input Data
    MySql.Insert Record
    MySql.Verify New Record Added

Verify Insert Contains Correct Input Data
    [Tags]  MySqlDB
    MySql.Verify Last Record

Log All Rows
    [Tags]  MySqlDB
    MySql.Log All Rows
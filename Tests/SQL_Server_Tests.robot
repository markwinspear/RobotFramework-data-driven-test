*** Settings ***
Documentation  These are some SQL Server Database tests
Resource  Resources/DB/SQL_Server.robot
Test Setup  SQL_Server.Connect
Test Teardown  SQL_Server.Disconnect

# Many ways to run:
# pybot -d results/sql-server tests/SQL_Server_Tests.robot
# pybot -d results/sql server -i SqlServerDB tests
# pybot -d results tests

*** Variables ***


*** Test Cases ***
Insert a Record
    [Tags]  SqlServerDB
    SQL_Server.Save Current Row Count
    SQL_Server.Get Input Data
    SQL_Server.Insert Record
    SQL_Server.Verify New Record Added

Verify Insert Contains Correct Input Data
    [Tags]  SqlServerDB
    SQL_Server.Verify Last Record

Log All Rows
    SQL_Server.Log All Rows
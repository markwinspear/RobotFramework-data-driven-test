*** Settings ***
Library  excel
Library  Collections
Resource  ../Resources/Web/PO/Login.robot
Resource        BaseWebTest.robot             # required for all tests

Test Setup      Common.Begin Web Test                   # required for all tests
Test Teardown   Common.End Web Test                     # required for all tests

*** Variables ***
${logins}

*** Test Cases ***

Login Should Succeed
    [tags]  TODO
    Get Logins  C:/Users/markwinspear/Desktop/test.xlsx  login_pass  passes


Login Should Fail
    [tags]  Current
    Get Logins  C:/Users/markwinspear/Desktop/test.xlsx  login_fail  fails

*** Keywords ***



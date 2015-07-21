*** Settings ***
Documentation  This is some basic info about the whole suite

Resource        ${CURDIR}/BaseWebTest.robot             # required for all tests
Test Template   Login Should Fail When                  # because this is data driven test
Test Setup      Common.Begin Web Test                   # required for all tests
Test Teardown   Common.End Web Test                     # required for all tests

*** Variables ***

*** Test Cases ***          Username        Password
The Password is wrong       tomsmith        Super
The Password is empty       tomsmith        ${empty}
Both fields are empty       ${empty}        ${empty}

*** Keywords ***
Login Should Fail When  [Arguments]  ${username}  ${password}
    Login.Load
    Login.With  ${username}  ${password}
    Login.Verify Login Fails
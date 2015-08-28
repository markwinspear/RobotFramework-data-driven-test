*** Settings ***
Documentation     Tests the login functionality
Test Setup        Common.Begin Web Test    # required for all tests
Test Teardown     Common.End Web Test    # required for all tests
Test Template     Login Should Fail When    # because this is data driven test
Resource          ${CURDIR}/BaseWebTest.robot    # required for all tests

*** Variables ***

*** Test Cases ***    Username    Password
The Password is wrong
                      [Tags]      TestMultiple
                      tomsmith    Super
                      tomsmith    Testy

The Password is empty
                      tomsmith    ${empty}

Both fields are empty
                      ${empty}    ${empty}

Username is wrong     test        test

*** Keywords ***
Login Should Fail
    [Arguments]    ${username}    ${password}
    #Login
    With    ${username}    ${password}
    Verify Login Fails

*** Settings ***
Documentation     This is some basic info about the whole suite
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
Login Should Fail When
    [Arguments]    ${username}    ${password}
    Login.Load                                          #Login. is optional. Used for readability
    Login.With    ${username}    ${password}
    Login.Verify Login Fails

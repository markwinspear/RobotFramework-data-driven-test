*** Settings ***
# These lines are required for each page object to import objects from the ObjectMap
Resource    ${CURDIR}/BasePage.robot
Variables   ${CURDIR}/ObjectMap.py    Login

*** Variables ***

*** Keywords ***
Load
    Go To  http://the-internet.herokuapp.com/login
    Wait Until Page Contains  Login Page

Enter Username  [Arguments]  ${username}
    Input Text  ${username_field}  ${username}

Enter Password  [Arguments]  ${password}
    Input Text  ${password_field}  ${password}

Click Login Button
    Click Button    ${login_button}

Verify Login Is Successful
    Page Should Contain  You logged into a secure area!

Verify Login Fails
    Page Should Contain Element  ${error_message}
    #Page Should Contain Element  xpath=//*[text()="Your username is invalid!" or text()="Your password is invalid!"]

With  [Arguments]  ${username}    ${password}
    Load
    Enter Username  ${username}
    Enter Password  ${password}
    Click Login Button

Get Logins  [Arguments]  ${filename}  ${sheet_name}  ${expected_result}
    [Documentation]  Takes the filename, sheet name and expected result (must be 'passes' or 'fails' and executes login tests
    ...  it will loop over all usernames and passwords in the test file and continue on failure and log errors where tests fail

    ${logins} =  excel.get logins  ${filename}  ${sheet_name}
    @{items}=    Get Dictionary Items    ${logins}
    :FOR    ${key}    ${value}    IN    @{items}
    \   Log    ${key} : ${value}
    \   Login.With  ${key}  ${value}
    \   Run Keyword And Continue On Failure  Verify Login  ${expected_result}

Verify Login  [Arguments]  ${expected_result}
    RUN KEYWORD If  "${expected_result}" == 'fails'  Login.Verify Login Fails
    ...  ELSE IF  "${expected_result}" == 'passes'  Login.Verify Login Is Successful
    ...  ELSE  fail("Expected result must be passes or fails)




*** Settings ***
Library  Selenium2Library

*** Variables ***
${username_locator}         id=username
${password_locator}         id=password
${loginButton_locator}      xpath=//*[@id="login"]/button
${errorMessage_locator}     xpath=//*[@class="flash error"]

*** Keywords ***
Load
    Go To  http://the-internet.herokuapp.com/login
    Wait Until Page Contains  Login Page

Enter Username  [Arguments]  ${username}
    Input Text  ${username_locator}  ${username}

Enter Password  [Arguments]  ${password}
    Input Text  ${password_locator}  ${password}

Click Login Button
    Click Button    ${loginButton_locator}

Verify Login Is Successful
    Page Should Contain  You logged into a secure area!

Verify Login Fails
    Page Should Contain Element  ${errorMessage_locator}
    #Page Should Contain Element  xpath=//*[text()="Your username is invalid!" or text()="Your password is invalid!"]

With  [Arguments]  ${username}    ${password}
    Load
    Enter Username  ${username}
    Enter Password  ${password}
    Click Login Button



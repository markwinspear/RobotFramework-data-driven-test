*** Settings ***
Library  Selenium2Library

*** Variables ***
${username_field}         id=username
${password_field}         id=password
${login_button}           xpath=//*[@id="login"]/button
${error_message}          xpath=//*[@class="flash error"]

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



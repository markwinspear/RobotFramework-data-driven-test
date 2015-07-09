*** Settings ***
Library  Selenium2Library

*** Variables ***


*** Keywords ***
Load
    Go To  http://the-internet.herokuapp.com/login
    Wait Until Page Contains  Login Page

Enter Username  [Arguments]  ${username}
    Input Text  id=username  ${username}

Enter Password  [Arguments]  ${password}
    Input Text  id=password  ${password}

Click Login Button
    Click Button    xpath=//*[@id="login"]/button

Verify Login Is Successful
    Page Should Contain  You logged into a secure area!

Verify Login Fails
    Page Should Contain Element  xpath=//*[@class="flash error"]

With  [Arguments]  ${username}    ${password}
    Load
    Enter Username  ${username}
    Enter Password  ${password}
    Click Login Button



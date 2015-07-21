*** Settings ***
Documentation  This is some basic info about the whole suite

Resource  ../Resources/Web/Common.robot                 # necessary for Setup & Teardown
Resource  ../Resources/Web/PO/Login.robot               # necessary for lower level keywords in test cases
Test Template   Login Should Fail When               #because this is data driven test
Test Setup  Common.Begin Remote Web Test
Test Teardown  Common.End Remote Web Test

*** Variables ***
# including default values which can be overriden using -v at runtime
${BROWSER} =  ie
#${SEARCH_TERM} =  ferrari 458
${REMOTE_URL} =  http://markwinspear:3e478c65-7a2a-4119-b4a1-cb96b23e6ed5@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES} =  name:Win8 + Chrome 43,platform:Windows 8.1,browserName:chrome,version:43

*** Test Cases ***          Username        Password
The Password is wrong       tomsmith        Super
The Password is empty       tomsmith        ${empty}
Both fields are empty       ${empty}        ${empty}

*** Keywords ***
Login Should Fail When  [Arguments]  ${username}  ${password}
    Login.Load
    Login.With  ${username}  ${password}
    Login.Verify Login Fails
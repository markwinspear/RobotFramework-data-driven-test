*** Settings ***
Documentation  This is some basic info about the whole suite
# notice we're no longer referencing the Selenium2Library in our script!
Resource  ../Resources/Common.robot  # necessary for Setup & Teardown
Resource  ../Resources/PO/Login.robot  # necessary for lower level keywords in test cases
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

*** Variables ***
${BROWSER} =  ie
#${SEARCH_TERM} =  ferrari 458
${REMOTE_URL} =  http://markwinspear:3e478c65-7a2a-4119-b4a1-cb96b23e6ed5@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES} =  name:Win8 + Chrome 43,platform:Windows 8.1,browserName:chrome,version:43
# Copy/paste the below line to Terminal window to execute
# pybot -d results tests/amazon.robot

*** Test Cases ***
Login Fails With Invalid Details
    Login.Load
    Login.With  fred    dave
    Login.Verify Login Fails

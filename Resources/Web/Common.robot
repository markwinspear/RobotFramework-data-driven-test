*** Settings ***
Library  Selenium2Library
Library  Saucelabs
Library  BuiltIn

*** Variables ***

*** Keywords ***
Begin Web Test
    [Documentation]  if remote url is blank, this will open a local browser, else it will open sauce labs (default)
    ...  to execute locally use -v BROWSER:[browser] -v REMOTE_URL:"" -v DESIRED_CAPABILITIES:""
    log many    "Capabilities to use:"  ${BROWSER}  ${DESIRED_CAPABILITIES}
    run keyword if  '${REMOTE_URL}' != ""  Open Browser  about:blank  ${BROWSER}  remote_url=${REMOTE_URL}  desired_capabilities=${DESIRED_CAPABILITIES}
    ...  ELSE  Open Browser  about:blank  ${BROWSER}
    # Maximize Browser Window - needs to be non-mobile specific

End Web Test
    [Documentation]  This line updates the test case name, result and tags in the SauceLabs UI
    ...  after the test case has completed, but before closing the browser
    ...  http://datakurre.pandala.org/2014/03/cross-browser-selenium-testing-with.html
    Run keyword if  '${REMOTE_URL}' != ''
    ...  Update Saucelabs Test Result
    ...  ${SUITE_NAME}: ${TEST_NAME}
    ...  ${TEST_STATUS}  ${TEST_TAGS}  ${REMOTE_URL}
    Close Browser
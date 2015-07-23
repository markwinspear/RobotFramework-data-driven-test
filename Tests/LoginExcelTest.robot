*** Settings ***
Library  excel
Library  Collections

Resource        ${CURDIR}/BaseWebTest.robot             # required for all tests
Test Setup      Common.Begin Web Test                   # required for all tests
Test Teardown   Common.End Web Test                     # required for all tests

*** Variables ***
${logins}

*** Test Cases ***

Login Should Succeed
    [tags]  TODO
    Get Logins  C:/Users/markwinspear/Desktop/test.xlsx  login_pass  passes


Login Should Fail
    [tags]  Current
    Get Logins  C:/Users/markwinspear/Desktop/test.xlsx  login_fail  fails


*** Keywords ***
Get Logins  [Arguments]  ${filename}  ${sheet_name}  ${expected_result}
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



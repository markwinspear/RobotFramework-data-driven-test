*** Settings ***
Documentation  These are some API tests
Resource  Resources/API/Github.robot

# Many ways to run:
# pybot -d results/api tests/API_Tests.robot
# pybot -d results/api -i API tests
# pybot -d results/api tests

*** Variables ***


*** Test Cases ***
Make a simple REST API call
    [Tags]  API
    Check Github Username

Display emoji from Github
    [Tags]  API
    Display Emoji
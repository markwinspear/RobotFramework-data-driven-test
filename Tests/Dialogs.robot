*** Settings ***
Documentation  These are some web tests
Library  Dialogs
Resource  ../Resources/Web/Common.robot
Resource  ../Resources/Web/Amazon.robot
Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# pybot -d results/dialogs tests/dialogs.robot
*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://www.amazon.com
${SEARCH_TERM} =  Ferrari 458

*** Test Cases ***
Logged out user can search for products
    [Tags]  Web
    ${new_browser} =  Get Selection From User  Which browser?  chrome  ie  firefox
    Set Global Variable  ${BROWSER}  ${new_browser}
    Amazon.Search for Products

Logged out user can add product to cart
    [Tags]  Web
    Amazon.Search for Products
    Execute Manual Step  Do something manually!  It failed!
    Amazon.Select Product from Search Results
    Pause Execution
    Amazon.Add Product to Cart
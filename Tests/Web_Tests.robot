*** Settings ***
Documentation  These are some web tests
Library  Dialogs
Resource  ../Resources/Web/Common.robot
Resource  ../Resources/Web/Amazon.robot
Test Setup  Common.Begin Local Web Test
Test Teardown  Common.End Local Web Test

*** Variables ***
${BROWSER} =  chrome
${START_URL} =  https://www.amazon.com
${SEARCH_TERM} =  Ferrari 458
${REMOTE_URL} =  http://markwinspear:3e478c65-7a2a-4119-b4a1-cb96b23e6ed5@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES} =  name:Win8 + Chrome 43,platform:Windows 8.1,browserName:chrome,version:43

*** Test Cases ***
Logged out user can search for products
    [Tags]  Web
    ${new_browser} =  Get Selection From User  which browser?  chrome  ie  firefox
    Set Global Variable  ${BROWSER}  ${new_browser}
    Amazon.Search for Products

Logged out user can add product to cart
    [Tags]  Web
    Amazon.Search for Products
    execute manual step  Do Something Manually  It Failed!
    Amazon.Select Product from Search Results
    pause execution
    Amazon.Add Product to Cart


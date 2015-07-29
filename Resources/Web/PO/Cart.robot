*** Settings ***
Documentation  Page object representing Amazon's shopping cart page
Library  Selenium2Library

*** Keywords ***
Verify Product Added
    Wait Until Page Contains  subtotal

Proceed to Checkout
    Click Link  id=hlb-ptc-btn-native
*** Settings ***
Library  Selenium2Library

*** Keywords ***
Verify Product Added
    Wait Until Page Contains  subtotal

Proceed to Checkout
    Click Link  id=hlb-ptc-btn-native
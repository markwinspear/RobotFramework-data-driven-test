*** Settings ***
Library  Selenium2Library

*** Keywords ***
Verify Page Loaded
    Page Should Contain Element  ap_signin1a_pagelet_title
    Element Text Should Be  ap_signin1a_pagelet_title  Sign In

*** Settings ***
Documentation  Page object representing Amazon's landing page
Library  Selenium2Library

*** Variables ***


*** Keywords ***
Load
    Go To  ${START_URL}

Verify Page Loaded
    Wait Until Page Contains  Sell
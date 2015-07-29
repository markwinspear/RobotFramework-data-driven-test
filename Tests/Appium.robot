*** Settings ***
Documentation     Simple test to open and close a mobile application
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}           http://localhost:4723/wd/hub # URL to appium server
${PLATFORM_NAME}        iOS
${PLATFORM_VERSION}     8.1
${DEVICE_NAME}          iPhone Simulator

# Appium uses the *.app directory that is created by the ios build to provision the emulator.
${APP_LOCATION}      /Users/horaceheaven/.jenkins/jobs/FunctionalTesting/workspace/build/Products/Debug-iphonesimulator/Todo.app

*** Keywords ***
Open App
   Open Application    ${REMOTE_URL}    ${PLATFORM_NAME}    ${PLATFORM_VERSION}    ${DEVICE_NAME}    ${APP_LOCATION}
Close All Apps
   Close All Applications
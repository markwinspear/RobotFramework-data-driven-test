*** Settings ***
Resource  ../Resources/Web/Common.robot                 # necessary for Setup & Teardown
Resource  ../Resources/Web/PO/Login.robot               # necessary for lower level keywords in test cases

*** Variables ***
# including default values which can be overriden using -v at runtime
${BROWSER} =  ie
#${SEARCH_TERM} =  ferrari 458
${REMOTE_URL} =  http://markwinspear:3e478c65-7a2a-4119-b4a1-cb96b23e6ed5@ondemand.saucelabs.com:80/wd/hub
${DESIRED_CAPABILITIES} =  name:Win8 + Chrome 43,platform:Windows 8.1,browserName:chrome,version:43
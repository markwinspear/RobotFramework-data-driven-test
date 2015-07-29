*** Settings ***
Library  RequestsLibrary
Library  Selenium2Library  # only used to display something we get back from API test
Library  HttpLibrary        # TODO: not using this at the moment, but it is installed - was trying to test an API requiring authentication

*** Variables ***


*** Keywords ***
Check Github Username
    # Create the Session
    Create Session  my_github_session  https://api.github.com
    # Make the call (and capture the response in a variable)
    ${response} =  Get Request  my_github_session  users/robotframeworktutorial

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}  200

    # Check the Response body
    ${json} =  Set Variable  ${response.json()}
    Should Be Equal As Strings  ${json['login']}  robotframeworktutorial
    Log  ${json}

Get Users Trello Cards                  #TODO: not working. Probably requires authentication - not sure how to do that
    create session  trello_session  https://api.trello.com
    ${response} =  get request  trello_session  /GET/members/markwinspear/cards
    should be equal as strings  ${response.status_code}  200
    ${json} =  Set Variable  ${response.json()}
    Log  ${json}

    # https://api.trello.com/GET/members/markwinspear/cards

Display Emoji
    # Create the session
    Create Session  my_github_session  https://api.github.com

    # Make the call (and capture the response in a variable)
    ${response} =  Get Request  my_github_session  emojis

    # Check the Response status
    Should Be Equal As Strings  ${response.status_code}  200
read
    # Check the Response body
    ${json} =  Set Variable  ${response.json()}
    ${emoji_url} =  Set Variable  ${json['aerial_tramway']}
    Open Browser  ${emoji_url}  ie
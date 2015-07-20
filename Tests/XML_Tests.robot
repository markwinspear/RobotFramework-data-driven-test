*** Settings ***
Documentation  These are some XML tests
Resource  ../Resources/XML/Breakfast_Menu.robot

# Many ways to run:
# pybot -d results tests/XML_Tests.robot
# pybot -d results -i XML tests
# pybot -d results tests

*** Variables ***


*** Test Cases ***
Verify Menu Count
    [Tags]  XML
    Breakfast_Menu.Should be one menu in the file

Verify Root
    [Tags]  XML
    Breakfast_Menu.Verify Menu Name

Verify Food Count
    [Tags]  XML
    Breakfast_Menu.Verify Food Count

Verify First Food
    [Tags]  XML
    Breakfast_Menu.Verify First Food Name
    Breakfast_Menu.Verify First Food Price
    Breakfast_Menu.Verify First Food Calories
*** Settings ***
Documentation  These are some file & directory tests
Resource  os.robot

# Many ways to run:
# pybot -d results/operating-system tests/operating_system.robot
# pybot -d results/files -i OperatingSystem tests
# pybot -d results/files -N "Diverse Suite" tests

*** Variables ***


*** Test Cases ***
Create Some Directories
    [Tags]  OperatingSystem
    Create the Base Directory
    Create Directory 1
    Create Directory 2

Create Some Files
    [Tags]  OperatingSystem
    Create the First File
    Create the Second File
    Create the Third File

Move a File
    [Tags]  OperatingSystem
    Move File 3 from Directory 2 to Directory 1

Copy a File
    [Tags]  OperatingSystem
    Copy File 1 from Directory 1 to Directory 2
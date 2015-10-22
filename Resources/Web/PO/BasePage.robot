#All page objects inherit from this base
#It currently saves importing the Selenium2Library and the Common objects in ObjectMap

*** Settings ***
Variables   ObjectMap.yaml            #Method 2: Variables contained in yaml file and all imported here
Library  Selenium2Library             #Note - Using {CURDIR} causes autocomplete and documentation link etc to break. https://github.com/millennialmedia/intellibot/issues/111

# This line is required to import common objects from the ObjectMap
#Variables   ${CURDIR}/ObjectMap.py    Common   Method 1: Pass argument to ObjectMap.py and get back objects for a page


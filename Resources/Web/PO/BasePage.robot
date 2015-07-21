#All page objects inherit from this base
#It currently saves importing the Selenium2Library and the Common objects in ObjectMap

*** Settings ***
Library  Selenium2Library

# This line is required to import common objects from the ObjectMap
Variables   ${CURDIR}/ObjectMap.py    Common

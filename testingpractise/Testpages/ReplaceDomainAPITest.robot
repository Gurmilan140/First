*** Settings ***
Documentation   To validate the Login form
Library          SeleniumLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
Library         ExcelLibrary
Library         JSONLibrary
Library         RequestsLibrary
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/ReplaceDomainAPI.robot

#Suite Setup    Get Current Date and Time
#Test Setup      open the browser with the url
#Test Teardown   Close Browser session


*** Variables ***


*** Test Cases ***
Replace the existing domain
    LoginAPI.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain     ${refresh_Token}
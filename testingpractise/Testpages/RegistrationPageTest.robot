*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DateTime
Library     OperatingSystem
Resource    ../Pages/PartnersPage.robot
Resource    ../Pages/Technology.robot
Resource    ../Pages/RegistrationPage.robot
Resource    ../Pages/ReplaceDomainAPI.robot
Resource    ../Pages/LoginAPI.robot






*** Test Cases ***
Assignment7
    Open Browser    ${url}  ${browser}
    Maximize Browser window
    Technology.Click on Login   Register
    LoginAPI.Fetch the refresh token from the login api
    ReplaceDomainAPI.Replace Domain     ${refresh_Token}
    RegistrationPage.Enter First Name
    RegistrationPage.Enter Last Name    Johar
    RegistrationPage.Enter Company Name
    RegistrationPage.Select Member Type     End User - Select this option to manage your own technology assets
    RegistrationPage.Enter Business Email
    RegistrationPage.Search Country     +91
    RegistrationPage.Phone Number       9463789821
    RegistrationPage.Click Checkbox
    RegistrationPage.Click on Register Button
    RegistrationPage.open new tab       https://yopmail.com/en/
    RegistrationPage.Perform actions in Yopmail
    RegistrationPage.Click on arrow button
    RegistrationPage.Click on verify button
    RegistrationPage.Switch new window
    PartnersPage.Loader
    RegistrationPage.Set and Confirm Password   Milan!@987
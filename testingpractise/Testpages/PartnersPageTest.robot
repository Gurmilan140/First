*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     String
Library     ExcelLibrary

Resource    ../Pages/PartnersPage.robot
Resource    ../Pages/Technology.robot



*** Test Cases ***
Assignment6
    Open browser    ${url}  ${browser}
    maximize browser window

    Technology.Click on Login   Login
    Technology.Click on email and password
#    Technology.Click on Technology Icon     Partners
#    PartnersPage.Click on Add partner Button
#    PartnersPage.Select Partner type    Manufacturer
#    PartnersPage.Enter Business Name
#    PartnersPage.Enter Business URL
#    PartnersPage.Select Country     United States
#    PartnersPage.Click on Add new Contact
#    PartnersPage.Loader
#    PartnersPage.Select contact person
#    PartnersPage.Enter Business Contact Email
#    PartnersPage.Search Country     +91
#    PartnersPage.Enter phone number     6284006097
#    PartnersPage.Select Location    Canada Office
#    PartnersPage.Click on Save Button
#    PartnersPage.Click on Main Save Button
#    PartnersPage.Get and Verify Alert
#    PartnersPage.Click on search bar
#    PartnersPage.Loader
#    PartnersPage.Verify the table and data
#    PartnersPage.Loader
#    Technology.Click on Technology Icon     Technology
#    Technology.Click on Add Technology
#    PartnersPage.Click on Brand Field
#    PartnersPage.Click Here To Add
#    PartnersPage.Enter Product name
#    PartnersPage.Enter Brandname
#    PartnersPage.Enter Description
#    PartnersPage.Enter Features
#    PartnersPage.Select Product Status      Active
#    PartnersPage.Select Technology Type     Hardware
#    PartnersPage.Select Technology Group    Accessories
#
#    PartnersPage.Click on Save Green Button for add Product
#    PartnersPage.Alert message
#    Technology.Generating Asset ID
#    Technology.Click on Save Button
#    Technology.Get Alert Message
#    Technology.Click on pop pop
#    PartnersPage.Verifies the location after clicking on save
#    PartnersPage.Loader
    Technology.Click on Technology Icon     Contracts
    PartnersPage.Click on Create New Contract
    PartnersPage.Click on Dynamic Contract
    sleep   1
    PartnersPage.Generate Contract Location
    PartnersPage.Select Contract Type    SmartShare_Manufacturer
    sleep   2
    PartnersPage.Enter contract with
    sleep   2
    PartnersPage.Invisiblity of small loader
    PartnersPage.Enter Brand
    sleep   2
    PartnersPage.Invisiblity of small loader
    PartnersPage.Enter Main Location    *Main Office
    sleep   2
    PartnersPage.Invisiblity of small loader
    PartnersPage.Select contract permission     Read/Write
    sleep   2
    PartnersPage.Enter New Contract Start Date      03/22/2022
    sleep   2
    PartnersPage.Enter New Contract End Date        05/18/2023
    sleep   2
    PartnersPage.Select Contract Function   Dynamic
    sleep   2
    PartnersPage.Click on Preview Selection Button
    sleep   2
    PartnersPage.Loader
    PartnersPage.Enter Contact Name
    PartnersPage.Scroll Down
    PartnersPage.Click on the checkboxes
    PartnersPage.Click on Create Contract Button
    PartnersPage.Create Pop Pop
    PartnersPage.New Alert get
    Technology.Click on Technology Icon     Technology
    PartnersPage.New Technology Input
    Technology.Click on Edit button
    PartnersPage.Loader
    Technology.Click on Pencil Icon
    Technology.Click on Brand
    Technology.Click on Product      Product7799 test - Test
    Technology.Click on update Button
    Technology.Click on update Pop Pop
    PartnersPage.Loader
    Technology.Get Update Alert

    





    


*** Settings ***
Library     SeleniumLibrary
Library    DateTime
Library     String
Resource    ../Pages/Technology.robot




*** Test Cases ***
Technology
    Open browser    ${url}     ${browser}
    maximize browser window
    Technology.Click on Login       Login
    Technology.Click on email and password
    Technology.Click on Technology Icon     Technology
    Technology.Click on Add Technology
    Technology.Click on Brand
    Technology.Click on Product      Product7799 test - Test
    Execute javascript    window.scrollTo(0,840)
    Technology.Contract Date Input      03/23/2014

    Technology.Contract End Date Input  05/28/2021

    Technology.Generating Asset ID


    Technology.Purchase Date Input  09/10/2021

    Technology.Renewal Date Input   02/8/2022

    Technology.Waranty End Date Input   05/11/2023

    Technology.Comment input    I Love Cricket


    Technology.Order Number Input   10101010

    Technology.Select Payment Partner   Baby5

    Technology.Select Cost Type     Fixed Length Contract

    Technology.Select Payment Type     VariablePayment

    Technology.Select Payment Period    Once

    Technology.Select Cost Center   IT-001 - Information Technology

    Technology.Input First Payment      06/14/2020

    Technology.Input Last Payment  08/20/2021

    Technology.Input Budget Payment     30,000

    Technology.Input Actual Payment     25,000

    Technology.Select Support Partner   Wachter

    Technology.Select Supplier

    Technology.Click on Save Button

    Technology.Get Alert Message


    Technology.Click on pop pop

    Technology.Click on Technology Search
    Technology.Select the Product from search
    Technology.Click on Edit button     Edit
    Technology.Click on Pencil Icon
    Technology.Select Brand from Technology     Lenovo
    Technology.Click on Product     0022W1J - Lenovo ThinkPad X100e 0022 - AMD Athlon Neo MV-40 / 1.6 GHz - Win 7 Home Premium - Mobility Radeon HD 3200 - 2 GB RAM - 160 GB HDD - 11.6" 1366 x 768 (HD)
    Technology.Select Status   Active
    Technology.Click on update Button
    Technology.Click on update Pop Pop
    Technology.Get Update Alert

#Hello















*** Keywords ***

*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DateTime
Library     OperatingSystem


*** Variables ***
${url}     https://uat-app.aithentic.com/
${browser}      Firefox
${first_name}      css:#FirstName
${c_name}       css:#companyName

*** Keywords ***
Enter First Name
    wait until element is visible       ${first_name}        60
    ${random_name} =    Generate Random String       4      [LETTERS]
    ${generated_firstname}=    Catenate    M${random_name}
    input text   ${first_name}   ${generated_firstname}
    log to console      ${generated_firstname}
    set global variable    ${generated_firstname}

Enter Last Name
    [Arguments]     ${name}
    wait until element is visible   css:#LastName   60
    click element   css:#LastName
    input text  css:#LastName   ${name}

Enter Company Name
    wait until element is visible       ${c_name}        60
    ${random_name} =    Generate Random String       6      [LETTERS]
    ${generated_cname}=    Catenate    ${random_name}
    input text   ${c_name}   ${generated_cname}
    log to console      ${generated_cname}
    set global variable    ${generated_cname}

Select Member Type
    [Arguments]     ${options}
    wait until element is visible   xpath://input[@aria-autocomplete='list']    60
    click element   xpath://input[@aria-autocomplete='list']
    wait until element is visible   css:span[title='${options}']    60
    click element   css:span[title='${options}']

Enter Business Email
    wait until element is visible   css:#Email  60
    click element   css:#Email
    input text  css:#Email      ${generated_firstname}@yopmail.net

Search Country
    [Arguments]     ${country}
    click element   css:.iti__arrow
    wait until element is visible   css:#country-search-box     60
    click element   css:#country-search-box
    input text  css:#country-search-box     ${country}
    wait until element is visible   xpath://span[contains(text(),'${country}')]   60
    click element   xpath://span[contains(text(),'${country}')]

Phone Number
     [Arguments]     ${number}
    wait until element is visible   css:#phone  60
    click element   css:#phone
    input text  css:#phone  ${number}

Click Checkbox
    wait until element is visible   css:.checkmark.theme-blue   60
    click element   css:.checkmark.theme-blue

Click on Register Button
    wait until element is visible   css:button[type='submit']   60
    click element   css:button[type='submit']
    wait until location contains   update-email    60

open new tab
    [Arguments]    ${option}
    Execute JavaScript    window.open('', '_blank');
    Switch Window   NEW
    go to   ${option}

Perform actions in Yopmail
    wait until element is visible   css:#login  60
    click element   css:#login
    input text      css:#login  ${generated_firstname}@yopmail.net

Click on arrow button
    wait until element is visible   css:button[title='Check Inbox @yopmail.com']    60
    click element   css:button[title='Check Inbox @yopmail.com']

Click on verify button
    Select frame    css:#ifmail
    wait until element is visible   xpath:/html/body/main/div/div/div/center[2]/a/button  60
    click element   xpath:/html/body/main/div/div/div/center[2]/a/button

Set and Confirm Password
    [Arguments]     ${option}
    wait until element is visible   xpath://input[@id='Password']   60
    click element   xpath://input[@id='Password']
    input text  xpath://input[@id='Password']   ${option}
    wait until element is visible   css:#Password_confirmation      60
    input text  css:#Password_confirmation      ${option}

Select the checkbox
    wait until element is visible   css:.checkmark      60
    click element   css:.checkmark
       
Switch new window
    switch window   xpath://title[normalize-space()='aithentic | Create - Account']



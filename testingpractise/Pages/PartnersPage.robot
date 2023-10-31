*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DateTime




*** Variables ***
${url}     https://uat-app.aithentic.com/
${browser}      Firefox
${email}       jasdeep@azeqsd.fr.nf
${password}     Test@123
${sig in}       xpath://button[normalize-space()='Sign In']
${business}     css:ng-select[placeholder='Select or Search a Business Name'] input[type='text']
${loader}       xpath://div[@role='status']
${contactperson}    css:#contactPerson
${alert}        css:.msg.d-inline-flex
${table}        css:.table-scrollable.overflow-auto.mt-1
${select_technology_group}     css:nz-tree-select[formcontrolname='TechGroupId'] input
${previewSelectionButton}      //button[normalize-space()='Preview Selection']
${table_row}        //tbody/tr[1]


*** Keywords ***
Click on Login
    [Arguments]     ${options}
    wait until element is visible       xpath://a[normalize-space()='${options}']       60
    click element   xpath://a[normalize-space()='${options}']

Click on email and password
    wait until element is visible   css:#Email    60
    input text      css:#Email      ${email}
    input text      xpath://input[@id='Password']       ${password}
    click element   ${sig in}

Click on Partners Icon
    [Arguments]     ${Icon}
    wait until location contains    https://uat-app.aithentic.com/dashboard/home/asset-overview     60
    wait until element is visible    css:li[title='${Icon}']   60
    Click element   css:li[title='${Icon}']

Click on Add partner Button
    wait until element is visible   css:a[title='Add New Partner']      60
    click element   css:a[title='Add New Partner']
    wait until location contains    addpartner      60

Select Partner type
    [Arguments]     ${Partnerstype}
    wait until element is visible   css:ng-select[placeholder='Select Partner Type']        60
    click element   css:ng-select[placeholder='Select Partner Type']
    wait until element is visible   xpath://div[contains(text(),'${Partnerstype}')]     60
    click element   xpath://div[contains(text(),'${Partnerstype}')]

Enter Business Name
    wait until element is visible       ${business}        60
    ${random_string} =    Generate Random String       6      [LETTERS]
    ${generated_SerialNumber}=    Catenate    QA${random_string}
    input text   ${business}   ${generated_SerialNumber}
    log to console      ${generated_SerialNumber}
    set global variable    ${generated_SerialNumber}
Enter Business URL
    click element   css:#businessUrl
    input text  css:#businessUrl    ${generated_SerialNumber}.com
    log to console  ${generated_SerialNumber}.com

Select Country
    [Arguments]  ${options}
    click element   css:#country
    input text  css:#country    ${options}
    click element   xpath://span[normalize-space()='${options}']

Click on Add new Contact
    wait until element is visible   xpath://span[normalize-space()='Add new Contact']   60
    click element   xpath://span[normalize-space()='Add new Contact']

Loader
    wait until element is not visible   ${loader}   60

Select contact person
    wait until element is visible       ${contactperson}        60
    ${random_string} =    Generate Random String       5      [LETTERS]
    ${generated_personname}=    Catenate    M${random_string}
    input text   ${contactperson}   ${generated_personname}
    click element       css:div[role='option']
    log to console      ${generated_personname}
    set global variable    ${generated_personname}

Enter Business Contact Email
    wait until element is visible   css:#ContactEmail   60
    input text  css:#ContactEmail   ${generated_personname}@${generated_SerialNumber}.com

Search Country
    [Arguments]     ${country}
    click element   css:.iti__arrow
    wait until element is visible   css:#country-search-box     60
    click element   css:#country-search-box
    input text  css:#country-search-box     ${country}
    wait until element is visible   xpath://span[contains(text(),'${country}')]   60
    click element   xpath://span[contains(text(),'${country}')]

Enter phone number
    [Arguments]     ${number}
    wait until element is visible   css:#phone  60
    click element   css:#phone
    input text  css:#phone  ${number}

Select Location
    [Arguments]     ${location}
    wait until element is visible   css:#locations  60
    click element   css:#locations
    wait until element is visible   xpath://span[normalize-space()='${location}']   60
    click element   xpath://span[normalize-space()='${location}']

Click on Save Button
    wait until element is visible   xpath://span[normalize-space()='Save']  60
    click element   xpath://span[normalize-space()='Save']

Click on Main Save Button
    wait until element is visible   css:button[class='btn button-green mt-0 m5px ng-star-inserted']     60
    click element   css:button[class='btn button-green mt-0 m5px ng-star-inserted']

Get and Verify Alert
     wait until element is visible    ${alert}     60
    ${alert_text}=   Get Text    ${alert}
    log to console   ${alert_text}
    Should be equal  ${alert_text}   Partner created successfully
    wait until element is not visible   ${alert}     60

Click on search bar
    wait until element is visible   css:input[placeholder='Search by Business Name']    60
    click element   css:input[placeholder='Search by Business Name']
    input text  css:input[placeholder='Search by Business Name']    ${generated_SerialNumber}
    sleep   3

Verify the table and data
    Table column should contain     ${table}    2  ${generated_SerialNumber}

Click on Brand Field
     wait until element is visible     css:#brandselect       60
    click element    css:#brandselect
    input text       css:#brandselect   ${generated_SerialNumber}
    wait until element is visible    xpath://span[normalize-space()='${generated_SerialNumber}']        60
    click element    xpath://span[normalize-space()='${generated_SerialNumber}']

Click Here To Add
    wait until element is visible   css:a[class='theme-blue pointer text-decoration-none']      60
    click element   css:a[class='theme-blue pointer text-decoration-none']

Enter Product name
    wait until element is visible   css:#ProductName  60
    click element   css:#ProductName
    input text  css:#ProductName  ${generated_SerialNumber}product

Enter Brandname
    wait until element is visible   css:#addProductBrands   60
    click element   css:#addProductBrands
    input text  css:#addProductBrands   ${generated_SerialNumber}
    wait until element is visible   xpath://span[normalize-space()='${generated_SerialNumber}']     60
    click element   xpath://span[normalize-space()='${generated_SerialNumber}']

Enter Description
    wait until element is visible   css:#ProductDescription     60
    click element   css:#ProductDescription
    input text  css:#ProductDescription     Test

Enter Features
    wait until element is visible   css:#addProductFeat     60
    click element   css:#addProductFeat
    input text  css:#addProductFeat     Test

Select Product Status
    [Arguments]     ${status}
    click element   css:ng-select[id='ProductStatus'] span[title='Clear all']
    wait until element is visible   css:#addProductStatus   60
    click element   css:#addProductStatus
    input text  css:#addProductStatus   ${status}
    wait until element is visible   xpath://span[normalize-space()='${status}']    60
    click element   xpath://span[normalize-space()='${status}']

Select Technology Group
    [Arguments]    ${option}
    wait until element is visible       ${select_technology_group}     60
    Mouse Over      ${select_technology_group}
    click element   ${select_technology_group}
    Scroll Element Into View        //span[normalize-space()='${option}']
    wait until element is visible      //span[normalize-space()='${option}']       60
    click element       //span[normalize-space()='${option}']
#    [Arguments]     ${Group}
#    wait until element is visible     css:nz-tree-select[id='TechGroupId'] div nz-select-search   60
##    wait until element is enabled   css:nz-tree-select[id='TechGroupId'] div nz-select-search   60
#    mouse over  css:nz-tree-select[id='TechGroupId'] div nz-select-search
#    click element   css:nz-tree-select[id='TechGroupId'] div nz-select-search
#    wait until element is visible   xpath://span[normalize-space()='${Group}']      60
#    click element   xpath://span[normalize-space()='${Group}']

Select Technology Type
    [Arguments]     ${Type}
    click element   css:#addProductType
    input text  css:#addProductType     ${Type}
    wait until element is visible   xpath://span[normalize-space()='${Type}']   60
    click element   xpath://span[normalize-space()='${Type}']

Click on Save Green Button for add Product
    wait until element is visible   css:div[class='modal-footer my-1'] button[type='submit']    60
    click element   css:div[class='modal-footer my-1'] button[type='submit']

Alert message
     wait until element is visible    ${alert}     60
    ${alert1}=   Get Text    ${alert}
    log to console   ${alert1}
    Should be equal  ${alert1}   Product created successfully
    wait until element is not visible   ${alert}     60

Verifies the location after clicking on save
    wait until location contains     technology-list     60

Click on Create New Contract
    wait until element is visible   xpath://a[normalize-space()='Create New Contract']      60
    click element   xpath://a[normalize-space()='Create New Contract']

Click on Dynamic Contract
    wait until element is visible   xpath://app-contracts-list[@class='ng-star-inserted']//button[@class='btn w-100 bg-electric-cyan'][normalize-space()='Dynamic Contract']    60
    sleep   1
    click element   xpath://app-contracts-list[@class='ng-star-inserted']//button[@class='btn w-100 bg-electric-cyan'][normalize-space()='Dynamic Contract']

Select Contract Type
    [Arguments]     ${contract_type}
     wait until element is not visible    xpath://div[@class='modal-backdrop fade show']    60
    wait until element is visible   css:#contractType   60
#    mouse over  css:#contractType
    sleep   3
    click element   css:#contractType
#    input text  css:#contractType   ${contract_type}
    wait until element is visible   xpath://span[normalize-space()='${contract_type}']   60
    click element   xpath://span[normalize-space()='${contract_type}']



Enter contract with
    wait until element is visible       css:object[type='application/pdf']      60
    wait until element is enabled       css:object[type='application/pdf']      60
    click element   css:#CompanyId
    clear element text  css:#CompanyId
#    input text  css:#CompanyId  ${generated_SerialNumber}
    input text  css:#CompanyId  QAALdKtR
    Press Keys  css:#CompanyId        ENTER


Enter Brand
    wait until element is visible   css:#brand      60
    click element   css:#brand
#    input text  css:#brand  ${generated_SerialNumber}
    input text  css:#brand      QAALdKtR
    sleep   2
    Press Keys   css:#brand         ENTER


Enter Main Location
    [Arguments]     ${option}
    wait until element is visible   css:#locations  60
    click element   css:#locations
    wait until element is visible   xpath://span[normalize-space()='${option}']     60
    click element   xpath://span[normalize-space()='${option}']

Select contract permission
    [Arguments]     ${permission}
    wait until element is visible   css:#contractPermissions    60
    click element   css:#contractPermissions
    wait until element is visible   xpath://span[normalize-space()='${permission}']    60
    click element   xpath://span[normalize-space()='${permission}']

Generate Contract Location
    wait until location contains    generate-contract       60

Enter New Contract Start Date
    [Arguments]     ${start_date}
    wait until element is visible   css:#startDate  60
    input text  css:#startDate  ${start_date}

Enter New Contract End Date
    [Arguments]     ${end_date}
    wait until element is visible   css:#endDate    60
    input text  css:#endDate    ${end_date}

Click on Preview Selection Button
#    wait until element is visible   xpath://button[contains(text(), 'Preview Selection')]   60
#    wait until element is enabled  xpath://button[contains(text(), 'Preview Selection')]    60
    Wait Until Element Is Enabled     xpath://button[contains(text(), 'Preview Selection')]       60
    click element   xpath://button[contains(text(), 'Preview Selection')]

Enter Contact Name
    wait until element is visible   css:#contName   60
    wait until element is enabled   css:#contName   60
    sleep   4
    click element   css:#contName
    input text  css:#contName             ${generated_personname}
    Press Keys     css:#contName            ENTER

Invisiblity of small loader
    wait until element is not visible       css:.ng-spinner-loader.ng-star-inserted     60

Click on Create Contract Button
    wait until element is visible   xpath://button[normalize-space()='Create Contract'] 60
    click element   xpath://button[normalize-space()='Create Contract']

Location
    wait until location contains    https://uat-app.aithentic.com/dashboard/contract/createcontract     60

Click on the checkboxes
    wait until element is visible   xpath://span[@class='checkmark theme-blue']
    Select checkbox     xpath://span[@class='checkmark theme-blue']
    Select checkbox     xpath://span[@class='checkmark']

Create Pop Pop
    wait until element is visible   xpath://button[@class='btn button-green mt-0 ml-1 ng-star-inserted']    60
    click element   xpath://button[@class='btn button-green mt-0 ml-1 ng-star-inserted']

Contract Location
    wait until location contains    contracts-list  60

Click on cancel button
    wait until element is visible   css:button[class='btn button-red mt-0 button mr-2']      60
    click element   css:button[class='btn button-red mt-0 button mr-2']

New Alert get
    wait until element is visible    ${alert}     60
    ${alert_new}=   Get Text    ${alert}
    log to console   ${alert_new}
    Should be equal  ${alert_new}   Contract created successfully
    wait until element is not visible   ${alert}     60

New Technology Input
    wait until element is visible   xpath://input[@placeholder='Search by Brand, Product, Asset ID, Serial number or Assignee']     60
    click element   xpath://input[@placeholder='Search by Brand, Product, Asset ID, Serial number or Assignee']
    input text  xpath://input[@placeholder='Search by Brand, Product, Asset ID, Serial number or Assignee']     ${generated_SerialNumber}

Verify new Table
    Table row should contain    ${table}    ${table_row}    ${generated_SerialNumber}

Click on Edit Button
    wait until element is visible   xpath://a[normalize-space()='Edit']     60
    click element   xpath://a[normalize-space()='Edit']

Scroll Down
    Execute javascript window.scrollTo(0,400)

Select Contract Function
    [Arguments]     ${option}
    wait until element is visible   css:#contractFunction   60
    clear element text  css:#contractFunction
    click element   css:#contractFunction
    wait until element is visible   xpath://span[normalize-space()='${option}']     60
    Press Keys      xpath://span[normalize-space()='${option}']               ENTER


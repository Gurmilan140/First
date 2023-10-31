*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DateTime

*** Variables ***
${url}     https://uat-app.aithentic.com/
${browser}      chrome
${email}       jasdeep@azeqsd.fr.nf
${password}     Test@123
${sig in}       xpath://button[normalize-space()='Sign In']
${serial_number}    css:#AssetId
${table}        css:body app-root th
${column}      -4
${Alert_message}    css:.msg.d-inline-flex.ng-star-inserted



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

Click on Technology Icon
    [Arguments]     ${Icon}
   # wait until location contains    https://uat-app.aithentic.com/dashboard/home/asset-overview     60
    wait until element is visible    css:li[title='${Icon}']   60
    Click element   css:li[title='${Icon}']

Click on Add Technology
    wait until element is enabled     xpath://a[@class='btn button-cyan mt-0 mx-1 ng-star-inserted'][normalize-space()='Add Technology']  60
    click element    xpath://a[@class='btn button-cyan mt-0 mx-1 ng-star-inserted'][normalize-space()='Add Technology']

Click on Brand
    wait until element is visible     css:#brandselect       60
    click element    css:#brandselect
    input text       css:#brandselect    QABrand555
    wait until element is visible    xpath://span[normalize-space()='QABrand555']        60
    click element    xpath://span[normalize-space()='QABrand555']

Click on Product
    [Arguments]     ${Product}
    click element     css:#selectProductName
    wait until element is visible      css:span[title='${Product}']     60
    click element      css:span[title='${Product}']

Contract Date Input
    [Arguments]     ${Date}
    wait until element is visible      css:#DYNA_7     60
    click element      css:#DYNA_7
    input text     css:#DYNA_7  ${Date}

Contract End Date Input
    [Arguments]     ${End_Date}
    wait until element is visible  css:#DYNA_17   60
    click element      css:#DYNA_17
    input text     css:#DYNA_17    ${End_Date}

Generating Asset ID
     wait until element is visible       ${serial_number}        60
    ${random_string} =    Generate Random String       10      [NUMBERS]
    ${generated_assetnumber}=    Catenate    AssetID_${random_string}
    input text   ${serial_number}   ${generated_assetnumber}
    log to console      ${generated_assetnumber}
    set global variable    ${generated_assetnumber}

Purchase Date Input
    [Arguments]     ${Purchase}
    wait until element is visible  css:#PurchaseDt     60
    click element      css:#PurchaseDt
    input text         css:#PurchaseDt     ${Purchase}

Renewal Date Input
    [Arguments]     ${Renewal}
    wait until element is visible      css:#RenewalDate    60
    click element      css:#RenewalDate
    input text     css:#RenewalDate    ${Renewal}

Waranty End Date Input
     [Arguments]     ${Waranty}
    wait until element is visible      css:#WarrantyEndDt    60
    click element      css:#WarrantyEndDt
    input text     css:#WarrantyEndDt   ${Waranty}

Comment input
    [Arguments]     ${Comment}
    wait until element is visible   css:#Comment    60
    input text       css:#Comment   ${Comment}

Order Number Input
    [Arguments]     ${Order}
    wait until element is visible      css:#PurchaseOrderNo    60
    click element      css:#PurchaseOrderNo
    input text     css:#PurchaseOrderNo   ${Order}

Select Payment Partner
    [Arguments]     ${Payment}
   click element    css:#paymentPartner
    wait until element is visible    xpath://span[normalize-space()='${Payment}']    60
    click element    xpath://span[normalize-space()='${Payment}']

Select Cost Type
    [Arguments]     ${Cost}
   click element    css:#costType
    wait until element is visible    xpath://span[normalize-space()='${Cost}']     60
    click element        xpath://span[normalize-space()='${Cost}']

Select Payment Type
    [Arguments]     ${Payment_type}
    wait until element is not visible   xpath://div[@role='status']     60
   wait until element is visible    css:#paymentType    60
   click element    css:#paymentType
   wait until element is visible    xpath://span[normalize-space()='${Payment_type}']   60
   click element        xpath://span[normalize-space()='${Payment_type}']

Select Payment Period
    [Arguments]     ${Payment_Period}
     wait until element is visible    css:#paymentPeriod      60
    click element    css:#paymentPeriod
    wait until element is visible    xpath://span[normalize-space()='${Payment_Period}']   60
    click element        xpath://span[normalize-space()='${Payment_Period}']

Select Cost Center
    [Arguments]     ${Cost_Center}
    click element        css:#CostCenter
    wait until element is visible    xpath://span[normalize-space()='${Cost_Center}']       60
    click element    xpath://span[normalize-space()='${Cost_Center}']

Input First Payment
    [Arguments]     ${First}
    click element    css:#FirstPaymentDate
    input text       css:#FirstPaymentDate   ${First}

Input Last Payment
    [Arguments]     ${Last}
    click element    css:#LastPaymentDate
    input text       css:#LastPaymentDate    ${Last}

Input Budget Payment
    [Arguments]     ${Budget}
    click element    css:input[placeholder='Budget Payment']
    input text       css:input[placeholder='Budget Payment']     ${Budget}

Input Actual Payment
    [Arguments]     ${Actual_Payment}
    click element    css:input[placeholder='Actual Payment']
    input text       css:input[placeholder='Actual Payment']    ${Actual_Payment}

Select Support Partner
    [Arguments]     ${Support_Partner}
    click element    css:#supportPartner
    wait until element is visible    xpath://span[normalize-space()='${Support_Partner}']       60
    click element    xpath://span[normalize-space()='${Support_Partner}']

Select Supplier
    click element    css:#supplierPartner
    wait until element is visible   css:.ng-option-label.ng-star-inserted   60
    click element    css:.ng-option-label.ng-star-inserted

Click on Save Button
    click element    css:button[class='btn button-green mt-0 mx-2']

Get Alert Message
    wait until element is visible    css:.msg.d-inline-flex.ng-star-inserted     60
    ${alert_text}=   Get Text    css:.msg.d-inline-flex.ng-star-inserted
    log to console   ${alert_text}
    Should be equal  ${alert_text}   Technology created successfully
    wait until element is not visible   css:.msg.d-inline-flex.ng-star-inserted     60

Click on pop pop
    wait until element is visible    css:.btn.button-green.mt-0.mx-1.done-button.AssetSavedDoneQA    60
    click element    css:.btn.button-green.mt-0.mx-1.done-button.AssetSavedDoneQA

Click on Technology Search
   wait until location contains     technology-list     60
    wait until element is not visible   xpath://div[@role='status']     60
    wait until element is visible    css:input[placeholder='Search by Brand, Product, Asset ID, Serial number or Assignee']      60
    click element    css:input[placeholder='Search by Brand, Product, Asset ID, Serial number or Assignee']
    input text       css:input[placeholder='Search by Brand, Product, Asset ID, Serial number or Assignee']      ${generated_SerialNumber}
    sleep    5
    Table column should contain    ${table}    ${column}   ${generated_assetnumber}

Select the Product from search
    Click element    xpath://tbody/tr
    wait until location contains    technology-details      60




Click on Edit button
    [Arguments]     ${Edit}
    wait until element is visible   xpath://button[normalize-space()='${Edit}']    60
    click element   xpath://button[normalize-space()='${Edit}']
    wait until location contains    edit-technology     60

Click on Pencil Icon
        wait until element is visible   css:i[title='Click here edit product and brand']    60
        Click element   css:i[title='Click here edit product and brand']

Select Brand from Technology
    [Arguments]     ${Select}
    wait until element is visible     css:#brandselect       60
    click element    css:#brandselect

    wait until element is visible    xpath://span[normalize-space()='${Select}']        60
    click element    xpath://span[normalize-space()='${Select}']

Select Status
    [Arguments]     ${Status}
    wait until element is visible   xpath://input[@id='LifeCycleStatusId']      60
    click element   xpath://input[@id='LifeCycleStatusId']
    wait until element is visible   xpath://span[normalize-space()='${Status}']     60
    click element   xpath://span[normalize-space()='${Status}']

Click on update Button
    wait until element is visible   xpath://button[@type='submit'][normalize-space()='Update']      60
    click element   xpath://button[@type='submit'][normalize-space()='Update']

Click on update Pop Pop
    wait until element is visible   css:div[id='confirmUpdates'] button:nth-child(2)    60
    click element   css:div[id='confirmUpdates'] button:nth-child(2)

Get Update Alert
    wait until element is visible   css:.msg.d-inline-flex     60
    ${alert_text1}=     Get Text     css:.msg.d-inline-flex
    log to console  ${alert_text1}
    Should be equal    ${alert_text1}   Technology updated successfully
    wait until element is not visible   css:.msg.d-inline-flex     60







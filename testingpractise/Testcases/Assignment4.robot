*** Settings ***
Library     SeleniumLibrary



*** Variables ***
${url}          https://uat-app.aithentic.com
${browser}      chrome
${email}        testqa29j@mailinator.com
${password}     xpath://input[@id='Password']
${sig in}       css:button[type='submit']
${asset}        css:#asset-reports-tab
${Asset_links}  div[id='AssetReports'] li
${loader}       xpath://div[@role='status']
${alert_msg1}   css:.msg.d-inline-flex.ng-star-inserted
${aleret_msg2}  xpath://span[@class="msg d-inline-flex ng-star-inserted"]
${alert_msg3}   xpath://span[@class="msg d-inline-flex ng-star-inserted"]

*** Test Cases ***
Click till IT Performance Button
    Open browser    https://uat-app.aithentic.com     chrome
    maximize browser window
    click element      xpath://a[normalize-space()='Login']

    wait until element is visible     css:#Email    60
    input text  css:#Email  testqa29j@mailinator.com

    input text  xpath://input[@id='Password']       Test!@5099
    click element   ${sig in}
    wait until location contains    https://uat-app.aithentic.com/dashboard/home/asset-overview     60
    Click on IT       IT Performance
    wait until location contains     it-performance  60

  #-----------------------------------------------------------------------------------------#

  #-----------------------------Supplier----------------------------------------------------#
Click on Supplier Button
    Open browser    ${url}     ${browser}
    maximize browser window
    click element      xpath://a[normalize-space()='Login']
    #sleep   3
    wait until element is visible   ${email}    60
    input text      ${email}      testqa29j@mailinator.com
    #sleep   2
    input text      ${password}       Test!@5099
    click element   ${sig in}
    wait until location contains    https://uat-app.aithentic.com/dashboard/home/asset-overview     60
    Click on IT       IT Performance
    wait until location contains     it-performance      60
   # wait until element is enabled       css:#supplier-support-partner-location-tab      30
    click element      css:#supplier-support-partner-location-tab
    ${list}=  create list       supplierbudget-tab      supportpartnerbudget-tab        supportlocationbudget-tab
    FOR    ${elements}    IN    @{list}
        Choose options within supplier  ${elements}
    END
    click element        css:div[id='sspslReport'] i[title='File is preparing please wait']

    wait until element is visible    ${alert_msg1}
    ${alert}=    get text    ${alert_msg1}
    log to console   ${alert}
    should be equal   ${alert}     Supplier, Support Partner and Supplier by Location Report will get download soon
#---------------------------------------------------------------------------------------------#
#--------------------------------Brand---------------------------------------------------------#
Click on Brand Button
    Open browser    ${url}    ${browser}
    maximize browser window
    click element      xpath://a[normalize-space()='Login']

    wait until element is visible    ${email}   60
    input text      ${email}      testqa29j@mailinator.com

    input text      ${password}       Test!@9859
    click element   ${sig in}
    wait until location contains    https://uat-app.aithentic.com/dashboard/home/asset-overview     60

    Click on IT     IT Performance
    wait until location contains    it-performance      60

    click element        css:#brand-reports-tab

    ${list}=      create list       brandBudget-tab        brandsupplierbudget-tab       brandsupportpartnerbudget-tab
    FOR     ${elements}     IN      @{list}
        Choose options within brand     ${elements}
    END

    click element        css:div[id='brandReports'] i[title='File is preparing please wait']
    wait until element is visible    ${aleret_msg2}  60
    ${alert_text}=   Get Text    ${aleret_msg2}
    log to console   ${alert_text}
    should be equal     ${alert_text}      Brand Report will get download soon


#----------------------------------------------------------------------------------------------#
#--------------------------------------------Asset-------------------------------------------
Click on Asset Button
    Open browser    ${url}     ${browser}
    maximize browser window
    click element      xpath://a[normalize-space()='Login']
    wait until element is visible    ${email}       60
    input text      ${email}      testqa29j@mailinator.com
    input text      ${password}       Test!@9859
    click element   ${sig in}
    wait until location contains    https://uat-app.aithentic.com/dashboard/home/asset-overview     60
    Click on IT       IT Performance
    wait until location contains     it-performance      60
    Wait Until Element Is Not Visible    ${loader}      60
    wait until element is visible       css:#investments-partners-tab      60

    click element   css:#investments-partners-tab        60
    wait until element is visible       css:div[id='sspslReport'] li      60
    ${elements} =    Get WebElements    css:div[id='sspslReport'] li
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Wait Until Element Is Not Visible    ${loader}      60
    END


    click element        xpath://div[@id='AssetReports']//i[@title='File is preparing please wait']
    wait until element is visible    ${alert_msg3}      60
    ${Text}=     Get Text    ${alert_msg3}
    log to console   ${Text}
    should be equal     ${Text}      Asset Report will get download soon
    wait until element is enabled   xpath://button[normalize-space()="Download All"]        60
    click element   xpath://button[normalize-space()="Download All"]
    click element     css:#user-name-nav
    click element     css:li[class="pointer ng-tns-c167-0"] a[class="ng-tns-c167-0"]
    wait until location contains    https://uat-app.aithentic.com/verify/login        60









*** Keywords ***
Enter email or password
    [Arguments]     ${Func}
    wait until element is visible   css:#${Func}    60
    click element   css:#${Func}

Click on IT
    [Arguments]     ${Key}
    wait until element is visible   xpath://span[normalize-space()="${Key}"]        60
    click element       xpath://span[normalize-space()="${Key}"]

Choose options within supplier
    [Arguments]     ${SP}
    wait until element is visible       CSS:#${SP}                     60
    click element   CSS:#${SP}

Choose options within brand
     [Arguments]    ${Brand}
    wait until element is visible       CSS:#${Brand}     60
    click element       CSS:#${Brand}

Choose options within Asset
     [Arguments]     ${Asset}
    wait until element is visible       CSS:#${Asset}      60
    click element       CSS:#${Asset}




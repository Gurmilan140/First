*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}      https://uat-app.aithentic.com
${browser}      chrome
${email}        css:#Email
${password}     xpath://input[@id='Password']
${sig in}       css:button[type='submit']
${loader}   xpath://div[@role='status']
${download_supplierReportSheet}     css:div[id='SpendForecastsReports'] i[title='File is preparing please wait']
${alert_message}    xpath://span[@class="msg d-inline-flex ng-star-inserted"]


*** Test Cases ***
Click on Supplier Button
    Open browser    ${url}     ${browser}
    maximize browser window
    click element      xpath://a[normalize-space()='Login']
    wait until element is visible   ${email}    60
    input text      ${email}      testqa29j@mailinator.com
     input text      ${password}       Test!@5099
    click element   ${sig in}
    wait until location contains    https://uat-app.aithentic.com/dashboard/home/asset-overview     60
    Click on IT       IT Performance
    wait until location contains     it-performance      60
    Wait Until Element Is Not Visible    ${loader}      60
    wait until element is visible        css:#spend-forecast-reports-tab      60
    click element   css:#spend-forecast-reports-tab
    ${elements}=    Get WebElements     css:div[id='SpendForecastsReports'] li
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
    wait until Element is not visible   ${loader}   60
    END
    wait until element is visible       ${download_supplierReportSheet}     60
    click element       ${download_supplierReportSheet}
    wait until element is visible   ${alert_message}       60
    ${Alert}=       Get text    ${alert_message}
    log to console      ${Alert}
    Should be equal     ${Alert}    Spend Forecasts sheets will get download soon





*** Keywords ***
Click on IT
    [Arguments]     ${Key}
    wait until element is visible   xpath://span[normalize-space()="${Key}"]        60
    click element       xpath://span[normalize-space()="${Key}"]
*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}      https://uat-app.aithentic.com
${browser}      chrome
${email}        css:#Email
${password}     xpath://input[@id='Password']
${sig in}       css:button[type='submit']
${aleret_msg}  xpath://span[@class="msg d-inline-flex ng-star-inserted"]
${loader}   xpath://div[@role='status']
${brandReport_Tab}     css:#brand-reports-tab
${brandReport_List}     css:#brandReports ul a
${download_AgingAnalyticsSheet}     css:div[id='AgingAnalyticsReports'] i[title='File is preparing please wait']

*** Test Cases ***
Click on Brand
    Open browser    ${url}    ${browser}
    maximize browser window
    click element      xpath://a[normalize-space()='Login']

    wait until element is visible    ${email}   60
    input text      ${email}      testqa29j@mailinator.com

    input text      ${password}       Test!@5099
    click element   ${sig in}
    wait until location contains    https://uat-app.aithentic.com/dashboard/home/asset-overview     60

    Click on IT     IT Performance
    wait until location contains    it-performance      60


    Wait Until Element Is Not Visible    ${loader}      60
    wait until element is visible  css:#aging-analytics-tab       60
    click element   css:#aging-analytics-tab
    wait until element is visible  css:div[id='AgingAnalyticsReports'] li       60
    ${elements} =    Get WebElements    css:div[id='AgingAnalyticsReports'] li
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
        Wait Until Element Is Not Visible    ${loader}      60
    END
    wait until element is visible  ${download_AgingAnalyticsSheet}       60
    click element   ${download_AgingAnalyticsSheet}
    wait until element is visible    ${aleret_msg}  60
    ${alert_text}=   Get Text    ${aleret_msg}
    log to console   ${alert_text}
    should be equal     ${alert_text}      Aging Analytics sheets will get download soon








*** Keywords ***
Click on IT
    [Arguments]     ${Key}
    wait until element is visible   xpath://span[normalize-space()="${Key}"]        60
    click element       xpath://span[normalize-space()="${Key}"]
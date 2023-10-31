*** Settings ***
Library     SeleniumLibrary

*** Variables ***
${url}      https://uat-app.aithentic.com
${browser}      chrome
${email}        css:#Email
${password}     xpath://input[@id='Password']
${sig in}       css:button[type='submit']
${loader}   xpath://div[@role='status']

*** Test Cases ***
Click on investment by Partners
    Open browser    ${url}      ${browser}
    maximize browser window
    click element      xpath://a[normalize-space()='Login']
    wait until element is visible   ${email}    60
    input text      ${email}      testqa29j@mailinator.com
     input text      ${password}       Test!@5099
    click element   ${sig in}
    wait until location contains    asset-overview     60
    Click on IT     IT Performance
    wait until location contains     it-performance      60
    wait until element is not visible   ${loader}   60
    wait until element is visible   css:#investments-partners-tab   60
    click element   css:#investments-partners-tab
    ${elements}=    Get WebElements     css:div[id='sspslReport'] li
    FOR    ${element}    IN    @{elements}
        Click Element    ${element}
    wait until Element is not visible   ${loader}   60
    END
    wait until element is visible   css:div[id='sspslReport'] div[class='download-single-btn text-right float-right']     60
    click element   css:div[id='sspslReport'] div[class='download-single-btn text-right float-right']
    wait until element is visible   xpath://span[@class="msg d-inline-flex ng-star-inserted"]   60
    ${alert1}=  Get text    xpath://span[@class="msg d-inline-flex ng-star-inserted"]
    log to console  ${alert1}
    Should be equal     ${alert1}   Investment by Partners sheets will get download soon
     wait until element is enabled   css:button[title='Download all the files']        60
    click element   css:button[title='Download all the files']
    wait until element is visible   css:#user-name-nav      60
    click element     css:#user-name-nav
#    click element     css:li[class="pointer ng-tns-c167-0"] a[class="ng-tns-c167-0"]
#    wait until location contains    https://uat-app.aithentic.com/verify/login        60














*** Keywords ***
Click on IT
    [Arguments]     ${Key}
    wait until element is visible   xpath://span[normalize-space()="${Key}"]        60
    click element       xpath://span[normalize-space()="${Key}"]








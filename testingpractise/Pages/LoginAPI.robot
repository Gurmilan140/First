*** Settings ***
Documentation     Verify the Login API test
Library          SeleniumLibrary
Library          ExcelLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
Library         JSONLibrary
Library         RequestsLibrary
Resource    ../Pages/PartnersPage.robot
Resource    ../Pages/ReplaceDomainAPI.robot
Resource    ../Pages/LoginAPI.robot



*** Variables ***
#${base_URL}=        https://uat-api.aithentic.com/api/v1
${email}       jasdeep@azeqsd.fr.nf
${password}     Test@123


*** Keywords ***
Fetch the refresh token from the login api
    ${body}=    Create Dictionary       Email=${email}      Password=${password}
    ${response}=    POST    ${apiURL}/login       json=${body}        expected_status=200
#    log to console   ${response.json()}

    Dictionary Should Contain Key   ${response.json()}      data
    ${dataList}=    Get From Dictionary     ${response.json()}      data
    ${refresh_Token}=    Get From Dictionary     ${dataList}      refreshToken
    ${access_Token}=    Get From Dictionary     ${dataList}      access_token
    set global variable  ${access_Token}
    set global variable  ${refresh_Token}
#    log to console      Refesh token we fetch out:${refresh_Token}

*** Settings ***
Documentation     Verify the Replace domain API test
Library          SeleniumLibrary
Library         String
Library         Collections
Library         BuiltIn
Library         random
Library         DateTime
Library         OperatingSystem
Library         JSONLibrary
Library         RequestsLibrary
Library         ExcelLibrary
Resource        ../Pages/PartnersPage.robot
Resource        ../Pages/LoginAPI.robot
Resource        ../Pages/ReplaceDomainAPI.robot



*** Variables ***
${base_URL}        https://uat-api.aithentic.com
${apiURL}                 https://uat-api.aithentic.com/api/v1



*** Keywords ***

Replace Domain
    [Arguments]    ${option}
    # Set the base URL and endpoint
    ${base_url}    Set Variable    ${apiURL}/client-domains

    # Set the headers
    ${headers}    Create Dictionary
    ...    User-Agent=python-requests/2.31.0
    ...    Accept-Encoding=gzip, deflate
    ...    Accept=application/json
    ...    Connection=keep-alive
    ...    Content-Type=application/json
#    ...    Authorization=Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzZXRDbGFpbXMiOnsiQ2xpZW50U3RhdHVzIjoiQWN0aXZlIn0sImlzcyI6Imh0dHBzOi8vdWF0LWFwaS5haXRoZW50aWMuY29tL2FwaS92MS9sb2dpbiIsImlhdCI6MTY5MjQyMjE0MiwiZXhwIjoxNjkyODU0MTQyLCJuYmYiOjE2OTI0MjIxNDIsImp0aSI6ImNRVFJ1bzBDQUVZeUNuMmMiLCJzdWIiOiIzOTAiLCJwcnYiOiJiOTEyNzk5NzhmMTFhYTdiYzU2NzA0ODdmZmYwMWUyMjgyNTNmZTQ4In0.X4Q9X-cr3BnII4X5CTQnzHKzMT7hWat5lIidkcXVcW0
    ...    Authorization=Bearer ${option}
    ...    Content-Length=96

    # Generate new domain name
    ${date}=    Get Current Date    result_format=%Y%m%d
    ${time}=    Get Current Date    result_format=%H%M%S
    ${NewDomain}=    Catenate    automationqa${date}${time}
#    set global variable    ${NewDomain}

    # Define the JSON object
    ${json_object} =    Create Dictionary
    ...    old=www.yopmail.net
    ...    new=www.${NewDomain}.com

     # Define the JSON array
    ${json_array} =    Create List
    ...    ${json_object}

     # Define the JSON payload as a dictionary
    ${json_payload} =    Create Dictionary
    ...    domains=${json_array}


    # Send the PUT request
    ${response}    Put   url=${base_url}
    ...    json=${json_payload}
    ...    headers=${headers}

    # Verify the response
    Log    Response Status Code: ${response.status_code}
    Log    Response Body: ${response.text}


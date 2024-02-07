*** Settings ***
#Library      SeleniumLibrary
Library      RequestsLibrary

*** Variables ***
${BASEURL}     https://dummyapi.io/data/v1
${APP_ID}      625051a2546043dd2f62e684

*** Test Cases ***
Api Test
    Get Post
    Create User

*** Keywords ***
Get Post
    [Documentation]
    ${header}=  Create Dictionary   app-id=${APP_ID}
    ${response}=    GET  ${BASEURL}/user    headers=${header}
#    Should Be Equal As Strings    1    ${response.json().id}
    Log    ${response.text}

Create User
    [Documentation]
    ${header}=  Create Dictionary   app-id=${APP_ID}
    ${pauload}=     Create Dictionary   firstName=yono  lastName=supriyanto     email=yono2.sup@esample.com
    ${response}=    POST  ${BASEURL}/user/create    headers=${header}   json=${pauload}
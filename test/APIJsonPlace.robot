*** Settings ***
Library     RequestsLibrary

*** Variables ***
${BASEURL}  https://jsonplaceholder.typicode.com
${ID}   1

*** Test Cases ***
Json Place Holder
    Hit API

*** Keywords ***
Hit API
    [Documentation]
    ${response}=    GET   ${BASEURL}/posts/${ID}    params=query=ciao  expected_status=200
#    expected response body
    Should Be Equal As Strings    sunt aut facere repellat provident occaecati excepturi optio reprehenderit    ${response.json()}[title]
    Log     ${response.text}
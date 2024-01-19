*** Settings ***
Library    SeleniumLibrary


#*** Variables ***
#${BROWSER}    chrome
#${HEADLESS}    false

*** Test Cases ***
Create Quote for Car
    Open Insurance Application
    Enter Vehicle Data for Automobile
    Enter Insurant Data
    Enter Product Data
    Select Price Option
    Send Quote
    End Test

*** Keywords ***
Open Insurance Application
    Open Browser    http://sampleapp.tricentis.com/    chrome

Enter Vehicle Data for Automobile
    Click Element    id=get_motorcycle
    Click Button    css=div.main-navigation >> link=Automobile
    Select From List By Label    id=make    Audi
    Input Text    id=engineperformance    110
    Input Text    id=dateofmanufacture    06/12/1980
    Select From List By Label    id=numberofseats    5
    Select From List By Label    id=fuel    Petrol
    Input Text    id=listprice    30000
    Input Text    id=licenseplatenumber    DMK1234
    Input Text    id=annualmileage    10000
    Click Button    css=section[style="display: block;"] >> link=Next

Enter Insurant Data
    [Arguments]    ${firstname}=Max    ${lastname}=Mustermann
    Input Text    id=firstname    ${firstname}
    Input Text    id=lastname    ${lastname}
    Input Text    id=birthdate    01/31/1980
    Select Checkbox    id=gendermale
    Input Text    id=streetaddress    Test Street
    Select From List By Label    id=country    Germany
    Input Text    id=zipcode    40123
    Input Text    id=city    Essen
    Select From List By Label    id=occupation    Employee
    Click Button    link=Cliff Diving
    Click Button    css=section[style="display: block;"] >> link=Next

Enter Product Data
    Input Text    id=startdate    06/01/2023
    Select From List By Label    id=insurancesum    7.000.000,00
    Select From List By Label    id=meritrating    Bonus 1
    Select From List By Label    id=damageinsurance    No Coverage
    Select Checkbox    id=EuroProtection
    Select From List By Label    id=courtesycar    Yes
    Click Button    css=section[style="display: block;"] >> link=Next

Select Price Option
    [Arguments]    ${price_option}=Silver
    Click Button    css=[value=${price_option}]
    Click Button    css=section[style="display: block;"] >> link=Next

Send Quote
    Input Text    name=email    max.mustermann@example.com
    Input Text    name=phone    0049201123456
    Input Text    name=username    max.mustermann
    Input Text    name=password    SecretPassword123!
    Input Text    name=confirmpassword    SecretPassword123!
    Input Text    name=Comments    Some comments
    Click Button    link=Send
    Wait Until Page Contains Element    css=.sending-email-success
    Click Button    link=OK

End Test
    Close Browser
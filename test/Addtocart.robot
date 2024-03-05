*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${BROWSER}        Edge
${URL}            https://www.saucedemo.com/v1/
#${edge_driver_path}    C:/Users/CTAS131/Downloads/msedgedriver.exe
${USERNAME}       standard_user
${PASSWORD}       secret_sauce
${ADDTOCART}      xpath=//*[@id="inventory_item_container"]/div/div/div/button
#${BACKBTN}        xpath=//*[@id="inventory_item_container"]/div/button
${BACKBTN}        xpath=//*[@id="inventory_item_container"]/div/button
${FNAME}          Aldy
${LNAME}          Cantona
${ZCODE}          111111

*** Test Cases ***
Login Test
    Login1
    Add to cart
    Scroll Page
    Check amount
    See cart
    Checkout
    Price total

*** Keywords ***
Login1
    Open Browser    ${URL}    ${BROWSER}
    Input Text      user-name    ${USERNAME}
    Input Password  password     ${PASSWORD}
    Click Button    login-button
    Sleep    2s
    Capture Page Screenshot    login_success.png

Add to cart
    Wait Until Element Is Visible    xpath=//div[@class='inventory_item_name'][contains(text(),'Sauce Labs Backpack')]  timeout=2s
    Click Element    xpath=//div[@class='inventory_item_name'][contains(text(),'Sauce Labs Backpack')]
    Capture Page Screenshot     ss/ss1.png
    Wait Until Element Is Visible   xpath=//*[@id="inventory_item_container"]/div/div/div/button  timeout=2s
    Click Element    ${ADDTOCART}
    Sleep    2s
    Capture Page Screenshot     ss/ss2.png
#    Click Element    ${BACKBTN}
    Wait Until Element Is Visible    ${BACKBTN}
    Sleep    2s
#    Click Button   ${BACKBTN}

Scroll page
    Scroll Element Into View    xpath=//*[@id="item_3_title_link"]/div
    Click Element    xpath=//*[@id="item_3_title_link"]/div
    Click Element    ${ADDTOCART}
    Sleep    2s

Check amount
    Element Text Should Be    xpath=//*[@id="shopping_cart_container"]/a/span   2

See cart
    Click Element    xpath=//*[@id="shopping_cart_container"]/a/span
    #cart detail
    Click Element    xpath=//*[@id="cart_contents_container"]/div/div[2]/a[2]
    #checkout
    Sleep    2s

Checkout
    Input Text    first-name        ${FNAME}
    Input Text    last-name    ${LNAME}
    Input Text    postal-code    ${ZCODE}
    Sleep    2s
    Click Element    xpath=//*[@id="checkout_info_container"]/div/form/div[2]/input

Price total
    Element Text Should Be    xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[7]   Total: $49.66
    Click Element    xpath=//*[@id="checkout_summary_container"]/div/div[2]/div[8]/a[2]
    Sleep    5s
    Close Browser
    
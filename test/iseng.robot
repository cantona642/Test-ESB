*** Settings ***
Library     SeleniumLibrary
Library    String
Library    RequestsLibrary

*** Variables ***
${BROWSER}  Edge
${URL}      https://music.youtube.com/
${URL_WTP}  https://smallpdf.com/pdf-converter
*** Test Cases ***
Test Start
    Login

Upload file
    Upload something

*** Keywords ***
Login
    Open Browser    ${URL}  ${BROWSER}
    Click Element    xpath=//*[@id="layout"]/ytmusic-nav-bar/div[2]/ytmusic-search-box/div/div[1]/tp-yt-paper-icon-button[1]
     ${beranda_text}=    Get Text    xpath=//*[@id="details"]/yt-formatted-string
    IF    "${beranda_text}" == "Quick pick"
        Click Song
    ELSE IF     "${beranda_text}" == "Quick picks"
        Click Song
    ELSE
         Click Explorer
    END

Click Song
    Click Element    xpath=//*[@id="more-content-button"]/yt-button-renderer/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]

Click Explorer
    Click Element    xpath=//*[@id="items"]/ytmusic-guide-entry-renderer[2]/tp-yt-paper-item

#gagal
Upload Something
    Open Browser    ${URL_WTP}  ${BROWSER}
    Click Element    xpath=//*[@id="app"]/div/div[1]/header/div[2]/div/div/label/div/div[2]/form/label/div/div[2]/button[1]/span
    Get File For Streaming Upload   C:\\Users\\CTAS131\\Downloads\\file-sample_100kB.doc
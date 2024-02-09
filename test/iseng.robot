*** Settings ***
Library     SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}  Edge
${URL}      https://music.youtube.com/
*** Test Cases ***
Test Start
    Login

*** Keywords ***
Login
    Open Browser    ${URL}  ${BROWSER}
    Click Element    xpath=//*[@id="layout"]/ytmusic-nav-bar/div[2]/ytmusic-search-box/div/div[1]/tp-yt-paper-icon-button[1]
     ${beranda_text}=    Get Text    xpath=//*[@id="details"]/yt-formatted-string
    IF    "${beranda_text}" == "Quick pick"
        Click Song

    ELSE
         Click Explorer
    END

Click Song
    Click Element    xpath=//*[@id="more-content-button"]/yt-button-renderer/yt-button-shape/button/yt-touch-feedback-shape/div/div[2]

Click Explorer
    Click Element    xpath=//*[@id="items"]/ytmusic-guide-entry-renderer[2]/tp-yt-paper-item
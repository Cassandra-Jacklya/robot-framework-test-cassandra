*** Settings ***
Documentation    single test for login
Library    SeleniumLibrary
Resource    ./variables.robot
Resource    ./confidential.robot

*** Test Cases ***
demo
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    10
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    10
    Login Account    ${email}    ${password}
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${drop_down_account}    10
    Page Should Contain Element    ${real_account}
    Click Element    ${drop_down_account}
    Wait Until Page Contains Element    ${demo_account}    10
    Wait Until Element Is Visible    ${demo_account}    10
    Click Element    ${demo_account}
    Sleep    5

*** Keywords ***
Login Account
    [Arguments]    ${email_input}    ${password_input}
    Input Text    txtEmail    ${email_input}
    Input Password    password    ${password_input}
    
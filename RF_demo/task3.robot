*** Settings ***
Documentation    single test for login
Library    SeleniumLibrary
Resource    ./variables.robot
Resource    ./confidential.robot

*** Test Cases ***
login
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    7
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    7
    Input Text    txtEmail    ${email}
    Input Password    password    ${password}
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${drop_down_account}    5
    Page Should Contain Element    ${real_account}

go to demo account
    Go To Demo Account
    Choose DTrader
    Wait Until Page Contains Element    ${volatility_drop_down}    10
    Wait Until Element Is Visible    ${volatility_drop_down}    10
    Click Element    ${volatility_drop_down}  

market
    Market AUD/USD
    Wait Until Page Contains Element    ${contract_drop_down}    10
    Wait Until Element Is Visible    ${contract_drop_down}    10
    Click Element    ${contract_drop_down}
    Wait Until Page Contains Element    ${higher_lower}    10
    Wait Until Element Is Visible    ${higher_lower}    10
    Click Element    ${higher_lower}
    Choose Duration
    Choose Payout
    Lower Contract
    Sleep    5

*** Keywords ***
Go To Demo Account
    Click Element    ${drop_down_account}
    Wait Until Page Contains Element    ${demo_account}    10
    Wait Until Element Is Visible    ${demo_account}    10
    Click Element    ${demo_account}

Choose DTrader 
    [Arguments]       
    Wait Until Page Contains Element    ${d_trader}    10
    Wait Until Element Is Visible    ${d_trader}    10
    Click Element    ${d_trader}

Market AUD/USD    
    Wait Until Page Contains Element    ${aud_usd}    10
    Wait Until Element Is Visible    ${aud_usd}    10
    Click Element    ${aud_usd}

Choose Duration
    Wait Until Page Contains Element    ${duration}    10
    Wait Until Element Is Visible    ${duration}    10
    Click Element    ${duration}
    Press Keys    ${duration}    CTRL+A+BACKSPACE
    Input Text    ${duration}    2
    ${check_status_error}=  Run Keyword And Return Status    Wait Until Page Contains Element    ${error_duration}    10  
    IF    (${check_status_error})
        Click Element    ${duration}
        Press Keys    ${duration}    CTRL+A+BACKSPACE
        Input Text    ${duration}    3
    END
    
Choose Payout 
    Wait Until Page Contains Element    ${payout_btn}    10
    Wait Until Element Is Visible    ${payout_btn}    10
    Click Element    ${payout_btn}
    Click Element    ${payout_amount}
    Press Keys    ${payout_amount}    CTRL+A+BACKSPACE
    Input Text    ${payout_amount}    15.50

Lower Contract
    Wait Until Element Is Visible    ${disabled_lower_btn}    10
    ${check_btn_disabled}=  Run Keyword And Return Status    Wait Until Page Contains Element    ${disabled_lower_btn}    10
    IF    (${check_btn_disabled})
        Wait Until Page Contains Element    ${lower_btn}    10
        Wait Until Element Is Visible    ${lower_btn}    10
        Click Element    ${lower_btn}
    ELSE 
        Click Element    ${lower_btn}
    END

    
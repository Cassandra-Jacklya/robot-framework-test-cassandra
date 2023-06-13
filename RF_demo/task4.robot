*** Settings ***
Documentation    single test for login
Library    SeleniumLibrary
Resource    ./variables.robot
Resource    ./confidential.robot
Resource    ./keywords.robot

*** Test Cases ***
login
    Login To Deriv
    Wait Until Page Contains Element    ${drop_down_account}    5
    Page Should Contain Element    ${real_account}

go to demo account
    Go To Demo Account
    Choose Trade    ${d_trader}
    Wait Until Page Contains Element    ${volatility_drop_down}    10
    Wait Until Element Is Visible    ${volatility_drop_down}    10
    Click Element    ${volatility_drop_down}  

market
    Choose Market    ${aud_usd}
    Choose Trade Types    ${higher_lower}
    Choose Duration
    Choose Barrier    -0.1
    Wait Until Page Contains Element    ${barrier_error}    10  
    ${check_btn_disabled}=    Wait Until Page Contains Element    ${disabled_lower_btn}    10
    Choose Payout    10
    IF    (${check_btn_disabled} == "False")
        Buy Contract    ${lower_btn}
    END
    Sleep    5
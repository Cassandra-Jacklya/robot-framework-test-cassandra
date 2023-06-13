*** Settings ***
Documentation    single test for login
Library    SeleniumLibrary
Resource    ./variables.robot
Resource    ./confidential.robot

*** Test Cases ***
buy_rise_contract
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    7
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    7
    Input Text    txtEmail    ${email}
    Input Password    password    ${password}
    Click Element    //button[@name="login"]
    Wait Until Page Contains Element    ${drop_down_account}    5
    Page Should Contain Element    //span[text()="Real"]
    Click Element    ${drop_down_account}
    Wait Until Page Contains Element    ${demo_account}    10
    Wait Until Element Is Visible    ${demo_account}    10
    Click Element    ${demo_account}
    Wait Until Page Contains Element    ${d_trader}    10
    Wait Until Element Is Visible    ${d_trader}    10
    Click Element    ${d_trader}
    Wait Until Page Contains Element    ${volatility_drop_down}    10
    Wait Until Element Is Visible    ${volatility_drop_down}    10
    Click Element    ${volatility_drop_down}  
    Wait Until Page Contains Element    ${volatility_1s_index}    10
    Wait Until Element Is Visible    ${volatility_1s_index}    10
    Click Element    ${volatility_1s_index}
    Wait Until Page Contains Element    ${contract_drop_down}    10
    Wait Until Element Is Visible    ${contract_drop_down}    10
    Click Element    ${contract_drop_down}
    Wait Until Page Contains Element    ${rise_fall_item}    10
    Wait Until Element Is Visible    ${rise_fall_item}    10
    Click Element    ${rise_fall_item}
    Wait Until Page Contains Element    ${range_slider}    10
    Wait Until Element Is Visible    ${range_slider}
    ${tick_5_present}=  Run Keyword And Return Status    Element Should Be Visible    ${ticks_value5}
    ${stake10_present}=    Run Keyword And Return Status    Element Should Be Visible    ${stake_10}
    Run Keyword If    ${tick_5_present} and ${stake10_present}    Click Element    ${rise_button}  
    IF    (${tick_5_present} and ${stake10_present} != "True")
        Input Text    ${input_stake}    10
    ELSE IF    (${tick_5_present} != "True" and ${stake10_present})
        Click Element    ${ticks_value5}
    ELSE IF    (${tick_5_present} != "True" and ${stake10_present} != "True")
        Click Element    ${ticks_value5}
        Input Text    ${input_stake}    10
    END
    Sleep    5
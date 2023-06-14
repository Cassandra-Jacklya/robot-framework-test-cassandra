*** Settings ***
Documentation    this are all the keywords
Library    SeleniumLibrary
Library    String
Resource    ./confidential.robot
Resource    ./variables.robot

*** Keywords ***
Login To Deriv
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024
    Wait Until Page Contains Element    dt_login_button    7
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    7
    Input Text    txtEmail    ${email}
    Input Password    password    ${password}
    Click Element    ${login_btn}

Go To Demo Account
    Click Element    ${drop_down_account}
    Wait Until Page Contains Element    ${demo_account}    10
    Wait Until Element Is Visible    ${demo_account}    10
    Click Element    ${demo_account}
    Sleep    3

Choose Trade
    [Arguments]    ${trade_option}
    Wait Until Page Contains Element    ${trade_option}    10
    Wait Until Element Is Visible    ${trade_option}    10
    Click Element    ${trade_option}

Choose Market
    [Arguments]    ${market_option}  
    Ensure Page Contains    ${market_option}
    Click Element    ${market_option}

Choose Trade Types
    [Arguments]    ${trade_type}
    Ensure Page Contains    ${contract_drop_down}
    Click Element    ${contract_drop_down}
    Ensure Page Contains    ${trade_type}
    Click Element    ${trade_type}

Choose Duration
    Ensure Page Contains    ${duration}
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
    [Arguments]    ${payout_input}
    Ensure Page Contains    ${payout_btn}
    Click Element    ${payout_btn}
    Click Element    ${payout_amount}
    Press Keys    ${payout_amount}    CTRL+A+BACKSPACE
    Input Text    ${payout_amount}    ${payout_input}

Choose Barrier
    [Arguments]    ${barrier_amount}
    Ensure Page Contains    ${barrier_input}
    Click Element    ${barrier_input}
    Press Keys    ${barrier_input}    CTRL+A+BACKSPACE
    Input Text    ${barrier_input}    ${barrier_amount}

Tick Take Profit Checkbox
    [Arguments]    ${take_profit_amount}
    Click Element    ${take_profit_checkbox}
    Press Keys    ${take_profit_input}    CTRL+A+BACKSPACE
    Input Text    ${take_profit_input}    ${take_profit_amount}

Tick Stop Loss Checkbox
    [Arguments]    ${stop_loss_amount}
    Click Element    ${stop_loss_checkbox}
    Press Keys    ${stop_loss_input}    CTRL+A+BACKSPACE
    Input Text    ${stop_loss_input}    ${stop_loss_amount}

Check If Deal Fee And Stake Correlates
    [Arguments]    ${current_fee}    ${current_stake}
    FOR    ${counter}    IN RANGE    5       
        Click Element    ${stake_add}
        Ensure Page Contains    ${deal_fee_down}
        Ensure Page Contains    ${deal_fee_up}
        ${deal_fee_down_units}=    Get Text    ${deal_fee_down}
        ${value_deal_fee_down}=    Get Deal Fee Multiplier    ${deal_fee_down_units}
        ${deal_fee_up_units}=    Get Text    ${deal_fee_up}
        ${value_deal_fee_up}=    Get Deal Fee Multiplier    ${deal_fee_up_units}
        ${value_deal_fee_down_convert}    Convert To Number    ${value_deal_fee_down}
        ${value_deal_fee_up_convert}=    Convert To Number    ${value_deal_fee_up}
        ${current_fee_convert}=    Convert To Number    ${current_fee}
        IF    (${value_deal_fee_down_convert} > ${current_fee_convert} and ${value_deal_fee_up_convert} > ${current_fee_convert})
            ${current_fee}=    Set Variable    ${value_deal_fee_up}
        ELSE   
            Fail
        END   
    END
    RETURN    

Get Deal Fee Multiplier
    [Arguments]    ${value_with_units}
    @{list}=    Split String    ${value_with_units}    ${SPACE}
    ${split_more}=    Set Variable    ${list[2]}
    @{actual_value}=    Split String    ${split_more}    ${\n}
    ${value}=    Set Variable    ${actual_value[1]}
    RETURN    ${value}

Buy Contract
    [Arguments]    ${button}
    Ensure Page Contains    ${button}
    Click Element    ${button}

Ensure Page Contains
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}    10
    Wait Until Element Is Visible    ${element}    10
*** Settings ***
Documentation    task 5 for automation testing
Library    SeleniumLibrary
Library    String
Resource    ./variables.robot
Resource    ./keywords.robot

# d. Deal cancellation fee should correlate with the stake value (e.g. deal cancellation fee is more
# expensive when the stake is higher)


#haven't finish yet
*** Test Cases ***
login
    Login To Deriv
    Wait Until Page Contains Element    ${drop_down_account}    10
    Go To Demo Account
    Choose Trade    ${d_trader}
    Ensure Page Contains    ${volatility_drop_down}
    Click Element    ${volatility_drop_down}
    Choose Market    ${volatility_50_index}

key point a
    Choose Trade Types    ${multiplier}
    Ensure Page Contains    ${stake_word}
    Page Should Contain Element    ${stake_word} 
    Page Should Not Contain    Payout   

key point b
    Page Should Contain Element    ${stop_loss_checkbox}
    Page Should Contain Element    ${take_profit_checkbox}
    Page Should Contain Element    ${deal_cancellation_checkbox}
    Tick Take Profit Checkbox    1
    Tick Stop Loss Checkbox    1
    ${check_profit_status}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${take_profit_active}    10
    ${check_loss_status}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${stop_loss_active}    10
    ${check_deal_status}=    Run Keyword And Return Status    Wait Until Page Contains Element    ${deal_cancellation_active}    10
    IF    (${check_profit_status} or ${check_loss_status})
        Page Should Not Contain Element    ${deal_cancellation_active}
    ELSE IF    ${check_deal_status}
        Page Should Not Contain Element    ${stop_loss_active}
        Page Should Not Contain Element    ${take_profit_active}
    END

key point c
    Ensure Page Contains    ${multiplier_values}
    Click Element    ${multiplier_values}
    Ensure Page Contains    ${multiplier_value_x20}
    Ensure Page Contains    ${multiplier_value_x40}
    Ensure Page Contains    ${multiplier_value_x60}
    Ensure Page Contains    ${multiplier_value_x100}
    Ensure Page Contains    ${multiplier_value_x200}

key point d
    Click Element    ${deal_cancellation_checkbox}
    Ensure Page Contains    ${deal_fee_down}
    Ensure Page Contains    ${deal_fee_up}
    ${deal_fee_down_units}=    Get Text    ${deal_fee_down}
    ${value_deal_fee_down}=    Get Deal Fee Multiplier    ${deal_fee_down_units}
    ${deal_fee_up_units}=    Get Text    ${deal_fee_up}
    ${value_deal_fee_up}=    Get Deal Fee Multiplier    ${deal_fee_up_units}
    ${current_fee}=    Set Variable    ${value_deal_fee_up}
    ${current_stake}=    Set Variable    ${input_stake}
    Check If Deal Fee And Stake Correlates    ${current_fee}    ${current_stake}

key point e and f
    Click Element    ${input_stake}
    Press Keys    ${input_stake}    CTRL+A+BACKSPACE
    Input Text    ${input_stake}    2000
    ${input_error_status}=    Run Keyword And Return Status    Wait Until Page Contains    Maximum stake allowed is 2000.00.    10
    IF    ${input_error_status}
        Fail
    END
    Page Should Not Contain    Maximum stake allowed is 2000.00.
    Press Keys    ${input_stake}    CTRL+A+BACKSPACE
    Input Text    ${input_stake}    2001
    Wait Until Page Contains    Maximum stake allowed is 2000.00.
    Page Should Contain    Maximum stake allowed is 2000.00.
    Press Keys    ${input_stake}    CTRL+A+BACKSPACE
    Input Text    ${input_stake}    1
    ${input_error_status}=    Run Keyword And Return Status    Wait Until Page Contains    Please enter a stake amount that's at least 1.00.    10
    IF    ${input_error_status}
        Fail
    END
    Page Should Not Contain    Please enter a stake amount that's at least 1.00.
    Press Keys    ${input_stake}    CTRL+A+BACKSPACE
    Input Text    ${input_stake}    0
    Wait Until Page Contains    Please enter a stake amount that's at least 1.00.
    Page Should Contain    Please enter a stake amount that's at least 1.00.
    
key point g and h
    Ensure Page Contains    ${take_profit_checkbox}
    Click Element    ${take_profit_checkbox}
    Ensure Page Contains    ${take_profit_add}
    Ensure Page Contains    ${take_profit_sub}
    ${current_take_value}=    Get Value    ${take_profit_input}
    Click Element    ${take_profit_add}
    Sleep    3
    ${after_take_value}=    Get Value    ${take_profit_input}
    ${convert_int_current_take}=    Convert To Integer    ${current_take_value}
    ${convert_int_after_take}=    Convert To Integer    ${after_take_value} 
    IF    ${convert_int_after_take} < ${convert_int_current_take}
        Fail
    END
    ${current_take_value}=    Get Value    ${take_profit_input}
    Click Element    ${take_profit_sub}
    Sleep    3
    ${after_take_value}=    Get Value    ${take_profit_input}
    ${convert_int_current_take}=    Convert To Integer    ${current_take_value}
    ${convert_int_after_take}=    Convert To Integer    ${after_take_value}
    IF    ${convert_int_after_take} > ${convert_int_current_take}
        Fail
    END

key point i
    Click Element    ${deal_cancellation_checkbox}
    Ensure Page Contains    ${deal_duration_btn}
    Click Element    ${deal_duration_btn}
    Ensure Page Contains    ${5mins_deal_cancel}
    Ensure Page Contains    ${10mins_deal_cancel}
    Ensure Page Contains    ${15mins_deal_cancel}
    Ensure Page Contains    ${30mins_deal_cancel}
    Ensure Page Contains    ${60mins_deal_cancel}

final steps
    Sleep    5
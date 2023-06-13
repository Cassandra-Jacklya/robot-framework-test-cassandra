*** Settings ***
Documentation    these are all the keywords
Library    SeleniumLibrary
Library    Collections
Library    String
Resource    ./variables.robot

*** Keywords ***
Go To Browser 
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024

Login To Deriv
    [Arguments]    ${email}    ${password}
    Ensure Page Contains    txtEmail
    Ensure Page Contains    password
    Input Text    txtEmail    ${email}
    Input Password    password    ${password}
    Click Element     ${login_btn}

Go To Closing Account
    Ensure Page Contains    //a[@href="/account/personal-details"]
    Click Element    //a[@href="/account/personal-details"]
    Ensure Page Contains    //a[@href="/account/closing-account"]
    Click Element    //a[@href="/account/closing-account"]

Check Reason 
    [Arguments]    @{reason_list}
    FOR    ${reason}    IN    @{reason_list}
        ${financial_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${financial_priorities}
        ${stop_trade_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${stop_trading}
        ${not_interested_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${not_interested}
        ${another_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${another_website}
        ${not_user_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${not_user_friendly}
        ${difficult_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${difficult_transaction}
        ${lack_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${lack_of_features}
        ${unsatisfactory_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${unsatisfactory_service}
        ${others_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${reason}    ${other_reasons}
        Ensure Page Contains    ${reason}
        Click Element    ${reason}
        IF    ${financial_bool}
            Ensure Page Contains    ${financial_active}
            Click Element    ${financial_active}
        ELSE IF    ${stop_trade_bool}
            Ensure Page Contains    ${stop_trading_active}
            Click Element    ${stop_trading_active}
        ELSE IF    ${not_interested_bool}
            Ensure Page Contains    ${not_interested_active}
            Click Element    ${not_interested_active}
        ELSE IF    ${another_bool}
            Ensure Page Contains    ${another_website_active}
            Click Element    ${another_website_active}
        ELSE IF    ${not_user_bool}
            Ensure Page Contains    ${not_user_friendly_active}
            Click Element    ${not_user_friendly_active}
        ELSE IF    ${difficult_bool}
            Ensure Page Contains    ${difficult_transaction_active}
            Click Element    ${difficult_transaction_active}
        ELSE IF    ${lack_bool}
            Ensure Page Contains    ${lack_of_features_active}
            Click Element    ${lack_of_features_active}
        ELSE IF    ${unsatisfactory_bool}
            Ensure Page Contains    ${unsatisfactory_service_active}
            Click Element    ${unsatisfactory_service_active}
        ELSE IF    ${others_bool}
            Ensure Page Contains    ${other_reasons_active}
            Click Element    ${other_reasons_active}
        END
    END

Maximum Three Reasons
    [Arguments]    @{reasons}
    @{enabled_lists}=    Create List    @{reasons}
    FOR    ${element}    IN    @{reasons}
        Ensure Page Contains    ${element}
        Click Element    ${element}
    END
    
    @{all_checkboxes}=    Create List    ${financial_priorities}    ${stop_trading}    ${not_interested}    ${another_website}    ${not_user_friendly}    ${difficult_transaction}    ${lack_of_features}    ${unsatisfactory_service}    ${other_reasons}
    @{disabled_list}=    Create List
    FOR    ${checkbox}    IN    @{all_checkboxes}
        FOR    ${enabled}    IN    @{enabled_lists}
            ${check_status}=    Run Keyword And Return Status    Should Be Equal As Strings    ${enabled}    ${checkbox}
            IF    ${check_status} == "False"
                Append To List    @{disabled_list}    ${checkbox}
            END
        END
    END

    FOR    ${disabled}    IN    @{disabled_list}
       Page Should Not Contain Element    ${disabled}    
    END

Remaining Characters
    [Arguments]    ${remaining_text}    ${trading_platform}    ${improve}    ${actual_count}
    ${trading_count}=    Get Length    ${trading_platform}
    ${improve_count}=    Get Length    ${improve}
    ${words}=    Get Text    ${remaining_text}
    @{list_of_words}=    Split String    ${words}    ${SPACE}
    ${initial_count}=    Set Variable    ${list_of_words[2]}
    Press Keys    ${input_platform}    CTRL+A+BACKSPACE
    Input Text    ${input_platform}    ${trading_platform}
    Press Keys    ${input_improve}    CTRL+A+BACKSPACE
    Input Text    ${input_improve}    ${improve}
    ${total}=    Evaluate    ${trading_count} + ${improve_count}
    ${final_count}=    Evaluate    ${initial_count} - ${total}
    Should Be Equal As Integers    ${final_count}    ${actual_count}

Ensure Page Contains
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}    40
    Wait Until Element Is Visible    ${element}    40
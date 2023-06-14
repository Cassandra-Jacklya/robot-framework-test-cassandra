*** Settings ***
Documentation    these are all the keywords
Library    SeleniumLibrary
Resource    ./variables.robot

*** Keywords ***
Go To Browser 
    Open Browser    https://app.deriv.com    Chrome
    Set Window Size    1280    1024

Login To Deriv
    [Arguments]    ${email}    ${password}
    Wait Until Page Contains Element    dt_login_button    7
    Click Element    dt_login_button
    Wait Until Page Contains Element    txtEmail    7
    Input Text    txtEmail    ${email}
    Input Password    password    ${password}
    Click Element    //button[@name="login"]

Select Scope Checkboxes
    [Arguments]    ${checkbox}
    Ensure Page Contains    ${checkbox}
    Click Element    ${checkbox}
    ${read_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${checkbox}    ${read_active_checkbox}
    ${trade_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${checkbox}    ${trade_active_checkbox}
    ${payments_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${checkbox}    ${payments_active_checkbox}
    ${trading_info_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${checkbox}    ${trading_info_active_checkbox}
    ${admin_bool}=    Run Keyword And Return Status    Should Be Equal As Strings    ${checkbox}    ${admin_active_checkbox}
    IF    ${read_bool}
        Ensure Page Contains    ${read_active_checkbox}
    ELSE IF    ${trade_bool}
        Ensure Page Contains    ${trade_active_checkbox}
    ELSE IF    ${payments_bool}
        Ensure Page Contains    ${payments_active_checkbox}
    ELSE IF    ${trading_info_bool}
        Ensure Page Contains    ${trading_info_active_checkbox}
    ELSE IF    ${admin_bool}
        Ensure Page Contains    ${admin_active_checkbox}
    END

Check Empty Token Name Field
    Ensure Page Contains    ${input_token_name}
    Click Element    ${input_token_name}
    Click Element    //section[@class="da-api-token"]
    Ensure Page Contains    //div[@class="dc-field dc-field--error"]
    Click Element    //div[@class="da-api-token__checkbox-wrapper"]
    Page Should Contain Element    //div[@class="dc-field dc-field--error"]
    Press Keys    ${input_token_name}    CTRL+A+BACKSPACE
    Input Text    ${input_token_name}    testing
    Page Should Not Contain Element    //div[@class="dc-field dc-field--error"]

Check Invalid Token Name Field
    Ensure Page Contains    ${input_token_name}
    Click Element    ${input_token_name}
    Press Keys    ${input_token_name}    CTRL+A+BACKSPACE
    Input Text    ${input_token_name}    testingtestingtestingtestingtestingtestingtestingtestingtesting
    Ensure Page Contains    //div[@class="dc-field dc-field--error" and contains(text(), "Maximum 32 characters.")]
    Page Should Contain Element    //div[@class="dc-field dc-field--error" and contains(text(), "Maximum 32 characters.")]
    Press Keys    ${input_token_name}    CTRL+A+BACKSPACE
    Input Text    ${input_token_name}    t
    Ensure Page Contains    //div[@class="dc-field dc-field--error" and contains(text(), "Length of token name must be between 2 and 32 characters.")]

Check Icons Exist In Each Row
    [Arguments]    @{rows}
    ${count}=    Set Variable    1
    ${count_int_convert}=    Convert To Integer    ${count}
    FOR    ${element}    IN    @{rows}
        ${count_str_convert}=    Convert To String    ${count_int_convert}
        ${xpath_copy}=    Catenate    SEPARATOR=${EMPTY}    (    ${token_copy_icon}    )[    ${count_str_convert}    ]  
        ${xpath_delete}=    Catenate     SEPARATOR=${EMPTY}    (    ${token_delete_icon}    )[    ${count_str_convert}    ]  
        ${xpath_view}=    Catenate     SEPARATOR=${EMPTY}    (    ${tokenpass_view_icon}    )[    ${count_str_convert}    ]   
        Ensure Page Contains    ${xpath_copy}
        Ensure Page Contains    ${xpath_delete}
        Ensure Page Contains    ${xpath_view}
        ${count_int_convert}=    Set Variable    ${count_int_convert+1}
    END
    ${xpath_copy}=    Catenate    SEPARATOR=${EMPTY}    (    ${token_copy_icon}    )[1]  
    ${xpath_delete}=    Catenate     SEPARATOR=${EMPTY}    (    ${token_delete_icon}    )[1] 
    ${xpath_view}=    Catenate     SEPARATOR=${EMPTY}    (    ${tokenpass_view_icon}    )[1]
    IF    ${count_int_convert} == 1
        Page Should Not Contain Element    ${xpath_copy}
        Page Should Not Contain Element    ${xpath_delete}
        Page Should Not Contain Element    ${xpath_view}
    END

Fill In Token Name
    Ensure Page Contains    ${input_token_name}
    Click Element    ${input_token_name}
    Press Keys    ${input_token_name}    CTRL+A+BACKSPACE
    Input Text    ${input_token_name}    testing

Click Create Button
    Ensure Page Contains    ${create_btn}
    Click Button    ${create_btn}

Check Count Rows   
    [Arguments]    @{list}
    ${count}=    Get Element Count    ${list}
    IF    ${count} < 0
        Fail
    END

Check Create Button Status
    ${status}=    Run Keyword And Return Status    Wait Until Element Is Enabled    ${create_btn}
    RETURN    ${status}

Check Eye Icon Function
    [Arguments]    @{rows}
    ${count}=    Set Variable    1
    ${count_int_convert}=    Convert To Integer    ${count}
    FOR    ${element}    IN    @{rows}
        ${count_str_convert}=    Convert To String    ${count_int_convert}
        ${xpath_password}=    Catenate    SEPARATOR=${EMPTY}    (    ${tokenpass_view_icon}    )[    ${count_str_convert}    ]    
        Ensure Page Contains    ${xpath_password}
        Click Element    ${xpath_password}
        ${count_int_convert}=    Set Variable    ${count_int_convert+1}
    END
    IF    ${count_int_convert} != 1
        Page Should Not Contain Element    ${token_password_dot}
    END

Check Delete Icon Function
    [Arguments]    @{rows}
    FOR    ${element}    IN    @{rows}
        Ensure Page Contains    ${token_delete_icon}
        Click Element    ${token_delete_icon}
        Ensure Page Contains    ${delete_modal}
        Ensure Page Contains    ${cancel_btn}
        Click Element    ${cancel_btn}
        Wait Until Element Is Not Visible    ${delete_modal}
        Page Should Not Contain Element    ${delete_modal}
        Click Element    ${token_delete_icon}
        Ensure Page Contains    ${delete_modal}
        Ensure Page Contains    ${yes_delete_btn}
        Click Element    ${yes_delete_btn}
        Wait Until Element Is Not Visible    ${delete_modal}
    END
    Page Should Not Contain Element    ${token_table_list}
    
Ensure Page Contains
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}    10
    Wait Until Element Is Visible    ${element}    10
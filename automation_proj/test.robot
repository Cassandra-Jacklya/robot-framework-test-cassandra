*** Settings ***
Documentation    automation test project
Library    SeleniumLibrary
Resource    ./keywords.robot
Resource    ./variables.robot
Resource    ./confidential.robot

*** Test Cases ***
Go To Browser
    Go To Browser
Login To Deriv
    Login To Deriv    ${email}    ${password}
Go To API Page
    Ensure Page Contains    //a[@href="/account/personal-details"]
    Click Element    //a[@href="/account/personal-details"]
    Ensure Page Contains    //div[@id="/account/api-token"]
    Click Element    //div[@id="/account/api-token"]
    Ensure Page Contains    //h4[text()="API token"]
Check Select Scope Checkboxes
    Select Scope Checkboxes    ${read_checkbox}
    Select Scope Checkboxes    ${trade_checkbox}
    Select Scope Checkboxes    ${payments_checkbox}
    Select Scope Checkboxes    ${trading_info_checkbox}
    Select Scope Checkboxes    ${admin_checkbox}
    Sleep    2
Token Name Field
    Check Empty Token Name Field
    Check Invalid Token Name Field
Check Icons
    @{list}=    Get WebElements    ${token_rows}
    Check Icons Exist In Each Row    @{list}
Check Create Button
    Reload Page
    Ensure Page Contains    ${create_btn}
    Select Scope Checkboxes    ${admin_checkbox}
    Fill In Token Name
    Wait Until Element Is Enabled    ${create_btn}
    Click Create Button
    Check Count Rows    ${token_rows}
    Select Scope Checkboxes    ${read_checkbox}
    ${status}=    Check Create Button Status
    IF    ${status}
        Fail
    END
    Fill In Token Name
    ${status}=    Check Create Button Status
    IF    ${status}
        Fail
    END
Icon Functionalities
    @{list}=    Get WebElements    ${token_rows}
    Check Eye Icon Function    @{list}
    @{list}=    Get WebElements    ${token_rows}
    Check Delete Icon Function    @{list}







    

    
    


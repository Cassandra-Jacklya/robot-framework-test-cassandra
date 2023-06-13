*** Settings ***
Documentation    automation test project
Library    SeleniumLibrary
Library    String
Resource    ./keywords.robot
Resource    ./variables.robot
Resource    ./confidential.robot

*** Test Cases ***
Go To Browser
    Go To Browser
Login To Deriv
    Ensure Page Contains    ${login_from_chartpage}
    Click Element    ${login_from_chartpage}
    Login To Deriv    ${email}    ${password}
Go To Closing Account Page
    Go To Closing Account
Check Buttons on Are You Sure Page
    Ensure Page Contains    ${cancel_btn}
    Click Element    ${cancel_btn}
    Ensure Page Contains    ${chart}
    Go Back
    Ensure Page Contains    ${close_account_btn}
    Click Element    ${close_account_btn}
Check Reason Checkboxes
    Check Reason    ${financial_priorities}    ${stop_trading}    ${not_interested}    ${another_website}    ${not_user_friendly}    ${difficult_transaction}    ${lack_of_features}    ${unsatisfactory_service}    ${other_reasons}
    Maximum Three Reasons    ${financial_priorities}    ${other_reasons}    ${not_user_friendly}
Check Buttons On Closing Page
    Ensure Page Contains    ${back_btn}
    Click Element    ${back_btn}
    Ensure Page Contains    //*[text()="Are you sure?"]
    Go To Closing Account
    Ensure Page Contains    ${close_account_btn}
    Click Element    ${close_account_btn}
# Check Placeholders
#     Ensure Page Contains    //textarea[@placeholder="If you don’t mind sharing, which other trading platforms do you use?"]
#     Ensure Page Contains    //textarea[@placeholder="What could we do to improve?"]
# Check Error Messages
#     Click Element    ${financial_priorities}
#     Click Element    ${financial_active}
#     Ensure Page Contains    //p[text()="Please select at least one reason"]
Check Remaining Characters
    Remaining Characters    ${remaining_text}     ${EMPTY}    ${EMPTY}    110
    ${trade_str}=    Set Variable    other${SPACE}trading${SPACE}platforms
    ${improve_str}=    Set Variable    improvements${SPACE}here
    Remaining Characters    ${remaining_text}    ${trade_str}    ${improve_str}    70
Check Pop Up Window Elements
    Click Element    ${financial_priorities}
    Click Element    ${continue_btn}
    Ensure Page Contains    ${warning_close_account}
    Ensure Page Contains    ${go_back_btn}
    Click Element    ${go_back_btn}
    Ensure Page Contains    //form
    Click Element    ${continue_btn}
    Ensure Page Contains    ${confirm_close}
    Click Element    ${confirm_close}
    Ensure Page Contains    ${countdown_close}
    Wait Until Page Contains Element    ${title_after_close_acc}    20
Start Trading Again Elements
    Wait Until Element Is Enabled    //button[@id="dm-nav-login-button"]
    Click Element    //button[@id="dm-nav-login-button"]
    Login To Deriv    ${email}    ${password}
    Ensure Page Contains    //*[text()="Want to start trading on Deriv again?"]
    Ensure Page Contains    ${cancel_relogin}
    Click Element    ${cancel_relogin}
    Ensure Page Contains    ${chart}
    ${current_location}=    Get Location
    Should Be Equal As Strings    https://app.deriv.com/#error=reactivation_cancelled&state=    ${current_location}
    Ensure Page Contains    ${login_from_chartpage}
    Click Element    ${login_from_chartpage}
    Login To Deriv    ${email}    ${password}
    Ensure Page Contains    //*[text()="Want to start trading on Deriv again?"]
    Ensure Page Contains    ${start_trading}
    Click Element    ${start_trading}
    Ensure Page Contains    //span[text()="Deposit"]//parent::button
    Sleep    5

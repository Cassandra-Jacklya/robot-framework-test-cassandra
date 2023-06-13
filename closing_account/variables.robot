*** Variables ***
#buttons
${back_btn}    //span[text()="Back"]//parent::button
${cancel_btn}    //span[text()="Cancel"]//parent::button
${close_account_btn}    //button[@class="dc-btn dc-btn--primary dc-btn__large closing-account__button--close-account"]
${continue_btn}    //span[text()="Continue"]//parent::button
${go_back_btn}    //span[text()="Go Back"]//parent::button
${confirm_close}    //span[text()="Close account"]//parent::button
${start_trading}    //button[@id="btnGrant"]
${cancel_relogin}    //button[@id="btnCancel"]
${login_btn}    //button[@name="login"]
${login_from_chartpage}    //button[@id="dt_login_button"]

#page-body
${chart}    //div[@class="ciq-chart-area"]
${warning_close_account}    //div[@class="account-closure-warning-modal"]
${countdown_close}    //p[@class="dc-text account-closed"]
${title_after_close_acc}    //title[text()="Online trading platform | Forex, commodities, synthetic indices, stocks, and stock indices | Deriv"]

#input
${input_platform}    //textarea[@name="other_trading_platforms"]
${input_improve}    //textarea[@name="do_to_improve"]
${remaining_text}    //p[@class="dc-text closing-account-reasons__hint"]

#checkboxes
${financial_priorities}    //input[@name="financial-priorities"]//following-sibling::span[@class="dc-checkbox__box"]
${stop_trading}    //input[@name="stop-trading"]//following-sibling::span[@class="dc-checkbox__box"]
${not_interested}    //input[@name="not-interested"]//following-sibling::span[@class="dc-checkbox__box"] 
${another_website}    //input[@name="another-website"]//following-sibling::span[@class="dc-checkbox__box"]
${not_user_friendly}    //input[@name="not-user-friendly"]//following-sibling::span[@class="dc-checkbox__box"]
${difficult_transaction}    //input[@name="difficult-transactions"]//following-sibling::span[@class="dc-checkbox__box"]
${lack_of_features}    //input[@name="lack-of-features"]//following-sibling::span[@class="dc-checkbox__box"]
${unsatisfactory_service}    //input[@name="unsatisfactory-service"]//following-sibling::span[@class="dc-checkbox__box"]
${other_reasons}    //input[@name="other-reasons"]//following-sibling::span[@class="dc-checkbox__box"]
${financial_active}    //input[@name="financial-priorities"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${stop_trading_active}    //input[@name="stop-trading"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${not_interested_active}    //input[@name="not-interested"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${another_website_active}    //input[@name="another-website"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${not_user_friendly_active}    //input[@name="not-user-friendly"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${difficult_transaction_active}    //input[@name="difficult-transactions"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${lack_of_features_active}    //input[@name="lack-of-features"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${unsatisfactory_service_active}    //input[@name="unsatisfactory-service"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]
${other_reasons_active}    //input[@name="other-reasons"]//following-sibling::span[@class="dc-checkbox__box dc-checkbox__box--active"]


    
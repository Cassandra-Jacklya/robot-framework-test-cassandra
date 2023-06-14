*** Variables ***
#urls
${api_page}    https://app.deriv.com/account/api-token

#token details
${input_token_name}    //input[@name="token_name"]
${token_table_list}    //tr[@class="da-api-token__table-cell-row"]//parent::tbody
${token_rows}    //tr[@class="da-api-token__table-cell-row"]
${token_password_dot}    //div[@class="da-api-token__pass-dot-container"]

#icon functions
${delete_modal}    //p[text()="Are you sure you want to delete this token?"]//parent::div[@class="dc-modal-body"]
${token_copy_icon}    //td[@class="da-api-token__table-cell"]/div/div/div/div/*[@data-testid="dt_copy_token_icon"]
${token_delete_icon}    //td[@class="da-api-token__table-cell"]/div/div/div/*[@data-testid="dt_token_delete_icon"]
${tokenpass_view_icon}    //td[@class="da-api-token__table-cell"]/div/div/div/div/*[@data-testid="dt_toggle_visibility_icon"]

#checkboxes
${read_checkbox}    //input[@name="read"]//parent::label
${trade_checkbox}    //input[@name="trade"]//parent::label
${payments_checkbox}    //input[@name="payments"]//parent::label
${trading_info_checkbox}    //input[@name="trading_information"]//parent::label
${admin_checkbox}    //input[@name="admin"]//parent::label
${read_active_checkbox}    //input[@name="read"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]
${trade_active_checkbox}    //input[@name="trade"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]
${payments_active_checkbox}    //input[@name="payments"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]
${trading_info_active_checkbox}    //input[@name="trading_information"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]
${admin_active_checkbox}    //input[@name="admin"]//ancestor::div[@class="composite-checkbox api-token__checkbox composite-checkbox--active"]

#buttons
${create_btn}    //button[@class="dc-btn dc-btn__effect dc-btn--primary dc-btn__large dc-btn__button-group da-api-token__button"]
${cancel_btn}    //span[text()="Cancel"]//parent::button
${yes_delete_btn}    //span[text()="Yes, delete"]//parent::button
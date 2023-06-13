*** Variables ***
${login_btn}    //button[@name="login"]
${deposit_btn}    //button[@class="dc-btn dc-btn--secondary currency-switcher__button"]
${check_trading_specs_btn}    //a[@class="live-pricing-section-module--button_table--ff134 link-button primary outlined typography-link typography typography-font-UBUNTU typography-break-word"] 
${trade_now_btn}    //button[@class="button live-pricing-section-module--button_table--ff134 primary text-small typography-weight-bold"] 

${cfd_btn}    //a[@href="/markets/forex/?tab=cfds#cfds"]
${options_btn}    //a[@href="/markets/forex/?tab=options#options"]
${multipliers_btn}    //a[@href="/markets/forex/?tab=multipliers#multipliers"]

${drop_down_account}    //div[@class="dc-dropdown__container"]
${demo_account}    //div[@id="demo"]
${real_account}    //span[text()="Real"]

${d_trader}    //a[@href="/"]
${volatility_drop_down}    //div[@class="cq-symbol-select-btn"]
${volatility_1s_index}    //span[@class="ic-icon ic-1HZ10V"]
${volatility_50_index}    //div[@class="sc-mcd__item sc-mcd__item--R_50 "]
${contract_drop_down}    //div[@id="dt_contract_dropdown"]
${rise_fall_item}    //div[@id="dt_contract_rise_fall_item"]
${range_slider}    //div[@class="range-slider__ticks"]
${ticks_value5}    //span[@data-testid="tick_step_4"]
${stake_10}    //input[@value="10"]
${input_stake}    //input[@id="dt_amount_input"]//parent::div
${rise_button}    //button[@id="dt_purchase_call_button"]

${aud_usd}    //div[@class="sc-mcd__item sc-mcd__item--frxAUDUSD "]
${higher_lower}    //div[@id="dt_contract_high_low_item"]
${duration}    //input[@class="dc-input__ield"]
${payout_btn}    //button[@id="dc_payout_toggle_item"]
${payout_amount}    //input[@id="dt_amount_input"]
${lower_btn}    //button[@class="btn-purchase btn-purchase--2"]
${error_duration}    //div[@class="dc-input-field dc-input-field--has-error"]
${disabled_lower_btn}    //button[@class="btn-purchase btn-purchase--disabled btn-purchase--2"]
${disabled_higher_btn}    //button[@class="btn-purchase btn-purchase--disabled btn-purchase--1"]

${multiplier}    //div[@id="dt_contract_multiplier_item"]
${accumulator_link}    //div[@id="dc_accumulators_link"]

${barrier_error}    //*[@data-tooltip="Contracts more than 24 hours in duration would need an absolute barrier."]
${take_profit_error}    //span[@data-tooltip="Please enter a take profit amount."]
${stop_loss_error}    //span[@data-tooltip="Please enter a stop loss amount."]

${take_profit_add}    //button[@id="dc_take_profit_input_add"]
${stop_loss_add}    //button[@id="dc_stop_loss_input_add"]
${stake_add}    //button[@id="dt_amount_input_add"]

${barrier_input}    //input[@id="dt_barrier_1_input"]
${take_profit_input}    //input[@id="dc_take_profit_input"]
${stop_loss_input}    //input[@id="dc_stop_loss_input"]

${deal_cancellation_checkbox}    //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox"]
${take_profit_checkbox}    //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox take_profit-checkbox__input"]
${stop_loss_checkbox}    //span[@class="dc-checkbox__box"]//parent::label[@class="dc-checkbox stop_loss-checkbox__input"]
${stake_word}    //span[text()="Stake"]

${take_profit_active}    //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox take_profit-checkbox__input"]
${stop_loss_active}    //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox stop_loss-checkbox__input"]
${deal_cancellation_active}    //span[@class="dc-checkbox__box dc-checkbox__box--active"]//parent::label[@class="dc-checkbox"]
${multiplier_values}    //span[@name="multiplier"]//parent::div[@class="dc-dropdown__display dc-dropdown__display--no-border"]
${deal_cancellation_duration}    //span[@name="cancellation_duration"]//parent::div[@class="dc-dropdown__display dc-dropdown__display--no-border"]
${multiplier_value_x20}    //span[text()="x20"]//parent::div[@id="20"]
${multiplier_value_x40}    //span[text()="x40"]//parent::div[@id="40"]
${multiplier_value_x60}    //span[text()="x60"]//parent::div[@id="60"]
${multiplier_value_x100}    //span[text()="x100"]//parent::div[@id="100"]
${multiplier_value_x200}    //span[text()="x200"]//parent::div[@id="200"]
${deal_fee_up}    //span[@class="trade-container__price-info-currency"]//ancestor::div[@id="dt_purchase_multup_price"]
${deal_fee_down}    //span[@class="trade-container__price-info-currency"]//ancestor::div[@id="dt_purchase_multdown_price"]

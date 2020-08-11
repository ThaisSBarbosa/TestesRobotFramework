*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${CREATEANACCOUNT_HEADER}               xpath=//*[@id="account-creation_form"]//h3[contains(text(),"Your personal information")]
${CREATEANACCOUNT_RB_GENDER}            id=id_gender2
${CREATEANACCOUNT_FIELD_FIRSTNAME}      id=customer_firstname
${CREATEANACCOUNT_FIELD_LASTNAME}       id=customer_lastname
${CREATEANACCOUNT_FIELD_PASSWORD}       id=passwd
${CREATEANACCOUNT_FIELD_ADRESS}         id=address1
${CREATEANACCOUNT_FIELD_CITY}           id=city
${CREATEANACCOUNT_CB_STATE_MENU}        xpath=//p[@class='required id_state select form-group']//div//select
${CREATEANACCOUNT_CB_STATE}             xpath=//p[@class='required id_state select form-group']
${CREATEANACCOUNT_FIELD_POSTCODE}       id=postcode
${CREATEANACCOUNT_FIELD_MOBILE}         id=phone_mobile
${CREATEANACCOUNT_BTN_SUBMITACCOUNT}    submitAccount


*** Keywords ***
Preencher os dados obrigatórios (Browser: "${BROWSER}")
    Wait Until Element Is Visible   ${CREATEANACCOUNT_HEADER}
    Click Element                   ${CREATEANACCOUNT_RB_GENDER}
    Input Text                      ${CREATEANACCOUNT_FIELD_FIRSTNAME}    May
    Input Text                      ${CREATEANACCOUNT_FIELD_LASTNAME}     Fernandes
    Input Text                      ${CREATEANACCOUNT_FIELD_PASSWORD}     123456
    Input Text                      ${CREATEANACCOUNT_FIELD_ADRESS}       Rua Framework, Bairro Robot
    Input Text                      ${CREATEANACCOUNT_FIELD_CITY}         Floripa
    Wait Until Element Is Visible   ${CREATEANACCOUNT_CB_STATE}           20
    Set Focus To Element            ${CREATEANACCOUNT_CB_STATE}
    Select From List By Index       ${CREATEANACCOUNT_CB_STATE_MENU}      9
    Input Text                      ${CREATEANACCOUNT_FIELD_POSTCODE}     12345
    Input Text                      ${CREATEANACCOUNT_FIELD_MOBILE}       99988877

Submeter cadastro
    Click Button    ${CREATEANACCOUNT_BTN_SUBMITACCOUNT}

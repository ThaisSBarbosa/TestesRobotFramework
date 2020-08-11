*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${AUTHENTICATION_FIELD_EMAIL}     id=email_create
${AUTHENTICATION_BTN_CREATE}    id=SubmitCreate

*** Keywords ***
#### Ações da página
Informar um e-mail válido
    Wait Until Element Is Visible   ${AUTHENTICATION_FIELD_EMAIL}
    ${EMAIL}                        Generate Random String
    Input Text                      ${AUTHENTICATION_FIELD_EMAIL}    ${EMAIL}@testerobot.com

Clicar em "Create an account"
    Click Button    ${AUTHENTICATION_BTN_CREATE}

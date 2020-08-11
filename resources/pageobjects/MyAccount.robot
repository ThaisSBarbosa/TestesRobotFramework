*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${MYACCOUNT_HEADER}         xpath=//*[@id="center_column"]/p
${MYACCOUNT_MSG}            Welcome to your account. Here you can manage all of your personal information and orders.
${MYACCOUNT_NAMEACCOUNT}    xpath=//*[@id="header"]/div[2]//div[1]/a/span
${MYACCOUNT_NAME}           May Fernandes

*** Keywords ***

#### Conferências
Conferir se o cadastro foi efetuado com sucesso
    Wait Until Element Is Visible    ${MYACCOUNT_HEADER}
    Element Text Should Be           ${MYACCOUNT_HEADER}          ${MYACCOUNT_MSG}
    Element Text Should Be           ${MYACCOUNT_NAMEACCOUNT}     ${MYACCOUNT_NAME}

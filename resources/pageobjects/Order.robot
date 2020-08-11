*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ORDER_TITLE}      Order - My Store
${ORDER_DELETE}     xpath=//*[@class="cart_quantity_delete"]
${ORDER_MESSAGE}    xpath=//*[@id="center_column"]/p[@class='alert alert-warning']

*** Keywords ***
Excluir o produto do carrinho
    Title Should Be    ${ORDER_TITLE}
    Wait Until Element Is Visible    ${ORDER_DELETE}
    Click Element      ${ORDER_DELETE}

Conferir se o carrinho fica vazio
    Wait Until Element Is Visible   ${ORDER_MESSAGE}
    Element Text Should Be          ${ORDER_MESSAGE}    Your shopping cart is empty.

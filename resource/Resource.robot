*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
${BROWSER}   firefox
${URL}   http://automationpractice.com

*** Keywords ***
## Setup e Teardown
Abrir navegador
     Open Browser     about:blank     ${BROWSER}

Fechar navegador
     Close Browser

## Passo-a-Passo
Acessar a página home do site
   Go To   http://automationpractice.com
   Title Should Be   My Store

Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
   Input Text   name=search_query    ${PRODUTO}

Clicar no botão pesquisar
   Click Element    name=submit_search

Conferir se o produto "${PRODUTO}" foi listado no site
   Wait Until Element Is Visible    xpath=//h1[contains(@class,'page-heading')]
   Title Should Be                  Search - My Store
   Page Should Contain Image        xpath=//ul[@class='product_list grid row']//img[contains(@src,'.jpg')]
   Page Should Contain Link         xpath=//div[@id='center_column']//a[@class='product-name'][contains(text(), '${PRODUTO}')]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
   Wait Until Element Is Visible    xpath=//p[contains(@class,'alert-warning')]
   Element Text Should Be           xpath=//p[contains(@class,'alert-warning')]    ${MENSAGEM_ALERTA}

Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
   Wait Until Element Is Visible    xpath = //div[@id='block_top_menu']//a[@title='${CATEGORIA}']
   Mouse Over                       xpath = //div[@id='block_top_menu']//a[@title='${CATEGORIA}']

Conferir se as sub categorias foram exibidas no site
   Wait Until Element Is Visible    xpath=//ul[contains(@class,'menu-content')]//ul[contains(@class,'submenu')]//a[@title='Tops']
   Wait Until Element Is Visible    xpath=//ul[contains(@class,'menu-content')]//ul[contains(@class,'submenu')]//a[@title='Dresses']

Clicar na sub categoria "${SUBCATEGORIA}"
   Wait Until Element Is Visible       xpath=//ul[contains(@class,'menu-content')]//ul[contains(@class,'submenu')]//ul[@style='display: none;']//a[@title='${SUBCATEGORIA}']
   Click Element                       xpath=//ul[contains(@class,'menu-content')]//ul[contains(@class,'submenu')]//ul[@style='display: none;']//a[@title='${SUBCATEGORIA}']

Conferir se a página com os produtos da categoria "${SUBCATEGORIA}" foi exibida
   Wait Until Element Is Visible       xpath=//span[@class='cat-name'][contains(text(),'${SUBCATEGORIA}')]
   Wait Until Element Is Visible       xpath=//ul[contains(@class,'product_list')]//li[contains(@class,'block_product')][1]

Clicar no botão "Add to cart" do produto "${PRODUTO}"
   # Wait Until Element Is Visible       xpath=//li[contains(@class,'block_product')][1]//a[@title='Add to cart']    20
   # Click Element                       xpath=//li[contains(@class,'block_product')][1]//a[@title='Add to cart']
   Wait Until Element Is Visible       xpath=//*[@id='center_column']//img[contains(@alt,'${PRODUTO}')]    20
   Click Element                       xpath=//*[@id='center_column']//img[contains(@alt,'${PRODUTO}')]
   Wait Until Element Is Visible       xpath=//*[@id='add_to_cart']    20
   Click Element                       xpath=//*[@id='add_to_cart']

Conferir se uma tela de confirmação foi exibida
   Wait Until Element Is Visible       xpath=//*[@id="layer_cart"]//h2//i[@class='icon-ok']

Clicar no botão "Proceed to checkout"
   Wait Until Element Is Visible       xpath=//a[@title='Proceed to checkout']
   Click Element                       xpath=//a[@title='Proceed to checkout']

Conferir se a tela do carrinho de compras foi exibida, juntamente com os dados do produto adicionado e os devidos valores
   Wait Until Element Is Visible       xpath=//table[@id='cart_summary']
   Wait Until Element Is Visible       xpath=//td[@class='cart_description']
   Wait Until Element Is Visible       xpath=//td[@data-title='Unit price']

Clicar no ícone carrinho de compras no menu superior direito
   Wait Until Element Is Visible       xpath=//a[@title='View my shopping cart']
   Click Element                       xpath=//a[@title='View my shopping cart']

Conferir se a tela do carrinho de compras foi exibida
   Wait Until Element Is Visible       xpath=//table[@id='cart_summary']

Clicar no botão de remoção de produtos (delete) no produto do carrinho
   Wait Until Element Is Visible       xpath=//i[@class='icon-trash']
   Click Element                       xpath=//i[@class='icon-trash']

Conferir se o sistema exibiu a mensagem "Your shopping cart is empty."
   Wait Until Element Is Visible       xpath=//p[@class='alert alert-warning'][contains(text(),'Your shopping cart is empty.')]

Clicar no botão superior direito “Sign in”
   Wait Until Element Is Visible    xpath=//a[@title='Log in to your customer account'][contains(text(),'Sign in')]
   Click Element                    xpath=//a[@title='Log in to your customer account'][contains(text(),'Sign in')]

Conferir se a página para fazer login foi exibida
   Wait Until Element Is Visible    xpath=//h1[@class='page-heading'][contains(text(),'Authentication')]

Inserir um e-mail válido
   Wait Until Element Is Visible    id=email_create
   ${EMAIL}                         Generate Random String
   Input Text    id=email_create    ${EMAIL}@testrobot.com

Clicar no botão "Create an account"
   Wait Until Element Is Visible    id=SubmitCreate
   Click Button                     id=SubmitCreate

Conferir se a página com os campos de cadastro foi exibida
   Wait Until Element Is Visible    //div[@class='account_creation']//h3[@class='page-subheading'][contains(text(),'Your personal information')]

Preencher os campos obrigatórios
   Click Element                id=id_gender2
   Input Text                   id=customer_firstname    Thais
   Input Text                   id=customer_lastname     Barbosa
   Input Text                   id=passwd                12345
   Input Text                   id=address1              Rua Serra do Mar
   Input Text                   id=city                  São Paulo
   Set Focus To Element         id=id_state
   Run Keyword If               '${BROWSER}'=='firefox'  Wait Until Element Is Visible    id=uniform-id_state    30
   Select From List By Index    id=id_state              9
   Input Text                   id=postcode              04455
   Input Text                   id=phone_mobile          898989898
   Input Text                   id=alias                 adress2

Clicar em "Register" para finalizar o cadastro
   Wait Until Element Is Visible    id=submitAccount
   Click Button                     id=submitAccount

Conferir se a página de gerenciamento da conta foi exibida
   Wait Until Element Is Visible    xpath=//p[@class='info-account']
   Element Text Should Be           xpath=//p[@class='info-account']    Welcome to your account. Here you can manage all of your personal information and orders.
   Element Text Should Be           xpath=//a[@class='account']         Thais Barbosa

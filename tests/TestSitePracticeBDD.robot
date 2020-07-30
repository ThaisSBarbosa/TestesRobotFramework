*** Settings ***
Resource   ../resource/Resource.robot
Test Setup   Abrir navegador
Test Teardown   Fechar navegador

## SETUP ele roda keyword antes da suíte ou antes de um Teste
## TEARDOWN ele roda keyword depois de uma suíte ou um Teste

*** Test Case ***
Cenário 01: Pesquisar produto existente
  Dado que estou na página home do site
  Quando eu pesquisar pelo produto "Blouse"
  Então o produto "Blouse" deve ser listado na página de resultado da busca

Cenário 02: Pesquisar produto não-existente
  Dado que estou na página home do site
  Quando eu pesquisar pelo produto "itemNãoExistente"
  Então a página deve exibir a mensagem "No results were found for your search "itemNãoExistente""

Cenário 03: Listar produtos
  Dado que estou na página home do site
  Quando eu escolher a categoria "Women"
  E escolher a sub categoria "Summer Dresses"
  Então a página deve exibir os produtos da categoria "Summer Dresses"

Cenário 04: Adicionar produtos no carrinho
  Dado que estou na página home do site
  E busque o produto "T-shirt"
  Quando eu adicionar o primeiro produto "T-shirt" da lista ao carrinho
  E escolher a opção "Proceed to checkout"
  Então a tela do carrinho de compras deve ser exibida, juntamente com os dados do produto adicionado e os devidos valores
  [Teardown]

Cenário 05: Remover produtos
  [Setup]
  Dado que estou na página home do site
  E entre na página do carrinho de compras
  Quando eu clicar no botão de remoção de produtos (delete)
  Então o sistema deve exibir a mensagem "Your shopping cart is empty."

Cenário 06: Adicionar Cliente
  Dado que estou na página home do site
  E clique no no botão “Sign in”
  E insira um e-mail válido
  E clicar no botão "Create an account"
  Quando eu preencher os campos obrigatórios
  E clicar em "Register"
  Então a página de gerenciamento da conta deve ser exibida


*** Keywords ***
Dado que estou na página home do site
  Acessar a página home do site

Quando eu pesquisar pelo produto "${PRODUTO}"
  Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
  Clicar no botão pesquisar

Então o produto "${PRODUTO}" deve ser listado na página de resultado da busca
  Conferir se o produto "${PRODUTO}" foi listado no site

Então a página deve exibir a mensagem "${MENSAGEM_ALERTA}"
  Conferir mensagem de erro "${MENSAGEM_ALERTA}"

Quando eu escolher a categoria "${CATEGORIA}"
  Passar o mouse por cima da categoria "${CATEGORIA}" no menu principal superior de categorias
  Conferir se as sub categorias foram exibidas no site

E escolher a sub categoria "${SUBCATEGORIA}"
  Clicar na sub categoria "${SUBCATEGORIA}"

Então a página deve exibir os produtos da categoria "${SUBCATEGORIA}"
  Conferir se a página com os produtos da categoria "${SUBCATEGORIA}" foi exibida

E busque o produto "${PRODUTO}"
  Digitar o nome do produto "${PRODUTO}" no campo de Pesquisar
  Clicar no botão pesquisar
  Conferir se o produto "${PRODUTO}" foi listado no site

Quando eu adicionar o primeiro produto "${PRODUTO}" da lista ao carrinho
  Clicar no botão "Add to cart" do produto "${PRODUTO}"
  Conferir se uma tela de confirmação foi exibida

E escolher a opção "Proceed to checkout"
  Clicar no botão "Proceed to checkout"

Então a tela do carrinho de compras deve ser exibida, juntamente com os dados do produto adicionado e os devidos valores
  Conferir se a tela do carrinho de compras foi exibida, juntamente com os dados do produto adicionado e os devidos valores

E entre na página do carrinho de compras
  Clicar no ícone carrinho de compras no menu superior direito
  Conferir se a tela do carrinho de compras foi exibida

Quando eu clicar no botão de remoção de produtos (delete)
  Clicar no botão de remoção de produtos (delete) no produto do carrinho

Então o sistema deve exibir a mensagem "Your shopping cart is empty."
  Conferir se o sistema exibiu a mensagem "Your shopping cart is empty."

E clique no no botão “Sign in”
  Clicar no botão superior direito “Sign in”
  Conferir se a página para fazer login foi exibida

E insira um e-mail válido
  Inserir um e-mail válido

E clicar no botão "Create an account"
  Clicar no botão "Create an account"
  Wait Until Element Is Visible    //div[@class='account_creation']//h3[@class='page-subheading'][contains(text(),'Your personal information')]

Quando eu preencher os campos obrigatórios
  Preencher os campos obrigatórios

E clicar em "Register"
  Clicar em "Register" para finalizar o cadastro

Então a página de gerenciamento da conta deve ser exibida
  Conferir se a página de gerenciamento da conta foi exibida

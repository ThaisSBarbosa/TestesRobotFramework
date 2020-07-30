*** Settings ***
Resource   ../resource/Resource.robot
Test Setup     Abrir navegador
Test Teardown     Fechar navegador

## SETUP ele roda keyword antes da suíte ou antes de um Teste
## TEARDOWN ele roda keyword depois de uma suíte ou um Teste

*** Test Case ***
Caso de Teste 01: Pesquisar produto existente
  Acessar a página home do site
  Digitar o nome do produto "Blouse" no campo de Pesquisar
  Clicar no botão pesquisar
  Conferir se o produto "Blouse" foi listado no site

Caso de Teste 02: Pesquisar produto não-existente
  Acessar a página home do site
  Digitar o nome do produto "itemNãoExistente" no campo de Pesquisar
  Clicar no botão pesquisar
  Conferir mensagem de erro "No results were found for your search "itemNãoExistente""

Caso de Teste 03: Listar produtos
  Acessar a página home do site
  Passar o mouse por cima da categoria "Women" no menu principal superior de categorias
  Conferir se as sub categorias foram exibidas no site
  Clicar na sub categoria "Summer Dresses"
  Conferir se a página com os produtos da categoria "Summer Dresses" foi exibida

Caso de Teste 04: Adicionar produtos no carrinho
  Acessar a página home do site
  Digitar o nome do produto "T-shirt" no campo de Pesquisar
  Clicar no botão pesquisar
  Conferir se o produto "T-shirt" foi listado no site
  Clicar no botão "Add to cart" do produto "T-shirt"
  Conferir se uma tela de confirmação foi exibida
  Clicar no botão "Proceed to checkout"
  [Teardown]   Conferir se a tela do carrinho de compras foi exibida, juntamente com os dados do produto adicionado e os devidos valores

Caso de Teste 05: Remover produtos
  [Setup]   Acessar a página home do site
  Clicar no ícone carrinho de compras no menu superior direito
  Conferir se a tela do carrinho de compras foi exibida
  Clicar no botão de remoção de produtos (delete) no produto do carrinho
  Conferir se o sistema exibiu a mensagem "Your shopping cart is empty."

Caso de Teste 06: Adicionar Cliente
  Acessar a página home do site
  Clicar no botão superior direito “Sign in”
  Conferir se a página para fazer login foi exibida
  Inserir um e-mail válido
  Clicar no botão "Create an account"
  Conferir se a página com os campos de cadastro foi exibida
  Preencher os campos obrigatórios
  Clicar em "Register" para finalizar o cadastro
  Conferir se a página de gerenciamento da conta foi exibida

*** Keywords ***

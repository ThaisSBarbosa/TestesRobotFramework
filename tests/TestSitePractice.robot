*** Settings ***
Resource            ../resources/Resource.robot
Test Setup          Abrir navegador
Test Teardown       Fechar navegador

Resource            ../resources/pageobjects/Home.robot
Resource            ../resources/pageobjects/Order.robot
Resource            ../resources/pageobjects/Authentication.robot
Resource            ../resources/pageobjects/MyAccount.robot
Resource            ../resources/pageobjects/CreateAnAccount.robot

*** Test Case ***
Caso de Teste com PO 01: Remover Produtos do Carrinho
    Home.Acessar a página home do site
    Home.Adicionar o produto "T-shirt" no carrinho
    Order.Excluir o produto do carrinho
    Order.Conferir se o carrinho fica vazio

### EXERCÍCIO
Caso de Teste com PO 02: Adicionar Cliente
    Home.Acessar a página home do site
    Home.Clicar em "Sign in"
    Authentication.Informar um e-mail válido
    Authentication.Clicar em "Create an account"
    CreateAnAccount.Preencher os dados obrigatórios (Browser: "chrome")
    CreateAnAccount.Submeter cadastro
    MyAccount.Conferir se o cadastro foi efetuado com sucesso

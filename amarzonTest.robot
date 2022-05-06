*** Settings ***
Documentation    Essa suite testa o site da amarzon
Resource         amarzon_resources.robot
Test Setup       Abrir navegador     
Test Teardown    Fechar navegador 

#suite setup e o outro para executar qualquer coisa antes de tudo 


*** Test Cases ***

Caso de testes numero 1 - Acesso ao menu "Eletrônicos"
    [Documentation]     Verifica eletronicos no site da amarzon

    [Tags]              menus_
    Acessar a home page do site Amazon.com.br
    Verificar se o título da página fica "Amazon.com.br | Tudo pra você, de A a Z."
    Entrar no menu "Eletrônicos"
    Verificar se aparece a frase "Eletrônicos e Tecnologia"
    Verificar se o título da página fica "Eletrônicos e Tecnologia | Amazon.com.br"
    #Verificar se aparece a categoria "Computadores e Informática"

 Caso de testes numero 2 - Pesquisa de um Produto
     [Documentation]     Verifica a busca de um produto
     [Tags]              busca_
    

     Dado que estou na home page da Amazon.com.br
     Quando pesquisar pelo produto "Xbox Series S"
    Então o título da página deve ficar "Amazon.com.br : Xbox Series S"
     E um produto da linha "Xbox Series S" deve ser mostrado na página




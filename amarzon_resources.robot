*** Settings ***
Library    SeleniumLibrary

***Variables***
${BROWSER}   chrome
${URL}  https://www.amazon.com.br/
${MENU_ELETRONICOS}   //*[@id="nav-xshop"]/a[9]
${HEADER_ELETRONICOS}  //*[@id="contentGrid_990398"]/div/div[1]/div/div/div/h1
${PRODUTOPESQUISA}  //*[@id="twotabsearchtextbox"]
${ESCREVERPRODUTO}  
${CLICAR_BOTAO_PESQUISA}  //*[@id="nav-search-submit-button"]  
${RESULTADOpESQUISA}  RESULTADOS


*** Keywords ***

Abrir navegador
    Open Browser     browser=chrome
    Maximize Browser Window

Fechar navegador
    Capture Page Screenshot    locator
    Close Browser    

Acessar a home page do site Amazon.com.br
    Go To    url=${URL} 
    Wait Until Element Is Visible    ${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element     ${MENU_ELETRONICOS} 
Verificar se aparece a frase "${TEXTO_HEADER_ELETRONICOS}"
     Wait Until Page Contains   text=${TEXTO_HEADER_ELETRONICOS} 
     #Wait Until Element Is Visible    locator
Verificar se o título da página fica "${TITULO}"
    Title Should Be   ${TITULO}


#Verificar se aparece a categoria "${CATEGORIA}"
     #Element Should Be Visible   //*[@id="contentGrid_448328"]/div/div[2]/div[1]/div/div/a/img
    
Digitar o nome de produto "${ESCREVERPRODUTO}" no campo de pesquisa
     Input Text    ${PRODUTOPESQUISA}  ${ESCREVERPRODUTO}

Clicar no botão de pesquisa 
    Click Button   ${CLICAR_BOTAO_PESQUISA}  


Verificar o resultado da pequisa
    Page Should Contain  ${RESULTADOpESQUISA}
    Wait Until Element Is Visible    //*[@id="search"]/div[1]/div[1]/div/span[3]/div[2]/div[6]/div/div/div/div/div[2]/div[1]/h2/a/span

# BDD

Dado que estou na home page da Amazon.com.br
    Acessar a home page do site Amazon.com.br
 Quando acessar o menu "Eletrônicos"
    Entrar no menu "Eletrônicos"

#Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
    
E o texto "${TEXTO_HEADER_ELETRONICOS}" deve ser exibido na página
    Verificar se aparece a frase "${TEXTO_HEADER_ELETRONICOS}"
 #E a categoria "Computadores e Informática" deve ser exibida na página

 #test 2

 

 Quando pesquisar pelo produto "Xbox Series S"
 

Então o título da página deve ficar "Amazon.com.br : Xbox Series S"

 E um produto da linha "Xbox Series S" deve ser mostrado na página
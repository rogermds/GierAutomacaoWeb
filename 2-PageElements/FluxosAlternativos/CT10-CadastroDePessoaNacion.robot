*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***

*** Keywords ***
Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: NACIONALIDADE 
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Os campos a seguir são de preenchimento obrigatório:Dados Pessoais: Nacionalidade')]

Clicar em "Ok" na mensagem
    Execute JavaScript  document.getElementById("cphContent_Mensagem_Padrao_btnOk").click();
    Sleep    8

Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: UF NASCIMENTO, CIDADE DE NASCIMENTO
    Wait Until Page Contains Element    //div[@class='lista_erros'][contains(.,'Dados Pessoais: UF Nascimento, Cidade de Nascimento')]
    Sleep    8

Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: CIDADE DE NASCIMENTO
    Wait Until Page Contains Element    //div[@class='lista_erros'][contains(.,'Dados Pessoais: Cidade de Nascimento')]    10


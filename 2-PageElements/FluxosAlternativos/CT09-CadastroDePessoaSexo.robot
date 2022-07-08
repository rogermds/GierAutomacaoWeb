*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***

*** Keywords ***
Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: SEXO 
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Os campos a seguir são de preenchimento obrigatório:Dados Pessoais: Sexo')]
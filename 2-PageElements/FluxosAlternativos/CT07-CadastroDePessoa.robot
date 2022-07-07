*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***

*** Keywords ***
Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: DATA DE NASCIMENTO    
    Wait Until Page Contains Element    //div[@class='msg left'][contains(.,'Os campos a seguir são de preenchimento obrigatório:Dados Pessoais: Data de Nascimento')]
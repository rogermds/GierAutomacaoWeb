*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***

*** Keywords ***
Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: ENDEREÇOS: AO MENOS UM ENDEREÇO RESIDENCIAL    
    Wait Until Page Contains Element    //div[@class='msg left'][contains(.,'Os campos a seguir são de preenchimento obrigatório:Endereços: Ao menos um endereço residencial')]
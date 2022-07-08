*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***

*** Keywords ***
Visualizar a mensagem: CEP NÃO ENCONTRADO
    Wait Until Page Contains Element    locator=cphContent_ucEnderecos_Mensagem_Padrao_painelMsg      
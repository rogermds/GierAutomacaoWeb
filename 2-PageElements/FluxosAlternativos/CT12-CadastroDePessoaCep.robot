*** Settings ***
Library    SeleniumLibrary


*** Variables ***

*** Keywords ***
Visualizar a mensagem: CEP NÃO ENCONTRADO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'CEP não Encontrado')] 
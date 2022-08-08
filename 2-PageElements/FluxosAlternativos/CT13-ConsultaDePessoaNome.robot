*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***
Visualizar a mensagem: OBRIGATÓRIO PREENCHER NOME E SOBRENOME OU NOME E DATA DE NASCIMENTO. 
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Obrigatório preencher NOME e SOBRENOME ou NOME e DATA DE NASCIMENTO.')]
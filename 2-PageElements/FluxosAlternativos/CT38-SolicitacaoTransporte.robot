*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
Visualizar a mensagem: CAMPO OBRIGATÓRIO. ETAPA/MODALIDADE
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Campo obrigatório. Etapa/Modalidade')]
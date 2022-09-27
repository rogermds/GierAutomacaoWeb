*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot        
Library    SeleniumLibrary

*** Keywords ***
Visualizar a mensagem: SELECIONE UMA TURMA PARA REALIZAR A PESQUISA.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Selecione uma Turma para realizar a pesquisa.')]
*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***

*** Keywords ***
Visualizar o Titulo Consultar Grupos de Pergunta  
    Wait Until Page Contains    Consultar Grupos de Pergunta
    Set Suite Variable    ${botaoCadastrar}        cphContent_btnCadastrar
    Aguardar tela de carregamento

Visualizar a mensagem de alerta: INFORME A DESCRIÇÃO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Descrição.')]

Visualizar a mensagem: INFORME A SIGLA.  
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Sigla.')]
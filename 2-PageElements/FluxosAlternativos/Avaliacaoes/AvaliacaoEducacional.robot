*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***
${botaoProvaEducacional}            cphContent_rptAvaliacoes_divPeriodo_3
${botaoAvancarAvaliacao}            (//input[@value='Avançar'])[1]

*** Keywords ***
Clicar na Prova Prova Automação Qa
    Execute JavaScript  document.getElementById("${botaoProvaEducacional}").click();

Clicar no Botão Avançar 
    Execute JavaScript  xPathResult = document.evaluate("${botaoAvancarAvaliacao}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()  
    Sleep    3

Visualizar a Questão 1 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 1 de 18')]

Visualizar a Questão 2 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 2 de 18')]

Visualizar a Questão 3 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 3 de 18')]

Visualizar a Questão 4 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 4 de 18')]

Visualizar a Questão 5 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 5 de 18')]

Visualizar a Questão 6 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 6 de 18')]

Visualizar a Questão 7 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 7 de 18')]

Visualizar a Questão 8 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 8 de 18')]

Visualizar a Questão 9 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 9 de 18')]

Visualizar a Questão 10 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 10 de 18')]

Visualizar a Questão 11 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 11 de 18')]

Visualizar a Questão 12 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 12 de 18')]

Visualizar a Questão 13 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 13 de 18')]

Visualizar a Questão 14 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 14 de 18')]

Visualizar a Questão 15 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 15 de 18')]

Visualizar a Questão 16 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 16 de 18')]

Visualizar a Questão 17 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 17 de 18')]

Visualizar a Questão 18 de 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-cabecalho'][contains(.,'Questão 18 de 18')]

Visualizar o texto: Perguntas não respondidas: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
    Wait Until Page Contains Element    //span[contains(.,'1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18')]


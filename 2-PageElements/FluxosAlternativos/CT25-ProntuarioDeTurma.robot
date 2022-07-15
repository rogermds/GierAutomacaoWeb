*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary
Library     FakerLibrary

*** Keywords ***
Visualizar a mensagem: INFORME A UNIDADE ESCOLAR.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Informe a Unidade Escolar.')]
    Sleep    5

Visualizar a mensagem: SELECIONE O MÊS DA REUNIÃO.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Selecione o mês da reunião.')]
    Sleep    5

Em Mês de Reunião, selecionar "${Mes}"
    Run Keyword If    '${Mes}' == 'Janeiro'    Execute JavaScript  document.getElementById("cphContent_btnJaneiro").click();
    Run Keyword If    '${Mes}' == 'Fevereiro'  Execute JavaScript   document.getElementById("cphContent_btnFevereiro").click();
    Run Keyword If    '${Mes}' == 'Março'      Execute JavaScript   document.getElementById("cphContent_btnMarco").click();
    Run Keyword If    '${Mes}' == 'Abril'      Execute JavaScript   document.getElementById("cphContent_btnAbril").click();
    Run Keyword If    '${Mes}' == 'Maio'       Execute JavaScript   document.getElementById("cphContent_btnMaio").click();
    Run Keyword If    '${Mes}' == 'Junho'      Execute JavaScript   document.getElementById("cphContent_btnJunho").click();
    Run Keyword If    '${Mes}' == 'Julho'      Execute JavaScript   document.getElementById("cphContent_btnJulho").click();
    Run Keyword If    '${Mes}' == 'Agosto'     Execute JavaScript   document.getElementById("cphContent_btnAgosto").click();
    Run Keyword If    '${Mes}' == 'Setembro'   Execute JavaScript   document.getElementById("cphContent_btnSetembro").click();
    Run Keyword If    '${Mes}' == 'Outubro'    Execute JavaScript   document.getElementById("cphContent_btnOutubro").click();
    Run Keyword If    '${Mes}' == 'Novembro'   Execute JavaScript   document.getElementById("cphContent_btnNovembro").click();
    Run Keyword If    '${Mes}' == 'Dezembro'   Execute JavaScript   document.getElementById("cphContent_btnDezembro").click();
    Sleep    3

Visualizar a mensagem: PREENCHA A DATA DA REUNIÃO.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Preencha a data da reunião.')]
    Sleep    5
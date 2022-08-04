*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***
${campoAnoLetivo}        cphContent_ddlAnoLetivo


*** Keywords ***
Em Ano Letivo, clicar em "${anoLetivo}" 
    Run Keyword If    '${anoLetivo}' == 'SELECIONE'  Execute JavaScript   $('#${campoAnoLetivo}').val("0").trigger('chosen:updated');
    Run Keyword If    '${anoLetivo}' == '2017'  Execute JavaScript   $('#${campoAnoLetivo}').val("2017").trigger('chosen:updated');
    Run Keyword If    '${anoLetivo}' == '2018'  Execute JavaScript   $('#${campoAnoLetivo}').val("2018").trigger('chosen:updated');
    Run Keyword If    '${anoLetivo}' == '2019'  Execute JavaScript   $('#${campoAnoLetivo}').val("2019").trigger('chosen:updated');
    Run Keyword If    '${anoLetivo}' == '2020'  Execute JavaScript   $('#${campoAnoLetivo}').val("2020").trigger('chosen:updated');
    Run Keyword If    '${anoLetivo}' == '2021'  Execute JavaScript   $('#${campoAnoLetivo}').val("2021").trigger('chosen:updated');
    Run Keyword If    '${anoLetivo}' == '2022'  Execute JavaScript   $('#${campoAnoLetivo}').val("2022").trigger('chosen:updated');
    Run Keyword If    '${anoLetivo}' == '2023'  Execute JavaScript   $('#${campoAnoLetivo}').val("2023").trigger('chosen:updated');
    Run Keyword If    '${anoLetivo}' == '2024'  Execute JavaScript   $('#${campoAnoLetivo}').val("2024").trigger('chosen:updated');
    Execute JavaScript   $('#${campoAnoLetivo}').trigger('change');
    Sleep    2

Clicar em 'Pesquisar'
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click();

Visualizar a mensagem: CAMPOS OBRIGATÓRIOS NÃO PREENCHIDO
    Wait Until Page Contains Element    //span[contains(.,'Campos obrigatórios não preenchidos')]
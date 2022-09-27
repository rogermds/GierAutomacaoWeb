*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***


*** Keywords ***
Em Programação de Processo, visualizar o modal de alerta contendo "${mensagemAlerta}"
    Wait Until Element Is Visible    cphContent_Mensagem_Padrao_btnOk
    Wait Until Element Contains    cphContent_Mensagem_Padrao_lblMsg    ${mensagemAlerta} 

Em Programação de Processo, em Processo, selecionar o processo "${processo}"
    Set Suite Variable    ${processo}
    Wait Until Page Contains    Processo
    Execute JavaScript   $("#cphContent_ddlProcesso").val($('option:contains("${processo}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlProcesso').trigger('change');
    Aguardar tela de carregamento

Em Programação de Processo, clicar em Pesquisar
    Wait Until Element Is Visible    cphContent_btnPesquisa
    Execute JavaScript   document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Programação de Processo, verificar se o processo aparece nos resultados
    Wait Until Page Contains    ${processo}

Em Programação de Processo, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento
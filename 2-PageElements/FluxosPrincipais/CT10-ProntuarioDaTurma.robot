*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../1-Hooks/1-Principal.robot

*** Variables ***


*** Keywords ***
Em Prontuário da Turma, em Ano Letivo, selecionar "${ano}"
    Wait Until Element Is Visible    cphContent_btnJaneiro
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').val("${ano}").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento

Em Prontuário da Turma, em Turma, selecionar "${turma}"
    Run Keyword If    '${turma}' == 'EII A'     Execute JavaScript   $('#cphContent_ddlTurma').val("110667").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '5A'        Execute JavaScript   $('#cphContent_ddlTurma').val("112170").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'CII A (1º Semestre)'        Execute JavaScript   $('#cphContent_ddlTurma').val("113557").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTurma').trigger('change');
    Aguardar tela de carregamento

Em Prontuário da Turma, em Mês de Reunião, selecionar "Março"
    Execute JavaScript  document.getElementById("cphContent_btnMarco").click();
    Aguardar tela de carregamento

Em Prontuário da Turma, em Data da Reunião, inserir o dia atual
    ${dataHoje}    Get Current Date    result_format=%d/%m/%Y
    Input Text    cphContent_txtDataReuniao    ${dataHoje}

Em Prontuário da Turma, clicar em OK no Modal
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Prontuário da Turma, clicar em Finalizar Ata do Conselho
    Wait Until Element Is Visible    cphContent_btnFinalizar
    Execute JavaScript  document.getElementById("cphContent_btnFinalizar").click();
    Aguardar tela de carregamento

Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se o botão foi desativado
    Element Attribute Value Should Be    cphContent_btnFinalizar    disabled    true
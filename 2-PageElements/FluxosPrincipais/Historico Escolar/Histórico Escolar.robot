*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${campoEducandoHistorico}          cphContent_txtNomeAluno
${campoHistoricoEscolar}           cphContent_dtlConsuAlunoMatriculado_lnkVisualizar_0
${campoSalvarHistorico}            cphContent_btnSalvar
${campoFecharHistorico}            cphContent_btnFecharHistorico

*** Keywords ***
Em Histórico Escolar, pesquisar "${nomeEducando}"
    Clear Element Text    ${campoEducandoHistorico}
    Input Text    ${campoEducandoHistorico}    ${nomeEducando}

Em Histórico Escolar, selecionar a Etapa/Modalidade "${etapaModalidade}"   
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript  $('#cphContent_ddlTipoEnsino').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript  $('#cphContent_ddlTipoEnsino').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoEnsino').trigger('change');
    Aguardar tela de carregamento
    Sleep    3

Em Histórico Escolar, clicar em HISTORICO ESCOLAR
    Execute JavaScript  document.getElementById("${campoHistoricoEscolar}").click();
    Aguardar tela de carregamento

Em Histórico Escolar, clicar em Salvar Historico
    Wait Until Page Contains Element    ${campoSalvarHistorico}
    Execute JavaScript  document.getElementById("${campoSalvarHistorico}").click();
    Aguardar tela de carregamento

Em Histórico Escolar, clicar em OK no Modal
    Wait Until Page Contains Element    cphContent_MensagemPadrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Histórico Escolar, clicar em Fechar Historico
    Wait Until Page Contains Element    ${campoFecharHistorico}    60
    Execute JavaScript  document.getElementById("${campoFecharHistorico}").click();
    Aguardar tela de carregamento

Em Histórico Escolar, clicar em Sim no Modal
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Histórico Escolar, clicar em Emitir Historico
    Wait Until Element Is Visible    cphContent_btnImprimirRelatorio
    Execute JavaScript  document.getElementById("cphContent_btnImprimirRelatorio").click();
    Sleep    2
    Aguardar tela de carregamento
    Sleep    2

Em Histórico Escolar, verificar se o Historico foi emitido corretamente
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Wait Until Page Does Not Contain    OCORREU UM ERRO INESPERADO
    Sleep    2

Em Histórico Escolar, fechar o Historico Escolar
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Close window
    Switch Window   ${windowHandles}[0]    

Em Histórico Escolar, clicar em Abrir Historico
    Execute JavaScript  document.getElementById("cphContent_btnAbrirHistorico").click();
    Aguardar tela de carregamento

Em Histórico Escolar, verificar se o botão Salvar Historico foi habilitado
    Wait Until Page Contains Element    cphContent_btnSalvar
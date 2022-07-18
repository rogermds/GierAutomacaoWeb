*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${botaoCadastrarJustificativas}        btnCadastraJustificativa
${botaoOkCampObrigatorio}              alertBox_btnOk
${campoTiposJustificativas}            ddlTiposJustificativas
${botaoSalvarJustificativa}            btnSalvar


*** Keywords ***
    
Clicar em Cadastrar justificativas
    Execute JavaScript  document.getElementById("${botaoCadastrarJustificativas}").click();
    Sleep    3

Clicar em Salvar a justificativa
    Execute JavaScript  document.getElementById("${botaoSalvarJustificativa}").click();
    Sleep    3    

Visualizar a mensagem: O CAMPO TIPO DE SITUAÇÃO É OBRIGATÓRIO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'O campo Tipo de Situação é obrigatório.')]

Clicar em Ok no modal de alerta de campo obrigatório
    Execute JavaScript  document.getElementById("${botaoOkCampObrigatorio}").click();
    
Em Tipo de Situação, selecionar "${tipoSituacao}"
    Run Keyword If    '${tipoSituacao}' == 'SELECIONE'  Execute JavaScript   $('#${campoTiposJustificativas}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'CANCELAMENTO'  Execute JavaScript   $('#${campoTiposJustificativas}').val("1").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'DETERMINAÇÃO LEGAL'  Execute JavaScript   $('#${campoTiposJustificativas}').val("2").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'DESFAZER AÇÃO'  Execute JavaScript   $('#${campoTiposJustificativas}').val("3").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'INDEFERIMENTO'  Execute JavaScript   $('#${campoTiposJustificativas}').val("4").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'PAUSADO'  Execute JavaScript   $('#${campoTiposJustificativas}').val("5").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'VAGA OFERTADA'  Execute JavaScript   $('#${campoTiposJustificativas}').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTiposJustificativas}').trigger('change');
    Sleep   3

Visualizar a mensagem: O CAMPO JUSTIFICATIVA É OBRIGATÓRIO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'O campo Justificativa é obrigatório.')]
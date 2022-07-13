*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${campoEtapaModalidadeCalendario}         cphContent_ddlModalidadeEnsino
${campoCalendarioCalendario}              cphContent_ddlCalendario
${botaoEditarCalendario}                  cphContent_btnEditar
${botaoSalvarCalendario}                  cphContent_btnSalvar
${botaoFinalizarCalendario}               cphContent_btnFinalizar
${modalSucessoCalendario}                 cphContent_Mensagem_Padrao_btnOk

*** Keywords ***
No Calendário, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeCalendario}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeCalendario}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO ESPECIAL EXCLUSIVA'  Execute JavaScript   $('#${campoEtapaModalidadeCalendario}').val("12").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeCalendario}').trigger('change');
    Sleep   5

Em Calendário, selecionar CALENDÁRIO ESCOLAR SME 2022
    Execute JavaScript   $('#${campoCalendarioCalendario}').val("1336").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCalendarioCalendario}').trigger('change');
    Set Suite Variable    ${botaoPesquisar}               cphContent_btnPesquisa
    Sleep   5

Clicar em OK no modal Sucesso
    Wait Until Element Is Visible    ${modalSucessoCalendario}
    Execute JavaScript  document.getElementById("${modalSucessoCalendario}").click();
    Sleep   5

Em Calendário, selecionar novamente CALENDÁRIO ESCOLAR SME 2022
    Execute JavaScript   $('#${campoCalendarioCalendario}').val("1376").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCalendarioCalendario}').trigger('change');
    Set Suite Variable    ${botaoPesquisar}               cphContent_btnPesquisa
    Sleep   5
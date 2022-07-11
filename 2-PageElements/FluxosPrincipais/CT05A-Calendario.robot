*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${campoEtapaModalidadeCalendario}     cphContent_ddlModalidadeEnsino
${campoCalendarioCalendario}          cphContent_ddlCalendario
${botaoPesquisarCalendario}           cphContent_btnPesquisa
${botaoEditarCalendario}              cphContent_btnEditar
${botaoSalvarCalendario}              cphContent_btnSalvar
${botaoFinalizarCalendario}           cphContent_btnFinalizar

*** Keywords ***
No calendário, em Etapa/Modalidade, selecionar "${etapaModalide}"
    Run Keyword If    '${etapaModalide}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeCalendario}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalide}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeCalendario}').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeCalendario}').trigger('change');
    Sleep   5

Em Calendário, selecionar CALENDÁRIO ESCOLAR SME 2022
    Execute JavaScript   $('#${campoCalendarioCalendario}').val("1329").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCalendarioCalendario}').trigger('change');
    Sleep   5

Clicar em Pesquisar
    Execute JavaScript  document.getElementById("${botaoPesquisarCalendario}").click();
    Sleep   5

Clicar em Editar
    Execute JavaScript  document.getElementById("${botaoEditarCalendario}").click();
    Sleep   5

Clicar em Salvar
    Execute JavaScript  document.getElementById("${botaoSalvarCalendario}").click();
    Sleep   5

Clicar em Finalizar
    Execute JavaScript  document.getElementById("${botaoFinalizarCalendario}").click();
    Sleep   5

Clicar em OK no modal Sucesso
    Execute JavaScript  document.getElementById("${cphContent_Mensagem_Padrao_btnOk}").click();
    Sleep   5

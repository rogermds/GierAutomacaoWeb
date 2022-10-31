*** Settings ***
Library    SeleniumLibrary
Resource    ../../../1-Hooks/1-Principal.robot    

*** Variables ***

*** Keywords ***
Em Agendamento Avaliação, clicar em Cadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

Em Agendamento Avaliação, em Avaliação, selecionar "${avaliacaoAgendamento}"
    Execute JavaScript   $("#cphContent_ddlAvaliacao").val($('option:contains("${avaliacaoAgendamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAvaliacao').trigger('change');
    Aguardar tela de carregamento

Em Agendamento Avaliação, em Identificação do Período, inserir "${identificacaoPeriodoAgendamento}"
    Clear Element Text    cphContent_txtNomePublico
    Input Text    cphContent_txtNomePublico    ${identificacaoPeriodoAgendamento}

Em Agendamento Avaliação, em Data Início da Avaliação, inserir "${dataInicioAgendamento}"
    Input Text    cphContent_txtDataInicio    ${dataInicioAgendamento}
    
Em Agendamento Avaliação, em Data Fim da Avaliação, inserir "${dataFimAgendamento}"
    Input Text    cphContent_txtDataFim    ${dataFimAgendamento}

Em Agendamento Avaliação, clicar em Aplicar
    Execute JavaScript  document.getElementById("cphContent_btnAplicar").click();
    Aguardar tela de carregamento

Em Agendamento Avaliação, clicar em Salvar
    Wait Until Element Is Visible    cphContent_btnSalvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Agendamento Avaliação, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Agendamento Avaliação, em Avaliação, inserir "${avaliacaoConsultaAgendamento}"
    Input Text    cphContent_txtAvaliacao    ${avaliacaoConsultaAgendamento}

Em Agendamento Avaliação, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento
    
Em Agendamento Avaliação, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Agendamento Avaliação, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Agendamento Avaliação, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento
    
Em Agendamento Avaliação, verificar se o Agendamento "${agendamentoAgendamento}" foi cadastrado
    Wait Until Page Contains    ${agendamentoAgendamento}
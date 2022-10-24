*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Em Viagens, clicar em Cadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

Em Viagens, em Nome, inserir "${nomeViagem}"
    Set Suite Variable    ${nomeViagem}
    Clear Element Text    cphContent_txtNome
    Input Text    cphContent_txtNome    ${nomeViagem}

Em Cadastrar Viagens, em Rota, selecionar "${rotaViagem}"
    Execute JavaScript   $("#cphContent_ddlRota").val($('option:contains("${rotaViagem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlRota').trigger('change');
    Aguardar tela de carregamento

Em Cadastrar Viagens, em Vigência Inicial, inserir "${dataVigenciaInicial}"
    Input Text    cphContent_txtVigenciaInicial    ${dataVigenciaInicial}

Em Cadastrar Viagens, em Vigência Final, inserir "${dataVigenciaFinal}"
    Input Text    cphContent_txtVigenciaFinal    ${dataVigenciaFinal}

Em Cadastrar Viagens, em Frota, selecionar "${frotaViagem}"
    Execute JavaScript   $("#cphContent_ddlFrota").val($('option:contains("${frotaViagem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlFrota').trigger('change');
    Aguardar tela de carregamento

Em Cadastrar Viagens, em Veículo, selecionar "${frotaViagem}"
    Execute JavaScript   $("#cphContent_ddlVeiculo").val($('option:contains("${frotaViagem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlVeiculo').trigger('change');
    Aguardar tela de carregamento

Em Cadastrar Viagens, em Período, selecionar "${periodoViagem}"
    Execute JavaScript   $("#cphContent_ddlPeriodo").val($('option:contains("${periodoViagem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPeriodo').trigger('change');
    Aguardar tela de carregamento

Em Cadastrar Viagens, em Horário Inicial De, inserir "${horarioInicialDeViagem}"
    Input Text    cphContent_txtHoraInicialDe    ${horarioInicialDeViagem}
    
Em Cadastrar Viagens, em Horário Inicial Até, inserir "${horarioInicialAteViagem}"
    Input Text    cphContent_txtHoraInicialAte    ${horarioInicialAteViagem}

Em Cadastrar Viagens, em Horário Final De, inserir "${horarioFindalDeViagem}"
    Input Text    cphContent_txtHoraFinalDe    ${horarioFindalDeViagem}
    
Em Cadastrar Viagens, em Horário Final Até, inserir "${horarioFinalAteViagem}"
    Input Text    cphContent_txtHoraFinalAte    ${horarioFinalAteViagem}

Em Cadastrar Viagens, em Dia da Semana, clicar em "TODOS"
    Execute JavaScript  document.getElementById("checkTodos").click();
    Aguardar tela de carregamento

Em Cadastrar Viagens, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Cadastrar Viagens, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Cadastrar Viagens, verificar se a viagem foi cadastrada
    Wait Until Page Contains    ${nomeViagem}

Em Cadastrar Viagens, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Cadastrar Viagens, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Cadastrar Viagens, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Cadastrar Viagens, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento
    
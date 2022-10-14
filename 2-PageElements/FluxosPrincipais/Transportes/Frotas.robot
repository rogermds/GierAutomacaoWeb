*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Em Frotas, clicar em Cadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

Em Frotas, em Descrição, inserir "${descricaoFrota}"
    Wait Until Page Contains    Gestão de Transporte
    Set Suite Variable    ${descricaoFrota}
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao    ${descricaoFrota}

Em Frotas, em Sigla, inserir "${siglaFrota}"
    Input Text    cphContent_txtSigla    ${siglaFrota}

Em Frotas, em Tipo, selecionar "${tipoFrota}"
    Execute JavaScript   $("#cphContent_ddlTipo").val($('option:contains("${tipoFrota}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipo').trigger('change');
    Aguardar tela de carregamento

Em Frotas, em Forma de Gerenciamento, selecionar "${formaDeGerenciamentoFrota}"
    Execute JavaScript   $("#cphContent_ddlFormaGerenciamento").val($('option:contains("${formaDeGerenciamentoFrota}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlFormaGerenciamento').trigger('change');
    Aguardar tela de carregamento
    
Em Frotas, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Frotas, clicar em OK
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Frotas, em Descrição, inserir a frota cadastrada
    Wait Until Page Contains    Gestão de Transporte
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao    ${descricaoFrota}

Em Frotas, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Frotas, verificar se a frota foi cadastrada
    Wait Until Element Contains    cphContent_dtlConsulta_lblDescricao_0    ${descricaoFrota}

Em Frotas, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Frotas, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Frotas, clicar em Sim
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento
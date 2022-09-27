*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../1-Hooks/1-Principal.robot

*** Variables ***


*** Keywords ***
Em Tipos de Rotas, clicar em Cadastrar
    Wait Until Element Is Visible    cphContent_btnCad
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

Em Tipos de Rotas, em Descrição, inserir "${tipoDeRota}"
    Wait Until Page Contains    Gestão de Transporte
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao    ${tipoDeRota} 

Em Tipos de Rotas, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento
    
Em Tipos de Rotas, clicar em OK no modal
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click(); 
    Aguardar tela de carregamento

Em Tipos de Rotas, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Tipos de Rotas, nos resultado, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Tipos de Rotas, nos resultado, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Tipos de Rotas, clicar em Sim no modal
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Tipos de Rotas, verificar se aparece o resultado "${tipoDeRota}"
    Wait Until Page Contains    ${tipoDeRota}
    
Em Rotas, clicar em Cadastrar
    Wait Until Element Is Visible    cphContent_btnCad
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

Em Cadastrar Rota, selecionar o Tipo de Rota "${tipoDeRota}"
    Wait Until Element Is Visible    cphContent_btnVincular
    Execute JavaScript   $("#cphContent_ddlTipoRota").val($('option:contains("${tipoDeRota}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoRota').trigger('change');
    Aguardar tela de carregamento

Em Cadastrar Rota, em Nome, inserir "${nomeRota}"
    Set Suite Variable    ${nomeRota}
    Clear Element Text    cphContent_txtNome
    Input Text    cphContent_txtNome    ${nomeRota}

Em Cadastrar Rota, em Ponto Inicial, inserir "${pontoInicial}"
    Clear Element Text    cphContent_txtPontoInicial
    Input Text    cphContent_txtPontoInicial    ${pontoInicial}

Em Cadastrar Rota, em Ponto Final, inserir "${pontoFinal}"
    Clear Element Text    cphContent_txtPontoFinal
    Input Text    cphContent_txtPontoFinal    ${pontoFinal}

Em Cadastrar Rota, em Km, inserir "${km}"
    Clear Element Text    cphContent_txtKm
    Input Text    cphContent_txtKm    ${km}
    
Em Cadastrar Rota, em Vincular Escolar a Rota, em Nome de Escola, inserir "${nomeEscola}"
    Clear Element Text    cphContent_Busca_Escola_txtNomeEscola
    Input Text    cphContent_Busca_Escola_txtNomeEscola    ${nomeEscola}
    
Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_Busca_Escola_btnPesquisa").click();
    Aguardar tela de carregamento

Em Cadastrar Rota, em Vincular Escolar a Rota, selecionar a escola pesquisada
    Wait Until Element Is Visible    cphContent_Busca_Escola_dtlConsulta_lbtSelecionar_0
    Execute JavaScript  document.getElementById("cphContent_Busca_Escola_dtlConsulta_lbtSelecionar_0").click();
    Aguardar tela de carregamento

Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Inserir
    Wait Until Element Is Visible    cphContent_Busca_Escola_btnInserir
    Execute JavaScript  document.getElementById("cphContent_Busca_Escola_btnInserir").click();
    Aguardar tela de carregamento
    
Em Cadastrar Rota, clicar em Salvar
    Wait Until Element Is Visible    cphContent_btnSalvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento
    
Em Cadastrar Rota, clicar em OK no Modal
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento
    
Em Rotas, em Descrição, inserir "${descricaoRota}"
    Wait Until Page Contains    Gestão de Transporte
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao    ${descricaoRota}

Em Rotas, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Rotas, verificar se a rota foi cadastrada
    Wait Until Page Contains    ${nomeRota}
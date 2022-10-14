*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***


*** Keywords ***
Em Tipos de Frotas, clicar em Cadastrar
    Wait Until Element Is Visible    cphContent_btnCadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCadastrar").click();
    Aguardar tela de carregamento

Em Tipos de Frotas, em Descrição, inserir "${descricaoTipoFrota}"
    Set Suite Variable    ${descricaoTipoFrota}
    Wait Until Page Contains    Gestão de Transporte
    Input Text    cphContent_txtDescricao    ${descricaoTipoFrota}
    
Em Tipos de Frotas, em Sigla, inserir "${siglaTipoFrota}"
    Set Suite Variable    ${siglaTipoFrota}
    Input Text    cphContent_txtSigla    ${siglaTipoFrota}
    
Em Tipos de Frotas, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Tipos de Frotas, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento
    
Em Tipos de Frotas, em Descrição, inserir o nome da frota cadastrado
    Wait Until Page Contains    Consultar Tipos de Frotas
    Input Text    cphContent_txtDescricao    ${descricaoTipoFrota}
    
Em Tipos de Frotas, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Tipos de Frotas, verificar se o tipo de rota foi cadastrado
    Wait Until Element Contains    cphContent_dtlConsulta_lblDescricao_0    ${descricaoTipoFrota}

Em Tipos de Frotas, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Tipos de Frotas, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Tipos de Frotas, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_Mensagem_Padrao_btnSim").click();
    Aguardar tela de carregamento
    
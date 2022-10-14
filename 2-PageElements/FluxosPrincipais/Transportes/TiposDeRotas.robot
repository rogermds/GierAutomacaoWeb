*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../../1-Hooks/1-Principal.robot

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
    Wait Until Element Is Visible    cphContent_btnPesquisa
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


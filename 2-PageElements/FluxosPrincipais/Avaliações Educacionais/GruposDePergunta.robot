*** Settings ***
Library    SeleniumLibrary
Resource    ../../../1-Hooks/1-Principal.robot    

*** Variables ***


*** Keywords ***
Em Grupos de Pergunta, clicar em Cadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCadastrar").click();
    Aguardar tela de carregamento

Em Grupos de Pergunta, em Descrição inserir "${descricaoGrupoPergunta}"
    Set Suite Variable    ${descricaoGrupoPergunta}
    Wait Until Element Is Visible    cphContent_txtDescricao
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao    ${descricaoGrupoPergunta}

Em Grupos de Pergunta, em Sigla inserir "${siglaGrupoPergunta}"
    Input Text    cphContent_txtSigla    ${siglaGrupoPergunta}

Em Grupos de Pergunta, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Grupos de Pergunta, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento

Em Grupos de Pergunta, em Descrição inserir a descrição cadastrada
    Wait Until Element Is Visible    cphContent_txtDescricao
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao    ${descricaoGrupoPergunta}

Em Grupos de Pergunta, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Grupos de Pergunta, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Grupos de Pergunta, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Grupos de Pergunta, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_Mensagem_Padrao_btnSim").click();
    Aguardar tela de carregamento

Em Grupos de Pergunta, verificar se o cadastro foi excluído
    Wait Until Page Contains    Nenhum registro foi encontrado.

Em Grupos de Pergunta, verificar se o cadastro foi efetuado
    Wait Until Page Contains    ${descricaoGrupoPergunta}

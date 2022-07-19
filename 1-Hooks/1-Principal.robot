*** Settings ***
Library    SeleniumLibrary

*** Variable ***
${botaoCadastrar}               cphContent_btnCad
${botaoPesquisar}               cphContent_btnPesquisar
${botaoEditar}                  cphContent_btnEditar
${botaoSalvar}                  cphContent_btnSalvar
${botaoFinalizar}               cphContent_btnFinalizar
${botaoLimpar}                  cphContent_btnLimpar
${botaoImprimir}                cphContent_btnImprimir
${botaoDataHoje}                //button[@type='button'][contains(.,'Hoje')]


*** Keywords ***
Abrir o navegador
    Open Browser    url=https://www.google.com/    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Verificar se aparece o texto "${texto}"
    Wait Until Page Contains    ${texto}    20
    Sleep   1

Entrar no módulo "${nomeModulo}"
    Execute JavaScript  xPathResult = document.evaluate("//span[contains(.,'${nomeModulo}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()  

Entrar na funcionalidade "${funcionalidade}"  
    Execute JavaScript  xPathResult = document.evaluate("//span[contains(@title,'${funcionalidade}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Clicar no botão Cadastrar
    Wait Until Element Is Visible    ${botaoCadastrar}
    Execute JavaScript  document.getElementById("${botaoCadastrar}").click();

Clicar em Pesquisar
    Wait Until Element Is Visible    ${botaoPesquisar}
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click(); 

Clicar em Editar
    Wait Until Element Is Visible    ${botaoEditar}
    Execute JavaScript  document.getElementById("${botaoEditar}").click(); 

Clicar em Salvar
    Wait Until Element Is Visible    ${botaoSalvar}
    Execute JavaScript  document.getElementById("${botaoSalvar}").click(); 

Clicar em Finalizar
    Wait Until Element Is Visible    ${botaoFinalizar}
    Execute JavaScript  document.getElementById("${botaoFinalizar}").click(); 
*** Settings ***
Library    SeleniumLibrary

*** Variable ***
${botaoCadastrar}               cphContent_btnCad
${botaoPesquisar}               cphContent_btnPesquisar
${botaoEditar}                  cphContent_btnEditar
${botaoSalvar}                  cphContent_btnSalvar
${botaoFinalizar}               cphContent_btnFinalizar
${botaoVoltar}                  cphContent_btnVoltar
${botaoLimpar}                  cphContent_btnLimpar
${botaoFechar}                  cphContent_btFechar
${botaoImprimir}                cphContent_btnImprimir
${botaoDataHoje}                //button[@type='button'][contains(.,'Hoje')]
${campoObservacaoAta}           cphContent_txtObservacaoAtaConcelho
${botaoOKModal}                 cphContent_Mensagem_Padrao_btnOk
${botaoSimModal}                cphContent_Mensagem_Padrao_btnSim
${botaoNaoModal}                cphContent_Mensagem_Padrao_btnNao
${AnoLetivo}                    ddlAnoLetivo


*** Keywords ***
Abrir o navegador
    Open Browser    url=https://www.google.com/    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar o ambiente "${url}"
    Go to   ${url}

Aguardar tela de carregamento
    Wait Until Element Is Not Visible    class=carregando    300

Verificar se aparece o texto "${texto}"
    Wait Until Page Contains    ${texto}    20

Entrar no eixo "${nomeEixo}"
    Execute JavaScript  xPathResult = document.evaluate("//span[contains(.,'${nomeEixo}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()  

Entrar no módulo "${nomeModulo}"
    Execute JavaScript  xPathResult = document.evaluate("//span[contains(.,'${nomeModulo}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()  

Entrar na funcionalidade "${funcionalidade}"  
    Execute JavaScript  xPathResult = document.evaluate("//span[contains(@title,'${funcionalidade}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Clicar em Cadastrar
    Wait Until Element Is Visible    ${botaoCadastrar}
    Execute JavaScript  document.getElementById("${botaoCadastrar}").click();
    Aguardar tela de carregamento

Clicar em Pesquisar
    Wait Until Element Is Visible    ${botaoPesquisar}
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click();
    Aguardar tela de carregamento

Clicar em Editar
    Wait Until Element Is Visible    ${botaoEditar}
    Execute JavaScript  document.getElementById("${botaoEditar}").click(); 
    Aguardar tela de carregamento

Clicar em Salvar
    Wait Until Element Is Visible    ${botaoSalvar}
    Execute JavaScript  document.getElementById("${botaoSalvar}").click(); 
    Aguardar tela de carregamento

Clicar em Finalizar
    Wait Until Element Is Visible    ${botaoFinalizar}
    Execute JavaScript  document.getElementById("${botaoFinalizar}").click(); 

Clicar em Fechar
    Wait Until Element Is Visible    ${botaoFechar}
    Execute JavaScript  document.getElementById("${botaoFechar}").click(); 
    Aguardar tela de carregamento

Clicar em Voltar
    Wait Until Element Is Visible    ${botaoVoltar}
    Execute JavaScript  document.getElementById("${botaoVoltar}").click();
    Aguardar tela de carregamento

Retornar a página anterior
    Go Back

Clicar em OK no Modal
    Wait Until Element Is Visible    ${botaoOKModal}
    Execute JavaScript  document.getElementById("${botaoOKModal}").click();
    Aguardar tela de carregamento
    
Clicar em Sim no Modal   
    Wait Until Element Is Visible    ${botaoSimModal}
    Execute JavaScript  document.getElementById("${botaoSimModal}").click();
    Aguardar tela de carregamento

Clicar em Não no Modal   
    Wait Until Element Is Visible    ${botaoNaoModal}
    Execute JavaScript  document.getElementById("${botaoNaoModal}").click();
    Aguardar tela de carregamento

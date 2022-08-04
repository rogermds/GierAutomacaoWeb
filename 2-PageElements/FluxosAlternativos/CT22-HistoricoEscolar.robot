*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***
${campoCodEducando}                cphContent_txtDocumento
${campoEducando}                   cphContent_txtNomeAluno
${acaoHistoricoEscolar}            cphContent_dtlConsuAlunoMatriculado_lnkVisualizar_0
${botaoIncluirObservacao}          cphContent_btnIncluirObservacao


*** Keywords ***
Visualizar o texto: PESQUISAR EDUCANDO
    Wait Until Page Contains Element    //span[contains(.,'Nenhum registro foi encontrado.')]

Em código do Educando, informar "${codEducando}"
    Execute JavaScript  document.getElementById("${campoCodEducando}").click();
    Input Text    ${campoCodEducando}    ${codEducando}
    Sleep    3

Em Educando, informar "${nomeEducando}"
    Execute JavaScript  document.getElementById("${campoEducando}").click();
    Input Text    ${campoEducando}    ${nomeEducando}
    Sleep    3

Clicar no botão Limpar
    Execute JavaScript  document.getElementById("${botaoLimpar}").click();
    Aguardar tela de carregamento

Clicar na ação Histórico Escolar
    Execute JavaScript  document.getElementById("${acaoHistoricoEscolar}").click();
    Sleep    10
    
Clicar em 'Incluir' para a Observação
    Wait Until Element Is Visible    ${botaoIncluirObservacao}    10    
    Execute JavaScript  document.getElementById("${botaoIncluirObservacao}").click();
    
Visualizar a mensagem: CAMPO CICLO OBRIGATÓRIO!
    Wait Until Page Contains Element    //span[contains(.,'Campo Ciclo Obrigatório!')]
    Sleep    3

Em Observações, selecionar "${anoLetivoObservacao}"
    Run Keyword If    '${anoLetivoObservacao}' == '1°'  Execute JavaScript  document.getElementById("cphContent_rbtListaCorsoCiclo_0").click();
    Run Keyword If    '${anoLetivoObservacao}' == '2°'  Execute JavaScript   document.getElementById("cphContent_rbtListaCorsoCiclo_1").click();
    Run Keyword If    '${anoLetivoObservacao}' == '3°'  Execute JavaScript   document.getElementById("cphContent_rbtListaCorsoCiclo_2").click();
    Run Keyword If    '${anoLetivoObservacao}' == '4°'  Execute JavaScript   document.getElementById("cphContent_rbtListaCorsoCiclo_3").click();
    Run Keyword If    '${anoLetivoObservacao}' == '5°'  Execute JavaScript   document.getElementById("cphContent_rbtListaCorsoCiclo_4").click();
    Sleep    8

Visualizar a mensagem: CAMPO OBSERVAÇÕES GERAL DO ANO LETIVO OBRIGATÓRIO!
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Campo Observações Geral do Ano Letivo Obrigatório!')]    
    
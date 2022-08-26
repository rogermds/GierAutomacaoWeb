*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***
${campoSigla}                cphContent_txtSigla
${campoOrdem}                cphContent_txtOrdem
${botaoSim}                  cphContent_MensagemPadrao_btnSim  
${campoDescricao}            cphContent_txtDescricao
${botaoAcao}                 cphContent_dtlConsulta_A2_0

*** Keywords ***
Visualizar o Titulo Consulta de Descrição de Aprendizagem
    Wait Until Page Contains    Consulta de Descrição de Aprendizagem
    Set Suite Variable    ${botaoCadastrar}        cphContent_btnCadastra
    Aguardar tela de carregamento

Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'PREENCHA OS CAMPOS OBRIGATÓRIOS')]

Em Sigla, informar "${Sigla}"
    Input Text    ${campoSigla}    ${Sigla}

Em Ordem, informar "${Ordem}" 
    Input Text   ${campoOrdem}    ${Ordem}
    
Visualizar a mensagem: OS DADOS NÃO SALVOS SERÃO PERDIDOS, DESEJA CONTINUAR?
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'OS DADOS NÃO SALVOS SERÃO PERDIDOS, DESEJA CONTINUAR?')]

Clicar no botão 'Sim'
    Execute JavaScript  document.getElementById("${botaoSim}").click();
    Aguardar tela de carregamento

Clicar na ação "${Acao}"
    Execute JavaScript  document.getElementById("${botaoAcao}").click();
    Run Keyword If    '${Acao}' == 'Visulizar'  Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkVisualizar_0").click();
    Run Keyword If    '${Acao}' == 'Editar'  Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Run Keyword If    '${Acao}' == 'Excluir'  Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Run Keyword If    '${Acao}' == 'Copiar Aprendizagem'  Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkCopiar_0").click();
    Aguardar tela de carregamento

Limpar o campo Sigla 
    Clear Element Text    ${campoSigla}

Limpar o campo Ordem    
    Clear Element Text    ${campoOrdem}

Limpar o campo Descrição   
    Clear Element Text    ${campoDescricao}
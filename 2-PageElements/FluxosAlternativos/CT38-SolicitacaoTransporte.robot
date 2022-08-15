*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***
${campoSituacaoSolicitacao}                  cphContent_ddlSituacaoSolicitacao      

*** Keywords ***
Visualizar a mensagem: CAMPO OBRIGATÓRIO. ETAPA/MODALIDADE
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Campo obrigatório. Etapa/Modalidade')]

Em Situação da Solicitação, selecionar "${Situacao}"
    Run Keyword If    '${Situacao}' == 'Todas'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Sem solicitação'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("0").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Aguardando Análise'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("1").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Aguardando Análise da CEB'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("2").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Aguardando Reanalise'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("3").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Deferida'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("4").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Indeferida'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("5").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Cancelada'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("6").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Fila de Espera'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("7").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Enviar Para Analise'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("10").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'Deferida sem Veiculo'  Execute JavaScript   $('#${campoSituacaoSolicitacao}').val("11").trigger('chosen:updated');
    Execute JavaScript   $('#${campoSituacaoSolicitacao}').trigger('change');
    Aguardar tela de carregamento

Clicar em Ações
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_A2_0").click();

Em ações, selecionar "Editar"
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Visualizar a mensagem: É NECESSÁRIO SELECIONAR UMA LINHA PREFERENCIAL DO FRETADO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'É necessário selecionar uma linha preferencial do fretado.')]
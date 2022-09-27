*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***
${campoTipoRotaRotas}                cphContent_ddlTipoRota   
${campoEscolaRotas}                  cphContent_Busca_Escola_txtNomeEscola  
${botaoInserirRotas}                 cphContent_Busca_Escola_btnInserir
${campoPontoInicialRotas}            cphContent_txtPontoInicial
${campoPontoFinalRotas}              cphContent_txtPontoFinal

*** Keywords ***
Em Tipo de Rota, selecionar "${tipoRotas}"
    Run Keyword If    '${tipoRotas}' == 'Selecione'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("0").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Apa Cabuçu'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("4").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Bonsucesso'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("5").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Centro'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("6").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Cumbica'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("7").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Escola Especial'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("12").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Outras Unidades'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("13").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Pimentas'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("8").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Regional Norte'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("2").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Regional Sul'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("3").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'São João'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("9").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Taboão'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("10").trigger('chosen:updated');
    Run Keyword If    '${tipoRotas}' == 'Vila Galvão'  Execute JavaScript   $('#${campoTipoRotaRotas}').val("11").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTipoRotaRotas}').trigger('change');

Em Nome de Escola, inserir "${Escola}"
    Execute JavaScript  document.getElementById("${campoEscolaRotas}").click();
    Input Text    ${campoEscolaRotas}    ${Escola}
    Set Suite Variable    ${botaoPesquisar}    cphContent_Busca_Escola_btnPesquisa
    Aguardar tela de carregamento

Selecionar a busca realizada na pesquisa da Escola
    Execute JavaScript  document.getElementById("cphContent_Busca_Escola_dtlConsulta_lbtSelecionar_0").click();
    Aguardar tela de carregamento

Clicar no botão 'Inserir' 
    Execute JavaScript  document.getElementById("${botaoInserirRotas}").click();
    Aguardar tela de carregamento

Visualizar a mensagem: PREENCHA O CAMPO NOME.
    Wait Until Page Contains Element    //span[contains(.,'Preencha o campo Nome.')]

Visualizar a mensagem: PREENCHA O CAMPO PONTO INICIAL.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Preencha o campo Ponto Inicial.')]
    
Em Ponto Inicial, inserir "${pontoInicial}"
    Execute JavaScript  document.getElementById("${campoPontoInicialRotas}").click();
    Input Text    ${campoPontoInicialRotas}    ${pontoInicial}

Visualizar a mensagem: PREENCHA O CAMPO PONTO FINAL.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Preencha o campo Ponto Final.')]

Em Ponto Final, inserir "${pontoFinal}"
    Execute JavaScript  document.getElementById("${campoPontoFinalRotas}").click();
    Input Text    ${campoPontoFinalRotas}    ${pontoFinal}
    
Visualizar a mensagem: SELECIONE UM TIPO DE ROTA
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Selecione um tipo de rota')]
    
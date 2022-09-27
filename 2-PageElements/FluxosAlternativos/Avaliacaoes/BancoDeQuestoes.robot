*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***
${campoUtilizacaoQuestao}                cphContent_ddlUtilizacaoQuestao
${campoPergunta}                         (//div[contains(@class,'note-editable panel-body')])[2]
${campoTipoEnsino}                       cphContent_ddlTipoEnsino

*** Keywords ***
Visualizar a mensagem: UTILIZAÇÃO DA QUESTÃO É OBRIGATÓRIO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Utilização da Questão é obrigatório')]

Em Utilização da Questão, selecionar "${utilizacaoQuestao}"
    Run Keyword If    '${utilizacaoQuestao}' == 'Selecione'  Execute JavaScript   $('#${campoUtilizacaoQuestao}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${utilizacaoQuestao}' == 'Avaliação Educacional'  Execute JavaScript   $('#${campoUtilizacaoQuestao}').val("1").trigger('chosen:updated');
    Run Keyword If    '${utilizacaoQuestao}' == 'Pedagógico'  Execute JavaScript   $('#${campoUtilizacaoQuestao}').val("2").trigger('chosen:updated');
    Run Keyword If    '${utilizacaoQuestao}' == 'Tipo de Solicitações'  Execute JavaScript   $('#${campoUtilizacaoQuestao}').val("3").trigger('chosen:updated');
    Execute JavaScript   $('#${campoUtilizacaoQuestao}').trigger('change');
    Aguardar tela de carregamento

Visualizar a mensagem: INFORME A PERGUNTA.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Pergunta.')]

Em Pergunta, informar "${Pergunta}"
    Execute JavaScript  xPathResult = document.evaluate("${campoPergunta}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()  
    Input Text    ${campoPergunta}    ${Pergunta}

Visualizar a mensagem: INFORME A ETAPA/MODALIDADE.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Etapa/Modalidade.')]
    
Em Etapa/Modalidade, selecionar o tipo de ensino "${tipoEnsino}"   
    Run Keyword If    '${tipoEnsino}' == 'Selecione'  Execute JavaScript   $('#${campoTipoEnsino}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${tipoEnsino}' == 'Atendimento Educacional Especializado'  Execute JavaScript   $('#${campoTipoEnsino}').val("13").trigger('chosen:updated');
    Run Keyword If    '${tipoEnsino}' == 'Atividade Complementar'  Execute JavaScript   $('#${campoTipoEnsino}').val("11").trigger('chosen:updated');
    Run Keyword If    '${tipoEnsino}' == 'Educação de Jovens e Adultos 1º Semestre'  Execute JavaScript   $('#${campoTipoEnsino}').val("5").trigger('chosen:updated');
    Run Keyword If    '${tipoEnsino}' == 'Educação de Jovens e Adultos 2º Semestre'  Execute JavaScript   $('#${campoTipoEnsino}').val("6").trigger('chosen:updated');
    Run Keyword If    '${tipoEnsino}' == 'Educação Especial Exclusiva'  Execute JavaScript   $('#${campoTipoEnsino}').val("12").trigger('chosen:updated');
    Run Keyword If    '${tipoEnsino}' == 'Educação Infantil'  Execute JavaScript   $('#${campoTipoEnsino}').val("1").trigger('chosen:updated');
    Run Keyword If    '${tipoEnsino}' == 'Ensino Fundamental'  Execute JavaScript   $('#${campoTipoEnsino}').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTipoEnsino}').trigger('change');
    Aguardar tela de carregamento

Visualizar a mensagem: INFORME O ANO/CICLO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe o Ano/Ciclo.')]
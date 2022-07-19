*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${campoEtapaModalidadeAvaliacoes}        cphContent_ddlEtapaModalidade
${campoProfessorAvalicoes}               cphContent_ddlProfessor
${campoTurmaAvalicoes}                   cphContent_ddlClasse
${campoDataRefencia}                     cphContent_txtDataReferenci
${campoDescricao}                        cphContent_txtDescricao    
${diarioAluno}                           cphContent_rptDigitaNf_btnDiario_0


*** Keywords ***
Na consulta de avaliações, em Etapa/Modalidade, selecionar "${etapaModalidade}" 
    Sleep    1
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').trigger('change');
    Sleep   3

Na consulta de avaliações, em Data de Referência, informar "${data}"
    Execute JavaScript  document.getElementById("${campoDataRefencia}").click();
    Clear Element Text    ${campoDataRefencia}
    Input Text    ${campoDataRefencia}    ${data}
    Execute JavaScript  document.getElementById("${campoProfessorAvalicoes}").click();
    Sleep   2

Visualizar a mensagem: INFORME UMA DATA VÁLIDA
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Informe uma data válida')]
    
Na consulta de avaliações, em Data de Referência, informar a data do dia atual
    Execute JavaScript  document.getElementById("${campoDataRefencia}").click();
    Clear Element Text    ${campoDataRefencia}
    Execute JavaScript  xPathResult = document.evaluate("${botaoDataHoje}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Sleep   2
    
Na consulta de avaliações, em Professor, selecionar "${professor}"
    Run Keyword If    '${professor}' == 'ADRIANA CRISTINA CAMPOS SCALICI'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("6167").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'TANIA MARA DA SILVA'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("7859").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'TANIA APARECIDA MINORELLI'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("7491").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'PRISCILA DOMINGUES FERNANDES LOPES'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("2588").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'MARIA FAUSTA JUSTINIANO SANTOS SILVEIRA'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("3560").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'LUCIANA OLIVEIRA RIBEIRO TOLEDO'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("7797").trigger('chosen:updated');
    Execute JavaScript   $('#${campoProfessorAvalicoes}').trigger('change');
    Sleep   3

Na consulta de avaliações, em Turma, selecionar "${turma}"
    Run Keyword If    '${turma}' == 'EII A'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("110667").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '5B'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("112173").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '3A'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("110822").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '3B'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("110825").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '1B'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("110726").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '4A'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("111827").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaAvalicoes}').trigger('change');
    Sleep   3

No primeiro aluno, em questionário, clicar em Diário de Bordo do Aluno
    Wait Until Page Contains Element    ${diarioAluno}    60
    Execute JavaScript  document.getElementById("${diarioAluno}").click();
    Sleep    3
    
Clicar em "Salvar"
    Execute JavaScript  document.getElementById("cphContent_btnIncluir").click();
    Sleep    3

Visualizar a mensagem: INFORME A DESCRIÇÃO.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Informe a descrição.')]

Em Descrição, informar o valor "${descricao}"
    Execute JavaScript  document.getElementById("${campoDescricao}").click();
    Input Text    ${campoDescricao}    ${descricao}
    Sleep    3
    
Visualizar a mensagem: UM TIPO DE AVALIAÇÃO DEVE SER SELECIONADO.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Um tipo de avaliação deve ser selecionado.')]
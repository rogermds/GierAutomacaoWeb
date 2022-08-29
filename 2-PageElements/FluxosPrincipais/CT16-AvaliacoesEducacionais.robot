*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${campoEtapaModalidadeAta}          cphContent_ddlEtapaModalidade
${campoTurmaAta}                    cphContent_ddlTurma
${botaoAcoesAta}                    //input[@name='ctl00$cphContent$dtlAlunos$ctl00$A2'][contains(@id,'0')]
${botaoFecharAnoLetivo}             cphContent_dtlAlunos_lnkDetalhes_0
${botaoProntuarioDoEducando}        cphContent_dtlAlunos_lnkProntuarioAluno_0
${botaoRegistrarObservacoes}        cphContent_dtlAlunos_lkObservacao_0
${campoObservacaoAta}               cphContent_txtObservacaoAtaConcelho
${botaoFinalizarConselhoAta}        cphContent_btnFecharClasse
${botaoReabrirConselhoAta}          cphContent_btnAbrirClasse

*** Keywords ***
Na tela de Ata de Conselho, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeAta}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeAta}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeAta}').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeAta}').trigger('change');
    Aguardar tela de carregamento

Na tela de Ata de Conselho, em Turma, selecionar "${turma}"
    Run Keyword If    '${turma}' == 'EII A'  Execute JavaScript   $('#${campoTurmaAta}').val("110667").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '5B'  Execute JavaScript   $('#${campoTurmaAta}').val("112173").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '3A'  Execute JavaScript   $('#${campoTurmaAta}').val("110822").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '3B'  Execute JavaScript   $('#${campoTurmaAta}').val("110825").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '2A'  Execute JavaScript   $('#${campoTurmaAta}').val("110788").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'CI A (1º Semestre)'  Execute JavaScript   $('#${campoTurmaAta}').val("113554").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaAta}').trigger('change');
    Aguardar tela de carregamento

Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Wait Until Page Contains Element    ${botaoAcoesAta}    180
    Execute JavaScript  xPathResult = document.evaluate("${botaoAcoesAta}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
       
Na tela de Ata de Conselho, em ações, clicar em Fechamento do Período Letivo no primeiro aluno
    Execute JavaScript  document.getElementById("${botaoFecharAnoLetivo}").click();

Verificar se a página foi redirecionada para Fechamento de Período Letivo
    Wait Until Page Contains    Nesta tela são exibidas as informações detalhadas dos fechamentos de período letivo do Educando selecionado.

Na tela de Ata de Conselho, em ações, clicar em Prontuário do Aluno no primeiro aluno
    Execute JavaScript  document.getElementById("${botaoProntuarioDoEducando}").click();

Verificar se a página foi redirecionada para Prontuário do Educando
    Wait Until Page Contains    Prontuário do Educando
    Sleep    2

Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Execute JavaScript  document.getElementById("${botaoRegistrarObservacoes}").click();

Na tela de Ata de Conselho, em Registro das Observações, inserir uma observação
    Wait Until Element Is Visible    ${campoObservacaoAta}
    Set Suite Variable      ${botaoSalvar}           cphContent_btSalvar
    Set Suite Variable      ${textoObservacaoAta}    TESTE DE INSERÇÃO DE OBSERVAÇÃO
    Input Text    ${campoObservacaoAta}    ${textoObservacaoAta}

Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Wait Until Element Is Visible    ${campoObservacaoAta}
    Element Text Should Be    ${campoObservacaoAta}    ${textoObservacaoAta}

Na tela de Ata de Conselho, clicar em Finalizar Conselho
    Aguardar tela de carregamento
    Wait Until Element Is Visible    ${botaoFinalizarConselhoAta}
    Execute JavaScript  document.getElementById("${botaoFinalizarConselhoAta}").click();
    
Na tela de Ata de Conselho, verificar se o botão Reabrir Conselho é exibido
    Aguardar tela de carregamento
    Wait Until Element Is Visible    ${botaoReabrirConselhoAta}

Na tela de Ata de Conselho, clicar no botão Reabrir Conselho
    Execute JavaScript  document.getElementById("${botaoReabrirConselhoAta}").click();

Na tela de Ata de Conselho, verificar se o botão Finalizar Conselho é exibido
    Wait Until Element Is Visible    ${botaoFinalizarConselhoAta}    300
    
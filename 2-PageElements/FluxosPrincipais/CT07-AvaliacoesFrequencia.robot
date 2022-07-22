*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary

*** Variables ***
${campoEtapaModalidadeAvaliacoes}        cphContent_ddlEtapaModalidade
${campoProfessorAvalicoes}               cphContent_ddlProfessor
${campoTurmaAvalicoes}                   cphContent_ddlClasse
${responderPrimeiroAluno}                cphContent_rptDigitaNf_lkbQuestionario_0
${botaoControleFrequencia}               cphContent_btnLancarAusencia
${primeiraQuestao}                       cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_1_0_1
${segundaQuestao}                        cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_2_0_2
${terceiraQuestao}                       cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_3_0_3
${quartaQuestao}                         cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_4_0_4
${salvarFechar}                          cphContent_QuestionarioAvaliacao_btnSalvar
${okModalSucesso}                        cphContent_QuestionarioAvaliacao_MensagemPadrao_btnOk
${okModalCadastroSucesso}                cphContent_Mensagem_Padrao_btnOk
${campoTextoRelatorioQuestionario}       cphContent_QuestionarioAvaliacao_dtlQuestionario_txtRespostaValidacao_50
${botaoEnviarParaValidacao}              cphContent_QuestionarioAvaliacao_dtlQuestionario_btnValidacao_50
${campoDescricaoQuestionario}            cphContent_rptDigitaNf_lkbQuestionario_0
${campoSituacaoValidacao}                cphContent_dtlConsulta_lblSituacao_0
${visualizarEducandos}                   cphContent_dtlConsulta_lblVisualizar_0 
${visualizarRelatorio}                   cphContent_dtlConsulta_lblVisualizar_0
${campoTextoRespostaAvaliacao}           txtResposta
${encaminharParaAjustes}                 cphContent_btnEncaminhar
${campoJustificativaRelatorio}           cphContent_txtJustificativa
${campoHistoricoJustificativa}           cphContent_dtlConsulta_lblJustificativa_0
${botaoRealizarAjustes}                  cphContent_QuestionarioAvaliacao_dtlQuestionario_btnValidacao_50
${campoCorrecaoRelatorio}                cphContent_QuestionarioAvaliacao_dtlQuestionario_txtRespostaValidacao_50
${botaoSalvarAjustes}                    cphContent_QuestionarioAvaliacao_dtlQuestionario_btnValidacao_50
${campoEtapaModalidadeRelatorio}         cphContent_ddlTiposEnsino
${campoTurmaRelatorio}                   cphContent_ddlTurma
${campoJustificativaDevolucao}           cphContent_QuestionarioAvaliacao_dtlQuestionario_txtJustificativaValidacao_50


*** Keywords ***
Na consulta de avaliações, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Sleep    1
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').trigger('change');
    Sleep   3

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

No primeiro aluno, em questionário, clicar em "Responder"
    Wait Until Element Is Visible       ${botaoControleFrequencia}  20
    Execute JavaScript  document.getElementById("${responderPrimeiroAluno}").click();
    Wait Until Element Is Visible       ${primeiraQuestao}  10

Marcar "ATINGIU OS OBJETIVOS" nas questões
    Execute JavaScript  document.getElementById("${primeiraQuestao}").click();
    Execute JavaScript  document.getElementById("${segundaQuestao}").click();
    Execute JavaScript  document.getElementById("${terceiraQuestao}").click();
    Execute JavaScript  document.getElementById("${quartaQuestao}").click();

Clicar em Salvar e Fechar
    Execute JavaScript  document.getElementById("${salvarFechar}").click();
    Wait Until Element Is Visible   ${okModalSucesso}  10

No modal de alerta, clicar em Ok
    Execute JavaScript  document.getElementById("${okModalSucesso}").click();
    Sleep  5

No modal de Cadastro Efetuado com Sucesso, clicar em Ok
    Sleep   8
    Execute JavaScript  document.getElementById("${okModalCadastroSucesso}").click();
    Wait Until Element Is Visible       ${botaoControleFrequencia}  10

Verificar se as questões foram marcadas conforme foram salvas
    Element Attribute Value Should Be    ${primeiraQuestao}     checked     true
    Element Attribute Value Should Be    ${segundaQuestao}     checked     true
    Element Attribute Value Should Be    ${terceiraQuestao}     checked     true
    Element Attribute Value Should Be    ${quartaQuestao}     checked     true
    Sleep   2

Em Relatório, digitar um texto para envio
    Set Suite Variable    ${textoRelatorioValidacao}    ENVIO DE RELATÓRIO PARA VALIDAÇÃO
    Input Text    ${campoTextoRelatorioQuestionario}    ${textoRelatorioValidacao}

Clicar em Enviar para Validação
    Execute JavaScript  document.getElementById("${botaoEnviarParaValidacao}").click();
    Sleep   4

Verificar se aparece o status "${texto}"
    Sleep    8
    Element Should Contain    ${campoDescricaoQuestionario}     ${texto}

Verificar se a Situação de Validação está como "${texto}"
    ${primeiraValidacao}    Run Keyword And Return Status   Wait Until Page Contains    Relatórios de Desenvolvimento para Validação
    ${segundaValidacao}     Run Keyword And Return Status    Wait Until Page Contains    Relatórios de Desenvolvimento de Educandos para Validação
    IF         ${primeiraValidacao}
        Element Text Should Be    ${campoSituacaoValidacao}     ${texto}
    ELSE IF    ${segundaValidacao}
        Element Text Should Be    ${campoSituacaoValidacao}     ${texto}
    END   

Clicar em VISUALIZAR EDUCANDOS
    Execute JavaScript  document.getElementById("${visualizarEducandos}").click();
    Sleep   4

Clicar em VISUALIZAR RELATORIO
    Execute JavaScript  document.getElementById("${visualizarRelatorio}").click();
    Sleep   4

Verificar se o texto inserido aparece nesta tela
    Element Should Contain    ${campoTextoRespostaAvaliacao}     ${textoRelatorioValidacao}

Clicar em Encaminhar para Ajustes
    Execute JavaScript  document.getElementById("${encaminharParaAjustes}").click();
    Sleep   4

Digitar uma justificativa
    Set Suite Variable    ${justificativaRelatorio}    JUSTIFICATIVA DE DEVOLUÇÃO DE RELATÓRIO
    Input Text    ${campoJustificativaRelatorio}    ${justificativaRelatorio}

Verificar se a Justificativa de Devolução é exibida
    Element Should Contain    ${campoJustificativaDevolucao}     ${justificativaRelatorio}

Verificar se este texto aparece no histórico
    Sleep    5
    Element Should Contain    ${campoHistoricoJustificativa}     ${justificativaRelatorio}

Clicar em Realizar Ajustes
    Execute JavaScript  document.getElementById("${botaoRealizarAjustes}").click();
    Sleep   4

Inserir um novo texto no relatório
    Set Suite Variable    ${correcaoRelatorio}    AJUSTE EFETUADO COM SUCESSO
    Input Text    ${campoCorrecaoRelatorio}    ${correcaoRelatorio}

Clicar em Salvar Ajustes
    Execute JavaScript  document.getElementById("${botaoSalvarAjustes}").click();
    Sleep   4

Verificar se o texto alterado aparece nesta tela
    Element Should Contain    ${campoTextoRespostaAvaliacao}     ${correcaoRelatorio}

Em Validação de Relatório, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Sleep    5
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeRelatorio}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeRelatorio}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeRelatorio}').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeRelatorio}').trigger('change');
    Sleep   2

Em Validação de Relatório, em Turma, selecionar "${turma}"
    Sleep    5
    Run Keyword If    '${turma}' == 'EII A'  Execute JavaScript   $('#${campoTurmaRelatorio}').val("110667").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '5B'  Execute JavaScript   $('#${campoTurmaRelatorio}').val("112173").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '3A'  Execute JavaScript   $('#${campoTurmaRelatorio}').val("110822").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '3B'  Execute JavaScript   $('#${campoTurmaRelatorio}').val("110825").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '4A'  Execute JavaScript   $('#${campoTurmaRelatorio}').val("111827").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '1B'  Execute JavaScript   $('#${campoTurmaRelatorio}').val("110726").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaRelatorio}').trigger('change');
    Sleep   2

Em Validação de Relatório, clicar em Pesquisar
    ${botaoPesquisar}    Set Variable   cphContent_btnPesquisa
    Wait Until Element Is Visible    ${botaoPesquisar}
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click(); 
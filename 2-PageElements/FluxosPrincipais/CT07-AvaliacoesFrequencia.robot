*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${campoEtapaModalidadeAvaliacoes}       cphContent_ddlEtapaModalidade
${campoProfessorAvalicoes}              cphContent_ddlProfessor
${campoTurmaAvalicoes}                  cphContent_ddlClasse
${responderPrimeiroAluno}               cphContent_rptDigitaNf_lkbQuestionario_0
${botaoControleFrequencia}              cphContent_btnLancarAusencia
${primeiraQuestao}                      cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_1_0_1
${segundaQuestao}                       cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_2_0_2
${terceiraQuestao}                      cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_3_0_3
${quartaQuestao}                        cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_4_0_4
${quintaQuestao}                        cphContent_QuestionarioAvaliacao_dtlQuestionario_rblResposta_5_0_5
${salvarFechar}                         cphContent_QuestionarioAvaliacao_btnSalvar
${okModalSucesso}                       cphContent_QuestionarioAvaliacao_MensagemPadrao_btnOk
${okModalCadastroSucesso}               cphContent_Mensagem_Padrao_btnOk

*** Keywords ***
Na consulta de avaliações, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').trigger('change');
    Sleep   3

Na consulta de avaliações, em Professor, selecionar "${professor}"    
    Run Keyword If    '${professor}' == 'ADRIANA CRISTINA CAMPOS SCALICI'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("6167").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'xxxx'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("4").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'xxxx'  Execute JavaScript   $('#${campoProfessorAvalicoes}').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoProfessorAvalicoes}').trigger('change');
    Sleep   3

Na consulta de avaliações, em Turma, selecionar "${turma}"
    Run Keyword If    '${turma}' == 'EII A'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("110667").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'xxxx'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("4").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'xxxx'  Execute JavaScript   $('#${campoTurmaAvalicoes}').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaAvalicoes}').trigger('change');
    Sleep   3

No primeiro aluno, em questionário, clicar em "Responder"
    Wait Until Element Is Visible       ${botaoControleFrequencia}  10
    Execute JavaScript  document.getElementById("${responderPrimeiroAluno}").click();
    Wait Until Element Is Visible       ${primeiraQuestao}  10

Marcar "ATINGIU OS OBJETIVOS" nas questões
    Execute JavaScript  document.getElementById("${primeiraQuestao}").click();
    Execute JavaScript  document.getElementById("${segundaQuestao}").click();
    Execute JavaScript  document.getElementById("${terceiraQuestao}").click();
    Execute JavaScript  document.getElementById("${quartaQuestao}").click();
    Execute JavaScript  document.getElementById("${quintaQuestao}").click();

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
    Element Attribute Value Should Be    ${quintaQuestao}     checked     true
    Sleep   2



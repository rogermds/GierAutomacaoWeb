*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${campoEtapaModalidadeAvaliacoes}        cphContent_ddlEtapaModalidade
${campoDataReferencia}                   cphContent_txtDataReferenci
${campoProfessorAvalicoes}               cphContent_ddlProfessor
${campoTurmaAvalicoes}                   cphContent_ddlClasse
${responderPrimeiroAluno}                cphContent_rptDigitaNf_lkbQuestionario_0
${responderProximoAluno}                 cphContent_rptDigitaNf_lkbQuestionario_1
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
${campoDescricaoQuestionario}            cphContent_rptDigitaNf_lkbQuestionario_1
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
    Set Test Variable    ${etapaModalidade}
    Aguardar tela de carregamento
    Execute JavaScript   $("#${campoEtapaModalidadeAvaliacoes}").val($('option:contains("${etapaModalidade}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').trigger('change');
    Aguardar tela de carregamento

Na consulta de avaliações, em Etapa/Modalidade, selecionar a etapa/modalidade utilizada
    Execute JavaScript   $("#${campoEtapaModalidadeAvaliacoes}").val($('option:contains("${etapaModalidade}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeAvaliacoes}').trigger('change');
    Aguardar tela de carregamento

Na consulta de avaliações, em Data de Referência, informar "${data}"
    Clear Element Text    ${campoDataReferencia}
    Aguardar tela de carregamento
    Wait Until Element Is Visible    cphContent_Mensagem_Padrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento
    Input Text    ${campoDataReferencia}    ${data}
    Execute JavaScript   $('#${campoDataReferencia}').trigger('change');
    Aguardar tela de carregamento
    Execute JavaScript   document.getElementsByClassName("ui-datepicker-close")[0].click();
    Aguardar tela de carregamento

Na consulta de avaliações, em Professor, selecionar "${professor}"
    Set Test Variable    ${professor}
    Execute JavaScript   $("#${campoProfessorAvalicoes}").val($('option:contains("${professor}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#${campoProfessorAvalicoes}').trigger('change');
    Aguardar tela de carregamento

Na consulta de avaliações, em Professor, selecionar o professor utilizado
    Execute JavaScript   $("#${campoProfessorAvalicoes}").val($('option:contains("${professor}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#${campoProfessorAvalicoes}').trigger('change');
    Aguardar tela de carregamento

Na consulta de avaliações, em Turma, selecionar "${turma}"
    Set Test Variable    ${turma}
    Execute JavaScript   $("#${campoTurmaAvalicoes}").val($('option:contains("${turma}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaAvalicoes}').trigger('change');
    Aguardar tela de carregamento

Na consulta de avaliações, em Turma, selecionar a turma utilizada
    Execute JavaScript   $("#${campoTurmaAvalicoes}").val($('option:contains("${turma}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaAvalicoes}').trigger('change');
    Aguardar tela de carregamento

No primeiro aluno, em questionário, clicar em "Responder"
    ${validacao}    Run Keyword And Return Status   Wait Until Page Contains    RESPONDER
    IF         ${validacao}
        Execute JavaScript  document.getElementById("${responderProximoAluno}").click();     
    ELSE    
        Execute JavaScript  document.getElementById("${responderPrimeiroAluno}").click();    
    END   

Marcar "ATINGIU OS OBJETIVOS" nas questões
    Sleep    2
    Execute JavaScript  document.getElementById("${primeiraQuestao}").click();
    Sleep    2
    Execute JavaScript  document.getElementById("${segundaQuestao}").click();
    Sleep    2
    Execute JavaScript  document.getElementById("${terceiraQuestao}").click();

Clicar em Salvar e Fechar
    Execute JavaScript  document.getElementById("${salvarFechar}").click();
    Aguardar tela de carregamento


No modal de alerta, clicar em Ok
    Wait Until Element Is Visible   ${okModalSucesso}  10
    Execute JavaScript  document.getElementById("${okModalSucesso}").click();
    Aguardar tela de carregamento

No modal de Cadastro Efetuado com Sucesso, clicar em Ok
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("${okModalCadastroSucesso}").click();
    Wait Until Element Is Visible       ${botaoControleFrequencia}  10

Verificar se as questões foram marcadas conforme foram salvas
    Wait Until Element Is Visible    ${primeiraQuestao}
    Element Attribute Value Should Be    ${primeiraQuestao}     checked     true
    Element Attribute Value Should Be    ${segundaQuestao}     checked     true
    Element Attribute Value Should Be    ${terceiraQuestao}     checked     true
    Aguardar tela de carregamento

Em Relatório, digitar um texto para envio
    Set Test Variable    ${textoRelatorioValidacao}    ENVIO DE RELATÓRIO PARA VALIDAÇÃO
    Clear Element Text    ${campoTextoRelatorioQuestionario}
    Input Text    ${campoTextoRelatorioQuestionario}    ${textoRelatorioValidacao}

Clicar em Enviar para Validação
    Execute JavaScript  document.getElementById("${botaoEnviarParaValidacao}").click();
    Aguardar tela de carregamento

Verificar se aparece o status "${texto}"
    Wait Until Element Contains    cphContent_rptDigitaNf_lkbQuestionario_${localizacaoAlunoListaAvaliacao}    ${texto}

Verificar se a Situação de Validação está como "${texto}"
    FOR     ${index}    IN RANGE    0    50
        ${busca}    Set Variable    cphContent_dtlConsulta_lblNomeTd_${index}
        ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    ${alunoAvaliacaoFrequencia}
        IF  ${resultado}
            Wait Until Element Contains    cphContent_dtlConsulta_lblSituacao_${index}    ${texto}
            Exit For Loop
        END
    END

Clicar em VISUALIZAR EDUCANDOS
    Wait Until Element Is Visible    ${visualizarEducandos}
    Execute JavaScript  document.getElementById("${visualizarEducandos}").click();
    Aguardar tela de carregamento

Clicar em VISUALIZAR RELATORIO
    Wait Until Element Is Visible    ${visualizarRelatorio}
    FOR     ${index}    IN RANGE    0    50
        ${busca}    Set Variable    cphContent_dtlConsulta_lblNomeTd_${index}
        ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    ${alunoAvaliacaoFrequencia}
        IF  ${resultado}            
            Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lblVisualizar_${index}").click();
            Aguardar tela de carregamento
            Exit For Loop
        END
    END

Verificar se o texto inserido aparece nesta tela
    Element Should Contain    ${campoTextoRespostaAvaliacao}     ${textoRelatorioValidacao}

Clicar em Encaminhar para Ajustes
    Execute JavaScript  document.getElementById("${encaminharParaAjustes}").click();
    Aguardar tela de carregamento

Digitar uma justificativa
    Set Test Variable    ${justificativaRelatorio}    JUSTIFICATIVA DE DEVOLUÇÃO DE RELATÓRIO
    Clear Element Text    ${campoJustificativaRelatorio}
    Input Text    ${campoJustificativaRelatorio}    ${justificativaRelatorio}

Verificar se a Justificativa de Devolução é exibida
    Element Should Contain    ${campoJustificativaDevolucao}     ${justificativaRelatorio}

Verificar se este texto aparece no histórico
    Aguardar tela de carregamento
    Element Should Contain    ${campoHistoricoJustificativa}     ${justificativaRelatorio}

Clicar em Realizar Ajustes
    Execute JavaScript  document.getElementById("${botaoRealizarAjustes}").click();
    Aguardar tela de carregamento

Inserir um novo texto no relatório
    Set Test Variable    ${correcaoRelatorio}    AJUSTE EFETUADO COM SUCESSO
    Clear Element Text    ${campoCorrecaoRelatorio}
    Input Text    ${campoCorrecaoRelatorio}    ${correcaoRelatorio}

Clicar em Salvar Ajustes
    Execute JavaScript  document.getElementById("${botaoSalvarAjustes}").click();
    Aguardar tela de carregamento

Verificar se o texto alterado aparece nesta tela
    Dormir
    Element Should Contain    ${campoTextoRespostaAvaliacao}     ${correcaoRelatorio}

Em Validação de Relatório, em Etapa/Modalidade, selecionar a etapa/modalidade utilizada
    Aguardar tela de carregamento
    Execute JavaScript   $("#${campoEtapaModalidadeRelatorio}").val($('option:contains("${etapaModalidade}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeRelatorio}').trigger('change');
    Aguardar tela de carregamento

Em Validação de Relatório, em Turma, selecionar a turma utilizada
    Aguardar tela de carregamento
    Execute JavaScript   $("#${campoTurmaRelatorio}").val($('option:contains("${turma}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaRelatorio}').trigger('change');
    Aguardar tela de carregamento

Em Validação de Relatório, em Unidade Letiva, selecionar "${unidadeLetivaRelatorio}"
    Execute JavaScript   $("#cphContent_ddlUnidadeLetiva").val($('option:contains("${unidadeLetivaRelatorio}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlUnidadeLetiva').trigger('change');
    Aguardar tela de carregamento

Em Validação de Relatório, em Professor, selecionar o professor utilizado
    Execute JavaScript   $("#cphContent_ddlProfessor").val($('option:contains("${professor}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlProfessor').trigger('change');
    Aguardar tela de carregamento

Em Validação de Relatório, clicar em Pesquisar
    ${botaoPesquisar}    Set Variable   cphContent_btnPesquisa
    Wait Until Element Is Visible    ${botaoPesquisar}
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click();

Em Gerir Lançamentos, em Etapa/Modalidade, selecionar "${modalidade}"
    Set Test Variable    ${modalidade}
    Run Keyword If    '${modalidade}' == 'Educação de Jovens e Adultos 1º Semestre'  Execute JavaScript   $('#cphContent_ddlTipoEnsino').val("5").trigger('chosen:updated');
    Run Keyword If    '${modalidade}' == 'Educação de Jovens e Adultos 2º Semestre'  Execute JavaScript   $('#cphContent_ddlTipoEnsino').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoEnsino').trigger('change');
    Aguardar tela de carregamento

Em Gerir Lançamentos, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlListaPilotoNotasFaltas$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("cphContent_dtlListaPilotoNotasFaltas_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Gerir Lançamentos, alterar as datas para "${data}"
    IF    '${modalidade}' == 'Educação de Jovens e Adultos 2º Semestre'
        Clear Element Text    cphContent_txtIniUniLetiva
        Input Text    cphContent_txtIniUniLetiva    ${data}
        Clear Element Text    cphContent_txtDeNf
        Input Text    cphContent_txtDeNf    ${data}
        Clear Element Text    cphContent_txtDeNotasConceitosFinais
        Input Text    cphContent_txtDeNotasConceitosFinais    ${data}
    ELSE IF    '${modalidade}' == 'Educação de Jovens e Adultos 1º Semestre'
        Clear Element Text    cphContent_txtFimUniLetiva
        Input Text    cphContent_txtFimUniLetiva    ${data}
        Clear Element Text    cphContent_txtAteNf
        Input Text    cphContent_txtAteNf    ${data}
        Clear Element Text    cphContent_txtAteNotasConceitosFinais
        Input Text    cphContent_txtAteNotasConceitosFinais    ${data}
    END

Em Gerir Lançamentos, clicar em OK no Modal
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Pesquisar um aluno com o status RESPONDER e clicá-lo
    FOR     ${index}    IN RANGE    0    50
        ${busca}    Set Variable    cphContent_rptDigitaNf_lkbQuestionario_${index}
        ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    RESPONDER
        ${resultado2}    Run Keyword And Return Status   Element Should Not Contain  ${busca}    RELATÓRIO
        ${resultado3}    Run Keyword And Return Status   Element Attribute Value Should Be    cphContent_rptDigitaNf_tdNChamada_${index}    style    width: 15px; background-color: rgb(10, 150, 13);
        IF  ${resultado} and ${resultado2} and ${resultado3}
            ${alunoAvaliacaoFrequencia}    Get Text    cphContent_rptDigitaNf_lblAlunoTd_${index}
            Set Test Variable    ${busca}
            ${localizacaoAlunoListaAvaliacao}    Set Variable    ${index}
            Set Test Variable    ${localizacaoAlunoListaAvaliacao}
            Set Test Variable    ${alunoAvaliacaoFrequencia}
            Execute JavaScript  document.getElementById("${busca}").click();
            Aguardar tela de carregamento
            Exit For Loop
        END
    END

Localizar o aluno pesquisado e clicar em RESPONDER
    Execute JavaScript  document.getElementById("${busca}").click();
    Aguardar tela de carregamento

*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${botaoNovaTurmaTurma}                  cphContent_btnCad
${campoEtapaModalidadeTurma}            cphContent_ddlTipoEnsino
${campoCursoTurma}                      cphContent_ddlCurso
${campoCicloTurma}                      cphContent_ddlCiclo
${campoPeriodoTurma}                    cphContent_ddlPeriodo
${campoTurmaTurma}                      cphContent_ddlTurma_chosen
${campoGradeAulaTurma}                  cphContent_ddlCalendarioPadrao
${campoProgramaCurricularTurma}         cphContent_ddlProgramaCurricular
${campoSalaFisica}                      cphContent_dtlGerarClasse_lbtSelecionar_0
${campoCapacidadeTurma}                 cphContent_txtCapacidadeInformada
${botaoSalvarTurma}                     cphContent_btnSalvar
${botaoNaoTurma}                        cphContent_Mensagem_Padrao_btnNao  
${botaoOk}                              cphContent_Mensagem_Padrao_btnOk

*** Keywords ***
Clicar em Nova Turma Regular
    Execute JavaScript  document.getElementById("${botaoNovaTurmaTurma}").click();
    Wait Until Page Contains  Gerar Turma Regular

Na Turma, em Etapa/Modalidade, selecionar "${etapaModalide}"
    Run Keyword If    '${etapaModalide}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("1|EI|0").trigger('chosen:updated');
    Run Keyword If    '${etapaModalide}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("4|EF|0").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeTurma}').trigger('change');
    Sleep   3

Em Curso, selecionar "${curso}"
    Run Keyword If    '${curso}' == 'CRECHE'  Execute JavaScript   $('#${campoCursoTurma}').val("1").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I'  Execute JavaScript   $('#${campoCursoTurma}').val("2").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'PRÉ-ESCOLA'  Execute JavaScript   $('#${campoCursoTurma}').val("3").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II'  Execute JavaScript   $('#${campoCursoTurma}').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCursoTurma}').trigger('change');
    Sleep   3

Em Ciclo, selecionar "${ciclo}"
    Run Keyword If    '${ciclo}' == 'ESTÁGIO I'  Execute JavaScript   $('#${campoCicloTurma}').val("6|EI|G4").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'ESTÁGIO II'  Execute JavaScript   $('#${campoCicloTurma}').val("7|EII|G5").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '4° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("14|4º|4").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '5° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("15|5º|5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCicloTurma}').trigger('change');
    Sleep   3

Em Período, selecionar "${periodo}"
    Run Keyword If    '${periodo}' == 'INTEGRAL'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14650|I|1").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'MISTO'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15324|MISTO|6").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'MANHÃ'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14648|M|2").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'TARDE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14649|T|3").trigger('chosen:updated');
    Execute JavaScript   $('#${campoPeriodoTurma}').trigger('change');
    Sleep   8
    Wait Until Element Is Visible    ${campoTurmaTurma}    10

Em Turma, selecionar "${turma}"
    Run Keyword If    '${turma}' == 'W'  Execute JavaScript   $('#${campoTurmaTurma}').val("25").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'X'  Execute JavaScript   $('#${campoTurmaTurma}').val("24").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'Y'  Execute JavaScript   $('#${campoTurmaTurma}').val("23").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaTurma}').trigger('change');
    Sleep   5

Em Grade de Aula, selecionar "${gradeAula}"
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - MANHÃ'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("14710").trigger('chosen:updated');
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - TARDE'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("14711").trigger('chosen:updated');
    Execute JavaScript   $('#${campoGradeAulaTurma}').trigger('change');
    Sleep   3

Em Programa Curricular, selecionar "${programaCurricular}"
    Run Keyword If    '${programaCurricular}' == 'ESTÁGIO I'  Execute JavaScript   $('#${campoProgramaCurricularTurma}').val("42480|1232").trigger('chosen:updated');
    Run Keyword If    '${programaCurricular}' == 'SELECIONE'  Execute JavaScript   $('#${campoProgramaCurricularTurma}').val("0|0").trigger('chosen:updated');

Em Capacidade da Turma, inserir a quantidade "${capacidade}"
    Input Text   ${campoCapacidadeTurma}    ${capacidade}

Na Turma, clicar em Salvar
    Execute JavaScript  document.getElementById("${botaoSalvarTurma}").click();
    Sleep   3

Visualizar a mensagem: SELECIONE UMA SALA FÍSICA PARA ASSOCIAR A TURMA.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Selecione uma sala física para associar a Turma.')] 
    Sleep   3

Clicar em OK no modal
    Execute JavaScript  document.getElementById("${botaoOk}").click();

Selecionar uma Sala Física
    Execute JavaScript  document.getElementById("${campoSalaFisica}").click();
    Sleep   3

Limpar a capacidade da Turma    
    Clear Element Text    ${campoCapacidadeTurma}

Visualizar a mensagem: INFORME A CAPACIDADE DA TURMA.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Informe a Capacidade da Turma.')]
    Sleep   3

Visualizar a mensagem: INFORME A GRADE DE AULA.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Informe a Grade de Aula.')]
    Sleep   3

Visualizar a mensagem: INFORME O PROGRAMA CURRICULAR.
    Wait Until Page Contains Element    //span[contains(.,'Informe o Programa Curricular.')]
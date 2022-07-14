*** Settings ***
Library    SeleniumLibrary

*** Variables ***

${botaoNovaTurmaTurma}                  cphContent_btnCad
${campoEtapaModalidadeTurma}            cphContent_ddlTipoEnsino
${campoCursoTurma}                      cphContent_ddlCurso
${campoCicloTurma}                      cphContent_ddlCiclo
${campoPeriodoTurma}                    cphContent_ddlPeriodo
${campoTurmaTurma}                      cphContent_ddlTurma
${campoGradeAulaTurma}                  cphContent_ddlCalendarioPadrao
${campoProgramaCurricularTurma}         cphContent_ddlProgramaCurricular
${campoSalaFisica}                      cphContent_dtlGerarClasse_lbtSelecionar_0
${campoCapacidadeTurma}                 cphContent_txtCapacidadeInformada
${botaoSalvarTurma}                     cphContent_btnSalvar
${botaoNaoTurma}                        cphContent_Mensagem_Padrao_btnNao
${botaoNovaTurmaMulti}                  cphContent_btnClasseMultisseriada
${campoAnualSemestral}                  cphContent_ddlTipoEnsino

*** Keywords ***
Clicar em Nova Turma Regular
    Execute JavaScript  document.getElementById("${botaoNovaTurmaTurma}").click();
    Wait Until Page Contains  Gerar Turma Regular

No cadastro de turma, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Set Suite Variable      ${etapaModalidade}
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("1|EI|0").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("4|EF|0").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("5|EJA1S|1").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeTurma}').trigger('change');
    Sleep   3

Em Curso, selecionar "${curso}"
    Run Keyword If    '${curso}' == 'CRECHE'  Execute JavaScript   $('#${campoCursoTurma}').val("1").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'PRÉ-ESCOLA'  Execute JavaScript   $('#${campoCursoTurma}').val("3").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoCursoTurma}').val("2").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoCursoTurma}').val("4").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("5").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCursoTurma}').trigger('change');
    Sleep   3

Em Ciclo, selecionar "${ciclo}"
    Run Keyword If    '${ciclo}' == 'ESTÁGIO I'  Execute JavaScript   $('#${campoCicloTurma}').val("6|EI|G4").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'ESTÁGIO II'  Execute JavaScript   $('#${campoCicloTurma}').val("7|EII|G5").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '4° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("14|4º|4").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '5° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("15|5º|5").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'SEMESTRE 3'  Execute JavaScript   $('#${campoCicloTurma}').val("43|S3|S3").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'SEMESTRE 4'  Execute JavaScript   $('#${campoCicloTurma}').val("44|S4|S4").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCicloTurma}').trigger('change');
    Sleep   3

Em Período, selecionar "${periodo}"
    Run Keyword If    '${periodo}' == 'INTEGRAL'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14650|I|1").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'MISTO'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15324|MISTO|6").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'MANHÃ'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14648|M|2").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'TARDE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14649|T|3").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'NOITE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15221|N|4").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'INTERMEDIÁRIO'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15332|IN|5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoPeriodoTurma}').trigger('change');
    Sleep   3

Em Turma, selecionar "${turma}"
    Run Keyword If    '${turma}' == 'P'  Execute JavaScript   $('#${campoTurmaTurma}').val("16").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'Q'  Execute JavaScript   $('#${campoTurmaTurma}').val("17").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'R'  Execute JavaScript   $('#${campoTurmaTurma}').val("18").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'S'  Execute JavaScript   $('#${campoTurmaTurma}').val("19").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'T'  Execute JavaScript   $('#${campoTurmaTurma}').val("20").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'U'  Execute JavaScript   $('#${campoTurmaTurma}').val("21").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'V'  Execute JavaScript   $('#${campoTurmaTurma}').val("22").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'W'  Execute JavaScript   $('#${campoTurmaTurma}').val("25").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'X'  Execute JavaScript   $('#${campoTurmaTurma}').val("24").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'Y'  Execute JavaScript   $('#${campoTurmaTurma}').val("23").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'Z'  Execute JavaScript   $('#${campoTurmaTurma}').val("26").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaTurma}').trigger('change');
    Sleep   5

Em Grade de Aula, selecionar "${gradeAula}"
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - MANHÃ'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("14710").trigger('chosen:updated');
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - TARDE'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("14711").trigger('chosen:updated');
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - NOITE'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("15274").trigger('chosen:updated');
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - MISTO'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("15406").trigger('chosen:updated');
    Execute JavaScript   $('#${campoGradeAulaTurma}').trigger('change');
    Sleep   3

Em Programa Curricular, selecionar "${programaCurricular}"
    Run Keyword If    '${programaCurricular}' == 'ESTÁGIO II'  Execute JavaScript   $('#${campoProgramaCurricularTurma}').val("42646|1234").trigger('chosen:updated');
    Run Keyword If    '${programaCurricular}' == '5º ANO'  Execute JavaScript   $('#${campoProgramaCurricularTurma}').val("45150|1246").trigger('chosen:updated');
    Run Keyword If    '${programaCurricular}' == 'EJA'  Execute JavaScript   $('#${campoProgramaCurricularTurma}').val("44455|1266").trigger('chosen:updated');

Selecionar uma Sala Física
    Execute JavaScript  document.getElementById("${campoSalaFisica}").click();
    Sleep   3

Em Capacidade da Turma, inserir a quantidade "${capacidade}"
    Input Text   ${campoCapacidadeTurma}    ${capacidade}

Na Turma, clicar em Salvar
    Execute JavaScript  document.getElementById("${botaoSalvarTurma}").click();
    Sleep   3

No modal para cadastrar outra turma, clique em Não
    Execute JavaScript  document.getElementById("${botaoNaoTurma}").click();
    Sleep   3
    Wait Until Page Contains  Consultar Turma

Clicar em Nova Turma Multisseriada
    Execute JavaScript  document.getElementById("${botaoNovaTurmaMulti}").click();
    Wait Until Page Contains  Gerar Turma Multisseriada    10

Em Anual/Semanal, selecionar "${anualSemanal}"
    Run Keyword If    '${anualSemanal}' == 'ANUAL'  Execute JavaScript   $('#${campoAnualSemestral}').val("0").trigger('chosen:updated');
    Run Keyword If    '${anualSemanal}' == '1° SEMESTRE'  Execute JavaScript   $('#${campoAnualSemestral}').val("1").trigger('chosen:updated');
    Run Keyword If    '${anualSemanal}' == '2° SEMESTRE'  Execute JavaScript   $('#${campoAnualSemestral}').val("2").trigger('chosen:updated');
    Execute JavaScript   $('#${campoAnualSemestral}').trigger('change');
    Sleep    2

No grid de Etapa, selecionar "${cicloMulti}"
    Run Keyword If    '${cicloMulti}' == 'BERCARIO I'   Execute JavaScript  document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_0").click();
    Run Keyword If    '${cicloMulti}' == 'BERCARIO II'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_1").click();
    Run Keyword If    '${cicloMulti}' == 'MATERNAL'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_2").click();
    Run Keyword If    '${cicloMulti}' == 'ESTÁGIO I'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_3").click();
    Run Keyword If    '${cicloMulti}' == 'ESTÁGIO II'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_4").click();
    Run Keyword If    '${cicloMulti}' == '1° ANO'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_5").click();
    Run Keyword If    '${cicloMulti}' == '2° ANO'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_6").click();
    Run Keyword If    '${cicloMulti}' == '3° ANO'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_7").click();
    Run Keyword If    '${cicloMulti}' == '4° ANO'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_8").click();
    Run Keyword If    '${cicloMulti}' == '5° ANO'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_9").click();
    Run Keyword If    '${cicloMulti}' == 'ATENDIMENTO EDUCACIONAL ESPECIALIZADO'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_11").click();
    Run Keyword If    '${cicloMulti}' == '1° ANO - EE'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_10").click();
    Run Keyword If    '${cicloMulti}' == '2° ANO - EE'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_12").click();
    Run Keyword If    '${cicloMulti}' == '3° ANO - EE'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_13").click();
    Run Keyword If    '${cicloMulti}' == '4° ANO - EE'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_14").click();
    Run Keyword If    '${cicloMulti}' == '5° ANO - EE'  Execute JavaScript   document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_15").click();
    Sleep    2
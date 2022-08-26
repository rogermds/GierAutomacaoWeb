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
    Sleep   2

Em Turma, selecionar "${turma}"
    Run Keyword If    '${turma}' == 'I'  Execute JavaScript   $('#${campoTurmaTurma}').val("9").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'W'  Execute JavaScript   $('#${campoTurmaTurma}').val("25").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'X'  Execute JavaScript   $('#${campoTurmaTurma}').val("24").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'Y'  Execute JavaScript   $('#${campoTurmaTurma}').val("23").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '1A'  Execute JavaScript    $('#${campoTurmaTurma}').val("110725").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '1B'  Execute JavaScript   $('#${campoTurmaTurma}').val("110726").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '2A'  Execute JavaScript   $('#${campoTurmaTurma}').val("110788").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '3A'  Execute JavaScript   $('#${campoTurmaTurma}').val("110822").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '3B'  Execute JavaScript   $('#${campoTurmaTurma}').val("110825").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '4A'  Execute JavaScript   $('#${campoTurmaTurma}').val("111827").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '4B'  Execute JavaScript   $('#${campoTurmaTurma}').val("111831").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '5A'  Execute JavaScript   $('#${campoTurmaTurma}').val("112170").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '5B'  Execute JavaScript   $('#${campoTurmaTurma}').val("112173").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '5D'  Execute JavaScript   $('#${campoTurmaTurma}').val("115159").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '5X'  Execute JavaScript   $('#${campoTurmaTurma}').val("115161").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'BI AT'  Execute JavaScript   $('#${campoTurmaTurma}').val("111819").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'BII AM'  Execute JavaScript   $('#${campoTurmaTurma}').val("110764").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'BII BM'  Execute JavaScript   $('#${campoTurmaTurma}').val("112335").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'BII BT'  Execute JavaScript   $('#${campoTurmaTurma}').val("110758").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI A'  Execute JavaScript   $('#${campoTurmaTurma}').val("110603").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI B'  Execute JavaScript   $('#${campoTurmaTurma}').val("110614").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI C'  Execute JavaScript   $('#${campoTurmaTurma}').val("110627").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI D'  Execute JavaScript   $('#${campoTurmaTurma}').val("110644").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI E'  Execute JavaScript   $('#${campoTurmaTurma}').val("110653").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI W'  Execute JavaScript   $('#${campoTurmaTurma}').val("115163").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI X'  Execute JavaScript   $('#${campoTurmaTurma}').val("115164").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII A'  Execute JavaScript   $('#${campoTurmaTurma}').val("110667").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII B'  Execute JavaScript   $('#${campoTurmaTurma}').val("110673").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII C'  Execute JavaScript   $('#${campoTurmaTurma}').val("110677").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII D'  Execute JavaScript   $('#${campoTurmaTurma}').val("110683").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII G'  Execute JavaScript   $('#${campoTurmaTurma}').val("115158").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII Z'  Execute JavaScript   $('#${campoTurmaTurma}').val("112356").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT AI'  Execute JavaScript   $('#${campoTurmaTurma}').val("113359").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT AM'  Execute JavaScript   $('#${campoTurmaTurma}').val("113358").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT AT'  Execute JavaScript   $('#${campoTurmaTurma}').val("110781").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT BI'  Execute JavaScript   $('#${campoTurmaTurma}').val("112337").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT BM'  Execute JavaScript   $('#${campoTurmaTurma}').val("110773").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT BT'  Execute JavaScript   $('#${campoTurmaTurma}').val("111814").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaTurma}').trigger('change');
    Sleep   2

Em Grade de Aula, selecionar "${gradeAula}"
    Run Keyword If    '${gradeAula}' == 'SELECIONE'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("-1").trigger('chosen:updated');
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
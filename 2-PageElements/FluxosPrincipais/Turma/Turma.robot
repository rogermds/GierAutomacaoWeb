*** Settings ***
Library    SeleniumLibrary
Library    String
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${campoCalendario}                      cphContent_ddlCalendarioEscola
${botaoNaoTurma}                        cphContent_Mensagem_Padrao_btnNao
${botaoNovaTurmaMulti}                  cphContent_btnClasseMultisseriada
${campoAnualSemestral}                  cphContent_ddlTipoEnsino
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
${botaoOk}                              cphContent_Mensagem_Padrao_btnOk

*** Keywords ***
Clicar em Nova Turma Regular
    Execute JavaScript  document.getElementById("${botaoNovaTurmaTurma}").click();
    Wait Until Page Contains  Gerar Turma Regular

No cadastro de turma, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Set Suite Variable      ${etapaModalidade}
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("1|EI|0").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("4|EF|0").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("5|EJA1S|1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("6|EJA2S|2").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeTurma}').trigger('change');
    Aguardar tela de carregamento

Em Curso, selecionar "${curso}"
    Run Keyword If    '${curso}' == 'CRECHE'  Execute JavaScript   $('#${campoCursoTurma}').val("1").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'PRÉ-ESCOLA'  Execute JavaScript   $('#${campoCursoTurma}').val("3").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoCursoTurma}').val("2").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoCursoTurma}').val("4").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("5").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("6").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("6").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("9").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCursoTurma}').trigger('change');
    Aguardar tela de carregamento

Em Ciclo, selecionar "${ciclo}"
    Run Keyword If    '${ciclo}' == 'ESTÁGIO I'  Execute JavaScript   $('#${campoCicloTurma}').val("6|EI|G4").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'ESTÁGIO II'  Execute JavaScript   $('#${campoCicloTurma}').val("7|EII|G5").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '4° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("14|4º|4").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '5° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("15|5º|5").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'SEMESTRE 3'  Execute JavaScript   $('#${campoCicloTurma}').val("43|S3|S3").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'SEMESTRE 4'  Execute JavaScript   $('#${campoCicloTurma}').val("44|S4|S4").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCicloTurma}').trigger('change');
    Aguardar tela de carregamento

Em Período, selecionar "${periodo}"
    Run Keyword If    '${periodo}' == 'INTEGRAL'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14650|I|1").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'MISTO'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15347|MISTO|6").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'MANHÃ'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15219|M|2").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'TARDE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15220|T|3").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'NOITE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15221|N|4").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'INTERMEDIÁRIO'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15332|IN|5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoPeriodoTurma}').trigger('change');
    Aguardar tela de carregamento

Em Turma, selecionar "${turma}"
    Set Suite Variable    ${turma}
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
    Aguardar tela de carregamento

No cadastro de Turma, selecionar Calendário
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'    Execute JavaScript   $('#${campoCalendario}').val("1374").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'    Execute JavaScript   $('#${campoCalendario}').val("1516").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCalendario}').trigger('change');

Em Grade de Aula, selecionar "${gradeAula}"
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - MANHÃ'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("14710").trigger('chosen:updated');
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - TARDE'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("15273").trigger('chosen:updated');
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - NOITE'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("15274").trigger('chosen:updated');
    Run Keyword If    '${gradeAula}' == 'GRADE DE HORARIO - MISTO'  Execute JavaScript   $('#${campoGradeAulaTurma}').val("15428").trigger('chosen:updated');
    Execute JavaScript   $('#${campoGradeAulaTurma}').trigger('change');
    Aguardar tela de carregamento

Em Programa Curricular, selecionar "${programaCurricular}"
    Run Keyword If    '${programaCurricular}' == 'ESTÁGIO II'  Execute JavaScript   $('#${campoProgramaCurricularTurma}').val("42668|1234").trigger('chosen:updated');
    Run Keyword If    '${programaCurricular}' == '5º ANO'  Execute JavaScript   $('#${campoProgramaCurricularTurma}').val("43568|1247").trigger('chosen:updated');
    Run Keyword If    '${programaCurricular}' == 'EJA'  Execute JavaScript   $('#${campoProgramaCurricularTurma}').val("44455|1266").trigger('chosen:updated');

Selecionar uma Sala Física
    Execute JavaScript  document.getElementById("${campoSalaFisica}").click();
    Aguardar tela de carregamento

Em Capacidade da Turma, inserir a quantidade "${capacidade}"
    Clear Element Text    ${campoCapacidadeTurma}
    Input Text   ${campoCapacidadeTurma}    ${capacidade}

No modal para cadastrar outra turma, clique em Não
    Execute JavaScript  document.getElementById("${botaoNaoTurma}").click();
    Aguardar tela de carregamento

Verificar se a página retornou a busca de turma
    Wait Until Page Contains    Consultar Turma

Clicar em Nova Turma Multisseriada
    Execute JavaScript  document.getElementById("${botaoNovaTurmaMulti}").click();
    Wait Until Page Contains  Gerar Turma Multisseriada    10

Em Anual/Semanal, selecionar "${anualSemanal}"
    Run Keyword If    '${anualSemanal}' == 'ANUAL'  Execute JavaScript   $('#${campoAnualSemestral}').val("0").trigger('chosen:updated');
    Run Keyword If    '${anualSemanal}' == '1° SEMESTRE'  Execute JavaScript   $('#${campoAnualSemestral}').val("1").trigger('chosen:updated');
    Run Keyword If    '${anualSemanal}' == '2° SEMESTRE'  Execute JavaScript   $('#${campoAnualSemestral}').val("2").trigger('chosen:updated');
    Execute JavaScript   $('#${campoAnualSemestral}').trigger('change');
    Aguardar tela de carregamento

No grid de Etapa, selecionar os semestres correspondentes
    Execute JavaScript    document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_6").click();
    Aguardar tela de carregamento
    Execute JavaScript    document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_7").click();
    Aguardar tela de carregamento
    Execute JavaScript    document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_8").click();
    Aguardar tela de carregamento
    Execute JavaScript    document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_9").click();
    Aguardar tela de carregamento
    Execute JavaScript    document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_10").click();
    Aguardar tela de carregamento
    Execute JavaScript    document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_11").click();
    Aguardar tela de carregamento

Buscar e editar o resultado que corresponde a sala criada
    FOR     ${index}    IN RANGE    0    20
        ${botaoEditar}    Set Variable    cphContent_dtlConsulta_lnkEditar_${index}
        ${botaoAcoes}    Set Variable    //input[@name='ctl00$cphContent$dtlConsulta$ctl0${index}$A2'][contains(@id,'${index}')]
        ${busca}    Set Variable    cphContent_dtlConsulta_lblCodClassse_${index}
        
        IF  '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    EII${turma}
        ELSE IF    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    5${turma}
        ELSE IF    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    CII${turma}
        END

        IF    ${resultado}
            Execute JavaScript  xPathResult = document.evaluate(" ${botaoAcoes}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
            Execute JavaScript  xPathResult.singleNodeValue.click()
            Execute JavaScript  document.getElementById("${botaoEditar}").click();
            Aguardar tela de carregamento
        END
    END

Na consulta de turma, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Set Suite Variable      ${etapaModalidade}
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("5").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("6").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO ESPECIAL EXCLUSIVA'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("12").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeTurma}').trigger('change');
    Aguardar tela de carregamento

Na consulta de turma, em Curso, selecionar "${curso}"
    Run Keyword If    '${curso}' == 'CRECHE'  Execute JavaScript   $('#${campoCursoTurma}').val("1").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'PRÉ-ESCOLA'  Execute JavaScript   $('#${campoCursoTurma}').val("3").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoCursoTurma}').val("2").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoCursoTurma}').val("4").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("5").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("6").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("9").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'EDUCAÇÃO ESPECIAL EXCLUSIVA'  Execute JavaScript   $('#${campoCursoTurma}').val("15").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCursoTurma}').trigger('change');
    Aguardar tela de carregamento

Na consulta de turma, em Período, selecionar "${periodo}"
    Run Keyword If    '${periodo}' == 'MISTO'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15347|MISTO").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'MANHÃ'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14648|M").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'TARDE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15220|T").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'NOITE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15221|N").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'INTERMEDIÁRIO'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15332|IN").trigger('chosen:updated');

Na consulta de turma, em Ciclo, selecionar "${ciclo}"
    Run Keyword If    '${ciclo}' == 'ESTÁGIO I'  Execute JavaScript   $('#${campoCicloTurma}').val("6|EI").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'ESTÁGIO II'  Execute JavaScript   $('#${campoCicloTurma}').val("7|EII").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '4° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("14|4º").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '5° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("15|5º").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'SEMESTRE 3'  Execute JavaScript   $('#${campoCicloTurma}').val("49|S3").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'SEMESTRE 4'  Execute JavaScript   $('#${campoCicloTurma}').val("50|S4").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '1º ANO - EE'  Execute JavaScript   $('#${campoCicloTurma}').val("71|1º EE").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '2º ANO - EE'  Execute JavaScript   $('#${campoCicloTurma}').val("73|2º EE").trigger('chosen:updated');

Em Professor Responsável, clicar em EXCLUIR
    Execute JavaScript  document.getElementById("cphContent_dtlProfessor_lkbDelete_0").click();
    Aguardar tela de carregamento

Em Professor Responsável, clicar em INSERIR
    Execute JavaScript  document.getElementById("cphContent_dtlProfessor_lbtSelecionar_0").click();
    Aguardar tela de carregamento
    
Em Professor Responsável, selecionar ADRIANA HOLLAIS SANTOS REIS
    Execute JavaScript  document.getElementById("cphContent_dtlProfessor_lbtSelecionar_0").click();
    Aguardar tela de carregamento

Buscar e visualizar o resultado que corresponde a sala criada
    FOR     ${index}    IN RANGE    0    20
        ${botaoVisualizar}    Set Variable    cphContent_dtlConsulta_lnkVisualizar_${index}
        ${botaoAcoes}    Set Variable    //input[@name='ctl00$cphContent$dtlConsulta$ctl0${index}$A2'][contains(@id,'${index}')]
        ${busca}    Set Variable    cphContent_dtlConsulta_lblCodClassse_${index}
        
        IF  '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    EII${turma}
        ELSE IF    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    5${turma}
        ELSE IF    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    CII${turma}
        END

        IF    ${resultado}
            Execute JavaScript  xPathResult = document.evaluate(" ${botaoAcoes}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
            Execute JavaScript  xPathResult.singleNodeValue.click()
            Execute JavaScript  document.getElementById("${botaoVisualizar}").click();
            Aguardar tela de carregamento
        END
    END

Verificar se em Etapa/Modalidade, em Multisseriada, está selecionado "${texto}"
    ${maiuscula}    Convert To Upper Case    ${texto}
    Element Attribute Value Should Be    cphContent_txtTipoEnsino    value    ${maiuscula}

Verificar se em Curso, em Multisseriada, está selecionado "${texto}"
    ${maiuscula}    Convert To Upper Case    ${texto}
    Element Attribute Value Should Be    cphContent_txtCurso    value    ${maiuscula}

Verificar se em Período, em Multisseriada, está selecionado "${texto}"
    ${maiuscula}    Convert To Upper Case    ${texto}
    Element Attribute Value Should Be    cphContent_txtPeriodo    value    ${maiuscula}

Verificar se em Etapa/Modalidade está selecionado "${texto}"
    ${maiuscula}    Convert To Upper Case    ${texto}
    Wait Until Element Contains    //span[contains(.,'${texto}')]    ${maiuscula}

Verificar se em Curso está selecionado "${texto}"
    ${maiuscula}    Convert To Upper Case    ${texto}
    Wait Until Element Contains    //span[contains(.,'${texto}')]    ${maiuscula}

Verificar se em Ciclo está selecionado "${texto}"
    ${maiuscula}    Convert To Upper Case    ${texto}
    Wait Until Element Contains    //span[contains(.,'${texto}')]    ${maiuscula}

Verificar se em Período está selecionado "${texto}"
    ${maiuscula}    Convert To Upper Case    ${texto}
    Wait Until Element Contains    (//span[contains(.,'${texto}')])[1]   ${maiuscula}

Verificar se em Capacidade da Turma está a quantidade "${texto}"
    Element Attribute Value Should Be    cphContent_txtCapacidadeInformada    value    ${texto}

Verificar se o professor responsável é "${texto}"
    Wait Until Element Contains    cphContent_dtlProfessor_lblNomeProfessorTd_0   ${texto}

Buscar e excluir o resultado que corresponde a sala criada
    FOR     ${index}    IN RANGE    0    20
        ${botaoExcluir}    Set Variable    cphContent_dtlConsulta_lnkExcluir_${index}
        ${botaoAcoes}    Set Variable    //input[@name='ctl00$cphContent$dtlConsulta$ctl0${index}$A2'][contains(@id,'${index}')]
        ${busca}    Set Variable    cphContent_dtlConsulta_lblCodClassse_${index}
        
        IF  '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    EII${turma}
        ELSE IF    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    5${turma}
        ELSE IF    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'
            ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    CII${turma}
        END

        IF    ${resultado}
            Execute JavaScript  xPathResult = document.evaluate(" ${botaoAcoes}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
            Execute JavaScript  xPathResult.singleNodeValue.click()
            Execute JavaScript  document.getElementById("${botaoExcluir}").click();
            Aguardar tela de carregamento
        END
    END

No modal de exclusão, clicar em Sim
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento
    
No modal de exclusão, clicar em Ok
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Verificar se a sala não aparece nos resultados
    FOR     ${index}    IN RANGE    0    20
        ${busca}    Set Variable    cphContent_dtlConsulta_lblCodClassse_${index}
        ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    EII${turma}
        IF    ${resultado}
            Fail    Turma não foi excluída
        END
    END
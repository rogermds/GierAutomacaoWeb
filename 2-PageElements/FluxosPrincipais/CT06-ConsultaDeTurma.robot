*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Na consulta de turma, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Set Suite Variable      ${etapaModalidade}
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeTurma}').val("5").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeTurma}').trigger('change');
    Sleep   3

Na consulta de turma, em Curso, selecionar "${curso}"
    Run Keyword If    '${curso}' == 'CRECHE'  Execute JavaScript   $('#${campoCursoTurma}').val("1").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'PRÉ-ESCOLA'  Execute JavaScript   $('#${campoCursoTurma}').val("3").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoCursoTurma}').val("2").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoCursoTurma}').val("4").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO I' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("5").trigger('chosen:updated');
    Run Keyword If    '${curso}' == 'CICLO II' and '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoCursoTurma}').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCursoTurma}').trigger('change');
    Sleep   3

Na consulta de turma, em Período, selecionar "${periodo}"
    Run Keyword If    '${periodo}' == 'MISTO'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15324|MISTO").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'MANHÃ'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14648|M").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'TARDE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("14649|T").trigger('chosen:updated');
    Run Keyword If    '${periodo}' == 'NOITE'  Execute JavaScript   $('#${campoPeriodoTurma}').val("15221|N").trigger('chosen:updated');

Na consulta de turma, em Ciclo, selecionar "${ciclo}"
    Run Keyword If    '${ciclo}' == 'ESTÁGIO I'  Execute JavaScript   $('#${campoCicloTurma}').val("6|EI").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'ESTÁGIO II'  Execute JavaScript   $('#${campoCicloTurma}').val("7|EII").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '4° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("14|4º").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == '5° ANO'  Execute JavaScript   $('#${campoCicloTurma}').val("15|5º").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'SEMESTRE 3'  Execute JavaScript   $('#${campoCicloTurma}').val("49|S3").trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'SEMESTRE 4'  Execute JavaScript   $('#${campoCicloTurma}').val("50|S4").trigger('chosen:updated');


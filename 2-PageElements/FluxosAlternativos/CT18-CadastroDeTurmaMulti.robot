*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${botaoNovaTurmaMulti}                  cphContent_btnClasseMultisseriada
${campoAnualSemestral}                  cphContent_ddlTipoEnsino

*** Keywords ***
Clicar em Nova Turma Multisseriada
    Execute JavaScript  document.getElementById("${botaoNovaTurmaMulti}").click();
    Wait Until Page Contains  Gerar Turma Multisseriada    10

Visualizar a mensagem: SELECIONE MAIS UMA MATRIZ CURRICULAR PARA CADASTRAR A TURMA MULTISSERIADA.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Selecione mais uma matriz curricular para cadastrar a Turma multisseriada')]
    Sleep    2

Em Anual/Semanal, selecionar "${anualSemanal}"
    Run Keyword If    '${anualSemanal}' == 'ANUAL'  Execute JavaScript   $('#${campoAnualSemestral}').val("0").trigger('chosen:updated');
    Run Keyword If    '${anualSemanal}' == '1° SEMESTRE'  Execute JavaScript   $('#${campoAnualSemestral}').val("1").trigger('chosen:updated');
    Run Keyword If    '${anualSemanal}' == '2° SEMESTRE'  Execute JavaScript   $('#${campoAnualSemestral}').val("2").trigger('chosen:updated');
    Execute JavaScript   $('#${campoAnualSemestral}').trigger('change');
    Sleep    2

Em Grid, selecionar "${cicloMulti}"
    Run Keyword If    '${cicloMulti}' == 'BERCARIO I'   Execute JavaScript  document.getElementById("cphContent_dtlMatrizCurricular_ckbProgramaCurricularEscola_0").click();
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

Visualizar a mensagem: SELECIONE A TURMA
    Wait Until Page Contains Element    //span[contains(.,'Selecione a Turma')]
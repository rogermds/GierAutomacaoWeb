*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${campoAnoLetivo}                          cphContent_ddlAnoLetivo
${campoetapaModalidadeControle}            cphContent_ddlEtapaModalidade
${campoClasseControle}                     cphContent_ddlClasse
${campoProfControle}                       cphContent_ddlProfessor
${botaoDiarioDeTurmaControle}              cphContent_btnDiarioTurma
${botaoIncluirDiario}                            cphContent_btnIncluir
${botaoOk}                                 cphContent_Mensagem_Padrao_btnOk

*** Keywords ***
Visualizar a mensagem: INFORME O PROFESSOR.
    Wait Until Page Contains Element    //span[contains(.,'Informe o Professor.')]

Em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoetapaModalidadeControle}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoetapaModalidadeControle}').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#${campoetapaModalidadeControle}').trigger('change');
    Sleep    2

Em Professor, selecionar "${profControle}"
    Run Keyword If    '${profControle}' == 'ALEXANDRE FERREIRA DE ALMEIDA'  Execute JavaScript   $('#${campoProfControle}').val("8924").trigger('chosen:updated');
    Run Keyword If    '${profControle}' == 'CAROLINA CALDEIRA CELESTINO'  Execute JavaScript   $('#${campoProfControle}').val("3733").trigger('chosen:updated');
    Run Keyword If    '${profControle}' == 'DANIELA MACHADO OLIVEIRA'  Execute JavaScript   $('#${campoProfControle}').val("8702").trigger('chosen:updated');
    Run Keyword If    '${profControle}' == 'FELIPE VITORIANO DE MORAES'  Execute JavaScript   $('#${campoProfControle}').val("8965").trigger('chosen:updated');
    Execute JavaScript   $('#${campoProfControle}').trigger('change');
    Sleep    2

Visualizar a mensagem: INFORME A TURMA.
    Wait Until Page Contains Element    //span[contains(.,'Informe a Turma.')]

Em campo turma, selecionar "${turmaControle}" 
    Run Keyword If    '${turmaControle}' == '1B'  Execute JavaScript   $('#${campoClasseControle}').val("110726").trigger('chosen:updated');
    Run Keyword If    '${turmaControle}' == '3B'  Execute JavaScript   $('#${campoClasseControle}').val("110825").trigger('chosen:updated');
    Run Keyword If    '${turmaControle}' == '4B'  Execute JavaScript   $('#${campoClasseControle}').val("111831").trigger('chosen:updated');
    Run Keyword If    '${turmaControle}' == '5B'  Execute JavaScript   $('#${campoClasseControle}').val("112173").trigger('chosen:updated');
    Execute JavaScript   $('#${campoClasseControle}').trigger('change');
    Sleep    2

Clicar no botão 'Diário de Turma'
    Wait Until Element Is Visible    ${botaoDiarioDeTurmaControle}    20
    Execute JavaScript  document.getElementById("${botaoDiarioDeTurmaControle}").click();
    Wait Until Element Is Visible    ${botaoSalvar}    20

Visualizar a mensagem: É NECESSÁRIO SELECIONAR AO MENOS DOIS EDUCANDOS PARA PROSSEGUIR.
    Wait Until Page Contains Element    //span[contains(.,'É NECESSÁRIO SELECIONAR AO MENOS DOIS EDUCANDOS PARA PROSSEGUIR.')]
    Sleep    3

Clicar em OK no modal do Diário de Classe
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Sleep    2    

Selecionar dois Educandos na Grid 
    Execute JavaScript  document.getElementById("cphContent_dtlAlunos_chkAluno_0").click();
    Execute JavaScript  document.getElementById("cphContent_dtlAlunos_chkAluno_1").click();
    
Clicar em 'Incluir'
    Execute JavaScript  document.getElementById("${botaoIncluirDiario}").click();
    
Visualizar a mensagem: EXISTEM CAMPOS DE PREENCHIMENTO OBRIGATÓRIO NÃO PREENCHIDOS. PREENCHA OS CAMPOS PARA CONTINUAR.
    Wait Until Page Contains Element    //span[contains(.,'EXISTEM CAMPOS DE PREENCHIMENTO OBRIGATÓRIO NÃO PREENCHIDOS. PREENCHA OS CAMPOS PARA CONTINUAR.')]
*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***
${adicionarApoio}                    cphContent_btnAdicionarApoio
${adicionarEspecialista}             cphContent_btnAdicionarEspecialista
${campoEtapaModalidadeProntuario}    cphContent_ListaPiloto_ddlEtapaModalidade
${campoTurmaProntuario}              cphContent_ListaPiloto_ddlTurma
${botaoPesquisarProntuario}          cphContent_ListaPiloto_btnPesquisar
${botaoOkProntuario}                 cphContent_ListaPiloto_MensagemPadrao_btnOk


*** Keywords ***
Em Etapa/Modalidade no Prontuário, selecionar "${etapaModalide}"
    Run Keyword If    '${etapaModalide}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeProntuario}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalide}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeProntuario}').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeProntuario}').trigger('change');
    Sleep   3

Clicar em Pesquisar no Prontuário do Educando 
    Execute JavaScript  document.getElementById("${botaoPesquisarProntuario}").click();

Visualizar a mensagem: INFORME UMA TURMA
    Wait Until Page Contains Element    //span[contains(.,'Informe uma Turma')]
    Sleep    3

Clicar em OK no modal de alerta do Prontuário
    Execute JavaScript  document.getElementById("${botaoOkProntuario}").click()
    Sleep    3

Em campo turma no Prontuário, selecionar "${Turma}"
    Run Keyword If    '${Turma}' == '1A'  Execute JavaScript    $('#${campoTurmaProntuario}').val("117025").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '1B'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110726").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '2A'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110788").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '3A'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110822").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '3B'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110825").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '4A'  Execute JavaScript   $('#${campoTurmaProntuario}').val("111827").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '4B'  Execute JavaScript   $('#${campoTurmaProntuario}').val("111831").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '5A'  Execute JavaScript   $('#${campoTurmaProntuario}').val("112170").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '5B'  Execute JavaScript   $('#${campoTurmaProntuario}').val("112173").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '5D'  Execute JavaScript   $('#${campoTurmaProntuario}').val("115159").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == '5X'  Execute JavaScript   $('#${campoTurmaProntuario}').val("115161").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'BI AT'  Execute JavaScript   $('#${campoTurmaProntuario}').val("111819").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'BII AM'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110764").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'BII BM'  Execute JavaScript   $('#${campoTurmaProntuario}').val("112335").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'BII BT'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110758").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI A'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110603").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI B'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110614").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI C'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110627").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI D'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110644").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI E'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110653").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI W'  Execute JavaScript   $('#${campoTurmaProntuario}').val("115163").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EI X'  Execute JavaScript   $('#${campoTurmaProntuario}').val("115164").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII A'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110667").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII B'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110673").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII C'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110677").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII D'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110683").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII G'  Execute JavaScript   $('#${campoTurmaProntuario}').val("115158").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'EII Z'  Execute JavaScript   $('#${campoTurmaProntuario}').val("112356").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT AI'  Execute JavaScript   $('#${campoTurmaProntuario}').val("113359").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT AM'  Execute JavaScript   $('#${campoTurmaProntuario}').val("113358").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT AT'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110781").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT BI'  Execute JavaScript   $('#${campoTurmaProntuario}').val("112337").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT BM'  Execute JavaScript   $('#${campoTurmaProntuario}').val("110773").trigger('chosen:updated');
    Run Keyword If    '${Turma}' == 'MAT BT'  Execute JavaScript   $('#${campoTurmaProntuario}').val("111814").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaProntuario}').trigger('change');
    Sleep   3

Clicar em Adicionar para Apoio Escolar
    Wait Until Element Is Visible    ${adicionarApoio}    20
    Execute JavaScript  document.getElementById("${adicionarApoio}").click();
    
Visualizar a mensagem: INFORME UM COMPONENTE DE APOIO ESCOLAR.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Informe um Componente de Apoio Escolar.')]
    
Clicar em Adicionar para Avaliação por Especialista
    Execute JavaScript  document.getElementById("${adicionarEspecialista}").click();
    
Visualizar a mensagem: INFORME UMA ESPECIALIDADE.
    Wait Until Page Contains Element    //div[contains(@id,'painelMsg')][contains(.,'Informe uma Especialidade.')]
    
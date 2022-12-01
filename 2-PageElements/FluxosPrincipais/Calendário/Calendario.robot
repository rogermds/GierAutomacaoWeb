*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***

*** Keywords ***
Em Calendário Escolar, em Etapa/Modalidade, selecionar "${etapaModalidadeCalendario}"
    Execute JavaScript   $("#cphContent_ddlModalidadeEnsino").val($('option:contains("${etapaModalidadeCalendario}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlModalidadeEnsino').trigger('change');
    Aguardar tela de carregamento

Em Calendário Escolar, selecionar o Calendário "${calendarioCalendario}"
    Execute JavaScript   $("#cphContent_ddlCalendario").val($('option:contains("${calendarioCalendario}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCalendario').trigger('change');
    Aguardar tela de carregamento

Em Calendário Escolar, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Calendário Escolar, clicar em Editar
    Execute JavaScript  document.getElementById("cphContent_btnEditar").click();
    Aguardar tela de carregamento
    
Em Calendário Escolar, em Data de Fim, inserir "${dataFimCalendario}"
    Clear Element Text    cphContent_txtValidade
    Input Text    cphContent_txtValidade    ${dataFimCalendario}

Em Calendário Escolar, clicar em Calcular Dias
    Execute JavaScript  document.getElementById("cphContent_btnCalcularDias").click();
    Aguardar tela de carregamento
    
Em Calendário Escolar, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento
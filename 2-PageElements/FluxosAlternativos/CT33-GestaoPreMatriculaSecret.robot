*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${campoCicloDestino}                  cphContent_ddlCiclo
${campoEscolaDestino}                 cphContent_ddlEscolaDestino
              

*** Keywords ***
Em Ciclo Destino, selecionar "${Ciclo}"
    Run Keyword If    '${Ciclo}' == 'Selecione'  Execute JavaScript   $('#${campoCicloDestino}').val("0").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Creche-Bercário I'  Execute JavaScript   $('#${campoCicloDestino}').val("1").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Creche-Bercário II'  Execute JavaScript   $('#${campoCicloDestino}').val("2").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Creche-Maternal'  Execute JavaScript   $('#${campoCicloDestino}').val("3").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Pré-Escola-Estágio I'  Execute JavaScript   $('#${campoCicloDestino}').val("6").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Pré-Escola-Estágio II'  Execute JavaScript   $('#${campoCicloDestino}').val("7").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Ciclo I-1º Ano'  Execute JavaScript   $('#${campoCicloDestino}').val("11").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Ciclo I-2º Ano'  Execute JavaScript   $('#${campoCicloDestino}').val("12").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Ciclo I-3º Ano'  Execute JavaScript   $('#${campoCicloDestino}').val("13").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Ciclo II-4º Ano'  Execute JavaScript   $('#${campoCicloDestino}').val("14").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Ciclo II-5º Ano'  Execute JavaScript   $('#${campoCicloDestino}').val("15").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Ciclo I-Semestre 1'  Execute JavaScript   $('#${campoCicloDestino}').val("41").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Ciclo II-Semestre 1'  Execute JavaScript   $('#${campoCicloDestino}').val("47").trigger('chosen:updated');
    Run Keyword If    '${Ciclo}' == 'Ciclo I-Semestre 1'  Execute JavaScript   $('#${campoCicloDestino}').val("53").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCicloDestino}').trigger('change');
    Aguardar tela de carregamento

Em Escola Destino, selecionar "${Escola}"
    Run Keyword If    '${Escola}' == 'EPG JOAO BALBINO FILHO'  Execute JavaScript   $('#${campoEscolaDestino}').val("648").trigger('chosen:updated');
    Run Keyword If    '${Escola}' == 'EPG DA EMILIA'  Execute JavaScript   $('#${campoEscolaDestino}').val("608").trigger('chosen:updated');
    Run Keyword If    '${Escola}' == 'EPG ANITA MALFATTI'  Execute JavaScript   $('#${campoEscolaDestino}').val("582").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEscolaDestino}').trigger('change');
    Aguardar tela de carregamento

Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS PARA PROSSEGUIR
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Preencha os campos obrigatórios para prosseguir')]
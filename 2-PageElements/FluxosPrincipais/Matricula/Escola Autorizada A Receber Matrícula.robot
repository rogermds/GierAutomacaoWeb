*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Library    FakerLibrary     locale=pt_BR
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${campoTipoEstabelecimentoEscolaMatricula}    cphContent_ddlTipoEstabelecimento
${campoEtapaModalidadeEscolaMatricula}        cphContent_ddlModalidade
${campoEscolaEscolaMatricula}                 cphContent_ddlEscola
${campoEPGVolpi}                              chkEW_575
${campoEPGCrispiniano}                        chkEW_607
${campoEPGAntonioAparecido}                   chkEW_584
${campoNomeCadastroPessoa}                    cphContent_ucDadosPessoais_txtNomeCompleto

*** Keywords ***
Em Escola Autorizada A Receber Matrícula, em Tipo de Estabelecimento, selecionar "ESCOLA"
    Execute JavaScript   $('#${campoTipoEstabelecimentoEscolaMatricula}').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTipoEstabelecimentoEscolaMatricula}').trigger('change');
    Aguardar tela de carregamento

Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'   Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1° SEMESTRE'    Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').val("5").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2° SEMESTRE'    Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').trigger('change');
    Aguardar tela de carregamento

Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "${escola}"
    Run Keyword If    '${escola}' == 'EPG ALFREDO VOLPI'    Execute JavaScript   $('#${campoEscolaEscolaMatricula}').val("575").trigger('chosen:updated');
    Run Keyword If    '${escola}' == 'EPG CRISPINIANO SOARES'   Execute JavaScript   $('#${campoEscolaEscolaMatricula}').val("607").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEscolaEscolaMatricula}').trigger('change');
    Aguardar tela de carregamento

Em Escola Autorizada A Receber Matrícula, verificar se as opções estão selecionadas, e selecionar caso não estejam
    FOR     ${index}    IN RANGE    0    20
        ${busca}    Set Variable    cphContent_dtlEscolas_chkTodosTd_${index}
        ${resultado}    Run Keyword And Return Status   Wait Until Element Is Not Visible    ${busca}    0.2
        ${resultado2}    Run Keyword And Return Status   Element Attribute Value Should Be    ${busca}    checked    true
        IF  ${resultado} or ${resultado2}
        CONTINUE    
        ELSE
            Execute JavaScript  document.getElementById("${busca}").click();
            Aguardar tela de carregamento
            Exit For Loop
        END
    END

Em Escola Autorizada A Receber Matrícula, verificar se as opções foram salvas corretamente
    FOR     ${index}    IN RANGE    0    20
        ${busca}    Set Variable    cphContent_dtlEscolas_chkTodosTd_${index}
        ${resultado}    Run Keyword And Return Status   Wait Until Element Is Not Visible    ${busca}    0.2
        ${resultado2}    Run Keyword And Return Status   Element Attribute Value Should Be    ${busca}    checked    true
        IF  ${resultado} or ${resultado2}
            CONTINUE    
        ELSE
            Fail
        END
    END
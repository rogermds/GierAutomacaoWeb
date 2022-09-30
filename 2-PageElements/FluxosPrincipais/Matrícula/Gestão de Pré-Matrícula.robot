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
Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Wait Until Element Is Visible    cphContent_btnPesquisa
    ${status}    Run Keyword And Return Status    Variable Should Not Exist     ${nomeCompletoAluno}
    IF    ${status}
        Input Text    cphContent_txtAluno    ${nomeCompletoResponsavel}
    ELSE    
        Input Text    cphContent_txtAluno    ${nomeCompletoAluno}
    END
    

Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Input Text    cphContent_txtProtocolo    ${protocoloComprovante}

Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados Candidato
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkDadosCandidato_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados do Responsável
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkDadosResponsaveis_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Deferir
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkAprovar_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, selecionar uma turma com vagas
    FOR     ${index}    IN RANGE    0    20
    ${busca}    Set Variable    cphContent_dtlClasseTurma_lblVagasDisponiveisTd_${index}
    ${resultado}    Run Keyword And Return Status   Element Should Not Contain    ${busca}    0    
        IF  ${resultado}
            Execute JavaScript  document.getElementById("cphContent_dtlClasseTurma_lbtSelecionar_${index}").click();
            Aguardar tela de carregamento
            IF    ${resultado}    BREAK
        END
    END
    Aguardar tela de carregamento
        
Em Gestão de Pré-Matrícula, clicar em Matricular Educando
    Execute JavaScript  document.getElementById("cphContent_btnMatricular").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento



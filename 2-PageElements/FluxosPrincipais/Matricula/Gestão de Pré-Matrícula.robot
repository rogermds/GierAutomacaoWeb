*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Library    FakerLibrary     locale=pt_BR
Library    XML
Resource    ../../../1-Hooks/1-Principal.robot
Resource    ../Pessoa/Pessoa.robot

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

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Indeferir
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkRecusar_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, selecionar "${justificativa}"
    Wait Until Page Contains    Justificativa de Indeferimento
    Execute JavaScript   $("#cphContent_Justificativa_ddlJustificativa").val($('option:contains("${justificativa}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Justificativa_ddlJustificativa').trigger('change');
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, inserir "${justificativa}"
    Input Text    txtObservacao    ${justificativa}

Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_Justificativa_btnSalvar").click();
    Aguardar tela de carregamento
    
Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Sim
    Execute JavaScript  document.getElementById("cphContent_Justificativa_Mensagem_Padrao_btnSim").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, verificar se o aluno foi indeferido
    Wait Until Element Contains    cphContent_Justificativa_Mensagem_Padrao_Outer_lblMsg    INDEFERIMENTO REALIZADO COM SUCESSO

Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Ok
    Execute JavaScript  document.getElementById("cphContent_Justificativa_Mensagem_Padrao_Outer_btnOk").click();
    Aguardar tela de carregamento


Em Gestão de Pré-Matrícula, selecionar uma turma com vagas
    FOR     ${index}    IN RANGE    0    20
    ${busca}    Set Variable    cphContent_dtlClasseTurma_lblVagasDisponiveisTd_${index}
    ${resultado}    Run Keyword And Return Status   Element Text Should Not Be    ${busca}    0    
        IF  ${resultado}
            Execute JavaScript  document.getElementById("cphContent_dtlClasseTurma_lbtSelecionar_${index}").click();
            Aguardar tela de carregamento
            Exit For Loop If    ${resultado}
        END
    END
    Aguardar tela de carregamento
        
Em Gestão de Pré-Matrícula, clicar em Matricular Educando
    Wait Until Element Is Visible    cphContent_btnMatricular
    Execute JavaScript  document.getElementById("cphContent_btnMatricular").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "${ciclo}"
    Execute JavaScript   $("#cphContent_ddlCiclo").val($('option:contains("${ciclo}")').val()).trigger('chosen:updated');
    Run Keyword If    '${ciclo}' == 'Ciclo II-Semestre 1'     Execute JavaScript   $('#cphContent_ddlCiclo').val("53").trigger('chosen:updated');        
    Execute JavaScript   $('#cphContent_ddlCiclo').trigger('change');
    Aguardar tela de carregamento
    
Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "${escola}"
    Execute JavaScript   $("#cphContent_ddlEscolaDestino").val($('option:contains("${escola}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlEscolaDestino').trigger('change');
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Situação, selecionar "${situacao}"
    Execute JavaScript   $("#cphContent_ddlSituacao").val($('option:contains("${situacao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlSituacao').trigger('change');
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em '${processo}', verificar se o aluno entrou em último lugar na fila de espera
    FOR     ${index}    IN RANGE    0    300
        ${campoAnterior}    Evaluate    ${index}-1
        ${buscaAluno}    Set Variable    cphContent_dtlConsulta_lblAlunoLi_${index}
        ${buscaProcesso}    Set Variable    cphContent_dtlConsulta_lblDemandaLi_${index}
        ${resultadoProcesso}    Run Keyword And Return Status   Element Should Contain    ${buscaProcesso}    ${processo}
        ${listaEsperaAluno}    Get Text    cphContent_dtlConsulta_lblClassificacaoLi_${index}
        ${validacao}    Evaluate    ${index} > ${listaEsperaAluno}
        
        ${existeNomeAluno}    Run Keyword And Return Status    Variable Should Exist    ${nomeCompletoAluno}
        IF    ${existeNomeAluno}
            ${nomeAlunoCaixaAlta}    Convert To Upper Case    ${nomeCompletoAluno}
        END

        ${resultadoAluno}    Run Keyword And Return Status   Element Should Contain  ${buscaAluno}    ${nomeAlunoCaixaAlta}
            
        ${nomeResponsavelCaixaAlta}    Convert To Upper Case    ${nomeCompletoAluno}
        ${resultadoResponsavel}    Run Keyword And Return Status   Element Should Contain  ${buscaAluno}    ${nomeResponsavelCaixaAlta}
        ${nomeResponsavelCaixaAlta}    Convert To Upper Case    ${nomeCompletoResponsavel}

        IF  ${resultadoAluno} and ${resultadoProcesso}
            IF    ${listaEsperaAluno} == 1
                Element Text Should Be    cphContent_dtlConsulta_lblClassificacaoLi_${index}    1
                Exit For Loop
            END
                ${listaEsperaAluno}    Get Text    cphContent_dtlConsulta_lblClassificacaoLi_${index}
                ${valorAnterior}    Evaluate    ${listaEsperaAluno}-1
                Element Text Should Be    cphContent_dtlConsulta_lblClassificacaoLi_${campoAnterior}    ${valorAnterior}
                Exit For Loop 
        END

        IF  ${resultadoResponsavel} and ${resultadoProcesso}
            IF    ${listaEsperaAluno} == 1
                Element Text Should Be    cphContent_dtlConsulta_lblClassificacaoLi_${index}    1
                Exit For Loop
            END
                ${listaEsperaAluno}    Get Text    cphContent_dtlConsulta_lblClassificacaoLi_${index}
                ${valorAnterior}    Evaluate    ${listaEsperaAluno}-1
                Element Text Should Be    cphContent_dtlConsulta_lblClassificacaoLi_${campoAnterior}    ${valorAnterior}
                Exit For Loop 
        END

        IF    ${validacao}
            Fail      
        END
    END

Em Gestão de Pré-Matrícula, em '${processo}', verificar se o aluno entrou em penúltimo lugar na fila de espera
    FOR     ${index}    IN RANGE    0    300
        ${proximoCampo}    Evaluate    ${index}+1
        ${buscaAluno}    Set Variable    cphContent_dtlConsulta_lblAlunoLi_${index}
        ${nomeAlunoCaixaAlta}    Convert To Upper Case    ${nomeCompletoAluno}
        ${buscaProcesso}    Set Variable    cphContent_dtlConsulta_lblDemandaLi_${index}
        ${resultadoProcesso}    Run Keyword And Return Status   Element Should Contain    ${buscaProcesso}    ${processo}
        ${resultadoAluno}    Run Keyword And Return Status   Element Should Contain  ${buscaAluno}    ${nomeAlunoCaixaAlta}
        ${listaEsperaAluno}    Get Text    cphContent_dtlConsulta_lblClassificacaoLi_${index}
        ${validacao}    Evaluate    ${index} > ${listaEsperaAluno}
        IF  ${resultadoAluno} and ${resultadoProcesso}
            IF    ${listaEsperaAluno} == 1
                Element Text Should Be    cphContent_dtlConsulta_lblClassificacaoLi_${index}    1
                Exit For Loop
            ELSE
                ${proximoValor}    Evaluate    ${listaEsperaAluno}+1
                Element Text Should Be    cphContent_dtlConsulta_lblClassificacaoLi_${proximoCampo}    ${proximoValor}
                Exit For Loop
            END
        END
        IF    ${validacao}
            Fail      
        END
    END

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Registro de Atendimento
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkRegistroAtendimento_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Histórico de Contato, selecionar Contato com Sucesso
    Execute JavaScript  document.getElementById("cphContent_HistoricoContato_rblContato_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Histórico de Contato, em Informações, inserir "${informacaoHistoricoContatoGestao}"
    Set Suite Variable    ${informacaoHistoricoContatoGestao}
    Wait Until Element Is Enabled    ctl00$cphContent$HistoricoContato$txtInformacoes
    Input Text    ctl00$cphContent$HistoricoContato$txtInformacoes    ${informacaoHistoricoContatoGestao}

Em Gestão de Pré-Matrícula, em Histórico de Contato, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_HistoricoContato_btnSalvar").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Histórico de Contato, clicar em OK
    Execute JavaScript  document.getElementById("cphContent_HistoricoContato_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento
    
Em Gestão de Pré-Matrícula, em Histórico de Contato, verificar se o registro foi salvo
    Wait Until Page Contains    ${informacaoHistoricoContatoGestao}

Em Gestão de Pré-Matrícula, em Histórico de Contato, fechar o modal
    Execute JavaScript  document.getElementById("cphContent_HistoricoContato_btnFechar").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Origem e Documentação
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkDocumentos_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Origem e Documentação, em Rede de Origem, selecionar "${redeOrigemGestao}"
    Execute JavaScript   $("#cphContent_ddlRedeNomeOrigem").val($('option:contains("${redeOrigemGestao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlRedeNomeOrigem').trigger('change');
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Origem e Documentação, em Escola Origem, inserir "${escolaOrigemGestao}"
    Input Text    cphContent_txtRedeNomeEscola    ${escolaOrigemGestao}

Em Gestão de Pré-Matrícula, em Origem e Documentação, em Estado Origem, selecionar "${estadoOrigemGestao}"
    Execute JavaScript   $("#cphContent_ddlRedeEstadoOrigem").val($('option:contains("${estadoOrigemGestao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlRedeEstadoOrigem').trigger('change');
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Origem e Documentação, em País Origem, selecionar "${paisOrigemGestao}"
    Execute JavaScript   $("#cphContent_ddlRedePais").val($('option:contains("${paisOrigemGestao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlRedePais').trigger('change');
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Origem e Documentação, em Documentos Aprensentados, selecionar CPF e RG
    Execute JavaScript  document.getElementById("cphContent_rptDocumentos_chkDocumento_0").click();
    Execute JavaScript  document.getElementById("cphContent_rptDocumentos_chkDocumento_1").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Origem e Documentação, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvarDocumento").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Origem e Documentação, clicar em Ok
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento
    
Em Gestão de Pré-Matrícula, em Origem e Documentação, verificar se os campos foram salvos corretamente
    Element Attribute Value Should Be    cphContent_rptDocumentos_chkDocumento_0    checked    true
    Element Attribute Value Should Be    cphContent_rptDocumentos_chkDocumento_1    checked    true

Em Gestão de Pré-Matrícula, em Origem e Documentação, fechar o modal
    Execute JavaScript  document.getElementById("cphContent_btnFecharDocumento").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Histórico de Alterações
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkHistoricoPreMatricula_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Histórico de Alterações, verificar se o registro foi salvo
    Em Gestão de Pré-Matrícula, em Histórico de Contato, verificar se o registro foi salvo

Em Gestão de Pré-Matrícula, em Histórico de Alterações, clicar em Fechar
    Execute JavaScript  document.getElementById("cphContent_btnFecharHistorico").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Determinação Legal
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkDeterminacaoLegal_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Determinação Legal, selecionar "${justificaDeterminacaoLegal}"
    Execute JavaScript   $("#cphContent_Justificativa_ddlJustificativa").val($('option:contains("${justificaDeterminacaoLegal}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Justificativa_ddlJustificativa').trigger('change');
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Determinação Legal, em Observações, inserir "${obsDeterminacaoLegal}"
    Wait Until Element Is Visible    txtObservacao
    Input Text    txtObservacao    ${obsDeterminacaoLegal}

Em Gestão de Pré-Matrícula, em Determinação Legal, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_Justificativa_btnSalvar").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Escolas Selecionadas, clicar em Ações e Cancelar Indicação
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlEscolasSelecionadas$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlEscolasSelecionadas_lnkCancelarIndicacao_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, selecionar "${justificativaCancelamentoGestao}"
    Execute JavaScript   $("#cphContent_Justificativa_ddlJustificativa").val($('option:contains("${justificativaCancelamentoGestao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Justificativa_ddlJustificativa').trigger('change');
    Aguardar tela de carregamento


Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, em Observações, inserir "${obsCancelamentoJustificativaGestao}"
    Wait Until Element Is Visible    txtObservacao
    Input Text    txtObservacao    ${obsCancelamentoJustificativaGestao}
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_Justificativa_btnSalvar").click();
    Aguardar tela de carregamento



    

    
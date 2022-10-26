*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Em Solicitação de Transporte, selecionar a Etapa/Modalidade "${etapaModalidadeTransportes}"
    Execute JavaScript   $("#cphContent_ddlEtapaModalidade").val($('option:contains("${etapaModalidadeTransportes}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlEtapaModalidade').trigger('change');
    Aguardar tela de carregamento

Em Solicitação de Transporte, selecionar o ciclo "${cicloTransportes}"
    Execute JavaScript   $("#cphContent_ddlCiclo").val($('option:contains("${cicloTransportes}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCiclo').trigger('change');
    Aguardar tela de carregamento

Em Solicitação de Transporte, selecionar o curso "${cursoTransportes}"
    Execute JavaScript   $("#cphContent_ddlCurso").val($('option:contains("${cursoTransportes}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCurso').trigger('change');
    Aguardar tela de carregamento

Em Solicitação de Transporte, selecionar a Situação "${situacaoTransportes}"
    Execute JavaScript   $("#cphContent_ddlSituacaoSolicitacao").val($('option:contains("${situacaoTransportes}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlSituacaoSolicitacao').trigger('change');
    Aguardar tela de carregamento

Em Solicitação de Transporte, selecionar a escola "${escolaTransportes}"
    Execute JavaScript   $("#cphContent_ddlEscola").val($('option:contains("${escolaTransportes}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlEscola').trigger('change');
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, selecionar o Tipo de Transporte "${tipoTransporteTransportes}"
    Execute JavaScript   $("#cphContent_ddlTipoTransporte").val($('option:contains("${tipoTransporteTransportes}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoTransporte').trigger('change');
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar em um aluno para solicitar transporte
    FOR     ${index}    IN RANGE    0    500
        ${botaoSolicitarTransporte}    Set Variable    cphContent_dtlConsulta_btnSemSolicitacao_${index}
        ${resultado}    Run Keyword And Return Status   Element Should Be Visible   ${botaoSolicitarTransporte}
        IF  ${resultado}
            Execute JavaScript  document.getElementById("${botaoSolicitarTransporte}").click();
            Aguardar tela de carregamento
            Exit For Loop
        END
    END

Em Solicitação de Transporte, salvar o nome do aluno
    ${nomeAlunoTransporte}    Get Value    cphContent_txtNomeAluno
    Set Suite Variable    ${nomeAlunoTransporte}

Em Solicitação de Transporte, clicar em Enviar para Análise
    Execute JavaScript  document.getElementById("cphContent_btnEnviarAnalise").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar no perfil e em Trocar Perfil
    Execute JavaScript  document.getElementById("cphHeader_Menu_imgUsuario2").click();
    Execute JavaScript  document.getElementById("cphHeader_Menu_lkbTrocarPerfil").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Input Text    cphContent_txtPesquisa    ${nomeAlunoTransporte}

Em Solicitação de Transporte, clicar em Ações e Analisar Solicitação
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar Deferir
    Execute JavaScript  document.getElementById("cphContent_btnDeferir").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar em Ações e Editar
    Em Solicitação de Transporte, clicar em Ações e Analisar Solicitação

Em Solicitação de Transporte, selecionar uma linha
    Execute JavaScript  document.getElementById("cphContent_dtlLinhasDisponiveis_lbtSelecionar_0").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar em Inserir
    Execute JavaScript  document.getElementById("cphContent_btnInserirLinhaPreferencial").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Solicitação de Transporte, verificar se a solicitação foi deferida
    Wait Until Element Contains    cphContent_dtlConsulta_lblSituacaoSolicitacaoTd_0    DEFERIDA
*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***
${campoNomeEducandoGestaoPre}                      cphContent_txtAluno  
${campoProtocolo}                                  cphContent_txtProtocolo
${campoSituacao}                                   cphContent_ddlSituacao
${botaoAcao}                                       cphContent_dtlConsulta_A2_0

*** Keywords ***
Viualizar o titulo Gestão de Pré-Matrícula
    Wait Until Page Contains    Gestão de Pré-Matrícula

Em campo Educando, informar "${Nome}"
    Execute JavaScript  document.getElementById("${campoNomeEducandoGestaoPre}").click()
    Input Text            ${campoNomeEducandoGestaoPre}      ${Nome}

Em campo Protocolo, informar "${Protocolo}"
    Input Text    ${campoProtocolo}      ${Protocolo}

Visualizar a mensagem: NÃO HÁ EDUCANDOS COM OS FILTROS SELECIONADOS.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Não há Educandos com os filtros selecionados.')]

Em Situação, selecionar "${Situacao}"
    Run Keyword If    '${Situacao}' == 'TODOS'  Execute JavaScript   $('#${campoSituacao}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'AGUARDANDO ANÁLISE'  Execute JavaScript   $('#${campoSituacao}').val("1").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'ATENDIDO'  Execute JavaScript   $('#${campoSituacao}').val("2").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'CANCELADO'  Execute JavaScript   $('#${campoSituacao}').val("5").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'DETERMINAÇÃO LEGAL'  Execute JavaScript   $('#${campoSituacao}').val("8").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'EXCEDENTE'  Execute JavaScript   $('#${campoSituacao}').val("4").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'INDEFERIDO'  Execute JavaScript   $('#${campoSituacao}').val("3").trigger('chosen:updated');
    Run Keyword If    '${Situacao}' == 'PAUSADO'  Execute JavaScript   $('#${campoSituacao}').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#${campoSituacao}').trigger('change');
    Sleep    8

No primeiro aluno da pesquisa, clicar na ação "${Acao}"
    Execute JavaScript  document.getElementById("${botaoAcao}").click();
    Run Keyword If    '${Acao}' == 'Analisar Inscrição'    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkAnalisar_0").click();
    Run Keyword If    '${Acao}' == 'Indeferir'             Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkRecusar_0").click();
    Run Keyword If    '${Acao}' == 'Deferir'      Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkAprovar_0").click();
    Run Keyword If    '${Acao}' == 'Dados do Candidato'      Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkDadosCandidato_0").click();
    Run Keyword If    '${Acao}' == 'Dados do Responsável'       Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkDadosResponsaveis_0").click();
    Run Keyword If    '${Acao}' == 'Registro de Atendimento'      Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkRegistroAtendimento_0").click();
    Run Keyword If    '${Acao}' == 'Origem e Documentação'      Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkDocumentos_0").click();
    Run Keyword If    '${Acao}' == 'Histórico de Alterações'     Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkHistoricoPreMatricula_0").click();
    Run Keyword If    '${Acao}' == 'Determinação Legal'   Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkDeterminacaoLegal_0").click();
    Run Keyword If    '${Acao}' == 'Pausar'    Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkPausar_0").click();
    Run Keyword If    '${Acao}' == 'Cancelar Inscrição'   Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkCancelar_0").click();
    Run Keyword If    '${Acao}' == 'Oferta de Vagas'   Execute JavaScript   document.getElementById("cphContent_dtlConsulta_lnkOfertaVagas_0").click();
    Sleep    5

Clicar no botão salvar para o alerta de Justificativa
    Execute JavaScript  document.getElementById("cphContent_Justificativa_btnSalvar").click();

Visualizar a mensagem: SELECIONE UMA JUSTIFICATIVA    
    Wait Until Page Contains Element    //span[contains(.,'Selecione uma justificativa')]
    
Clicar em Ok no alerta de Justificativa
    Execute JavaScript  document.getElementById("cphContent_Justificativa_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento

Fechar o modal de Justificativa
    Execute JavaScript  document.getElementById("cphContent_Justificativa_btnFechar").click();
    Aguardar tela de carregamento

Clicar em salvar o Registro de Atendimento 
    Execute JavaScript  document.getElementById("cphContent_HistoricoContato_btnSalvar").click();
    Aguardar tela de carregamento
    
Visualizar a mensagem: SELECIONE O TIPO DE CONTATO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Selecione o Tipo de Contato.')]
    
Clicar em OK para o alerta de Registro
    Execute JavaScript  document.getElementById("cphContent_HistoricoContato_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento

Selecionar a opção "${tipoDeContato}"
    Run Keyword If    '${tipoDeContato}' == 'Contato com Sucesso'   Execute JavaScript  document.getElementById("cphContent_HistoricoContato_rblContato_0").click();
    Run Keyword If    '${tipoDeContato}' == 'Contato com Sucesso'  Execute JavaScript   document.getElementById("cphContent_HistoricoContato_rblContato_1").click();

Visualizar a mensagem: PREENCHA O CAMPO INFORMAÇÕES SOBRE O ATENDIMENTO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Preencha o campo Informações Sobre o Atendimento.')]

Fechar o modal de Histórico de Contato
    Execute JavaScript  document.getElementById("cphContent_HistoricoContato_btnFechar").click();
    Aguardar tela de carregamento

Visualizar a mensagem: INSIRA A JUSTIFICATIVA PARA PROSSEGUIR    
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Insira a justificativa para prosseguir')]

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Cancelar
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkCancelar_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Pausar
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkPausar_0").click();
    Aguardar tela de carregamento

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

Em Gestão de Pré-Matrícula, em Justificativa, selecionar "${justificativa}"
    Wait Until Page Contains    Justificativa
    Execute JavaScript   $("#cphContent_Justificativa_ddlJustificativa").val($('option:contains("${justificativa}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Justificativa_ddlJustificativa').trigger('change');
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Justificativa, inserir "${justificativa}"
    Input Text    txtObservacao    ${justificativa}

Em Gestão de Pré-Matrícula, em Justificativa, clicar em Salvar
    Wait Until Element Is Visible    cphContent_Justificativa_btnSalvar
    Execute JavaScript  document.getElementById("cphContent_Justificativa_btnSalvar").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, em Justificativa, clicar em Ok
    Wait Until Element Is Visible    cphContent_Justificativa_Mensagem_Padrao_Outer_btnOk
    Execute JavaScript  document.getElementById("cphContent_Justificativa_Mensagem_Padrao_Outer_btnOk").click();
    Aguardar tela de carregamento
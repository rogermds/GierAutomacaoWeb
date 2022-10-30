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
Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Execute JavaScript  document.getElementById("btnCadastraJustificativa").click();

Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "${tipoSituacao}"
    Sleep    1.5
    Aguardar tela de carregamento
    Set Suite Variable    ${tipoSituacao}
    Run Keyword If    '${tipoSituacao}' == 'CANCELAMENTO'   Execute JavaScript   $('#ddlTiposJustificativas').val("1").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'DETERMINAÇÃO LEGAL'     Execute JavaScript   $('#ddlTiposJustificativas').val("2").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'DESFAZER AÇÃO'  Execute JavaScript   $('#ddlTiposJustificativas').val("3").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'INDEFERIMENTO'  Execute JavaScript   $('#ddlTiposJustificativas').val("4").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'PAUSADO'    Execute JavaScript   $('#ddlTiposJustificativas').val("5").trigger('chosen:updated');
    Run Keyword If    '${tipoSituacao}' == 'VAGA OFERTADA'  Execute JavaScript   $('#ddlTiposJustificativas').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#ddlTiposJustificativas').trigger('change');
    Aguardar tela de carregamento

Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "${justificativa}"
    Set Suite Variable    ${justificativaSituacao}    ${justificativa}${tipoSituacao}
    Clear Element Text    txtJustificativa
    Input Text    txtJustificativa    ${justificativaSituacao}

Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Execute JavaScript  document.getElementById("btnSalvar").click();
    Aguardar tela de carregamento

Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Wait Until Element Is Visible    alertBox_btnOk    20
    Execute JavaScript  document.getElementById("alertBox_btnOk").click();
    Aguardar tela de carregamento
    
Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Wait Until Element Is Visible    txtJustificativa
    Input Text    txtJustificativa    ${justificativaSituacao}
    Aguardar tela de carregamento

Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Wait Until Element Is Visible    btnPesquisar_busca
    Execute JavaScript  document.getElementById("btnPesquisar_busca").click();
    Aguardar tela de carregamento
    
Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Wait Until Page Contains    ${justificativaSituacao}

Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@idregistro,'grid_0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_edicao_grid_0").click();
    Aguardar tela de carregamento

Em Edição de Justificativas da Pré-Matrícula, em Justificativa, inserir "${textoEditado}"
    Set Suite Variable    ${textoEditado}
    Sleep    1.5
    Clear Element Text    txtJustificativa
    Input Text    txtJustificativa    ${textoEditado}

Em Edição de Justificativas da Pré-Matrícula, clicar em Alterar
    Sleep    2
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar

Em Edição de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Sleep    2
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal

Em Justificativas da Pré-Matrícula, verificar se a justificativa editada foi salva
    Sleep    3
    Aguardar tela de carregamento
    Wait Until Page Contains    ${textoEditado}
    Aguardar tela de carregamento

Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa editada
    Aguardar tela de carregamento
    Wait Until Element Is Visible    txtJustificativa
    Input Text    txtJustificativa    ${textoEditado}
    Aguardar tela de carregamento

Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@idregistro,'grid_0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_exclusao_grid_0").click();
    Aguardar tela de carregamento

Em Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
*** Settings ***
Library    SeleniumLibrary
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***


*** Keywords ***
Em Parâmetros de Transporte, clicar em Cadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em Data Inicial, inserir "${dataInicialTransporte}"
    Wait Until Element Is Visible    txtDtInicio
    Input Text    txtDtInicio    ${dataInicialTransporte}

No cadastro de Parâmetros de Transporte, em Data Final, inserir "${dataFinalTransporte}"
    Input Text    txtDtFinal    ${dataFinalTransporte}
        
No cadastro de Parâmetros de Transporte, em Processo de Transporte, inserir "${descricaoProcessoTransporte}"
    Set Suite Variable    ${descricaoProcessoTransporte}
    Clear Element Text    cphContent_txtProcessoTransporte
    Input Text    cphContent_txtProcessoTransporte    ${descricaoProcessoTransporte}
    
No cadastro de Parâmetros de Transporte, em permite o deferimento e indeferimento pelas escolas, selecionar "Não"
    Execute JavaScript  document.getElementById("cphContent_rbDeferimentoEscola_1").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em utilizar o indeferimento automático, selecionar "Sim"
    Execute JavaScript  document.getElementById("cphContent_rbIndeferimentoAutomatico_0").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em estruturas do indeferimento, selecionar "Escola"
    Execute JavaScript  document.getElementById("cblEstruturaIndeferimento_1").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em permite a escolha de veículo, selecionar "Não"
    Execute JavaScript  document.getElementById("cphContent_rbEscolhaVeiculo_1").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em retornar para o solicitante após o deferimento, selecionar "Sim"
    Execute JavaScript  document.getElementById("cphContent_rbRetornarSolicitante_0").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em solicitação de transporte para beneficiários fora da rede, selecionar "Sim"
    Execute JavaScript  document.getElementById("cphContent_rbPermiteBeneficiario_0").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Execute JavaScript   $("#cphContent_ddlEtapaModalidade").val($('option:contains("${etapaModalidade}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlEtapaModalidade').trigger('change');
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em Curso, selecionar "${curso}"
    Execute JavaScript   $("#cphContent_ddlCurso").val($('option:contains("${curso}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCurso').trigger('change');
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, clicar em Incluir
    Execute JavaScript  document.getElementById("cphContent_btnIncluirCurso").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em TEG, selecionar "Sim"
    Execute JavaScript  document.getElementById("cphContent_rbFretado_0").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em Distância entre a residência e a escola, inserir "${km}"
    Input Text    txtFretadoDistancia    ${km}

No cadastro de Parâmetros de Transporte, em Parâmetro de Distância, selecionar "${parametroDistancia}"
    Execute JavaScript   $("#cphContent_ddlFretadoParametroDistancia").val($('option:contains("${parametroDistancia}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlFretadoParametroDistancia').trigger('change');
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em Cálculo de Distância, selecionar "${calculoDistancia}"
    Execute JavaScript   $("#cphContent_ddlFretadoCalculoDistancia").val($('option:contains("${calculoDistancia}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlFretadoCalculoDistancia').trigger('change');
    Aguardar tela de carregamento
    
No cadastro de Parâmetros de Transporte, em TEG Adaptado, selecionar "Sim"
    Execute JavaScript  document.getElementById("cphContent_rbFretadoAdaptado_0").click();
    Aguardar tela de carregamento
    
No cadastro de Parâmetros de Transporte, em Necessidades especiais incluídas, selecionar "${necessidadesEspeciais}"
    Execute JavaScript   $("#cphContent_ddlNecessidadesEspeciais").val($('option:contains("${necessidadesEspeciais}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlNecessidadesEspeciais').trigger('change');
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em Necessidades Especiais, clicar em Incluir
    Execute JavaScript  document.getElementById("cphContent_btnIncluirNecessidade").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, em grupo de campos, selecionar "Sim"
    Execute JavaScript  document.getElementById("cphContent_rdlGrupoVagaQuantidadeFretadoAdaptado_0").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

No cadastro de Parâmetros de Transporte, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Parâmetros de Transporte, selecionar o ano "${ano}"
    Execute JavaScript   $("#cphContent_ddlAnoLetivo").val($('option:contains("${ano}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento
    
Em Parâmetros de Transporte, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento
        
Em Parâmetros de Transporte, verificar se o cadastro foi efetuado
    Wait Until Page Contains    ${descricaoProcessoTransporte}

Em Parâmetros de Transporte, verificar se o cadastro foi excluído
    Wait Until Page Does Not Contain    ${descricaoProcessoTransporte}


Em Parâmetros de Transporte, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@class,'lbtGrid')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Parâmetros de Transporte, clicar em Ações e Inativar
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@class,'lbtGrid')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Parâmetros de Transporte, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Parâmetros de Transporte, clicar em Ok no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

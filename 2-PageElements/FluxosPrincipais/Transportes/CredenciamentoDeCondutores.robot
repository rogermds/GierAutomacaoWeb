*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***


*** Keywords ***
Em Credenciamento de Condutores, clicar em Cadastrar Condutores
    Execute JavaScript  document.getElementById("cphContent_btnCadastrar").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em Cadastro de Pessoa Juridica
    Execute JavaScript  document.getElementById("cphContent_Wizard1_btnCadastrarPessoa").click();
    Aguardar tela de carregamento

Em Cadastrar Fornecedores, inserir a razão social "${razaoSocialFornecedor}"
    Input Text    cphContent_txtNomeRazaoSocial    ${razaoSocialFornecedor}

Em Cadastrar Fornecedores, inserir o nome fantasia "${nomeFantasiaFornecedor}"
    ${codChaveFornecedor}    Random Number    4    true
    ${nomeFantasiaFornecedor}   Set Variable     ${nomeFantasiaFornecedor}${codChaveFornecedor}
    Set Suite Variable    ${nomeFantasiaFornecedor}
    Input Text    cphContent_txtNomeFantasia    ${nomeFantasiaFornecedor}

Em Credenciamento de Condutores, Nome do Condutor selecionar o cadastro criado
    Execute JavaScript   $("#cphContent_ddlNomeCondutor").val($('option:contains("${nomeFantasiaFornecedor}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlNomeCondutor').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, em consulta, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, verificar se o status está como "${statusCredenciamento}"
    Wait Until Element Contains    cphContent_dtlResultado_lblSituacao_0    ${statusCredenciamento}

Em Credenciamento de Condutores, verificar se o status da documentação está como "${statusDocumentacaoCredenciamento}"
    Wait Until Element Contains    cphContent_dtlResultado_lblDocumentacao_0    ${statusDocumentacaoCredenciamento}

Em Credenciamento de Condutores, clicar em Ações e Analisar Credenciamento
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlResultado$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlResultado_lnkAnalisar_0").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em Ações e Credenciar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlResultado$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlResultado_lnkCredenciar_0").click();
    Aguardar tela de carregamento

Em Cadastrar Fornecedores, inserir um CNPJ aleatório
    ${CNPJ}    Random Number    14    true
    Input Text    cphContent_txtCpfCnpj    ${CNPJ}

Em Cadastrar Fornecedores, Clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em Selecionar
    Execute JavaScript  document.getElementById("cphContent_Wizard1_dtlConsulta_lnkVisualizar_0").click();
    Aguardar tela de carregamento
    
Em Credenciamento de Condutores, em data de inscrição do condutor, inserir "${dataInscricaoCondutor}"
    Input Text    cphContent_Wizard1_txtDataInscricao    ${dataInscricaoCondutor}

Em Credenciamento de Condutores, clicar em Salvar e Próximo
    Execute JavaScript  document.getElementById("cphContent_Wizard1_StartNavigationTemplateContainerID_StartNextButton").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, em Nome da Escola inserir "${nomeEscolaCredenciamento}"
    Input Text    cphContent_Wizard1_txtNomeEstrutura    ${nomeEscolaCredenciamento}

Em Credenciamento de Condutores, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_Wizard1_btnPesquisaEscola").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar o período "${periodoEscolaCredenciamento}"
    Execute JavaScript   $('#cphContent_Wizard1_dtlEscola_lbPeriodoEscola_0 [value="14648"]').attr('selected', true);
    Execute JavaScript   $('#cphContent_Wizard1_dtlEscola_lbPeriodoEscola_0 [value="14649"]').attr('selected', true);
    Execute JavaScript   $("#cphContent_Wizard1_dtlEscola_lbPeriodoEscola_0").trigger("chosen:updated");
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em INSERIR
    Execute JavaScript  document.getElementById("cphContent_Wizard1_dtlEscola_lnkVisualizar_0").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 2
    Execute JavaScript  document.getElementById("cphContent_Wizard1_StepNavigationTemplateContainerID_StepNextButton").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 3
    Execute JavaScript  document.getElementById("cphContent_Wizard1_StepNavigationTemplateContainerID_StepNextButton").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 4
    Execute JavaScript  document.getElementById("cphContent_Wizard1_StepNavigationTemplateContainerID_StepNextButton").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar a marca "${marcaCarroCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlMarca").val($('option:contains("${marcaCarroCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlMarca').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar o modelo "${modeloCarroCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlModelo").val($('option:contains("${modeloCarroCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlModelo').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar o ano de fabricação "${anoFabricacaoCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlAnoFabricacao").val($('option:contains("${anoFabricacaoCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlAnoFabricacao').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar o ano modelo "${anoModeloCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlAnoModelo").val($('option:contains("${anoModeloCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlAnoModelo').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, inserir o código do veículo "${codigoVeiculoCredenciamento}"
    Input Text    cphContent_Wizard1_txtCodigoVeiculo    ${codigoVeiculoCredenciamento}

Em Credenciamento de Condutores, inserir a placa do veículo "${placaVeiculoCredenciamento}"
    ${codPlaca}    Random Number    5    true
    Input Text    cphContent_Wizard1_txtPlaca    ${placaVeiculoCredenciamento}${codPlaca}

Em Credenciamento de Condutores, inserir o prefixo do veículo "${prefixoVeiculoCredenciamento}"
    Input Text    cphContent_Wizard1_txtPrefixo    ${prefixoVeiculoCredenciamento}

Em Credenciamento de Condutores, inserir a cor do veículo "${corVeiculoCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlCoresSistema").val($('option:contains("${corVeiculoCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlCoresSistema').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar o tipo do veículo "${tipoVeiculoCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlTipoVeiculo").val($('option:contains("${tipoVeiculoCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlTipoVeiculo').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar o tipo do combústivel "${tipoCombustivelCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlCombustivel").val($('option:contains("${tipoCombustivelCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlCombustivel').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar a unidade de medida "${unidadeMedidaCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlUnidadeMedida").val($('option:contains("${unidadeMedidaCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlUnidadeMedida').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, inserir o número de eixos "${eixosCredenciamento}"
    Input Text    cphContent_Wizard1_txtEixos    ${eixosCredenciamento}

Em Credenciamento de Condutores, selecionar o Estado do veículo "${estadoVeiculoCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlEstados").val($('option:contains("${estadoVeiculoCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlEstados').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar a Cidade do veículo "${cidadeVeiculoCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlCidades").val($('option:contains("${cidadeVeiculoCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlCidades').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar em veículo PCD "${veiculoPcdCredenciamento}"
    Execute JavaScript   $("#cphContent_Wizard1_ddlVeiculoPcd").val($('option:contains("${veiculoPcdCredenciamento}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_Wizard1_ddlVeiculoPcd').trigger('change');
    Aguardar tela de carregamento

Em Credenciamento de Condutores, inserir em vagas convencionais "${vagasConvencionaisCredenciamento}"
    Input Text    cphContent_Wizard1_txtVagasConvencional    ${vagasConvencionaisCredenciamento}

Em Credenciamento de Condutores, inserir em vagas PCD "${vagasPcdCredenciamento}"
    Input Text    cphContent_Wizard1_txtVagasPCD    ${vagasPcdCredenciamento}
    
Em Credenciamento de Condutores, clicar em Adicionar Veículo
    Execute JavaScript  document.getElementById("cphContent_Wizard1_btnAdicionarVeiculo").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar 3 anexos
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_0").click();
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_1").click();
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_2").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, selecionar os anexos restantes
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_3").click();
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_4").click();
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_5").click();
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_6").click();
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_7").click();
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_8").click();
    Execute JavaScript  document.getElementById("cphContent_Wizard1_cblDocumentos_9").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, em número do contrato inserir "${numeroContratoCredenciamento}"
    Input Text    cphContent_Wizard1_txtNumeroContrato    ${numeroContratoCredenciamento}

Em Credenciamento de Condutores, em vigência de contrato inserir "${vigenciaContratoCredenciamento}"
    Input Text    cphContent_Wizard1_txtVigenciaDe    ${vigenciaContratoCredenciamento}

Em Credenciamento de Condutores, clicar em Salvar e Fechar
    Execute JavaScript  document.getElementById("cphContent_Wizard1_FinishNavigationTemplateContainerID_FinishButton").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em Sim no Modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Credenciamento de Condutores, clicar em Ok no Modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento
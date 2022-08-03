*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     FakerLibrary     locale=pt_BR


*** Variables ***
${botaoCadastarCondutores}                 cphContent_btnCadastrar      
${botaoSalvarEProximoCondutores}           cphContent_Wizard1_StartNavigationTemplateContainerID_StartNextButton             
${botaoCadastroJuridicaCondutores}         cphContent_Wizard1_btnCadastrarPessoa
${campoRazaoSocial}                        cphContent_txtNomeRazaoSocial
${campoNomeFantasia}                       cphContent_txtNomeFantasia
${campoCnpj}                               cphContent_txtCpfCnpj
${campoDataCondutores}                     cphContent_Wizard1_txtDataInscricao
${campoEscolaCondutores}                   cphContent_Wizard1_txtNomeEstrutura
${botaoAdicionarVeiculoCondutores}         cphContent_Wizard1_btnAdicionarVeiculo
${campoMarcaCondutores}                    cphContent_Wizard1_ddlMarca
${campoModeloCondutores}                   cphContent_Wizard1_ddlModelo
${campoAnoFabricacaoCondutores}            cphContent_Wizard1_ddlAnoFabricacao    
${campoAnoModeloCondutores}                cphContent_Wizard1_ddlAnoModelo    
${campoCodVeiculosCondutores}              cphContent_Wizard1_txtCodigoVeiculo      
${campoPlacaCondutores}                    cphContent_Wizard1_txtPlaca    
${campoPrefixoCondutores}                  cphContent_Wizard1_txtPrefixo      
${campoCorCondutores}                      cphContent_Wizard1_ddlCoresSistema  
${campoTipoVeiculoCondutores}              cphContent_Wizard1_ddlTipoVeiculo  
${campoCombustivelCondutores}              cphContent_Wizard1_ddlCombustivel  
${campoUnidadeDeMedidaCondutores}          cphContent_Wizard1_ddlUnidadeMedida
${campoEixosCondutores}                    cphContent_Wizard1_txtEixos
${campoEstadoCondutores}                   cphContent_Wizard1_ddlEstados 
${campoCidadeCondutores}                   cphContent_Wizard1_ddlCidades
${campoVagasConvencionalCondutores}        cphContent_Wizard1_txtVagasConvencional    
${botaoSalvarEFinalizarCondutores}         cphContent_Wizard1_FinishNavigationTemplateContainerID_FinishButton

*** Keywords ***
Clicar em Cadastrar Condutores
    Execute JavaScript  document.getElementById("${botaoCadastarCondutores}").click();
    Aguardar tela de carregamento

Clicar no botão Salvar e Próximo
    Execute JavaScript  document.getElementById("${botaoSalvarEProximoCondutores}").click();

Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS')]

Clicar no botão Cadastro de Pessoa Jurídica
    Execute JavaScript  document.getElementById("${botaoCadastroJuridicaCondutores}").click();

Visualizar a mensagem: O CAMPO RAZÃO SOCIAL É OBRIGATÓRIO.
    Wait Until Page Contains Element    //span[contains(.,'O campo razão social é obrigatório.')]

Em Razão Social, informar "${razaoSocial}"
    ${codRazaoSocialRandom}   Random Number   6
    Input Text    ${campoRazaoSocial}    ${razaoSocial}${codRazaoSocialRandom}
    
Visualizar a mensagem: O CAMPO NOME FANTASIA É OBRIGATÓRIO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'O campo nome fantasia é obrigatório.')]

Em Nome Fantasia, informar "${nomeFantasia}"
    ${codNomeFantasiaRandom}   Random Number   6
    Input Text    ${campoNomeFantasia}    ${nomeFantasia}${codNomeFantasiaRandom}

Visualizar a mensagem: O CAMPO TIPO CPF/CNPJ É OBRIGATÓRIO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'O campo tipo CPF/CNPJ é obrigatório.')]

Em CNPJ, inserir um CNPJ válido
    ${CNPJ}  FakerLibrary.CNPJ        
    Input Text  ${campoCnpj}  ${CNPJ}

Em Data da Inscrição do Condutor, selecionar o dia atual
    Execute JavaScript  document.getElementById("${campoDataCondutores}").click();
    Execute JavaScript  document.getElementById("${botaoDataHoje}").click();
    
Clicar em selecionar 
    Execute JavaScript  document.getElementById("phContent_Wizard1_dtlConsulta_lnkVisualizar_0").click();
    Aguardar tela de carregamento

Visualizar a mensagem: SELECIONE AO MENOS UMA ESCOLA
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'SELECIONE AO MENOS UMA ESCOLA')]
    
Em Nome da Escola, inserir "${Escola}"
    Execute JavaScript  document.getElementById("${campoEscolaCondutores}").click();
    Input Text    ${campoEscolaCondutores}    ${Escola}
    Set Suite Variable    ${botaoPesquisar}    cphContent_Wizard1_btnPesquisaEscola

Clicar em "Inserir"
    Execute JavaScript  document.getElementById("cphContent_Wizard1_dtlEscola_lnkVisualizar_0").click();
    Aguardar tela de carregamento

Visualizar a mensagem: SELECIONE OU ADICIONE UM VEÍCULO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Selecione ou adicione um veículo')]

Clicar no botão Adicionar Veículo
    Execute JavaScript  document.getElementById("${botaoAdicionarVeiculoCondutores}").click();

Em Marca, selecionar "${Marca}"
    Run Keyword If    '${Marca}' == 'Selecione'  Execute JavaScript   $('#${campoMarcaCondutores}').val("575").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'MICROÔNIBUS'  Execute JavaScript   $('#${campoMarcaCondutores}').val("581").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'ÔNIBUS'  Execute JavaScript   $('#${campoMarcaCondutores}').val("606").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'VAN/KOMBI'  Execute JavaScript   $('#${campoMarcaCondutores}').val("575").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'OUTRO'  Execute JavaScript   $('#${campoMarcaCondutores}').val("581").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'KIA'  Execute JavaScript   $('#${campoMarcaCondutores}').val("606").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'FIAT'  Execute JavaScript   $('#${campoMarcaCondutores}').val("575").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'HYUNDAI'  Execute JavaScript   $('#${campoMarcaCondutores}').val("575").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'CITROEN'  Execute JavaScript   $('#${campoMarcaCondutores}').val("581").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'MARCOPOLO'  Execute JavaScript   $('#${campoMarcaCondutores}').val("606").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'JINBEI'  Execute JavaScript   $('#${campoMarcaCondutores}').val("575").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'MB S312'  Execute JavaScript   $('#${campoMarcaCondutores}').val("581").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'RENAULT'  Execute JavaScript   $('#${campoMarcaCondutores}').val("606").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'VOLKSWAGEN'  Execute JavaScript   $('#${campoMarcaCondutores}').val("575").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'FORD'  Execute JavaScript   $('#${campoMarcaCondutores}').val("581").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'IVECO'  Execute JavaScript   $('#${campoMarcaCondutores}').val("606").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'JINBEI'  Execute JavaScript   $('#${campoMarcaCondutores}').val("575").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'MERCEDES - BENZ'  Execute JavaScript   $('#${campoMarcaCondutores}').val("581").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'MERCEDEZ BENZ'  Execute JavaScript   $('#${campoMarcaCondutores}').val("606").trigger('chosen:updated');
    Run Keyword If    '${Marca}' == 'PEUGEOT'  Execute JavaScript   $('#${campoMarcaCondutores}').val("581").trigger('chosen:updated');
    Execute JavaScript   $('#${campoMarcaCondutores}').trigger('change');

Em Modelo, selecionar ${Modelo}"
    Run Keyword If    '${Modelo}' == 'Selecione'  Execute JavaScript   $('#${campoModeloCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO'  Execute JavaScript   $('#${campoModeloCondutores}').val("15").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUC TRANSFORMERS'  Execute JavaScript   $('#${campoModeloCondutores}').val("30").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'UNO'  Execute JavaScript   $('#${campoModeloCondutores}').val("37").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO MAXICARGO'  Execute JavaScript   $('#${campoModeloCondutores}').val("44").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO FABUSFORMA'  Execute JavaScript   $('#${campoModeloCondutores}').val("46").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO GUERRA MC 20'  Execute JavaScript   $('#${campoModeloCondutores}').val("50").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO MINIBUS'  Execute JavaScript   $('#${campoModeloCondutores}').val("56").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCA ESCOLAR FFBM25'  Execute JavaScript   $('#${campoModeloCondutores}').val("57").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO COMBINATO'  Execute JavaScript   $('#${campoModeloCondutores}').val("61").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO NIKS MIC 20'  Execute JavaScript   $('#${campoModeloCondutores}').val("63").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO MULTI REVESC'  Execute JavaScript   $('#${campoModeloCondutores}').val("65").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUC TRANSFORMES TE'  Execute JavaScript   $('#${campoModeloCondutores}').val("66").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUC TRANSFORMERS TE'  Execute JavaScript   $('#${campoModeloCondutores}').val("68").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO GUERRA MC20'  Execute JavaScript   $('#${campoModeloCondutores}').val("71").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUC TRANFORMERS TE'  Execute JavaScript   $('#${campoModeloCondutores}').val("73").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO GUERRA MC'  Execute JavaScript   $('#${campoModeloCondutores}').val("74").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO GREENCAR M01'  Execute JavaScript   $('#${campoModeloCondutores}').val("76").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'TRANSFORMERS TE'  Execute JavaScript   $('#${campoModeloCondutores}').val("81").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUC ESCOLAR FFBM25'  Execute JavaScript   $('#${campoModeloCondutores}').val("89").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'BOXER M3303 23S'  Execute JavaScript   $('#${campoModeloCondutores}').val("90").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCAMA FFORMA MIC23'  Execute JavaScript   $('#${campoModeloCondutores}').val("95").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATOFABUSFORMA'  Execute JavaScript   $('#${campoModeloCondutores}').val("98").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO GREENCAR MO1'  Execute JavaScript   $('#${campoModeloCondutores}').val("100").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO ESCOLAR FFBM25'  Execute JavaScript   $('#${campoModeloCondutores}').val("104").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCACOMFFORMA MIC21'  Execute JavaScript   $('#${campoModeloCondutores}').val("111").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCA ESCOLAR FFBM26'  Execute JavaScript   $('#${campoModeloCondutores}').val("119").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCATO GUERRA MC 16'  Execute JavaScript   $('#${campoModeloCondutores}').val("120").trigger('chosen:updated');
    Run Keyword If    '${Modelo}' == 'DUCAFFORMA MIC21'  Execute JavaScript   $('#${campoModeloCondutores}').val("123").trigger('chosen:updated');    
    Execute JavaScript   $('#${campoModeloCondutores}').trigger('change');

Em Ano de Fabricação, selecionar "${Ano}"
    Run Keyword If    '${Ano}' == 'Selecione'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2000'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2000").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2001'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2001").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2002'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2002").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2003'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2003").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2004'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2004").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2005'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2005").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2006'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2006").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2007'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2007").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2008'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2008").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2009'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2009").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2010'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2010").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2011'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2011").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2012'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2012").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2013'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2013").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2014'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2014").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2015'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2015").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2016'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2016").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2017'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2017").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2018'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2018").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2019'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2019").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2020'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2020").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2021'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2021").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2022'  Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').val("2022").trigger('chosen:updated');
    Execute JavaScript   $('#${campoAnoFabricacaoCondutores}').trigger('change');

Em Ano Modelo, selecionar "${Ano}"
    Run Keyword If    '${Ano}' == 'Selecione'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2000'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2000").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2001'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2001").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2002'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2002").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2003'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2003").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2004'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2004").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2005'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2005").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2006'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2006").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2007'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2007").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2008'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2008").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2009'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2009").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2010'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2010").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2011'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2011").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2012'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2012").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2013'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2013").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2014'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2014").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2015'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2015").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2016'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2016").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2017'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2017").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2018'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2018").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2019'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2019").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2020'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2020").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2021'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2021").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2022'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2022").trigger('chosen:updated');
    Run Keyword If    '${Ano}' == '2023'  Execute JavaScript   $('#${campoAnoModeloCondutores}').val("2023").trigger('chosen:updated');
    Execute JavaScript   $('#${campoAnoModeloCondutores}').trigger('change');

Em Código do Veículo, informar "${Codigo}"
    Execute JavaScript  document.getElementById("${campoCodVeiculosCondutores}").click();
    Input Text    ${campoCodVeiculosCondutores}    ${Codigo}

Em Placa do Veículo informar "${Placa}"
    Execute JavaScript  document.getElementById("${campoPlacaCondutores}").click();
    Input Text    ${campoPlacaCondutores}    ${Placa}

Em Prefixo do Veículo, informar "${Prefixo}"
    Execute JavaScript  document.getElementById("${campoPrefixoCondutores}").click();
    Input Text    ${campoPrefixoCondutores}    ${Prefixo}

Em Cor, selecionar "${Cor}"
    Run Keyword If    '${Cor}' == 'Selecione'  Execute JavaScript   $('#${campoCorCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Azul Claro'  Execute JavaScript   $('#${campoCorCondutores}').val("2").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Verde'  Execute JavaScript   $('#${campoCorCondutores}').val("3").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Laranja'  Execute JavaScript   $('#${campoCorCondutores}').val("4").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Vermelho'  Execute JavaScript   $('#${campoCorCondutores}').val("5").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Pink'  Execute JavaScript   $('#${campoCorCondutores}').val("6").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Petroleo'  Execute JavaScript   $('#${campoCorCondutores}').val("7").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Branca'  Execute JavaScript   $('#${campoCorCondutores}').val("8").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Preta'  Execute JavaScript   $('#${campoCorCondutores}').val("9").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Prata'  Execute JavaScript   $('#${campoCorCondutores}').val("10").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Chumbo'  Execute JavaScript   $('#${campoCorCondutores}').val("11").trigger('chosen:updated');
    Run Keyword If    '${Cor}' == 'Amarela'  Execute JavaScript   $('#${campoCorCondutores}').val("12").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCorCondutores}').trigger('change');

Em Tipo de Veículo, selecionar "${Veiculo}"
    Run Keyword If    '${Veiculo}' == 'Selecione'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Microonibus'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("7").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Outro'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("8").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Ônibus'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("9").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Vans/Kombis'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("10").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Carro de Passeio'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("11").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Caminhão 3/4'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("12").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Caminhão Sider'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("13").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Caminhonete'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("14").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'Ducato Maxicargo'  Execute JavaScript   $('#${campoTipoVeiculoCondutores}').val("15").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTipoVeiculoCondutores}').trigger('change');

Em Combustivél, selecionar "${Combustivel}"
    Run Keyword If    '${Combustivel}' == 'Selecione'  Execute JavaScript   $('#${campoCombustivelCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Combustivel}' == 'Gasolina'  Execute JavaScript   $('#${campoCombustivelCondutores}').val("7").trigger('chosen:updated');
    Run Keyword If    '${Combustivel}' == 'Alcool'  Execute JavaScript   $('#${campoCombustivelCondutores}').val("8").trigger('chosen:updated');
    Run Keyword If    '${Combustivel}' == 'Gasolina/Alcool'  Execute JavaScript   $('#${campoCombustivelCondutores}').val("9").trigger('chosen:updated');
    Run Keyword If    '${Combustivel}' == 'Diesel'  Execute JavaScript   $('#${campoCombustivelCondutores}').val("10").trigger('chosen:updated');
    Run Keyword If    '${Combustivel}' == 'Gás Natural'  Execute JavaScript   $('#${campoCombustivelCondutores}').val("11").trigger('chosen:updated');
    Run Keyword If    '${Combustivel}' == 'Outros'  Execute JavaScript   $('#${campoCombustivelCondutores}').val("12").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCombustivelCondutores}').trigger('change');

Em Unidade de Medida, selecionar "${UnidadeDeMedida}"
    Run Keyword If    '${UnidadeDeMedida}' == 'Selecione'  Execute JavaScript   $('#${campoUnidadeDeMedidaCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${UnidadeDeMedida}' == 'Pessoas'  Execute JavaScript   $('#${campoUnidadeDeMedidaCondutores}').val("1").trigger('chosen:updated');
    Run Keyword If    '${UnidadeDeMedida}' == 'Metros²'  Execute JavaScript   $('#${campoUnidadeDeMedidaCondutores}').val("2").trigger('chosen:updated');
    Run Keyword If    '${UnidadeDeMedida}' == 'Metros³'  Execute JavaScript   $('#${campoUnidadeDeMedidaCondutores}').val("3").trigger('chosen:updated');
    Execute JavaScript   $('#${campoUnidadeDeMedidaCondutores}').trigger('change');

Em Números de Eixos, informar "${Numero}"
    Execute JavaScript  document.getElementById("${campoEixosCondutores}").click();
    Input Text    ${campoEixosCondutores}    ${Numero}

Em Estado, selecionar "${Estado}"
    Run Keyword If    '${Estado}' == 'Selecione'  Execute JavaScript   $('#${campoEstadoCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Estado}' == 'Goias'  Execute JavaScript   $('#${campoEstadoCondutores}').val("21").trigger('chosen:updated');
    Run Keyword If    '${Estado}' == 'São Paulo'  Execute JavaScript   $('#${campoEstadoCondutores}').val("7").trigger('chosen:updated');
    Run Keyword If    '${Estado}' == 'Sergipe'  Execute JavaScript   $('#${campoEstadoCondutores}').val("9").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEstadoCondutores}').trigger('change');

Em Cidade do Veículo, selecionar "${Cidade}"
    Run Keyword If    '${Cidade}' == 'Selecione'  Execute JavaScript   $('#${campoEstadoCondutores}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'Guarulhos'  Execute JavaScript   $('#${campoEstadoCondutores}').val("5333").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'Santos'  Execute JavaScript   $('#${campoEstadoCondutores}').val("5026").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'Aracaju'  Execute JavaScript   $('#${campoEstadoCondutores}').val("4753").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'Sorocaba'  Execute JavaScript   $('#${campoEstadoCondutores}').val("4985").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'Águas Lindas de Goias'  Execute JavaScript   $('#${campoEstadoCondutores}').val("906").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEstadoCondutores}').trigger('change');

Em Vagas Convencional, informar "${Numero}"
    Execute JavaScript  document.getElementById("${campoVagasConvencionalCondutores}").click();
    Input Text    ${campoVagasConvencionalCondutores}    ${Numero}

Clicar no Botão Salvar e Fechar 
    Execute JavaScript  document.getElementById("${botaoSalvarEFinalizarCondutores}").click();
    Aguardar tela de carregamento

Visualizar a mensagem: NECESSÁRIO INFORMAR O NÚMERO DE CONTRATO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Necessário informar o número de contrato')]

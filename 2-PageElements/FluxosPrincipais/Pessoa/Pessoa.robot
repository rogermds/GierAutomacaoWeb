*** Settings ***
Library    SeleniumLibrary
Library    String
Library    FakerLibrary     locale=pt_BR
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${campoNomeCadastroPessoa}                    cphContent_ucDadosPessoais_txtNomeCompleto
${campoDataNascimento}          txtDNasc      
${naoPossuiEmail}               cphContent_ucDadosPessoais_chkNaoPossuiEmail
${campoSexoPessoa}              cphContent_ucDadosPessoais_ddlSexo
${campoNacionalidadePessoa}     cphContent_ucDadosPessoais_ddlNacionalidade
${campoUFNascimento}            cphContent_ucDadosPessoais_ddlUfNascimento
${campoCidade}                  cphContent_ucDadosPessoais_ddlCidadeNasc
${campoCPF}                     cphContent_ucDocumentos_txtCpf
${campoRG}                      cphContent_ucDocumentos_txtRg
${campoRGDigito}                cphContent_ucDocumentos_txtRgDigito
${campoOrgaoEmissor}            cphContent_ucDocumentos_ddlOrgaoEmissor
${campoDataExpedicao}           cphContent_ucDocumentos_txtRgDExpedicao
${campoCorRaca}                 cphContent_ucDadosSociais_ddlCorPele
${campoCEP}                     txtCep
${campoNumeroCEP}               cphContent_ucEnderecos_txtNumero
${campoZona}                    cphContent_ucEnderecos_ddlZona
${botaoIncluir}                 cphContent_ucEnderecos_btnIncluirResidencial
${botaoCadastroPessoaSim}       cphContent_Mensagem_Padrao_btnSim
${botaoCadastroPessoaNao}       cphContent_Mensagem_Padrao_btnNao
${botaoAcoesPessoa}               //input[@name='ctl00$cphContent$dtlConsultaPessoa$ctl00$A2'][contains(@id,'0')]
${botaoVisualizarPessoa}          cphContent_dtlConsultaPessoa_lkbVisualizar_0

*** Keywords ***
Em Cadastro de Pessoa, no campo Nome, inserir o nome "${nomePessoa}"
    ${codPessoaRandom}   Random Number   6    True
    Input Text    ${campoNomeCadastroPessoa}    ${nomePessoa}${codPessoaRandom}

Em Cadastro de Pessoa, no campo Sexo, selecionar "${sexo}"
    Run Keyword If    '${sexo}' == 'FEMININO'  Execute JavaScript   $('#${campoSexoPessoa}').val("1").trigger('chosen:updated');
    Run Keyword If    '${sexo}' == 'MASCULINO'  Execute JavaScript   $('#${campoSexoPessoa}').val("2").trigger('chosen:updated');
    Run Keyword If    '${sexo}' == 'NÃO INFORMADO'  Execute JavaScript   $('#${campoSexoPessoa}').val("3").trigger('chosen:updated');
    
Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "${dataNascimento}"
    Set Suite Variable    ${dataNascimento}
    Input Text   ${campoDataNascimento}    ${dataNascimento}

Clicar no checkbox Pessoa não possui correio eletrônico
    Execute JavaScript  document.getElementById("${naoPossuiEmail}").click();
    Aguardar tela de carregamento

Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "${nacionalidade}"
    Run Keyword If    '${nacionalidade}' == 'BRASILEIRA'  Execute JavaScript   $('#${campoNacionalidadePessoa}').val("1").trigger('chosen:updated');
    Run Keyword If    '${nacionalidade}' == 'BRASILEIRO NASCIDO NO EXTERIOR'  Execute JavaScript   $('#${campoNacionalidadePessoa}').val("2").trigger('chosen:updated');
    Run Keyword If    '${nacionalidade}' == 'ESTRANGEIRO'  Execute JavaScript   $('#${campoNacionalidadePessoa}').val("3").trigger('chosen:updated');
    Execute JavaScript   $('#${campoNacionalidadePessoa}').trigger('change');
    Aguardar tela de carregamento

Em Cadastro de Pessoa, no campo País Origem, selecionar "${paisOrigem}"
    Execute JavaScript   $("#cphContent_ucDadosPessoais_ddlPaisOrigem").val($('option:contains("${paisOrigem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ucDadosPessoais_ddlPaisOrigem').trigger('change');

Em Cadastro de Pessoa, no campo RNE, inserir um RNE válido
    ${numeroRNE}    Random Number   6    True
    Set Suite Variable    ${RNE}    V${numeroRNE}-S
    Set Suite Variable    ${RNEAluno}    ${RNE}
    Input Text    cphContent_ucDocumentos_txtRg    ${RNE}

Em Cadastro de Pessoa, no campo UF Nascimento, selecionar "${UF}"
    Run Keyword If    '${UF}' == 'PE'  Execute JavaScript   $('#${campoUFNascimento}').val("1").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'PE'  Execute JavaScript   $('#${campoUFNascimento}').val("1").trigger('change');
    Run Keyword If    '${UF}' == 'PB'  Execute JavaScript   $('#${campoUFNascimento}').val("2").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'PB'  Execute JavaScript   $('#${campoUFNascimento}').val("2").trigger('change');
    Run Keyword If    '${UF}' == 'PA'  Execute JavaScript   $('#${campoUFNascimento}').val("3").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'PA'  Execute JavaScript   $('#${campoUFNascimento}').val("3").trigger('change');
    Run Keyword If    '${UF}' == 'RS'  Execute JavaScript   $('#${campoUFNascimento}').val("4").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'RS'  Execute JavaScript   $('#${campoUFNascimento}').val("4").trigger('change');
    Run Keyword If    '${UF}' == 'AC'  Execute JavaScript   $('#${campoUFNascimento}').val("5").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'AC'  Execute JavaScript   $('#${campoUFNascimento}').val("5").trigger('change');
    Run Keyword If    '${UF}' == 'BA'  Execute JavaScript   $('#${campoUFNascimento}').val("6").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'BA'  Execute JavaScript   $('#${campoUFNascimento}').val("6").trigger('change');
    Run Keyword If    '${UF}' == 'SP'  Execute JavaScript   $('#${campoUFNascimento}').val("7").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'SP'  Execute JavaScript   $('#${campoUFNascimento}').val("7").trigger('change');
    Run Keyword If    '${UF}' == 'SC'  Execute JavaScript   $('#${campoUFNascimento}').val("8").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'SC'  Execute JavaScript   $('#${campoUFNascimento}').val("8").trigger('change');
    Run Keyword If    '${UF}' == 'SE'  Execute JavaScript   $('#${campoUFNascimento}').val("9").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'SE'  Execute JavaScript   $('#${campoUFNascimento}').val("9").trigger('change');
    Run Keyword If    '${UF}' == 'MA'  Execute JavaScript   $('#${campoUFNascimento}').val("10").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'MA'  Execute JavaScript   $('#${campoUFNascimento}').val("10").trigger('change');
    Run Keyword If    '${UF}' == 'TO'  Execute JavaScript   $('#${campoUFNascimento}').val("11").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'TO'  Execute JavaScript   $('#${campoUFNascimento}').val("11").trigger('change');
    Run Keyword If    '${UF}' == 'RO'  Execute JavaScript   $('#${campoUFNascimento}').val("12").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'RO'  Execute JavaScript   $('#${campoUFNascimento}').val("12").trigger('change');
    Run Keyword If    '${UF}' == 'DF'  Execute JavaScript   $('#${campoUFNascimento}').val("13").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'DF'  Execute JavaScript   $('#${campoUFNascimento}').val("13").trigger('change');
    Run Keyword If    '${UF}' == 'MT'  Execute JavaScript   $('#${campoUFNascimento}').val("14").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'MT'  Execute JavaScript   $('#${campoUFNascimento}').val("14").trigger('change');
    Run Keyword If    '${UF}' == 'PR'  Execute JavaScript   $('#${campoUFNascimento}').val("15").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'PR'  Execute JavaScript   $('#${campoUFNascimento}').val("15").trigger('change');
    Run Keyword If    '${UF}' == 'CE'  Execute JavaScript   $('#${campoUFNascimento}').val("16").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'CE'  Execute JavaScript   $('#${campoUFNascimento}').val("16").trigger('change');
    Run Keyword If    '${UF}' == 'AL'  Execute JavaScript   $('#${campoUFNascimento}').val("17").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'AL'  Execute JavaScript   $('#${campoUFNascimento}').val("17").trigger('change');
    Run Keyword If    '${UF}' == 'RR'  Execute JavaScript   $('#${campoUFNascimento}').val("18").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'RR'  Execute JavaScript   $('#${campoUFNascimento}').val("18").trigger('change');
    Run Keyword If    '${UF}' == 'MG'  Execute JavaScript   $('#${campoUFNascimento}').val("19").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'MG'  Execute JavaScript   $('#${campoUFNascimento}').val("19").trigger('change');
    Run Keyword If    '${UF}' == 'MS'  Execute JavaScript   $('#${campoUFNascimento}').val("20").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'MS'  Execute JavaScript   $('#${campoUFNascimento}').val("20").trigger('change');
    Run Keyword If    '${UF}' == 'GO'  Execute JavaScript   $('#${campoUFNascimento}').val("21").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'GO'  Execute JavaScript   $('#${campoUFNascimento}').val("21").trigger('change');
    Run Keyword If    '${UF}' == 'RN'  Execute JavaScript   $('#${campoUFNascimento}').val("22").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'RN'  Execute JavaScript   $('#${campoUFNascimento}').val("22").trigger('change');
    Run Keyword If    '${UF}' == 'AP'  Execute JavaScript   $('#${campoUFNascimento}').val("23").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'AP'  Execute JavaScript   $('#${campoUFNascimento}').val("23").trigger('change');
    Run Keyword If    '${UF}' == 'RJ'  Execute JavaScript   $('#${campoUFNascimento}').val("24").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'RJ'  Execute JavaScript   $('#${campoUFNascimento}').val("24").trigger('change');
    Run Keyword If    '${UF}' == 'ES'  Execute JavaScript   $('#${campoUFNascimento}').val("25").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'ES'  Execute JavaScript   $('#${campoUFNascimento}').val("25").trigger('change');
    Run Keyword If    '${UF}' == 'AM'  Execute JavaScript   $('#${campoUFNascimento}').val("26").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'AM'  Execute JavaScript   $('#${campoUFNascimento}').val("26").trigger('change');
    Run Keyword If    '${UF}' == 'PI'  Execute JavaScript   $('#${campoUFNascimento}').val("27").trigger('chosen:updated');
    Run Keyword If    '${UF}' == 'PI'  Execute JavaScript   $('#${campoUFNascimento}').val("27").trigger('change');
    Aguardar tela de carregamento

Em Cadastro de Pessoa, no campo Cidade de Nascimento, selecionar "${cidade}"
    Run Keyword If    '${cidade}' == 'ADAMANTINA'  Execute JavaScript   $('#${campoCidade}').val("5323").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'PRACINHA'  Execute JavaScript   $('#${campoCidade}').val("4800").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'SALESOPOLIS'  Execute JavaScript   $('#${campoCidade}').val("5302").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'SAO PAULO'  Execute JavaScript   $('#${campoCidade}').val("4910").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'SAO PEDRO'  Execute JavaScript   $('#${campoCidade}').val("4911").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'SAO ROQUE'  Execute JavaScript   $('#${campoCidade}').val("4913").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'TREMEMBE'  Execute JavaScript   $('#${campoCidade}').val("4870").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'UBATUBA'  Execute JavaScript   $('#${campoCidade}').val("4877").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'GUARULHOS'  Execute JavaScript   $('#${campoCidade}').val("5333").trigger('chosen:updated');
    Aguardar tela de carregamento

Em Cadastro de Pessoa, no campo CPF, inserir um CPF válido
    ${CPFPessoa}    FakerLibrary.cpf
    Set Suite Variable    ${CPFPessoa}
    Set Suite Variable    ${cpfFakeAluno}    ${CPFPessoa}
    Input Text  ${campoCPF}  ${CPFPessoa}

Em Cadastro de Pessoa, no campo Carteira de Identidade ou R.N.E., inserir um RG válido
    ${RG}   Random Number   10    True
    Input Text  ${campoRG}  ${RG}

Em Cadastro de Pessoa, no campo Dígito, inserir o dígito do RG
    ${digitoRG}   Random Number    1
    Input Text    ${campoRGDigito}    ${digitoRG}    

Em Cadastro de Pessoa, no campo Órgão Emissor, selecionar "${orgaoEmissor}"
    Run Keyword If    '${orgaoEmissor}' == 'SSP'  Execute JavaScript   $('#${campoOrgaoEmissor}').val("31").trigger('chosen:updated');

Em Cadastro de Pessoa, no campo Data de Expedição, inserir a data "${data}"
    Input Text   ${campoDataExpedicao}    ${data}

Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "${corRaca}"
    Run Keyword If    '${corRaca}' == 'AMARELA'  Execute JavaScript   $('#${campoCorRaca}').val("3").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'BRANCA'  Execute JavaScript   $('#${campoCorRaca}').val("1").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'INDÍGENA'  Execute JavaScript   $('#${campoCorRaca}').val("5").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'NÃO DECLARADA'  Execute JavaScript   $('#${campoCorRaca}').val("6").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'PARDA'  Execute JavaScript   $('#${campoCorRaca}').val("4").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'PRETA'  Execute JavaScript   $('#${campoCorRaca}').val("2").trigger('chosen:updated');

Em Cadastro de Pessoa, no campo CEP, inserir o CEP "${CEP}"
    Wait Until Element Is Visible    ${campoCEP}
    Input Text   ${campoCEP}    ${CEP}

Em Cadastro de Pessoa, no campo Número, inserir o número "${numeroCEP}"
    Input Text   ${campoNumeroCEP}    ${numeroCEP}
    Sleep    2
    Aguardar tela de carregamento
    Input Text   ${campoNumeroCEP}    ${numeroCEP}

Em Cadastro de Pessoa, no campo Zona, selecionar "${zona}"
    Run Keyword If    '${zona}' == 'URBANO'  Execute JavaScript   $('#${campoZona}').val("1").trigger('chosen:updated');
    Run Keyword If    '${zona}' == 'RURAL'   Execute JavaScript   $('#${campoZona}').val("2").trigger('chosen:updated');

Em Cadastro de Pessoa, no campo Localização difereciada, clicar em "${LocalizacaoDifereciada}"
    Run Keyword If    '${LocalizacaoDifereciada}' == 'Não está em Área de Localização Diferenciada'  Execute JavaScript   $('#${campoLocalizacaoDifereciada}').val("1").trigger('chosen:updated');
    Run Keyword If    '${LocalizacaoDifereciada}' == 'Área de Assentamento'  Execute JavaScript   $('#${campoLocalizacaoDifereciada}').val("4").trigger('chosen:updated');
    Run Keyword If    '${LocalizacaoDifereciada}' == 'Área onde se localiza Comunidade Remanescente de Quilombos'  Execute JavaScript   $('#${campoLocalizacaoDifereciada}').val("2").trigger('chosen:updated');



Clicar no botão Incluir
    Execute JavaScript  document.getElementById("${botaoIncluir}").click();
    Aguardar tela de carregamento

No modal Deseja Cadastrar Outra Pessoa?, clicar em "${cadastroSimNao}"
    Run Keyword If    '${cadastroSimNao}' == 'Sim'  Execute JavaScript  document.getElementById("${botaoCadastroPessoaSim}").click();
    Run Keyword If    '${cadastroSimNao}' == 'Não'  Execute JavaScript  document.getElementById("${botaoCadastroPessoaNao}").click();

Verificar se o sistema retorna a página Consultar Pessoa
    Aguardar tela de carregamento
    Wait Until Page Contains    Consultar Pessoa
 
Em Cadastro de Pessoa, em Tipo de Pesquisa, selecionar "CPF"
    Execute JavaScript   $(cphContent_ddlTipoPesquisa').val("2").trigger('chosen:updated');
    Execute JavaScript   $('cphContent_ddlTipoPesquisa').trigger('change');
    Aguardar tela de carregamento

Em Cadastro de Pessoa, clicar no botão Salvar
    Wait Until Element Is Visible    cphContent_btnCadastrarPessoa
    Execute JavaScript  document.getElementById("cphContent_btnCadastrarPessoa").click();
    Aguardar tela de carregamento

Em Consulta de Pessoa, em Tipo de Pesquisa, inserir o CPF cadastrado
    Input Text    cphContent_txtCpf    ${CPFPessoa} 

Verificar se no grid é exibido o nome "${nome}"
    Wait Until Page Contains    ${nome}

Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Execute JavaScript   $('#cphContent_ddlTipoPesquisa').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoPesquisa').trigger('change');
    Aguardar tela de carregamento
    Execute JavaScript   $('#cphContent_ddlTipoPesquisa').val("2").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoPesquisa').trigger('change');
    Aguardar tela de carregamento

Em Consulta de Pessoa, inserir o CPF cadastrado
    Aguardar tela de carregamento
    Input Text    cphContent_txtCpf    ${CPFPessoa}

Em Consulta de Pessoa, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Visualizar Pessoa, clicar em Voltar
    Execute JavaScript  document.getElementById("cphContent_btnConsu").click();
    Aguardar tela de carregamento

Em Editar Pessoa, no campo Nome, inserir o nome "${nome}"
    Clear Element Text    ${campoNomeCadastroPessoa}
    Input Text   ${campoNomeCadastroPessoa}    ${nome}

Em Editar Pessoa, no campo Data de Nascimento, inserir a data "${data}"
    Clear Element Text    ${campoDataNascimento}
    Input Text   ${campoDataNascimento}    ${data}

Em consulta, no campo Nome, inserir o nome "${nome}"
    Set Suite Variable  ${campoNome}    cphContent_txtNome
    Input Text    ${campoNome}    ${nome}

Em consulta, no campo D. Nascimento, inserir a data "${dataNascimento}"
    Set Suite Variable  ${campoDataNascimento}            cphContent_txtDNasc
    Input Text    ${campoDataNascimento}    ${dataNascimento}
    Set Suite Variable    ${botaoPesquisar}    cphContent_btnPesquisa

Verificar se no grid é exibido o CPF "${CPF}"
    Wait Until Page Contains  ${CPF}    10

Verificar se no grid é exibido o RG "${RG}"
    Wait Until Page Contains  ${RG}    10

Verificar se no grid é exibido a Data de Nascimento "${dataNascimento}"
    Wait Until Page Contains  ${dataNascimento}    10

Clicar no botão "Ações"
    Execute JavaScript  xPathResult = document.evaluate("${botaoAcoesPessoa}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Clicar no botão "Desativar"
    Execute JavaScript  document.getElementById("cphContent_dtlConsultaPessoa_lblAtivoDesativo_0").click();
    Aguardar tela de carregamento

Clicar no botão "Visualizar"
    Execute JavaScript  document.getElementById("${botaoVisualizarPessoa}").click();

Clicar no botão "Editar"
    Execute JavaScript  document.getElementById("cphContent_dtlConsultaPessoa_lkbEditar_0").click();
    Aguardar tela de carregamento

Verificar se é exibido o nome "${nome}"
    Set Suite Variable      ${campoNome}      ctl00$cphContent$ucDadosPessoais$txtNomeCompleto
    Element Attribute Value Should Be     ${campoNome}  value   ${nome}

Verificar se é exibido a data de nascimento "${dataNascimento}"
    Set Suite Variable      ${campoNascimento}      ctl00$cphContent$ucDadosPessoais$txtDNasc
    Element Attribute Value Should Be     ${campoNascimento}  value   ${dataNascimento}

Em Consulta de Pessoa, verificar se aparece o texto "${texto}"
    Wait Until Element Contains    cphContent_MensagemPadrao_lblMsg    ${texto}

Clicar em OK no Modal de Desativado com Sucesso
    Wait Until Page Contains Element   cphContent_MensagemPadrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();

Em Consulta de Pessoa, verificar se o botão Desativar está inativo
    Element Attribute Value Should Be    cphContent_dtlConsultaPessoa_lkbExcluir_0    class    aspNetDisabled

Em Cadastro de Pessoa, no campo Nome, inserir o nome cadastrado
    Clear Element Text    cphContent_ucDadosPessoais_txtNomeCompleto
    Input Text   cphContent_ucDadosPessoais_txtNomeCompleto    ${nomeCompletoResponsavel}

Em Cadastro de Pessoa, no campo Nome, inserir um nome aleatório
    ${nomeCompletoAluno}    Name Male
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    ã    a
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    á    a
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    ê    e
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    é    e
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    í    i
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    ó    o
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    ô    o
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    ç    c
    ${nomeCompletoAluno}    Fetch From Right    ${nomeCompletoAluno}    .
    ${nomeCompletoAluno}    Strip String	    ${nomeCompletoAluno}    both
    Set Suite Variable    ${nomeCompletoAluno}
    Input Text    ${campoNomeCadastroPessoa}    ${nomeCompletoAluno}

Em Cadastro de Pessoa, em Certidão de Nascimento, clicar em Nova Certidão de Nascimento
    Execute JavaScript  document.getElementById("cphContent_ucDocumentos_chkNovaCertidaoNascimento").click();
    Aguardar tela de carregamento

Em Cadastro de Pessoa, em Matrícula Certidão, inserir um certidão válida
    Gerar Certidão de Nascimento Aleatório
    Input Text    cphContent_ucDocumentos_txtCertidaoNascimentoMatricula    ${certidaoAleatoria}

Em Cadastro de Pessoa, em Certidão, em Data de Emissão, inserir "${dataEmissaoCertidao}"
    Input Text    cphContent_ucDocumentos_txtCertidaoNascimentoEmissao    ${dataEmissaoCertidao}

Em Cadastro de Pessoa, em Vínculos de Parentesco, inserir o Nome "${nomeParentesco}"
    Input Text    cphContent_ucVinculos_PesquisarPessoaParente_txtNome    ${nomeParentesco}

Em Cadastro de Pessoa, em Vínculos de Parentesco, inserir a Data de Nascimento "${nascimentoParentesco}"
    Input Text    cphContent_ucVinculos_PesquisarPessoaParente_txtDNasc    ${nascimentoParentesco}
    
Em Cadastro de Pessoa, em Vínculos de Parentesco, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_ucVinculos_PesquisarPessoaParente_btnPesquisa").click();
    Aguardar tela de carregamento

Em Cadastro Rapido de Pessoa, clicar em Sim no Modal
    Wait Until Element Is Visible    cphContent_ucVinculos_PesquisarPessoaParente_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_ucVinculos_PesquisarPessoaParente_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Cadastro Rapido de Pessoa, em Nome, inserir um nome aleatório
    Wait Until Element Is Visible    cphContent_ucVinculos_PesquisarPessoaParente_CadastroRapidoPessoa_btnSalvar
    ${nomeCompletoResponsavel}    Name Female
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    ã    a
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    á    a
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    ê    e
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    é    e
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    í    i
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    ó    o
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    ô    o
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    ç    c
    ${nomeCompletoResponsavel}    Fetch From Right    ${nomeCompletoResponsavel}    .
    ${nomeCompletoResponsavel}    Strip String	    ${nomeCompletoResponsavel}    both
    Set Suite Variable    ${nomeCompletoResponsavel}
    Input Text    ctl00$cphContent$ucVinculos$PesquisarPessoaParente$CadastroRapidoPessoa$txtNome    ${nomeCompletoResponsavel}

Em Cadastro Rapido de Pessoa, em Data de Nascimento, inserir "${nascimentoCadastroRapido}"
    Input Text    cphContent_ucVinculos_PesquisarPessoaParente_CadastroRapidoPessoa_txtDataNascimento    ${nascimentoCadastroRapido}

Em Cadastro Rapido de Pessoa, em Sexo, selecionar "${sexoCadastroRapido}"
    Execute JavaScript   $("#cphContent_ucVinculos_PesquisarPessoaParente_CadastroRapidoPessoa_ddlSexo").val($('option:contains("${sexoCadastroRapido}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ucVinculos_PesquisarPessoaParente_CadastroRapidoPessoa_ddlSexo').trigger('change');
    Aguardar tela de carregamento

Em Cadastro Rapido de Pessoa, em CPF, inserir um CPF válido
    ${cpfFakeResponsavel}    FakerLibrary.cpf
    Set Suite Variable    ${cpfFakeResponsavel}
    Input Text    cphContent_ucVinculos_PesquisarPessoaParente_CadastroRapidoPessoa_txtCpf    ${cpfFakeResponsavel}

Em Cadastro Rapido de Pessoa, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_ucVinculos_PesquisarPessoaParente_CadastroRapidoPessoa_btnSalvar").click();
    Aguardar tela de carregamento

Em Cadastro Rapido de Pessoa, clicar em OK no Modal
    Execute JavaScript  document.getElementById("cphContent_ucVinculos_PesquisarPessoaParente_CadastroRapidoPessoa_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Cadastro de Pessoa, em Grau de Parentesco, selecionar "${grauParentesco}"
    Wait Until Element Is Visible    cphContent_ucVinculos_btnInserirParente
    Execute JavaScript   $("#cphContent_ucVinculos_ddlGrauParentesco").val($('option:contains("${grauParentesco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ucVinculos_ddlGrauParentesco').trigger('change');
    Aguardar tela de carregamento

Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Legal
    Execute JavaScript  document.getElementById("cphContent_ucVinculos_chkResponsavelLegal").click();
    Aguardar tela de carregamento

Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Principal
    Execute JavaScript  document.getElementById("cphContent_ucVinculos_chkResponsavelPrincipal").click();
    Aguardar tela de carregamento

Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Inserir Parente
    Execute JavaScript  document.getElementById("cphContent_ucVinculos_btnInserirParente").click();
    Aguardar tela de carregamento
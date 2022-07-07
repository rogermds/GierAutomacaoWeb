*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary     locale=pt_BR

*** Variables ***
${campoNome}                    cphContent_ucDadosPessoais_txtNomeCompleto
${campoDataNascimento}          txtDNasc      
${naoPossuiEmail}               cphContent_ucDadosPessoais_chkNaoPossuiEmail
${campoSexo}                    cphContent_ucDadosPessoais_ddlSexo
${campoNacionalidade}           cphContent_ucDadosPessoais_ddlNacionalidade
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
${botaoSalvar}                  cphContent_btnCadastrarPessoa
${botaoCadastroPessoaSim}       cphContent_Mensagem_Padrao_btnSim
${botaoCadastroPessoaNao}       cphContent_Mensagem_Padrao_btnNao


*** Keywords ***
No campo Nome, inserir o nome "${nomePessoa}"
    ${codPessoaRandom}   Random Number   6
    Input Text    ${campoNome}    ${nomePessoa}${codPessoaRandom}

No campo Sexo, selecionar "${sexo}"
    Run Keyword If    '${sexo}' == 'FEMININO'  Execute JavaScript   $('#${campoSexo}').val("1").trigger('chosen:updated');
    Run Keyword If    '${sexo}' == 'MASCULINO'  Execute JavaScript   $('#${campoSexo}').val("2").trigger('chosen:updated');
    Run Keyword If    '${sexo}' == 'NÃO INFORMADO'  Execute JavaScript   $('#${campoSexo}').val("3").trigger('chosen:updated');
    
No campo Data de Nascimento, inserir a data "${data}"
    Input Text   ${campoDataNascimento}    ${data}

Clicar no checkbox Pessoa não possui correio eletrônico
    Execute JavaScript  document.getElementById("${naoPossuiEmail}").click();
    Sleep  8

No campo Nacionalidade, selecionar "${nacionalidade}"
    Run Keyword If    '${nacionalidade}' == 'BRASILEIRA'  Execute JavaScript   $('#${campoNacionalidade}').val("1").trigger('chosen:updated');
    Run Keyword If    '${nacionalidade}' == 'BRASILEIRA'  Execute JavaScript   $('#${campoNacionalidade}').trigger('change');
    Run Keyword If    '${nacionalidade}' == 'BRASILEIRO NASCIDO NO EXTERIOR'  Execute JavaScript   $('#${campoNacionalidade}').val("2").trigger('chosen:updated');
    Run Keyword If    '${nacionalidade}' == 'BRASILEIRO NASCIDO NO EXTERIOR'  Execute JavaScript   $('#${campoNacionalidade}').trigger('change');
    Run Keyword If    '${nacionalidade}' == 'ESTRANGEIRO'  Execute JavaScript   $('#${campoNacionalidade}').val("3").trigger('chosen:updated');
    Run Keyword If    '${nacionalidade}' == 'ESTRANGEIRO'  Execute JavaScript   $('#${campoNacionalidade}').trigger('change');
    Sleep  8

No campo UF Nascimento, selecionar "${UF}"
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
    Sleep  8

No campo Cidade de Nascimento, selecionar "${cidade}"
    Run Keyword If    '${cidade}' == 'ADAMANTINA'  Execute JavaScript   $('#${campoCidade}').val("5323").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'PRACINHA'  Execute JavaScript   $('#${campoCidade}').val("4800").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'SALESOPOLIS'  Execute JavaScript   $('#${campoCidade}').val("5302").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'SAO PAULO'  Execute JavaScript   $('#${campoCidade}').val("4910").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'SAO PEDRO'  Execute JavaScript   $('#${campoCidade}').val("4911").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'SAO ROQUE'  Execute JavaScript   $('#${campoCidade}').val("4913").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'TREMEMBE'  Execute JavaScript   $('#${campoCidade}').val("4870").trigger('chosen:updated');
    Run Keyword If    '${cidade}' == 'UBATUBA'  Execute JavaScript   $('#${campoCidade}').val("4877").trigger('chosen:updated');
    Sleep  8

No campo CPF, inserir um CPF válido
    ${CPF}  FakerLibrary.cpf
    Input Text  ${campoCPF}  ${CPF}

No campo Carteira de Identidade ou R.N.E., inserir um RG válido
    ${RG}   Random Number   10
    Input Text  ${campoRG}  ${RG}

No campo Dígito, inserir o dígito do RG
    ${digitoRG}   Random Number   1
    Input Text    ${campoRGDigito}    ${digitoRG}    

No campo Órgão Emissor, selecionar "${orgaoEmissor}"
    Run Keyword If    '${orgaoEmissor}' == 'SSP'  Execute JavaScript   $('#${campoOrgaoEmissor}').val("31").trigger('chosen:updated');

No campo Data de Expedição, inserir a data "${data}"
    Input Text   ${campoDataExpedicao}    ${data}

No campo Cor/Raça, selecionar "${corRaca}"
    Run Keyword If    '${corRaca}' == 'AMARELA'  Execute JavaScript   $('#${campoCorRaca}').val("3").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'BRANCA'  Execute JavaScript   $('#${campoCorRaca}').val("1").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'INDÍGENA'  Execute JavaScript   $('#${campoCorRaca}').val("5").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'NÃO DECLARADA'  Execute JavaScript   $('#${campoCorRaca}').val("6").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'PARDA'  Execute JavaScript   $('#${campoCorRaca}').val("4").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'PRETA'  Execute JavaScript   $('#${campoCorRaca}').val("2").trigger('chosen:updated');

No campo CEP, inserir o CEP "${CEP}"
    Input Text   ${campoCEP}    ${CEP}

No campo Número, inserir o número "${numeroCEP}"
    Input Text   ${campoNumeroCEP}    ${numeroCEP}
    Sleep   8
    Input Text   ${campoNumeroCEP}    ${numeroCEP}

No campo Zona, selecionar "${zona}"
    Run Keyword If    '${zona}' == 'URBANO'  Execute JavaScript   $('#${campoZona}').val("1").trigger('chosen:updated');
    Run Keyword If    '${zona}' == 'RURAL'   Execute JavaScript   $('#${campoZona}').val("2").trigger('chosen:updated');

Clicar no botão Incluir
    Execute JavaScript  document.getElementById("${botaoIncluir}").click();
    Sleep   5

Clicar no botão Salvar
    Execute JavaScript  document.getElementById("${botaoSalvar}").click();
    Sleep   12

No modal Deseja Cadastrar Outra Pessoa?, clicar em "${cadastroSimNao}"
    Run Keyword If    '${cadastroSimNao}' == 'Sim'  Execute JavaScript  document.getElementById("${botaoCadastroPessoaSim}").click();
    Run Keyword If    '${cadastroSimNao}' == 'Não'  Execute JavaScript  document.getElementById("${botaoCadastroPessoaNao}").click();

Verificar se o sistema retorna a página Consultar Pessoa
    Verificar se aparece o texto "Consultar Pessoa"
*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${campoPesquisaEstrutura}         //input[contains(@class,'textBuscaEstrutura')]
${primeiroResultadoEstrutura}     //html[1]/body[1]/form[1]/div[3]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/table[1]/tbody[1]/tr[1]/td[1]
${campoNome}                    cphContent_ucDadosPessoais_txtNomeCompleto
${campoDataNascimento}          txtDNasc      
${campoSexo}                    cphContent_ucDadosPessoais_ddlSexo
${campoNacionalidade}           cphContent_ucDadosPessoais_ddlNacionalidade
${campoUFNascimento}            cphContent_ucDadosPessoais_ddlUfNascimento
${campoCidade}                  cphContent_ucDadosPessoais_ddlCidadeNasc
${campoCorRaca}                 cphContent_ucDadosSociais_ddlCorPele
${campoCEP}                     txtCep
${campoNumeroCEP}               cphContent_ucEnderecos_txtNumero
${campoZona}                    cphContent_ucEnderecos_ddlZona
${campoEmail}                   cphContent_ucDadosPessoais_txtEmail
${botaoIncluir}                 cphContent_ucEnderecos_btnIncluirResidencial
${botaoSalvar}                  cphContent_btnCadastrarPessoa

*** Keywords ***
Pesquisar "${pesquisaEstrutura}" e selecionar o primeiro resultado
    Input Text  ${campoPesquisaEstrutura}    ${pesquisaEstrutura}
    Click Element  ${primeiroResultadoEstrutura}

Selecionar o botão 'Cadastrar'
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Wait Until Element Is Visible    ${campoNome}    

Clicar no campo 'Nome' e digitar o valor "${nomePessoa}"
    ${codPessoaRandom}   Random Number   6
    Input Text    ${campoNome}    ${nomePessoa}${codPessoaRandom}

Clicar no campo 'Sexo' e selecionar a opção "${Sexo}"
    Run Keyword If    '${Sexo}' == 'FEMININO'  Execute JavaScript   $('#${campoSexo}').val("1").trigger('chosen:updated');
    Run Keyword If    '${Sexo}' == 'MASCULINO'  Execute JavaScript   $('#${campoSexo}').val("2").trigger('chosen:updated');
    Run Keyword If    '${Sexo}' == 'NÃO INFORMADO'  Execute JavaScript   $('#${campoSexo}').val("3").trigger('chosen:updated');
    Sleep  5

Clicar no campo 'Data de Nascimento' e digitar o valor "${Data}"
    Input Text   ${campoDataNascimento}    ${Data}
    Sleep  5

Clicar no Campo 'Correio Eletrônico' e digitar o Valor "${Email}"
    Execute JavaScript  document.getElementById("${campoEmail}").click();
    Input Text       ${campoEmail}    ${Email}
    Sleep  5

Clicar no campo 'Nacionalidade' e selecionar a opção "${Nacionalidade}"
    Run Keyword If    '${Nacionalidade}' == 'BRASILEIRA'  Execute JavaScript   $('#${campoNacionalidade}').val("1").trigger('chosen:updated');
    Run Keyword If    '${Nacionalidade}' == 'BRASILEIRA'  Execute JavaScript   $('#${campoNacionalidade}').trigger('change');
    Run Keyword If    '${Nacionalidade}' == 'BRASILEIRO NASCIDO NO EXTERIOR'  Execute JavaScript   $('#${campoNacionalidade}').val("2").trigger('chosen:updated');
    Run Keyword If    '${Nacionalidade}' == 'BRASILEIRO NASCIDO NO EXTERIOR'  Execute JavaScript   $('#${campoNacionalidade}').trigger('change');
    Run Keyword If    '${Nacionalidade}' == 'ESTRANGEIRO'  Execute JavaScript   $('#${campoNacionalidade}').val("3").trigger('chosen:updated');
    Run Keyword If    '${Nacionalidade}' == 'ESTRANGEIRO'  Execute JavaScript   $('#${campoNacionalidade}').trigger('change');
    Sleep  5

Clicar no campo 'UF' e selecionar a opção "${UF}"
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
    Sleep  5

Clicar no campo 'Cidade de Nascimento' e selecionar a opção "${Cidade}"
    Run Keyword If    '${Cidade}' == 'ADAMANTINA'  Execute JavaScript   $('#${campoCidade}').val("5323").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'PRACINHA'  Execute JavaScript   $('#${campoCidade}').val("4800").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'SALESOPOLIS'  Execute JavaScript   $('#${campoCidade}').val("5302").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'SAO PAULO'  Execute JavaScript   $('#${campoCidade}').val("4910").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'SAO PEDRO'  Execute JavaScript   $('#${campoCidade}').val("4911").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'SAO ROQUE'  Execute JavaScript   $('#${campoCidade}').val("4913").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'TREMEMBE'  Execute JavaScript   $('#${campoCidade}').val("4870").trigger('chosen:updated');
    Run Keyword If    '${Cidade}' == 'UBATUBA'  Execute JavaScript   $('#${campoCidade}').val("4877").trigger('chosen:updated');
    Sleep  5

Clicar no campo 'Cor/Raça' e selecionar a opção "${corRaca}"
    Run Keyword If    '${corRaca}' == 'AMARELA'  Execute JavaScript   $('#${campoCorRaca}').val("3").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'BRANCA'  Execute JavaScript   $('#${campoCorRaca}').val("1").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'INDÍGENA'  Execute JavaScript   $('#${campoCorRaca}').val("5").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'NÃO DECLARADA'  Execute JavaScript   $('#${campoCorRaca}').val("6").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'PARDA'  Execute JavaScript   $('#${campoCorRaca}').val("4").trigger('chosen:updated');
    Run Keyword If    '${corRaca}' == 'PRETA'  Execute JavaScript   $('#${campoCorRaca}').val("2").trigger('chosen:updated');
    Sleep  5

Clicar no campo 'Cep' e digitar o valor "${CEP}"
    Input Text   ${campoCEP}    ${CEP}

Clicar no campo 'Numero' e digitar o valor "${numeroCEP}"
    Input Text   ${campoNumeroCEP}    ${numeroCEP}
    Sleep   5
    Input Text   ${campoNumeroCEP}    ${numeroCEP}
    Sleep    5    

Clicar no campo 'Zona' e selecionar a opção "${Zona}"
    Run Keyword If    '${Zona}' == 'URBANO'  Execute JavaScript   $('#${campoZona}').val("1").trigger('chosen:updated');
    Run Keyword If    '${Zona}' == 'RURAL'   Execute JavaScript   $('#${campoZona}').val("2").trigger('chosen:updated');

Clicar no botão 'Incluir'
    Execute JavaScript  document.getElementById("${botaoIncluir}").click();
    Sleep   5

Clicar no 'Botão Salvar'
    Execute JavaScript  document.getElementById("${botaoSalvar}").click();
    Sleep   12

Visualizar a mensagem: CORREIO ELETRÔNICO INVÁLIDO
    Wait Until Element Is Visible    locator=cphContent_Mensagem_Padrao_lblMsg   
           
    

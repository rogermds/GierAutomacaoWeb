*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     String
Library    FakerLibrary     locale=pt_BR
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${campoTipoEstabelecimentoEscolaMatricula}    cphContent_ddlTipoEstabelecimento
${campoEtapaModalidadeEscolaMatricula}        cphContent_ddlModalidade
${campoEscolaEscolaMatricula}                 cphContent_ddlEscola
${campoEPGVolpi}                              chkEW_575
${campoEPGCrispiniano}                        chkEW_607
${campoEPGAntonioAparecido}                   chkEW_584
${campoEPGAmadeuPereiraLima}                  chkEW_578
${campoNomeCadastroPessoa}                    cphContent_ucDadosPessoais_txtNomeCompleto

*** Keywords ***
Entrar no Portal 
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/index.html"
    Aguardar carregamento Portal

No Portal, clicar em "${etapa}"
    Run Keyword If   '${etapa}' == 'Educação Infantil'    Click Element    //div[@class='botao botao-ciano'][contains(.,'Educação Infantil')]
    Run Keyword If   '${etapa}' == 'Ensino Fundamental'    Click Element    //div[@class='botao botao-azul'][contains(.,'Ensino Fundamental')]
    Run Keyword If   '${etapa}' == 'Educação de Jovens e Adultos'    Click Element    //div[@class='botao botao-azul'][contains(.,'Educação de Jovens e Adultos')]
    Aguardar carregamento Portal

No Portal, selecionar o processo para a etapa "${etapa}"
    Wait Until Element Is Visible    //a[contains(@rel,'modal:close')]
    Click Element    //input[contains(@value,'AUTOMACAO ${etapa} #PROCESSO_TESTE_QA#')]
    Aguardar carregamento Portal

No Portal, clicar em Iniciar inscrição
    Wait Until Element Is Visible    iniciar-inscricao
    Click Element    iniciar-inscricao
    Aguardar carregamento Portal
    Aguardar carregamento Portal

No Portal, em Escolha da Escola, em Data de Nascimento, inserir "${data}"
    Sleep    1
    Wait Until Element Is Visible    busca-nascimento
    Input Text    busca-nascimento    ${data}
    Press Keys    busca-nascimento    TAB
    Aguardar carregamento Portal

No Portal, visualizar a mensagem "${texto}"
    Wait Until Page Contains    ${texto}

No Portal, fechar o modal
    Wait Until Element Is Visible    //a[contains(@rel,'modal:close')]
    Click Element    //a[contains(@rel,'modal:close')]
    Aguardar carregamento Portal

No Portal, em Escolha da Escola, em CEP, inserir "${cep}"
    Wait Until Element Is Visible    busca-cep
    Clear Element Text    busca-cep
    Input Text    busca-cep    ${cep}
    Press Keys    busca-cep    TAB
    Aguardar carregamento Portal

No Portal, em Escolha da Escola, em Número da Residência, inserir "${numeroResidencial}"
    Input Text    busca-numero    ${numeroResidencial}
    Press Keys    busca-numero    TAB
    Aguardar carregamento Portal

No Portal, clicar em Pesquisar Escolas
    Wait Until Element Is Enabled    pesquisar-escolas
    Execute JavaScript  document.getElementById("pesquisar-escolas").click();
    Sleep    1
    Aguardar carregamento Portal

No Portal, selecionar a escola "${escola}"
    Set Suite Variable    ${escola}
    Wait Until Page Contains Element    tabela-escolas
    Sleep    1
    Run Keyword If    "${escola}" == "EPG ALFREDO VOLPI"    Execute Javascript    document.getElementById("${campoEPGVolpi}").click();
    Run Keyword If    "${escola}" == "EPG CRISPINIANO SOARES"    Execute Javascript    document.getElementById("${campoEPGCrispiniano}").click();
    Run Keyword If    "${escola}" == "EPG ANTONIO APARECIDO MAGALHAES, VEREADOR"    Execute Javascript    document.getElementById("${campoEPGAntonioAparecido}").click();    
    Run Keyword If    "${escola}" == "EPG AMADEU PEREIRA LIMA"    Execute Javascript    document.getElementById("${campoEPGAmadeuPereiraLima}").click();    
    Aguardar carregamento Portal

No Portal, clicar em Selecionar Escolas
    Wait Until Element Is Enabled    selecionar-escolas-pesquisadas
    Execute JavaScript  document.getElementById("selecionar-escolas-pesquisadas").click();
    Sleep    1
    Aguardar carregamento Portal

No Portal, clicar em Próximo
    Wait Until Element Is Visible    proximo-passo1
    Click Element    proximo-passo1
    Aguardar carregamento Portal

No Portal, clicar nos campos de declarações
    Aguardar carregamento Portal
    Sleep    1
    Click Element    chkResponsabilidade
    Click Element    chkLgpd
    Sleep    1
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em CPF, inserir um CPF inválido
    Input Text    txtRCpf    000.000.000-00
    Press Keys    txtRCpf    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    ${cpfFakeResponsavel}    FakerLibrary.cpf
    Set Suite Variable    ${cpfFakeResponsavel}
    Input Text    txtRCpf    ${cpfFakeResponsavel}
    Press Keys    txtRCpf    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "${dataNascimentoResponsavel}"
    Sleep    1
    Input Text   txtRDataNascimento    ${dataNascimentoResponsavel}    
    Press Keys    txtRDataNascimento    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    ${nomeCompletoResponsavel}    Name Female
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    ç    c
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    í    i
    ${nomeCompletoResponsavel}    Fetch From Right    ${nomeCompletoResponsavel}    .
    ${nomeCompletoResponsavel}    Strip String	    ${nomeCompletoResponsavel}    both
    Set Suite Variable    ${nomeCompletoResponsavel}
    Input Text    txtRNomeCompleto    ${nomeCompletoResponsavel}

No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "${nacionalidade}"
    Wait Until Page Contains    ${escola}
    Wait Until Element Is Visible    ddlRNacionalidade
    Select From List By Label    ddlRNacionalidade    ${nacionalidade}
    Sleep    1

No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "${ufNascimento}"
    Wait Until Element Is Visible    ddlRUfNascimento
    Select From List By Label    ddlRUfNascimento    ${ufNascimento}
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "${ufNascimento}"
    Wait Until Element Is Visible    ddlRCidadeNascimento
    Select From List By Label    ddlRCidadeNascimento    ${ufNascimento}

No Portal, em Cadastro do Responsável, em Sexo, inserir "${sexo}"
    Select From List By Label    ddlRSexo    ${sexo}

No Portal, em Cadastro do Aluno, em Nome Completo, inserir um nome aleatório
    ${nomeCompletoAluno}    Name Male
    ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    ç    c
    ${nomeCompletoAluno}    Fetch From Right    ${nomeCompletoAluno}    .
    ${nomeCompletoAluno}    Strip String	    ${nomeCompletoAluno}    both
    Set Suite Variable    ${nomeCompletoAluno}
    Input Text    txtNomeCompleto    ${nomeCompletoAluno}

No Portal, em Cadastro do Aluno, em Sexo, inserir "${sexo}"
    Select From List By Label    ddlSexo    ${sexo}

No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    Sleep    1
    Click Element    rdNovaCertidao_Sim    
    Sleep    1

No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir um certidão válida
    Gerar Certidão de Nascimento Aleatório
    Input Text    txtMatriculaCertidao    ${certidaoAleatoria}
    Press Keys    txtMatriculaCertidao    TAB
    Sleep    1
    Aguardar carregamento Portal

No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir um certidão inválida
    Input Text    txtMatriculaCertidao    0
    Press Keys    txtMatriculaCertidao    TAB
    Sleep    1
    Aguardar carregamento Portal

No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "${dataEmissaoCertidao}"
    Sleep    1
    Clear Element Text    txtDataEmissaoCertidao
    Input Text    txtDataEmissaoCertidao    ${dataEmissaoCertidao}

No Portal, em Contato, em Telefone 1, inserir um telefone válido
    Sleep    1
    ${telefoneAleatorio}    Random Number   8    True
    Sleep    1
    Set Suite Variable    ${telefone1Aleatorio}    119${telefoneAleatorio}
    Input Text    txtTelefone1    ${telefone1Aleatorio}
    Sleep    1    

No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "${nacionalidade}"
    Select From List By Label    ddlNacionalidade    ${nacionalidade}
    Sleep    1
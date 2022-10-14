*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     String
Library     FakerLibrary     locale=pt_BR

*** Variables ***
${campoTipoEstabelecimentoEscolaMatricula}    cphContent_ddlTipoEstabelecimento
${campoEtapaModalidadeEscolaMatricula}        cphContent_ddlModalidade
${campoEscolaEscolaMatricula}                 cphContent_ddlEscola
${campoEPGVolpi}                              chkEW_575
${campoEPGCrispiniano}                        chkEW_607
${campoEPGAntonioAparecido}                   chkEW_584
${campoEPGAmadeuPereiraLima}                  chkEW_578
${campoEPGBraguinha}                          chkEW_591
${campoNomeCadastroPessoa}                    cphContent_ucDadosPessoais_txtNomeCompleto

*** Keywords ***
Entrar no Portal 
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/index.html"
    Aguardar carregamento Portal

No Portal, clicar em "${etapa}"
    Wait Until Element Is Visible    //div[@class='botao botao-ciano'][contains(.,'Educação Infantil')]
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
    Wait Until Element Is Visible    //a[contains(@rel,'modal:close')]
    Wait Until Page Contains    ${texto}

No Portal, fechar o modal
    Click Element    //a[contains(@rel,'modal:close')]
    Sleep    1
    Aguardar carregamento Portal
    Sleep    1

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
    Run Keyword If    "${escola}" == "EPG BRAGUINHA"    Execute Javascript    document.getElementById("${campoEPGBraguinha}").click();    
    Aguardar carregamento Portal

No Portal, clicar em Selecionar Escolas
    Wait Until Element Is Enabled    selecionar-escolas-pesquisadas
    Execute JavaScript  document.getElementById("selecionar-escolas-pesquisadas").click();
    Sleep    1
    Aguardar carregamento Portal

No Portal, verificar se o botão Selecionar Escolas está desativado
    Element Attribute Value Should Be    selecionar-escolas-pesquisadas    disabled    true

No Portal, clicar em Próximo
    Wait Until Element Is Visible    proximo-passo1
    Click Element    proximo-passo1
    Aguardar carregamento Portal

No Portal, clicar nos campos de declarações
    Aguardar carregamento Portal
    Wait Until Element Is Visible    chkResponsabilidade
    Sleep    1
    Click Element    chkResponsabilidade
    Click Element    chkLgpd
    Sleep    1
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em CPF, inserir um CPF inválido
    Wait Until Element Is Visible    txtRCpf
    Clear Element Text    txtRCpf
    Input Text    txtRCpf    00000000000
    Press Keys    txtRCpf    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    Wait Until Element Is Visible    txtRCpf
    ${cpfFakeResponsavel}    FakerLibrary.cpf
    Set Suite Variable    ${cpfFakeResponsavel}
    Clear Element Text    txtRCpf
    Sleep    1
    Input Text    txtRCpf    ${cpfFakeResponsavel}
    Press Keys    txtRCpf    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "${CPF}"
    Wait Until Element Is Visible    txtRCpf
    Clear Element Text    txtRCpf
    Sleep    1
    Input Text    txtRCpf    ${CPF}
    Sleep    1
    Press Keys    txtRCpf    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "${dataNascimentoResponsavel}"
    Sleep    1
    Input Text   txtRDataNascimento    ${dataNascimentoResponsavel}    
    Press Keys    txtRDataNascimento    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
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
    Input Text    txtRNomeCompleto    ${nomeCompletoResponsavel}

No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "${nome}"
    Input Text    txtRNomeCompleto    ${nome}

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
    Input Text    txtNomeCompleto    ${nomeCompletoAluno}

No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "${nome}"
    Input Text    txtNomeCompleto    ${nome}

No Portal, em Cadastro do Aluno, em Sexo, inserir "${sexo}"
    Select From List By Label    ddlSexo    ${sexo}

No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    Sleep    1
    Click Element    rdNovaCertidao_Sim    
    Sleep    1

No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão válida
    Gerar Certidão de Nascimento Aleatório
    Input Text    txtMatriculaCertidao    ${certidaoAleatoria}
    Press Keys    txtMatriculaCertidao    TAB
    Sleep    1
    Aguardar carregamento Portal
    ${validacao}    Run Keyword And Return Status    Wait Until Page Contains    Número de Certidão de Nascimento Inválido
    IF    ${validacao}
        No Portal, fechar o modal
        Gerar Certidão de Nascimento Aleatório
        Input Text    txtMatriculaCertidao    ${certidaoAleatoria}
        Press Keys    txtMatriculaCertidao    TAB
        Sleep    1
        Aguardar carregamento Portal
    END

No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão inválida
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

No Portal, clicar em Concluir Inscrição
    Wait Until Element Is Enabled    concluir-passo2
    Click Element    concluir-passo2
    Sleep    1
    Aguardar carregamento Portal
    Sleep    1
    Aguardar carregamento Portal
    Sleep    1
    Aguardar carregamento Portal

No Portal, em Ano/Ciclo selecionar "${anoCiclo}"
    Sleep    1
    Run Keyword If    "${escola}" == "EPG ALFREDO VOLPI"    Select From List By Label    ddlEW_575    ${anoCiclo}
    Run Keyword If    "${escola}" == "EPG CRISPINIANO SOARES"    Select From List By Label    ddlEW_607    ${anoCiclo}
    Run Keyword If    "${escola}" == "EPG AMADEU PEREIRA LIMA"    Select From List By Label    ddlEW_578    ${anoCiclo}
    Run Keyword If    "${escola}" == "EPG BRAGUINHA"    Select From List By Label    ddlEW_591    ${anoCiclo}

No Portal, em Cadastro do Aluno, em RNE, inserir um RNE válido
    ${numeroRNE}    Random Number   6
    Set Suite Variable    ${RNEAluno}    V${numeroRNE}-S
    Input Text    txtRNE    ${RNEAluno}
    Press Keys    txtRNE    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "${grauParentesco}"
    Select From List By Label    ddlGrauParentesco    ${grauParentesco}
    Press Keys    ddlGrauParentesco    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Antiga
    Sleep    1
    Click Element    rdNovaCertidao_Nao    
    Sleep    1

No Portal, em Cadastro do Aluno, em Termo, inserir "${termo}"
    Wait Until Element Is Visible    txtTermo
    Input Text    txtTermo    ${termo}

No Portal, em Cadastro do Aluno, em Livro, inserir "${livro}"
    Wait Until Element Is Visible    txtLivro
    Input Text    txtLivro    ${livro}

No Portal, em Cadastro do Aluno, em Folha, inserir "${folha}"
    Wait Until Element Is Visible    txtFolha
    Input Text    txtFolha    ${folha}

No Portal, clicar em Solicitar Vaga
    Run Keyword If    "${escola}" == "EPG ALFREDO VOLPI"    Execute Javascript    document.getElementById("btnVW_575").click();
    Run Keyword If    "${escola}" == "EPG CRISPINIANO SOARES"    Execute Javascript    document.getElementById("btnVW_607").click();
    Run Keyword If    "${escola}" == "EPG AMADEU PEREIRA LIMA"    Execute Javascript    document.getElementById("btnVW_578").click();
    Run Keyword If    "${escola}" == "EPG BRAGUINHA"    Execute Javascript    document.getElementById("btnVW_591").click();
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    ${validacao}    Run Keyword And Return Status    Variable Should Exist    ${cpfFakeResponsavel}
    IF    ${validacao}
        Input Text    txtRCpf    ${cpfFakeResponsavel}
        Press Keys    txtRCpf    TAB
    ELSE
        Input Text    txtRCpf    ${cpfFakeAluno}
        Press Keys    txtRCpf    TAB
    END
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    ${validacao}    Run Keyword And Return Status    Variable Should Exist    ${nomeCompletoResponsavel}
    IF    ${validacao}
        Input Text    txtRNomeCompleto    ${nomeCompletoResponsavel}
    ELSE
        Input Text    txtRNomeCompleto    ${nomeCompletoAluno}
    END

No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "${UF}"   
    Wait Until Element Is Visible    ddlUfNascimento
    Select From List By Label    ddlUfNascimento    ${UF}
    Sleep    1
    Aguardar carregamento Portal
    
No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "${cidadeNascimento}"
    Wait Until Element Is Visible    ddlCidadeNascimento
    Select From List By Label    ddlCidadeNascimento    ${cidadeNascimento}

No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    Input Text    txtCpf    ${cpfFakeAluno}
    Press Keys    txtCpf    TAB
    Aguardar carregamento Portal
    
No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    Input Text    txtNomeCompleto    ${nomeCompletoAluno}

No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    Input Text    txtMatriculaCertidao    ${certidaoAleatoria}
    Press Keys    txtMatriculaCertidao    TAB
    Sleep    1
    Aguardar carregamento Portal

No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "${ufCertidao}"
    Wait Until Element Is Visible    ddlUFCertidao
    Select From List By Label    ddlUFCertidao    ${ufCertidao}
    Sleep    1
    Aguardar carregamento Portal

No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "${cidadeCartorio}"
    Wait Until Element Is Visible    ddlCidadeCartorio
    Select From List By Label    ddlCidadeCartorio    ${cidadeCartorio}

No Portal, em Cadastro do Aluno, em Cartório, inserir "${cartorio}"
    Input Text    txtCartorio    ${cartorio}

No Portal, em Cadastro do Aluno, em Distrito, inserir "${distrito}"
    Input Text    txtDistritoCartorio    ${distrito}
    
No Portal, em Cadastro do Aluno, em Comarca, inserir "${comarca}"
    Input Text    txtComarcaCartorio    ${comarca}

No Portal, verificar se o comprovante é exibido em tela
    Wait Until Element Is Visible    comprovante-impressao    120
    Dormir

No Portal, em Contato, em Telefone 1, inserir o telefone cadastrado
    Input Text    txtTelefone1    ${telefone1Aleatorio}
    Sleep    1

No Portal, no modal de alerta, clicar em Sim
    Wait Until Element Is Visible    //button[@class='swal-button swal-button--Confirmar swal-button--confirm'][contains(.,'Sim')]
    Click Element    //button[@class='swal-button swal-button--Confirmar swal-button--confirm'][contains(.,'Sim')]
    Aguardar carregamento Portal

No Portal, gravar o número de protocolo gerado
    ${protocoloComprovante}    Get Text    comprovante-info-protocolo
    Set Suite Variable    ${protocoloComprovante}

No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "${paisNascimento}"
    Select From List By Label    ddlPaisNascimento    ${paisNascimento}
    Sleep    1

No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    Input Text    txtRNE    ${RNEAluno}
    Press Keys    txtRNE    TAB
    Aguardar carregamento Portal      

No Portal, em Cadastro do Aluno, em CPF, inserir um CPF válido
    ${cpfFakeAluno}    FakerLibrary.cpf
    Set Suite Variable    ${cpfFakeAluno}
    Input Text    txtCpf    ${cpfFakeAluno}
    Press Keys    txtCpf    TAB
    Aguardar carregamento Portal
    ${validacao}    Run Keyword And Return Status    Wait Until Page Contains    O CPF informado é inválido
    IF    ${validacao}
        ${cpfFakeAluno}    FakerLibrary.cpf
        Set Suite Variable    ${cpfFakeAluno}
        Input Text    txtCpf    ${cpfFakeAluno}
        Press Keys    txtCpf    TAB
        Aguardar carregamento Portal
    END

No Portal, verificar se é exibida a mensagem que a pessoa já está matriculada
    ${validacao}    Run Keyword And Return Status    Variable Should Exist    ${nomeCompletoAluno}
    IF    ${validacao}
        Wait Until Page Contains    A pessoa ${nomeCompletoAluno} já está matriculado(a) na rede de ensino!
    ELSE
        Wait Until Page Contains    A pessoa ${nomeCompletoResponsavel} já está matriculado(a) na rede de ensino!
    END

No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    ${validacao}    Run Keyword And Return Status    Variable Should Exist    ${nomeCompletoAluno}
    IF    ${validacao}
        Wait Until Page Contains    A pessoa ${nomeCompletoAluno} já está inscrito(a) na rede de ensino!
    ELSE
        Wait Until Page Contains    A pessoa ${nomeCompletoResponsavel} já está inscrito(a) na rede de ensino!
    END

No Portal, em Cadastro do Responsável, em País de Nascimento, selecionar "${pais}"
    Wait Until Element Is Visible    ddlRPaisNascimento
    Select From List By Label    ddlRPaisNascimento    ${pais}
    Sleep    1

No Portal, em Cadastro do Responsável, em RNE, inserir um RNE válido
    ${numeroRNE}    Random Number   6    True
    Set Suite Variable    ${RNEResponsavel}    V${numeroRNE}-S
    Input Text    txtRRNE    ${RNEResponsavel}
    Press Keys    txtRRNE    TAB
    Aguardar carregamento Portal
# *** Settings ***
# Library    SeleniumLibrary
# Library    DateTime
# Library    String
# Library    FakerLibrary     locale=pt_BR
# Resource    ../../../1-Hooks/1-Principal.robot
# Resource    ./Layout do Portal.robot

# *** Variables ***
# ${campoTipoEstabelecimentoEscolaMatricula}    cphContent_ddlTipoEstabelecimento
# ${campoEtapaModalidadeEscolaMatricula}        cphContent_ddlModalidade
# ${campoEscolaEscolaMatricula}                 cphContent_ddlEscola
# ${campoEPGVolpi}                              chkEW_575
# ${campoEPGCrispiniano}                        chkEW_607
# ${campoEPGAntonioAparecido}                   chkEW_584
# ${campoNomeCadastroPessoa}                    cphContent_ucDadosPessoais_txtNomeCompleto

# *** Keywords ***
# Entrar no Portal 
#     Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/index.html"
#     Aguardar carregamento Portal

# No Portal, clicar em "${etapa}"
#     Run Keyword If   '${etapa}' == 'Educação Infantil'    Click Element    //div[@class='botao botao-ciano'][contains(.,'Educação Infantil')]
#     Run Keyword If   '${etapa}' == 'Ensino Fundamental'    Click Element    //div[@class='botao botao-azul'][contains(.,'Ensino Fundamental')]
#     Run Keyword If   '${etapa}' == 'Consultar Solicitação'    Click Element    //div[@class='botao-branco'][contains(.,'Consultar Solicitação')]
#     Aguardar carregamento Portal

# No Portal, selecionar o processo para a etapa "${etapa}"
#     Wait Until Element Is Visible    //a[contains(@rel,'modal:close')]
#     Click Element    //input[contains(@value,'AUTOMACAO ${etapa} #PROCESSO_TESTE_QA#')]
#     Aguardar carregamento Portal

# No Portal, verificar se o texto exibido é igual ao cadastrado em Educação Infantil
#     Wait Until Element Is Visible    iniciar-inscricao
#     Wait Until Page Contains    ${textoInfoImportanteInfantil}

# No Portal, verificar se o texto exibido é igual ao cadastrado em Ensino Fundamental
#     Wait Until Element Is Visible    iniciar-inscricao
#     Wait Until Page Contains    ${textoInfoImportanteFundamental}

# No Portal, fechar o modal de informações importantes
#     Wait Until Page Contains Element    //a[contains(@rel,'modal:close')]
#     Click Element    //a[contains(@rel,'modal:close')]
#     Aguardar carregamento Portal

# No Portal, em Consultar Solicitação, selecionar a nacionalidade "Brasileiro"
#     Click Element    BR

# No Portal, em Consultar Solicitação, em Protocolo inserir "${protocolo}"
#     Input Text    txtprotocolo    ${protocolo}

# No Portal, em Consultar Solicitação, em CPF inserir "${cpf}"
#     Input Text    txtCpf    ${cpf}

# No Portal, em Consultar Solicitação, em Data de Nascimento inserir "${dataNascimento}"
#     Input Text    txtdatanascimento    ${dataNascimento}

# No Portal, em Consultar Solicitação, clicar em Pesquisar
#     Click Element    btnPesquisar
#     Aguardar carregamento Portal

# No Portal, em Consultar Solicitação, no resultado clicar em Emitir 2ª Via
#     Wait Until Element Is Visible    //input[contains(@value,'Emitir 2ª Via')]
#     Click Element    //input[contains(@value,'Emitir 2ª Via')]
#     Aguardar carregamento Portal

# No Portal, no Comprovante, verificar se o texto foi salvo para a etapa Educação Infantil
#     Wait Until Page Contains    ${textoObsImportanteInfantil}

# No Portal, no Comprovante, verificar se o texto foi salvo para a etapa Ensino Fundamental
#     Wait Until Page Contains    ${textoObsImportanteFundamental}

# No Portal, clicar em Iniciar inscrição
#     Wait Until Element Is Visible    iniciar-inscricao
#     Click Element    iniciar-inscricao
#     Aguardar carregamento Portal

# No Portal, em Escolha da Escola, em Data de Nascimento, inserir "${data}"
#     Sleep    1
#     Wait Until Element Is Visible    busca-nascimento
#     Input Text    busca-nascimento    ${data}

# No Portal, em Escolha da Escola, em CEP, inserir "${cep}"
#     Input Text    busca-cep    ${cep}

# No Portal, em Escolha da Escola, em Número da Residência, inserir "${numeroResidencial}"
#     Input Text    busca-numero    ${numeroResidencial}
#     Press Keys    busca-numero    TAB
#     Aguardar carregamento Portal

# No Portal, clicar em Pesquisar Escolas
#     Wait Until Element Is Enabled    pesquisar-escolas
#     Execute JavaScript  document.getElementById("pesquisar-escolas").click();
#     Sleep    1
#     Aguardar carregamento Portal

# No Portal, selecionar a escola "${escola}"
#     Set Suite Variable    ${escola}
#     Sleep    1
#     Run Keyword If    "${escola}" == "EPG ALFREDO VOLPI"    Wait Until Element Is Visible    ${campoEPGVolpi}
#     Run Keyword If    "${escola}" == "EPG ALFREDO VOLPI"    Click Element    ${campoEPGVolpi}
#     Run Keyword If    "${escola}" == "EPG CRISPINIANO SOARES"    Wait Until Element Is Visible    ${campoEPGCrispiniano}
#     Run Keyword If    "${escola}" == "EPG CRISPINIANO SOARES"    Click Element    ${campoEPGCrispiniano}
#     Run Keyword If    "${escola}" == "EPG ANTONIO APARECIDO MAGALHAES, VEREADOR"    Wait Until Element Is Visible    ${campoEPGAntonioAparecido}
#     Run Keyword If    "${escola}" == "EPG ANTONIO APARECIDO MAGALHAES, VEREADOR"    Click Element    ${campoEPGAntonioAparecido}
    
# No Portal, clicar em Selecionar Escolas
#     Wait Until Element Is Enabled    selecionar-escolas-pesquisadas
#     Execute JavaScript  document.getElementById("selecionar-escolas-pesquisadas").click();
#     Sleep    1
#     Aguardar carregamento Portal

# No Portal, clicar em Próximo
#     Wait Until Element Is Visible    proximo-passo1
#     Click Element    proximo-passo1
#     Aguardar carregamento Portal

# No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "${nacionalidade}"
#     Wait Until Page Contains    ${escola}
#     Wait Until Element Is Visible    ddlRNacionalidade
#     Select From List By Label    ddlRNacionalidade    ${nacionalidade}
#     Sleep    1

# No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "${ufNascimento}"
#     Wait Until Element Is Visible    ddlRUfNascimento
#     Select From List By Label    ddlRUfNascimento    ${ufNascimento}
#     Aguardar carregamento Portal

# No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "${ufNascimento}"
#     Select From List By Label    ddlRCidadeNascimento    ${ufNascimento}
    
# No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
#     ${cpfFakeResponsavel}    FakerLibrary.cpf
#     Set Suite Variable    ${cpfFakeResponsavel}
#     Input Text    txtRCpf    ${cpfFakeResponsavel}
#     Press Keys    txtRCpf    TAB
#     Aguardar carregamento Portal

# No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
#     ${nomeCompletoResponsavel}    Name Female
#     ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    ç    c
#     ${nomeCompletoResponsavel}    Fetch From Right    ${nomeCompletoResponsavel}    .
#     ${nomeCompletoResponsavel}    Strip String	    ${nomeCompletoResponsavel}    both
#     Set Suite Variable    ${nomeCompletoResponsavel}
#     Input Text    txtRNomeCompleto    ${nomeCompletoResponsavel}

# No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "${dataNascimento}"
#     Input Text   txtRDataNascimento    ${dataNascimento}

# No Portal, em Cadastro do Responsável, em Sexo, inserir "${sexo}"
#     Select From List By Label    ddlRSexo    ${sexo}
    
# No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "${grauParentesco}"
#     Select From List By Label    ddlGrauParentesco    ${grauParentesco}

# No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "${nacionalidade}"
#     Select From List By Label    ddlNacionalidade    ${nacionalidade}
#     Sleep    1

# No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "${UF}"   
#     Wait Until Element Is Visible    ddlUfNascimento
#     Select From List By Label    ddlUfNascimento    ${UF}
#     Sleep    1
#     Aguardar carregamento Portal
    
# No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "${cidadeNascimento}"
#     Wait Until Element Is Visible    ddlCidadeNascimento
#     Select From List By Label    ddlCidadeNascimento    ${cidadeNascimento}

# No Portal, em Cadastro do Aluno, em CPF, inserir um CPF válido
#     ${cpfFakeAluno}    FakerLibrary.cpf
#     Set Suite Variable    ${cpfFakeAluno}
#     Input Text    txtCpf    ${cpfFakeAluno}
#     Press Keys    txtCpf    TAB
#     Aguardar carregamento Portal
    
# No Portal, em Cadastro do Aluno, em Nome Completo, inserir um nome aleatório
#     ${nomeCompletoAluno}    Name Male
#     ${nomeCompletoAluno}    Replace String    ${nomeCompletoAluno}    ç    c
#     ${nomeCompletoAluno}    Fetch From Right    ${nomeCompletoAluno}    .
#     ${nomeCompletoAluno}    Strip String	    ${nomeCompletoAluno}    both
#     Set Suite Variable    ${nomeCompletoAluno}
#     Input Text    txtNomeCompleto    ${nomeCompletoAluno}
    
# No Portal, em Cadastro do Aluno, em Sexo, inserir "${sexo}"
#     Select From List By Label    ddlSexo    ${sexo}

# No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
#     Sleep    1
#     Click Element    rdNovaCertidao_Sim    
#     Sleep    1

# No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir um certidão válida
#     Gerar Certidão de Nascimento Aleatório
#     Input Text    txtMatriculaCertidao    ${certidaoAleatoria}
#     Press Keys    txtMatriculaCertidao    TAB
#     Sleep    1
#     Aguardar carregamento Portal

# No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "${dataEmissaoCertidao}"
#     Input Text    txtDataEmissaoCertidao    ${dataEmissaoCertidao}
    
# No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "${ufCertidao}"
#     Wait Until Element Is Visible    ddlUFCertidao
#     Select From List By Label    ddlUFCertidao    ${ufCertidao}
#     Sleep    1
#     Aguardar carregamento Portal

# No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "${cidadeCartorio}"
#     Wait Until Element Is Visible    ddlCidadeCartorio
#     Select From List By Label    ddlCidadeCartorio    ${cidadeCartorio}

# No Portal, em Cadastro do Aluno, em Cartório, inserir "${cartorio}"
#     Input Text    txtCartorio    ${cartorio}

# No Portal, em Cadastro do Aluno, em Distrito, inserir "${distrito}"
#     Input Text    txtDistritoCartorio    ${distrito}
    
# No Portal, em Cadastro do Aluno, em Comarca, inserir "${comarca}"
#     Input Text    txtComarcaCartorio    ${comarca}

# No Portal, em Contato, em Telefone 1, inserir um telefone válido
#     Sleep    1
#     ${telefoneAleatorio}    Random Number   8
#     Sleep    1
#     Set Suite Variable    ${telefone1Aleatorio}    119${telefoneAleatorio}
#     Input Text    txtTelefone1    ${telefone1Aleatorio}
#     Sleep    1

# No Portal, clicar nos campos de declarações
#     Aguardar carregamento Portal
#     Sleep    1
#     Click Element    chkResponsabilidade
#     Click Element    chkLgpd
#     Sleep    1
#     Aguardar carregamento Portal

# No Portal, clicar em Concluir Inscrição
#     Wait Until Element Is Enabled    concluir-passo2
#     Click Element    concluir-passo2
#     Sleep    1
#     Aguardar carregamento Portal
#     Sleep    1
#     Aguardar carregamento Portal
#     Sleep    1
#     Aguardar carregamento Portal

# No Portal, verificar se o comprovante é exibido em tela
#     Wait Until Page Contains    Comprovante de Inscrição
#     Dormir

# No Portal, gravar o número de protocolo gerado
#     ${protocoloComprovante}    Get Text    comprovante-info-protocolo
#     Set Suite Variable    ${protocoloComprovante}

# No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
#     Input Text    txtRCpf    ${cpfFakeResponsavel}
#     Press Keys    txtRCpf    TAB
#     Aguardar carregamento Portal

# No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
#         Input Text    txtRNomeCompleto    ${nomeCompletoResponsavel}

# No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
#     Input Text    txtCpf    ${cpfFakeAluno}
#     Press Keys    txtCpf    TAB
#     Aguardar carregamento Portal
    
# No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
#     Input Text    txtNomeCompleto    ${nomeCompletoAluno}

# No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
#     Input Text    txtMatriculaCertidao    ${certidaoAleatoria}
#     Press Keys    txtMatriculaCertidao    TAB
#     Sleep    1
#     Aguardar carregamento Portal

# No Portal, em Contato, em Telefone 1, inserir o telefone cadastrado
#     Input Text    txtTelefone1    ${telefone1Aleatorio}
#     Sleep    1
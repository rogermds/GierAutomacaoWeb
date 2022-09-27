*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Library    FakerLibrary     locale=pt_BR
Resource    ../../1-Hooks/1-Principal.robot

*** Variables ***
${campoTipoEstabelecimentoEscolaMatricula}    cphContent_ddlTipoEstabelecimento
${campoEtapaModalidadeEscolaMatricula}        cphContent_ddlModalidade
${campoEscolaEscolaMatricula}                 cphContent_ddlEscola
${campoEPGVolpi}                              chkEW_575
${campoEPGCrispiniano}                        chkEW_607
${campoEPGAntonioAparecido}                   chkEW_584
${campoNomeCadastroPessoa}                    cphContent_ucDadosPessoais_txtNomeCompleto

*** Keywords ***
Em Escola Autorizada A Receber Matrícula, em Tipo de Estabelecimento, selecionar "ESCOLA"
    Execute JavaScript   $('#${campoTipoEstabelecimentoEscolaMatricula}').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTipoEstabelecimentoEscolaMatricula}').trigger('change');
    Aguardar tela de carregamento

Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'   Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1° SEMESTRE'    Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').val("5").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2° SEMESTRE'    Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeEscolaMatricula}').trigger('change');
    Aguardar tela de carregamento

Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "${escola}"
    Run Keyword If    '${escola}' == 'EPG ALFREDO VOLPI'    Execute JavaScript   $('#${campoEscolaEscolaMatricula}').val("575").trigger('chosen:updated');
    Run Keyword If    '${escola}' == 'EPG CRISPINIANO SOARES'   Execute JavaScript   $('#${campoEscolaEscolaMatricula}').val("607").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEscolaEscolaMatricula}').trigger('change');
    Aguardar tela de carregamento

Em Escola Autorizada A Receber Matrícula, verificar se as opções estão selecionadas, e selecionar caso não estejam
    FOR     ${index}    IN RANGE    0    20
        ${busca}    Set Variable    cphContent_dtlEscolas_chkTodosTd_${index}
        ${resultado}    Run Keyword And Return Status   Wait Until Element Is Not Visible    ${busca}    0.2
        ${resultado2}    Run Keyword And Return Status   Element Attribute Value Should Be    ${busca}    checked    true
        IF  ${resultado} or ${resultado2}
        CONTINUE    
        ELSE
            Execute JavaScript  document.getElementById("${busca}").click();
            Aguardar tela de carregamento
        END
    END

Em Escola Autorizada A Receber Matrícula, verificar se as opções foram salvas corretamente
    FOR     ${index}    IN RANGE    0    20
        ${busca}    Set Variable    cphContent_dtlEscolas_chkTodosTd_${index}
        ${resultado}    Run Keyword And Return Status   Wait Until Element Is Not Visible    ${busca}    0.2
        ${resultado2}    Run Keyword And Return Status   Element Attribute Value Should Be    ${busca}    checked    true
        IF  ${resultado} or ${resultado2}
        CONTINUE    
        ELSE
        Fail
        END
    END

Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Execute JavaScript  document.getElementById("btnCadastraJustificativa").click();

Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "${tipoSituacao}"
    Sleep    1.5
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
    Wait Until Element Is Visible    alertBox_btnOk
    Execute JavaScript  document.getElementById("alertBox_btnOk").click();
    Aguardar tela de carregamento
    
Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Wait Until Element Is Visible    txtJustificativa
    Input Text    txtJustificativa    ${justificativaSituacao}

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
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar

Em Edição de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal

Em Justificativas da Pré-Matrícula, verificar se a justificativa editada foi salva
    Wait Until Page Contains    ${textoEditado}

Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa editada
    Wait Until Element Is Visible    btnPesquisar_busca
    Input Text    txtJustificativa    ${textoEditado}

Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@idregistro,'grid_0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_exclusao_grid_0").click();
    Aguardar tela de carregamento

Em Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal

Em Layout do Portal, clicar em Cadastrar
    Execute JavaScript  document.getElementById("btnCadastraLayout").click();

Em Layout do Portal, Página Inicial, em Ano Letivo, selecionar o ano subsequente
    ${anoAtual}     Get Current Date    result_format=%Y
    ${anoSeguinte}    Evaluate     ${anoAtual}+2
    Execute JavaScript   $('#ddlAnoLetivo').val("${anoSeguinte}").trigger('chosen:updated');
    Execute JavaScript   $('#ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, em Descrição do Processo, inserir "${descricaoProcesso}"
    Set Suite Variable    ${descricaoProcesso}
    Sleep    1
    Clear Element Text    txtDescricao
    Input Text    txtDescricao    ${descricaoProcesso}

Em Layout do Portal, Página Inicial, no Banner Inicial Web, inserir uma imagem
    Choose File   fupArquivoWeb    C:\\Users\\rogerio.santos\\Desktop\\AUTOMAÇÃO WEB - GIER\\Automação - Teste De Versão Gier\\4-Arquivos\\teste-banner.jpg
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Web, inserir a data "${data}"
    Input Text    txtDataInicioWeb    ${data}
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Web, clicar em Inserir
    Execute JavaScript  document.getElementById("btnIncluirWeb").click();
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, inserir uma imagem
    Choose File   fupArquivoMobile    C:\\Users\\rogerio.santos\\Desktop\\AUTOMAÇÃO WEB - GIER\\Automação - Teste De Versão Gier\\4-Arquivos\\teste-banner.jpg
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, inserir a data "${data}"
    Sleep    1
    Input Text    txtDataInicioMobile    ${data}
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, clicar em Inserir
    Execute JavaScript  document.getElementById("btnIncluirMobile").click();
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, clicar em Salvar e Próximo
    Wait Until Element Is Visible    btnAvancaPrimeiroPasso
    Sleep    1
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("btnAvancaPrimeiroPasso").click();
    Aguardar tela de carregamento

Em Layout do Portal, Informações Importantes, em Informações Gerais selecionar "${etapaInfoGerais}"
    Sleep    1
    Set Suite Variable    ${etapaInfoGerais}
    Wait Until Element Is Visible    btnAvancaSegundoPasso
    Run Keyword If    '${etapaInfoGerais}' == 'EDUCAÇÃO INFANTIL'   Execute JavaScript   $('#ddlEtapaModalidade').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaInfoGerais}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#ddlEtapaModalidade').val("4").trigger('chosen:updated');
    Sleep    1

Em Layout do Portal, Informações Importantes, em Descrição, inserir "${textoImpressaoConselho}"
    Set Suite Variable    ${textoImpressaoEtapa}    ${textoImpressaoConselho}${etapaInfoGerais}
    Select Frame   infogeral_ifr
    Input Text   tinymce    ${textoImpressaoEtapa}
    Unselect Frame

Em Layout do Portal, Informações Importantes, clicar em Inserir
    Execute JavaScript  document.getElementById("btnInserirInfoGeral").click();

Em Layout do Portal, Informações Importantes, clicar em Salvar e Próximo
    Execute JavaScript  document.getElementById("btnAvancaSegundoPasso").click();

Em Layout do Portal, Layout Inscrição, selecionar os campos conforme o ambiente de produção
    Wait Until Element Is Visible    btnAvancaTerceiroPasso
    Execute JavaScript  document.getElementById("chkV_b5b7").click();
    Execute JavaScript  document.getElementById("chkV_b5b6").click();
    Execute JavaScript  document.getElementById("chkV_b5b9").click();
    Execute JavaScript  document.getElementById("chkV_b6b3").click();

Em Layout do Portal, Layout Inscrição, clicar em Salvar e Próximo
    Wait Until Page Contains Element    btnAvancaTerceiroPasso
    Execute JavaScript  document.getElementById("btnAvancaTerceiroPasso").click();

Em Layout do Portal, Layout Transferência, clicar em Salvar e Próximo
    Wait Until Element Is Visible    btnAvancaQuartoPasso
    Execute JavaScript  document.getElementById("btnAvancaQuartoPasso").click();

Em Layout do Portal, Observações Importantes, selecionar a Etapa "${etapaObsImportante}"
    Wait Until Element Is Visible    btnSalvar
    Set Suite Variable    ${etapaObsImportante}
    Run Keyword If    '${etapaObsImportante}' == 'EDUCAÇÃO INFANTIL'    Execute JavaScript   $('#ddlEtapaModalidadeComprovante').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaObsImportante}' == 'ENSINO FUNDAMENTAL'   Execute JavaScript   $('#ddlEtapaModalidadeComprovante').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#ddlEtapaModalidadeComprovante').trigger('change');
    Aguardar tela de carregamento

Em Layout do Portal, Observações Importantes, selecionar o curso "${cursoObsImportante}"
    Set Suite Variable    ${cursoObsImportante}
    Run Keyword If    '${cursoObsImportante}' == 'PRÉ-ESCOLA'   Execute JavaScript   $('#ddlCursoComprovante').val("3").trigger('chosen:updated');
    Run Keyword If    '${cursoObsImportante}' == 'CICLO II'     Execute JavaScript   $('#ddlCursoComprovante').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#ddlCursoComprovante').trigger('change');
    Aguardar tela de carregamento

Em Layout do Portal, Observações Importantes, selecionar em inscrição "${inscricaoTransferencia}"
    Run Keyword If    '${inscricaoTransferencia}' == 'INSCRIÇÃO'    Execute JavaScript   $('#ddlInscricaoTransferencia').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#ddlInscricaoTransferencia').trigger('change');
    Aguardar tela de carregamento

Em Layout do Portal, Observações Importantes, selecionar em vaga "${simNao}"
    Run Keyword If    '${simNao}' == 'INSCRIÇÃO'    Execute JavaScript   $('#ddlComVaga').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#ddlComVaga').trigger('change');
    Aguardar tela de carregamento

Em Layout do Portal, Observações Importantes, em Observações inserir "${obsImportante}"
    Set Suite Variable    ${etapaCursoObsImportante}    ${obsImportante}${cursoObsImportante} ${etapaObsImportante} 
    Input Text    txtComprovante    ${obsImportante}

Em Layout do Portal, Observações Importantes, clicar em Inserir
    Execute JavaScript  document.getElementById("btnInserirComprovante").click();
    Aguardar tela de carregamento
    
Em Layout do Portal, Observações Importantes, clicar em Salvar
    Execute JavaScript  document.getElementById("btnSalvar").click();
    Aguardar tela de carregamento

Em Layout do Portal, Observações Importantes, clicar em OK no Modal
    Wait Until Element Is Visible    alertBox_btnOk
    Execute JavaScript  document.getElementById("alertBox_btnOk").click();
    Aguardar tela de carregamento

Entrar no Portal 
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/index.html"
    Aguardar carregamento Portal

Em Layout do Portal, em Ano Letivo, selecionar "${ano}"
    Wait Until Page Contains    Configuração de Layout do Portal de Inscrições e Transferências
    Run Keyword If    '${ano}' == '2024'    Execute JavaScript   $('#ddlAnoLetivo').val("2024").trigger('chosen:updated');
    Run Keyword If    '${ano}' == '2023'    Execute JavaScript   $('#ddlAnoLetivo').val("2023").trigger('chosen:updated');
    Run Keyword If    '${ano}' == '2022'    Execute JavaScript   $('#ddlAnoLetivo').val("2022").trigger('chosen:updated');
    Execute JavaScript   $('#ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento

Em Layout do Portal, em Descrição do Processo, inserir a descrição criada
    Input Text    txtDescricao    ${descricaoProcesso}

Em Layout do Portal, clicar em Pesquisar
    Execute JavaScript  document.getElementById("btnPesquisar_busca").click();
    Aguardar tela de carregamento
    
Em Layout do Portal, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@class,'btnAcoes btnAcoes_grid')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_exclusao_grid_0").click();
    Aguardar tela de carregamento

Em Layout do Portal, verificar se o Layout foi excluído
    Wait Until Element Is Visible    alertBox_btnOk
    Wait Until Element Contains    lblMsg    NÃO FORAM ENCONTRADOS REGISTROS

Em Layout do Portal, clicar em OK no modal
    Wait Until Element Is Visible    alertBox_btnOk
    Execute JavaScript  document.getElementById("alertBox_btnOk").click();
    Aguardar tela de carregamento

Em Layout do Portal, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@class,'btnAcoes btnAcoes_grid')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_edicao_grid_0").click();
    Aguardar tela de carregamento

Em Layout do Portal, clicar em Ações e Continuar Configuração
    Em Layout do Portal, clicar em Ações e Editar

Em Layout do Portal, Informações Importantes, editar o texto da etapa Educação Infantil
    Wait Until Element Is Visible    btnInserirInfoGeral
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@idregistro,'gridInformacoesGerais_0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_edicao_gridInformacoesGerais_0").click();
    Aguardar tela de carregamento
    Set Suite Variable    ${textoInfoImportanteInfantil}  Texto de Informações Importantes editado para a etapa Educação Infantil !!
    Select Frame   infogeral_ifr
    Clear Element Text    tinymce
    Input Text   tinymce    ${textoInfoImportanteInfantil}
    Unselect Frame
    Execute JavaScript  document.getElementById("btnInserirInfoGeral").click();

Em Layout do Portal, Informações Importantes, editar o texto da etapa Ensino Fundamental
    Wait Until Element Is Visible    btnInserirInfoGeral
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@idregistro,'gridInformacoesGerais_2')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_edicao_gridInformacoesGerais_2").click();
    Aguardar tela de carregamento
    Set Suite Variable    ${textoInfoImportanteFundamental}  Texto de Informações Importantes editado para a etapa Ensino Fundamental !! 
    Select Frame   infogeral_ifr
    Clear Element Text    tinymce
    Input Text   tinymce    ${textoInfoImportanteFundamental}
    Unselect Frame
    Execute JavaScript  document.getElementById("btnInserirInfoGeral").click();

Em Layout do Portal, Layout Inscrição, verificar se os campos estão marcados conforme o ambiente de produção
    Element Attribute Value Should Be    chkV_b5b7    checked    true
    Element Attribute Value Should Be    chkV_b5b6    checked    true
    Element Attribute Value Should Be    chkV_b5b9    checked    true
    Element Attribute Value Should Be    chkV_b6b3    checked    true

Em Layout do Portal, Observações Importantes, editar o texto da etapa Educação Infantil
    Wait Until Element Is Visible    btnInserirComprovante
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@idregistro,'gridComprovante_2')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_edicao_gridComprovante_2").click();
    Aguardar tela de carregamento
    Set Suite Variable    ${textoObsImportanteInfantil}  Texto de Observações Importantes editado para a etapa Educação Infantil !!  
    Clear Element Text    txtComprovante
    Input Text   txtComprovante    ${textoObsImportanteInfantil}
    Execute JavaScript  document.getElementById("btnInserirComprovante").click();

Em Layout do Portal, Observações Importantes, editar o texto da etapa Ensino Fundamental
    Wait Until Element Is Visible    btnInserirComprovante
    Execute JavaScript  xPathResult = document.evaluate("//input[contains(@idregistro,'gridComprovante_12')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("div_smartGrid_edicao_gridComprovante_12").click();
    Aguardar tela de carregamento
    Set Suite Variable    ${textoObsImportanteFundamental}  Texto de Observações Importantes editado para a etapa Ensino Fundamental !!
    Clear Element Text    txtComprovante
    Input Text   txtComprovante    ${textoObsImportanteFundamental}
    Execute JavaScript  document.getElementById("btnInserirComprovante").click();

No Portal, clicar em "${etapa}"
    Run Keyword If   '${etapa}' == 'Educação Infantil'    Click Element    //div[@class='botao botao-ciano'][contains(.,'Educação Infantil')]
    Run Keyword If   '${etapa}' == 'Ensino Fundamental'    Click Element    //div[@class='botao botao-azul'][contains(.,'Ensino Fundamental')]
    Run Keyword If   '${etapa}' == 'Consultar Solicitação'    Click Element    //div[@class='botao-branco'][contains(.,'Consultar Solicitação')]
    Aguardar carregamento Portal

No Portal, selecionar o processo para a etapa "${etapa}"
    Wait Until Element Is Visible    //a[contains(@rel,'modal:close')]
    Click Element    //input[contains(@value,'AUTOMACAO ${etapa} #PROCESSO_TESTE_QA#')]
    Aguardar carregamento Portal

No Portal, verificar se o texto exibido é igual ao cadastrado em Educação Infantil
    Wait Until Element Is Visible    iniciar-inscricao
    Wait Until Page Contains    ${textoInfoImportanteInfantil}

No Portal, verificar se o texto exibido é igual ao cadastrado em Ensino Fundamental
    Wait Until Element Is Visible    iniciar-inscricao
    Wait Until Page Contains    ${textoInfoImportanteFundamental}

No Portal, fechar o modal de informações importantes
    Wait Until Page Contains Element    //a[contains(@rel,'modal:close')]
    Click Element    //a[contains(@rel,'modal:close')]
    Aguardar carregamento Portal

No Portal, em Consultar Solicitação, selecionar a nacionalidade "Brasileiro"
    Click Element    BR

No Portal, em Consultar Solicitação, em Protocolo inserir "${protocolo}"
    Input Text    txtprotocolo    ${protocolo}

No Portal, em Consultar Solicitação, em CPF inserir "${cpf}"
    Input Text    txtCpf    ${cpf}

No Portal, em Consultar Solicitação, em Data de Nascimento inserir "${dataNascimento}"
    Input Text    txtdatanascimento    ${dataNascimento}

No Portal, em Consultar Solicitação, clicar em Pesquisar
    Click Element    btnPesquisar
    Aguardar carregamento Portal

No Portal, em Consultar Solicitação, no resultado clicar em Emitir 2ª Via
    Wait Until Element Is Visible    //input[contains(@value,'Emitir 2ª Via')]
    Click Element    //input[contains(@value,'Emitir 2ª Via')]
    Aguardar carregamento Portal

No Portal, no Comprovante, verificar se o texto foi salvo para a etapa Educação Infantil
    Wait Until Page Contains    ${textoObsImportanteInfantil}

No Portal, no Comprovante, verificar se o texto foi salvo para a etapa Ensino Fundamental
    Wait Until Page Contains    ${textoObsImportanteFundamental}

Em Processo de Demanda, clicar em Cadastrar
    Wait Until Element Is Visible    cphContent_btnCadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCadastrar").click();
    Aguardar tela de carregamento

Em Processo de Demanda, na Descrição, inserir "${descricaoProcesso}"
    Set Suite Variable    ${descricaoProcesso}
    ${descricaoProcessoChave}    Set Variable    ${descricaoProcesso} #PROCESSO_TESTE_QA#
    Wait Until Element Is Visible    cphContent_btnIncluir
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao    ${descricaoProcessoChave}

Em Processo de Demanda, em Resolução, inserir "${resolucao}"
    Input Text    cphContent_txtResolucao    ${resolucao}

Em Processo de Demanda, em Ano Letivo, selecionar "${anoLetivo}"
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').val("${anoLetivo}").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "${reservaTecnica}"
    Run Keyword If    '${reservaTecnica}' == 'SIM'  Execute JavaScript   $('#cphContent_ddlReservaTecnica').val("1").trigger('chosen:updated');
    Run Keyword If    '${reservaTecnica}' == 'NÃO'  Execute JavaScript   $('#cphContent_ddlReservaTecnica').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlReservaTecnica').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "${criterioClassificacao}"
    Run Keyword If    '${criterioClassificacao}' == 'SIM'   Execute JavaScript   $('#cphContent_ddlCriteriosEscola').val("1").trigger('chosen:updated');
    Run Keyword If    '${criterioClassificacao}' == 'NÃO'   Execute JavaScript   $('#cphContent_ddlCriteriosEscola').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCriteriosEscola').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, em Processamento Único da Classificação, selecionar "${processamentoUnico}"
    Run Keyword If    '${processamentoUnico}' == 'SIM'  Execute JavaScript   $('#cphContent_ddlProcessoUnicoClassificacao').val("1").trigger('chosen:updated');
    Run Keyword If    '${processamentoUnico}' == 'NÃO'  Execute JavaScript   $('#cphContent_ddlProcessoUnicoClassificacao').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlProcessoUnicoClassificacao').trigger('change');
    Aguardar tela de carregamento
    
Em Processo de Demanda, em Tipo de Demanda, selecionar "${tipoDemanda}"
    Run Keyword If    '${tipoDemanda}' == 'CADASTRO INICIAL'    Execute JavaScript   $('#cphContent_ddlTipoDemanda').val("2").trigger('chosen:updated');
    Run Keyword If    '${tipoDemanda}' == 'CADASTRO CONTÍNUO'    Execute JavaScript   $('#cphContent_ddlTipoDemanda').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoDemanda').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "${estabelecimentoDestino}"
    Run Keyword If    '${estabelecimentoDestino}' == 'ESCOLA'   Execute JavaScript   $('#cphContent_ddlTipoEstabelecimentoDest').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoEstabelecimentoDest').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "${esferaDestino}"
    Run Keyword If    '${esferaDestino}' == 'MUNICIPAL'    Execute JavaScript   $('#cphContent_ddlEsferaAdministrativaDest').val("3").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlEsferaAdministrativaDest').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "${tipoDemanda}"
    Run Keyword If    '${tipoDemanda}' == 'EDUCAÇÃO INFANTIL'   Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("1").trigger('chosen:updated');
    Run Keyword If    '${tipoDemanda}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("4").trigger('chosen:updated');
    Run Keyword If    '${tipoDemanda}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'    Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("5").trigger('chosen:updated');
    Run Keyword If    '${tipoDemanda}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'    Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "${cicloDestino}"
    Run Keyword If    '${cicloDestino}' == 'TODOS'  Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("0").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CRECHE - BERCÁRIO I'    Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("1").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CRECHE - BERCÁRIO II'   Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("2").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CRECHE - MATERNAL'  Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("3").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'PRÉ-ESCOLA - ESTÁGIO I'     Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("6").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'PRÉ-ESCOLA - ESTÁGIO II'    Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("7").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO I - 1º ANO'   Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("11").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO I - 2º ANO'   Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("12").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO I - 3º ANO'   Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("13").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO II - 4º ANO'   Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("14").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO II - 5º ANO'   Execute JavaScript   $('#cphContent_ddlCicloEnsino').val("15").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCicloEnsino').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "${listaEspera}"
    Run Keyword If    '${listaEspera}' == 'NÃO PERMITE LISTA DE ESPERA'     Execute JavaScript   $('#cphContent_ddlApresentarSomente').val("0").trigger('chosen:updated');
    Run Keyword If    '${listaEspera}' == 'SEMPRE LISTA DE ESPERA'  Execute JavaScript   $('#cphContent_ddlApresentarSomente').val("1").trigger('chosen:updated');
    Run Keyword If    '${listaEspera}' == 'PERMITE QUANDO NÃO HOUVER VAGA'  Execute JavaScript   $('#cphContent_ddlApresentarSomente').val("2").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlApresentarSomente').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "${data}"
    Input Text    cphContent_txtDataInicialAgrupamento    ${data}
    
Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "${data}"
    Input Text    cphContent_txtDataFinalAgrupamento    ${data}

Em Processo de Demanda, Critérios, em Permite Troca, selecionar "${permiteTroca}"
    Run Keyword If    '${permiteTroca}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlTrocaEstabelecimento').val("1").trigger('chosen:updated');
    Run Keyword If    '${permiteTroca}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlTrocaEstabelecimento').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTrocaEstabelecimento').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "${tipoBusca}"
    Run Keyword If    '${tipoBusca}' == 'GEORREFERENCIAMENTO LISTA'    Execute JavaScript   $('#cphContent_ddlTipoBuscaEscola').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoBuscaEscola').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "${autorizacaoMatricula}"
    Run Keyword If    '${autorizacaoMatricula}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlAutorizacaoMatricula').val("1").trigger('chosen:updated');
    Run Keyword If    '${autorizacaoMatricula}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlAutorizacaoMatricula').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAutorizacaoMatricula').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "${permiteInscricao}"
    Run Keyword If    '${permiteInscricao}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlPermiteMesmoMatriculado').val("1").trigger('chosen:updated');
    Run Keyword If    '${permiteInscricao}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlPermiteMesmoMatriculado').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPermiteMesmoMatriculado').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, clicar em Incluir
    Execute JavaScript  document.getElementById("cphContent_btnIncluir").click();
    Aguardar tela de carregamento

Em Processo de Demanda, Seleção de Escolas, em Selecionar Diversas Escolas, selecionar "${selecionaDiversas}"
    Run Keyword If    '${selecionaDiversas}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlDiversasEscolas').val("1").trigger('chosen:updated');
    Run Keyword If    '${selecionaDiversas}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlDiversasEscolas').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlDiversasEscolas').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Gestão Pré-Matrícula, em Verifica Dados, selecionar "${verificaDados}"
    Run Keyword If    '${verificaDados}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlVerificaDadosCandidato').val("1").trigger('chosen:updated');
    Run Keyword If    '${verificaDados}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlVerificaDadosCandidato').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlVerificaDadosCandidato').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Gestão Pré-Matrícula, em Permite alterar escolas, selecionar "${alterarEscolas}"
    Run Keyword If    '${alterarEscolas}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlPermiteEscolaSemInfTurma').val("1").trigger('chosen:updated');
    Run Keyword If    '${alterarEscolas}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlPermiteEscolaSemInfTurma').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPermiteEscolaSemInfTurma').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Processo de Demanda, clicar em OK no modal
    Wait Until Element Is Visible    cphContent_Mensagem_Padrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento

Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Input Text    cphContent_txtDescricao    ${descricaoProcesso}

Em Processo de Demanda, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Processo de Demanda, verificar se o processo foi encontrado na pesquisa
    Wait Until Page Contains    ${descricaoProcesso}

Em Processo de Demanda, verificar se o processo não foi encontrado na pesquisa
    Wait Until Page Does Not Contain    ${descricaoProcesso}

Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "${mesmaEscola}"
    Run Keyword If    '${mesmaEscola}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlPermiteInscricaoMesmaEscola').val("1").trigger('chosen:updated');
    Run Keyword If    '${mesmaEscola}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlPermiteInscricaoMesmaEscola').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPermiteInscricaoMesmaEscola').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Gestão Pré-Matrícula, em Permite Inscrição Pré-Matrícula, selecionar "${inscricaoPreMatricula}"
    Run Keyword If    '${inscricaoPreMatricula}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlPermiteNovaInscricaoGpm').val("1").trigger('chosen:updated');
    Run Keyword If    '${inscricaoPreMatricula}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlPermiteNovaInscricaoGpm').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPermiteNovaInscricaoGpm').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Gestão Pré-Matrícula, em Permite Quando For, selecionar ATENDIDO e INDEFERIDO
    Execute JavaScript   $('#cphContent_lbStatusGestaoPreMatricula [value="2"]').attr('selected', true);
    Execute JavaScript   $('#cphContent_lbStatusGestaoPreMatricula [value="3"]').attr('selected', true);
    Execute JavaScript   $("#cphContent_lbStatusGestaoPreMatricula").trigger("chosen:updated");
    Aguardar tela de carregamento

Em Processo de Demanda, nos resultados, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Processo de Demanda, nos resultados, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Processo de Demanda, clicar em Sim no modal
    Wait Until Element Is Visible    cphContent_Mensagem_Padrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_Mensagem_Padrao_btnSim").click();
    Aguardar tela de carregamento

Em Programação de Processo, clicar em Cadastrar
    Wait Until Element Is Visible    cphContent_btnCadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCadastrar").click();
    Aguardar tela de carregamento

Em Programação de Processo, em Ano Letivo, selecionar "${ano}"
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').val("${ano}").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento

Em Programação de Processo, em Tipo de Processo, selecionar "${tipoProcesso}"
    Run Keyword If    '${tipoProcesso}' == 'PREMATRICULA'    Execute JavaScript   $('#cphContent_ddlTipoProcesso').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoProcesso').trigger('change');
    Aguardar tela de carregamento

Em Programação de Processo, em Processo, selecionar o processo "${processo}"
    Set Suite Variable    ${processo}
    Wait Until Page Contains    Processo
    Execute JavaScript   $("#cphContent_ddlProcesso").val($('option:contains("${processo}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlProcesso').trigger('change');
    Aguardar tela de carregamento

Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Wait Until Element Is Visible    cphContent_btnPesquisa
    Execute JavaScript   $("#cphContent_ddlProcesso").val($('option:contains("${processo}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlProcesso').trigger('change');
    Aguardar tela de carregamento

Em Programação de Processo, em Ambiente Utilizado, selecionar "${ambienteUtilizado}"
    Run Keyword If    '${ambienteUtilizado}' == 'Gier'    Execute JavaScript   document.getElementById("cphContent_rblAmbiente_0").click();
    Run Keyword If    '${ambienteUtilizado}' == 'Portal de Inscrições'    Execute JavaScript   document.getElementById("cphContent_rblAmbiente_1").click();
    Aguardar tela de carregamento

Em Programação de Processo, em Data Inicio, inserir "${data}"
    Clear Element Text    cphContent_txtDataInicio
    Input Text    cphContent_txtDataInicio    ${data}

Em Programação de Processo, em Data Fim, inserir "${data}"
    Clear Element Text    cphContent_txtDataFim
    Input Text    cphContent_txtDataFim    ${data}

Em Programação de Processo, em Hora Inicio, inserir "${hora}"
    Input Text    cphContent_txtHoraInicio    ${hora}

Em Programação de Processo, em Hora Fim, inserir "${hora}"
    Clear Element Text    cphContent_txtHoraFim
    Input Text    cphContent_txtHoraFim    ${hora}

Em Programação de Processo, em Dias da Semana, selecionar "${diaSemana}"
    Run Keyword If    '${diaSemana}' == 'Todos'    Execute JavaScript   document.getElementById("cblDiaSemana_7").click();
    Run Keyword If    '${diaSemana}' == 'Segunda-Feira'    Execute JavaScript   document.getElementById("cblDiaSemana_1").click();
    Aguardar tela de carregamento

Em Programação de Processo, clicar em Inserir
    Execute JavaScript   document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Programação de Processo, clicar em OK no modal
    Wait Until Element Is Visible    cphContent_Mensagem_Padrao_btnOk
    Execute JavaScript   document.getElementById("cphContent_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento
    
Em Programação de Processo, clicar em Sim no modal
    Wait Until Element Is Visible    cphContent_Mensagem_Padrao_btnSim
    Execute JavaScript   document.getElementById("cphContent_Mensagem_Padrao_btnSim").click();
    Aguardar tela de carregamento

Em Programação de Processo, clicar em Pesquisar
    Wait Until Element Is Visible    cphContent_btnPesquisa
    Execute JavaScript   document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Programação de Processo, verificar se o processo aparece nos resultados
    Wait Until Page Contains    ${processo}

Em Programação de Processo, verificar se é exibida a mensagem "${mensagem}"
    Element Should Contain    cphContent_Mensagem_Padrao_lblMsg    ${mensagem}

Em Programação de Processo, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Programação de Processo, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Programação de Processo, verificar se a data "${data}" foi inserida 
    Wait Until Page Contains    ${data}

Em Programação de Processo, verificar se o horário "${hora}" foi inserida 
    Wait Until Page Contains    ${hora}

No Portal, clicar em Iniciar inscrição
    Wait Until Element Is Visible    iniciar-inscricao
    Click Element    iniciar-inscricao
    Aguardar carregamento Portal

No Portal, em Escolha da Escola, em Data de Nascimento, inserir "${data}"
    Sleep    1
    Wait Until Element Is Visible    busca-nascimento
    Input Text    busca-nascimento    ${data}

No Portal, em Escolha da Escola, em CEP, inserir "${cep}"
    Input Text    busca-cep    ${cep}

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
    Sleep    1
    Run Keyword If    "${escola}" == "EPG ALFREDO VOLPI"    Wait Until Element Is Visible    ${campoEPGVolpi}
    Run Keyword If    "${escola}" == "EPG ALFREDO VOLPI"    Click Element    ${campoEPGVolpi}
    Run Keyword If    "${escola}" == "EPG CRISPINIANO SOARES"    Wait Until Element Is Visible    ${campoEPGCrispiniano}
    Run Keyword If    "${escola}" == "EPG CRISPINIANO SOARES"    Click Element    ${campoEPGCrispiniano}
    Run Keyword If    "${escola}" == "EPG ANTONIO APARECIDO MAGALHAES, VEREADOR"    Wait Until Element Is Visible    ${campoEPGAntonioAparecido}
    Run Keyword If    "${escola}" == "EPG ANTONIO APARECIDO MAGALHAES, VEREADOR"    Click Element    ${campoEPGAntonioAparecido}
    
No Portal, clicar em Selecionar Escolas
    Wait Until Element Is Enabled    selecionar-escolas-pesquisadas
    Execute JavaScript  document.getElementById("selecionar-escolas-pesquisadas").click();
    Sleep    1
    Aguardar carregamento Portal

No Portal, clicar em Próximo
    Wait Until Element Is Visible    proximo-passo1
    Click Element    proximo-passo1
    Aguardar carregamento Portal

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
    Select From List By Label    ddlRCidadeNascimento    ${ufNascimento}
    
No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    ${cpfFakeResponsavel}    FakerLibrary.cpf
    Set Suite Variable    ${cpfFakeResponsavel}
    Input Text    txtRCpf    ${cpfFakeResponsavel}
    Press Keys    txtRCpf    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    ${nomeCompletoResponsavel}    Name Female
    ${nomeCompletoResponsavel}    Replace String    ${nomeCompletoResponsavel}    ç    c
    ${nomeCompletoResponsavel}    Fetch From Right    ${nomeCompletoResponsavel}    .
    ${nomeCompletoResponsavel}    Strip String	    ${nomeCompletoResponsavel}    both
    Set Suite Variable    ${nomeCompletoResponsavel}
    Input Text    txtRNomeCompleto    ${nomeCompletoResponsavel}

No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "${dataNascimento}"
    Input Text   txtRDataNascimento    ${dataNascimento}

No Portal, em Cadastro do Responsável, em Sexo, inserir "${sexo}"
    Select From List By Label    ddlRSexo    ${sexo}
    
No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "${grauParentesco}"
    Select From List By Label    ddlGrauParentesco    ${grauParentesco}

No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "${nacionalidade}"
    Select From List By Label    ddlNacionalidade    ${nacionalidade}
    Sleep    1

No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "${UF}"   
    Wait Until Element Is Visible    ddlUfNascimento
    Select From List By Label    ddlUfNascimento    ${UF}
    Sleep    1
    Aguardar carregamento Portal
    
No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "${cidadeNascimento}"
    Wait Until Element Is Visible    ddlCidadeNascimento
    Select From List By Label    ddlCidadeNascimento    ${cidadeNascimento}

No Portal, em Cadastro do Aluno, em CPF, inserir um CPF válido
    ${cpfFakeAluno}    FakerLibrary.cpf
    Set Suite Variable    ${cpfFakeAluno}
    Input Text    txtCpf    ${cpfFakeAluno}
    Press Keys    txtCpf    TAB
    Aguardar carregamento Portal
    
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

No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "${dataEmissaoCertidao}"
    Input Text    txtDataEmissaoCertidao    ${dataEmissaoCertidao}
    
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

No Portal, em Contato, em Telefone 1, inserir um telefone válido
    Sleep    1
    ${telefoneAleatorio}    Random Number   8
    Sleep    1
    Set Suite Variable    ${telefone1Aleatorio}    119${telefoneAleatorio}
    Input Text    txtTelefone1    ${telefone1Aleatorio}
    Sleep    1

No Portal, clicar nos campos de declarações
    Aguardar carregamento Portal
    Sleep    1
    Click Element    chkResponsabilidade
    Click Element    chkLgpd
    Sleep    1
    Aguardar carregamento Portal

No Portal, clicar em Concluir Inscrição
    Wait Until Element Is Enabled    concluir-passo2
    Click Element    concluir-passo2
    Sleep    1
    Aguardar carregamento Portal
    Sleep    1
    Aguardar carregamento Portal
    Sleep    1
    Aguardar carregamento Portal

No Portal, verificar se o comprovante é exibido em tela
    Wait Until Page Contains    Comprovante de Inscrição
    Dormir

No Portal, gravar o número de protocolo gerado
    ${protocoloComprovante}    Get Text    comprovante-info-protocolo
    Set Suite Variable    ${protocoloComprovante}

Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Wait Until Element Is Visible    cphContent_btnPesquisa
    Input Text    cphContent_txtAluno    ${nomeCompletoAluno}

Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Input Text    cphContent_txtProtocolo    ${protocoloComprovante}

Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados Candidato
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkDadosCandidato_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados do Responsável
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkDadosResponsaveis_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Deferir
    Wait Until Page Contains    Resultado da Busca
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkAprovar_0").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, selecionar uma turma com vagas
    FOR     ${index}    IN RANGE    0    20
    ${busca}    Set Variable    cphContent_dtlClasseTurma_lblVagasDisponiveisTd_${index}
    ${resultado}    Run Keyword And Return Status   Element Should Not Contain    ${busca}    0    
        IF  ${resultado}
            Execute JavaScript  document.getElementById("cphContent_dtlClasseTurma_lbtSelecionar_${index}").click();
            Aguardar tela de carregamento
            IF    ${resultado}    BREAK
        END
    END
    Aguardar tela de carregamento
        
Em Gestão de Pré-Matrícula, clicar em Matricular Educando
    Execute JavaScript  document.getElementById("cphContent_btnMatricular").click();
    Aguardar tela de carregamento

Em Gestão de Pré-Matrícula, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    Input Text    txtRCpf    ${cpfFakeResponsavel}
    Press Keys    txtRCpf    TAB
    Aguardar carregamento Portal

No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
        Input Text    txtRNomeCompleto    ${nomeCompletoResponsavel}

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

No Portal, em Contato, em Telefone 1, inserir o telefone cadastrado
    Input Text    txtTelefone1    ${telefone1Aleatorio}
    Sleep    1

Em Cadastro de Pessoa, no campo Nome, inserir o nome cadastrado
    Clear Element Text    cphContent_ucDadosPessoais_txtNomeCompleto
    Input Text   cphContent_ucDadosPessoais_txtNomeCompleto    ${nomeCompletoResponsavel}

Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "${ano}"
    ${anoSeguinte}    Evaluate    ${ano}+1
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').val("${anoSeguinte}").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').val("${ano}").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Pessoa que Deseja Matricular, inserir "${alunoMatricula}"
    Clear Element Text    cphContent_PesquisaPessoa_txtNome
    Input Text    cphContent_PesquisaPessoa_txtNome    ${alunoMatricula}
    
Em Matricular Educando, em Pessoa que Deseja Matricular, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_PesquisaPessoa_btnPesquisa").click();
    Aguardar tela de carregamento

Em Matricular Educando, clicar em Sim no Modal
    Wait Until Element Is Visible    cphContent_PesquisaPessoa_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_PesquisaPessoa_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Cadastro de Pessoa, no campo Nome, inserir um nome aleatório
    ${nomeCompletoAluno}    Name Male
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

Em Matricular Educando, em Rede de Origem, selecionar "${redeOrigem}"
    Wait Until Page Contains    Matricular Educando
    Execute JavaScript   $("#cphContent_ddlFormaIngresso").val($('option:contains("${redeOrigem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlFormaIngresso').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em País de Origem, selecionar "${paisOrigem}"
    Execute JavaScript   $("#cphContent_ddlPaisOrigem").val($('option:contains("${paisOrigem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPaisOrigem').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Execute JavaScript   $("#cphContent_ddlTipoEnsino").val($('option:contains("${etapaModalidade}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoEnsino').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Curso, selecionar "${curso}"
    Execute JavaScript   $("#cphContent_ddlCurso").val($('option:contains("${curso}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCurso').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Periodo, selecionar "${periodo}"
    Execute JavaScript   $("#cphContent_ddlPeriodo").val($('option:contains("${periodo}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPeriodo').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Ciclo, selecionar "${ciclo}"
    Execute JavaScript   $("#cphContent_ddlCiclo").val($('option:contains("${ciclo}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCiclo').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, selecionar uma turma com vagas
        FOR     ${index}    IN RANGE    0    20
    ${busca}    Set Variable    cphContent_dtlConsulta_lblVTeoricasTd_${index}
    ${resultado}    Run Keyword And Return Status   Element Should Not Contain    ${busca}    0    
        IF  ${resultado}
            Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lbtSelecionar_${index}").click();
            Aguardar tela de carregamento
            IF    ${resultado}    BREAK
        END
    END
    Aguardar tela de carregamento

Em Matricular Educando, clicar em Matricular Educando
    Execute JavaScript  document.getElementById("cphContent_btnMatricularAluno").click();
    Aguardar tela de carregamento

Em Matricular Educando, clicar em Sim no Modal de Matrícula
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Matricular Educando, verificar se a matrícula foi efetuada com sucesso
    Wait Until Element Contains    cphContent_MensagemPadrao_lblMsg    MATRÍCULA EFETUADA COM SUCESSO

*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../1-Hooks/1-Principal.robot

*** Variables ***
${campoTipoEstabelecimentoEscolaMatricula}    cphContent_ddlTipoEstabelecimento
${campoEtapaModalidadeEscolaMatricula}        cphContent_ddlModalidade
${campoEscolaEscolaMatricula}              cphContent_ddlEscola

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
    Run Keyword If    '${tipoSituacao}' == 'DETERMINAÇÃO LEGAL' Execute JavaScript   $('#ddlTiposJustificativas').val("2").trigger('chosen:updated');
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
    Run Keyword If    '${cursoObsImportante}' == 'CICLO II' Execute JavaScript   $('#ddlCursoComprovante').val("4").trigger('chosen:updated');
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
    Run Keyword If   '${etapa}' == 'Educação Infantil'   Click Element    seleciona-processo-17
    Run Keyword If   '${etapa}' == 'Ensino Fundamental'   Click Element    seleciona-processo-19
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

Em Processo de Demanda, na Descrição, inserir "AUTOMACAO INFANTIL INICIAL 2023 #PROCESSO_TESTE_QA#"
    ${descricaoProcessoChave}    Set Variable   ${descricaoProcesso} #PROCESSO_TESTE_QA#
    Input Text    cphContent_txtDescricao    ${descricaoProcessoChave}

Em Processo de Demanda, em Resolução, inserir "${resolucao}"
    Input Text    cphContent_txtResolucao    ${resolucao}

Em Processo de Demanda, em Ano Letivo, selecionar "${anoLetivo}
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
    Run Keyword If    '${tipoDemanda}' == 'CADASTRO CONTÍNUO    Execute JavaScript   $('#cphContent_ddlTipoDemanda').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoDemanda').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "${estabelecimentoDestino}"
    Run Keyword If    '${estabelecimentoDestino}' == 'ESCOLA'   Execute JavaScript   $('#cphContent_ddlTipoEstabelecimentoDest').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoEstabelecimentoDest').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "${esferaDestino}"
    Run Keyword If    '${esferaDestino}' == 'MUNICIPAL' Execute JavaScript   $('#cphContent_ddlTipoEstabelecimentoDest').val("3").trigger('chosen:updated');
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
    Run Keyword If    '${cicloDestino}' == 'TODOS'  Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("0").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CRECHE - BERCÁRIO I'    Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("1").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CRECHE - BERCÁRIO II'   Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("2").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CRECHE - MATERNAL'  Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("3").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'PRÉ-ESCOLA - ESTÁGIO I' Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("6").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'PRÉ-ESCOLA - ESTÁGIO II'    Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("7").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO I - 1º ANO'   Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("11").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO I - 2º ANO'   Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("12").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO I - 3º ANO'   Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("13").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO I - 4º ANO'   Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("14").trigger('chosen:updated');
    Run Keyword If    '${cicloDestino}' == 'CICLO I - 5º ANO'   Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').val("15").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlNivelEnsinoDest').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "${listaEspera}"
    Run Keyword If    '${listaEspera}' == 'NÃO PERMITE LISTA DE ESPERA' Execute JavaScript   $('#cphContent_ddlApresentarSomente').val("0").trigger('chosen:updated');
    Run Keyword If    '${listaEspera}' == 'SEMPRE LISTA DE ESPERA'  Execute JavaScript   $('#cphContent_ddlApresentarSomente').val("1").trigger('chosen:updated');
    Run Keyword If    '${listaEspera}' == 'PERMITE QUANDO NÃO HOUVER VAGA'  Execute JavaScript   $('#cphContent_ddlApresentarSomente').val("2").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlApresentarSomente').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "${data}"
    Input Text    cphContent_txtDataInicialAgrupamento    ${data}
    
Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "${data}"
    Input Text    cphContent_txtDataInicialAgrupamento    ${data}

Em Processo de Demanda, Critérios, em Permite Troca, selecionar "${permiteTroca}"
    Run Keyword If    '${permiteTroca}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlTrocaEstabelecimento').val("1").trigger('chosen:updated');
    Run Keyword If    '${permiteTroca}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlTrocaEstabelecimento').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTrocaEstabelecimento').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Run Keyword If    '${permiteTroca}' == 'SIM'    Execute JavaScript   $('#cphContent_ddlTipoBuscaEscola').val("1").trigger('chosen:updated');
    Run Keyword If    '${permiteTroca}' == 'NÃO'    Execute JavaScript   $('#cphContent_ddlTipoBuscaEscola').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoBuscaEscola').trigger('change');
    Aguardar tela de carregamento
    
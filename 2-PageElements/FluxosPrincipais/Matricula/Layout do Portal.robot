*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Library    FakerLibrary     locale=pt_BR
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${campoTipoEstabelecimentoEscolaMatricula}    cphContent_ddlTipoEstabelecimento
${campoEtapaModalidadeEscolaMatricula}        cphContent_ddlModalidade
${campoEscolaEscolaMatricula}                 cphContent_ddlEscola
${campoEPGVolpi}                              chkEW_575
${campoEPGCrispiniano}                        chkEW_607
${campoEPGAntonioAparecido}                   chkEW_584
${campoNomeCadastroPessoa}                    cphContent_ucDadosPessoais_txtNomeCompleto

*** Keywords ***
Em Layout do Portal, clicar em Cadastrar
    Execute JavaScript  document.getElementById("btnCadastraLayout").click();

Em Layout do Portal, Página Inicial, em Ano Letivo, selecionar o ano subsequente
    Wait Until Page Contains    Configuração de Layout
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
    Choose File   fupArquivoWeb    C:\\Users\\amanda.diniz\\Desktop\\Gier-TesteVersaoWeb\\4-Arquivos\\teste-banner.jpg
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Web, inserir a data "${data}"
    Input Text    txtDataInicioWeb    ${data}
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Web, clicar em Inserir
    Execute JavaScript  document.getElementById("btnIncluirWeb").click();
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, inserir uma imagem
    Choose File   fupArquivoMobile    C:\\Users\\amanda.diniz\\Desktop\\Gier-TesteVersaoWeb\\4-Arquivos\\teste-banner.jpg
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, inserir a data "${data}"
    Sleep    1
    Input Text    txtDataInicioMobile    ${data}
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, clicar em Inserir
    Execute JavaScript  document.getElementById("btnIncluirMobile").click();
    Aguardar tela de carregamento

Em Layout do Portal, Página Inicial, clicar em Salvar e Próximo
    Sleep    3
    Wait Until Element Is Visible    btnAvancaPrimeiroPasso
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

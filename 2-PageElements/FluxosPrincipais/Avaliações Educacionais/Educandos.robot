*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Library    FakerLibrary     locale=pt_BR
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***


*** Keywords ***
Em Educandos, em Educando, inserir o nome cadastrado
    Input Text    cphContent_txtNomeAluno    ${nomeCompletoAluno}

Em Educandos, em Etapa/Modalidade, selecionar "${etapaModalidadeEducando}"
    Execute JavaScript   $("#cphContent_ddlModalidade").val($('option:contains("${etapaModalidadeEducando}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlModalidade').trigger('change');
    Aguardar tela de carregamento

Em Educandos, em Situação, selecionar "${situacaoEducando}"
    Execute JavaScript   $("#cphContent_ddlSituacao_chosen").val($('option:contains("${situacaoEducando}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlSituacao_chosen').trigger('change');
    Aguardar tela de carregamento

Em Educandos, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisar").click();
    Aguardar tela de carregamento

Em Educandos, clicar em Ações e Visualizar Matrícula
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsuAlunoMatriculado$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsuAlunoMatriculado_lnkVisualizar_0").click();
    Aguardar tela de carregamento

Em Educandos, salvar o número do Livro RM
    ${loginSenhaProva}    Get Value    cphContent_txtLivroRm
    Set Suite Variable    ${loginSenhaProva}

Em Educandos, clicar no perfil e em Sair
    Execute JavaScript  document.getElementById("cphHeader_Menu_imgUsuario2").click();
    Execute JavaScript  document.getElementById("cphHeader_Menu_lblSair").click();
    Aguardar tela de carregamento

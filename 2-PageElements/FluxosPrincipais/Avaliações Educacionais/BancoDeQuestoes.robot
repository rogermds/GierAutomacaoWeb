*** Settings ***
Library    SeleniumLibrary
Resource    ../../../1-Hooks/1-Principal.robot    

*** Variables ***


*** Keywords ***    
Em Banco de Questões, clicar em Cadastrar
    Wait Until Element Is Visible    cphContent_btnCad
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

Em Banco de Questões, em Utilização da Questão, selecionar "${utilizacaoQuestaoBanco}"
    Execute JavaScript   $("#cphContent_ddlUtilizacaoQuestao").val($('option:contains("${utilizacaoQuestaoBanco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlUtilizacaoQuestao').trigger('change');
    Aguardar tela de carregamento

Em Banco de Questões, em Texto Base para a Pergunta, inserir "${textoBasePerguntaBanco}"
    Input Text    (//div[contains(@class,'note-editable panel-body')])[1]    ${textoBasePerguntaBanco}

Em Banco de Questões, em Pergunta, inserir "${perguntaBanco}"
    Set Suite Variable    ${perguntaBanco}
    Clear Element Text    (//div[contains(@class,'note-editable panel-body')])[2]
    Input Text    (//div[contains(@class,'note-editable panel-body')])[2]    ${perguntaBanco}

Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 1   
    Choose File   cphContent_fupImagemPergunta    ${path}\\banco-questoes01.jpg
  
Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 2
    Choose File   cphContent_fupImagemPergunta    ${path}\\banco-questoes02.jpg

Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 3
    Choose File   cphContent_fupImagemPergunta    ${path}\\banco-questoes03.jpg

Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 4
    Choose File   cphContent_fupImagemPergunta    ${path}\\banco-questoes04.jpg

Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 5
    Choose File   cphContent_fupImagemPergunta    ${path}\\banco-questoes05.jpg
    
Em Banco de Questões, clicar em Anexar
    Execute JavaScript  document.getElementById("cphContent_btnAnexarImagemPergunta").click();
    Aguardar tela de carregamento

Em Banco de Questões, em Sigla, inserir "${siglaBanco}"
    Input Text    cphContent_txtSigla    ${siglaBanco}

Em Banco de Questões, em Tipo de Resposta, selecionar "${tipoRespostaBanco}"
    Execute JavaScript   $("#cphContent_ddlTipoResposta").val($('option:contains("${tipoRespostaBanco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoResposta').trigger('change');
    Aguardar tela de carregamento

Em Banco de Questões, em Grupo de Pergunta, selecionar "${grupoPerguntaBanco}"
    Sleep    1
    Execute JavaScript   $("#cphContent_ddlGrupoPergunta").val($('option:contains("${grupoPerguntaBanco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlGrupoPergunta').trigger('change');
    Aguardar tela de carregamento

Em Banco de Questões, em Peso, inserir "${pesoBanco}"
    Input Text    cphContent_txtPeso    ${pesoBanco}

Em Banco de Questões, em Nível da Questão, selecionar "${nivelQuestaoBanco}"
    Execute JavaScript   $("#cphContent_ddlNivelQuestao").val($('option:contains("${nivelQuestaoBanco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlNivelQuestao').trigger('change');
    Aguardar tela de carregamento
    
Em Banco de Questões, em Sigla Descrição de Aprendizagem, selecionar "${siglaDescricaoAprendizagemBanco}"
    Execute JavaScript   $("#cphContent_ddlSiglaAprendizagem").val($('option:contains("${siglaDescricaoAprendizagemBanco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlSiglaAprendizagem').trigger('change');
    Aguardar tela de carregamento

Em Banco de Questões, em Etapa/Modalidade, selecionar "${etapaModalidadeBanco}"
    Execute JavaScript   $("#cphContent_ddlTipoEnsino").val($('option:contains("${etapaModalidadeBanco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoEnsino').trigger('change');
    Aguardar tela de carregamento

Em Banco de Questões, em Ano/Ciclo, selecionar "${anoCicloBanco}"
    Execute JavaScript   $("#cphContent_ddlCiclo").val($('option:contains("${anoCicloBanco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCiclo').trigger('change');
    Aguardar tela de carregamento

Em Banco de Questões, em Respostas Permitidas, selecionar Texto
    Execute JavaScript  document.getElementById("cphContent_rbTextoImagem_0").click();
    Aguardar tela de carregamento

Em Banco de Questões, em Resposta, inserir "${respostaBanco}"
    Input Text    cphContent_txtResposta    ${respostaBanco}

Em Banco de Questões, em Sigla Resposta, inserir "${siglaBanco}"
    Input Text    cphContent_txtSiglaResposta    ${siglaBanco}

Em Banco de Questões, em Resposta Correta, selecionar SIM
    Execute JavaScript  document.getElementById("cphContent_ddlRespostaCerta").click();
    Aguardar tela de carregamento

Em Banco de Questões, em Texto Explicativo da Resposta, inserir "${textoExplicativoRespostaBanco}"
    Input Text    cphContent_txtExplicativoResposta    ${textoExplicativoRespostaBanco}

Em Banco de Questões, clicar em Adicionar
    Execute JavaScript  document.getElementById("cphContent_btnAddResposta").click();
    Aguardar tela de carregamento

Em Banco de Questões, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Banco de Questões, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Banco de Questões, em Pergunta, inserir a pergunta cadastrada
    Input Text    cphContent_txtPergunta    ${perguntaBanco}

Em Banco de Questões, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Banco de Questões, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Banco de Questões, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Banco de Questões, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Banco de Questões, em Respostas Permitidas, selecionar Imagem
    Execute JavaScript  document.getElementById("cphContent_rbTextoImagem_1").click();
    Aguardar tela de carregamento

Em Banco de Questões, em Inserir Imagem na Resposta, inserir a imagem da questão 1
    Choose File   cphContent_fupImagemResposta    ${path}\\resposta01.jpg

Em Banco de Questões, em Inserir Imagem na Resposta, inserir a imagem da questão 2
    Choose File   cphContent_fupImagemResposta    ${path}\\resposta02.jpg

Em Configurar Avaliação, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, clicar em Ações e Imprimir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkImprimir_0").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, verificar se a prova foi gerada corretamente
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Wait Until Page Does Not Contain    OCORREU UM ERRO INESPERADO
    Sleep    2

Em Configurar Avaliação, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

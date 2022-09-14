*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${siglaAprendizagem}        cphContent_txtSigla
${ordemAprendizagem}        cphContent_txtOrdem
${descricaoAprendizagem}    cphContent_txtDescricao

*** Keywords ***
Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "${sigla}"
    Wait Until Page Contains    Cadastro de Descrição de Aprendizagem
    Input Text    ${siglaAprendizagem}    ${sigla}

Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "${ordem}"
    Input Text    ${ordemAprendizagem}    ${ordem}

Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "${descricao}"
    Input Text    ${descricaoAprendizagem}    ${descricao}

Em Consulta de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "${descricao}"
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao    ${descricao}
    
Em Consulta de Descrição de Aprendizagem, nos resultados, clicar em ações
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Em Consulta de Descrição de Aprendizagem, nos resultados, clicar em editar
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditar_0").click();
    Aguardar tela de carregamento
    
Em Consulta de Descrição de Aprendizagem, nos resultados, clicar em excluir
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluir_0").click();
    Aguardar tela de carregamento
    
Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCadastra").click();
    Aguardar tela de carregamento
        
Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento
    
Em Cadastro de Descrição de Aprendizagem, clicar em Sim no Modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento
    
Em Consulta de Descrição de Aprendizagem, clicar em Pesquisar
    Wait Until Page Contains Element    cphContent_btnPesquisa
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Consulta de Descrição de Aprendizagem, nos resultados, verificar se a descrição de aprendizagem está como "${descricao}"
    Wait Until Element Contains    cphContent_dtlConsulta_lblDescricao_0    ${descricao}

Em Consulta de Descrição de Aprendizagem, verificar se aparece o texto "${texto}"
    Wait Until Element Contains    cphContent_MensagemPadrao_lblMsg    ${texto}
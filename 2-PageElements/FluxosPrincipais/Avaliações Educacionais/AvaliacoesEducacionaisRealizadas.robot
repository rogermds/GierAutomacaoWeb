*** Settings ***
Library    SeleniumLibrary
Resource    ../../../1-Hooks/1-Principal.robot    

*** Variables ***

*** Keywords ***
Em Avaliações Educacionais Realizadas, selecionar o ciclo "${cicloAvaliacoesRealizadas}"
    Execute JavaScript   $("#cphContent_ddlCursoCiclo").val($('option:contains("${cicloAvaliacoesRealizadas}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCursoCiclo').trigger('change');
    Aguardar tela de carregamento

Em Avaliações Educacionais Realizadas, selecionar o período "${periodoAvaliacoesRealizadas}"
    Execute JavaScript   $("#cphContent_ddlUnidadeLetiva").val($('option:contains("${periodoAvaliacoesRealizadas}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlUnidadeLetiva').trigger('change');
    Aguardar tela de carregamento

Em Avaliações Educacionais Realizadas, selecionar a avaliação "${avaliacaovaliacoesRealizadas}"
    Execute JavaScript   $("#cphContent_ddlNomeAvaliacao").val($('option:contains("${avaliacaovaliacoesRealizadas}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlNomeAvaliacao').trigger('change');
    Aguardar tela de carregamento

Em Avaliações Educacionais Realizadas, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Avaliações Educacionais Realizadas, no resultado, clicar em Ações e Relatório de Produção de Texto
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click();
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkRelatorioTexto_0").click();
    Aguardar tela de carregamento

Em Avaliações Educacionais Realizadas, verificar o relatório foi aberto sem erros
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Wait Until Page Does Not Contain    OCORREU UM ERRO INESPERADO
    Sleep    4
    Close window
    Switch Window   ${windowHandles}[0] 

Em Avaliações Educacionais Realizadas, no resultado, clicar em Ações e Relatório de Educandos Sem Lançamento
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlConsulta$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click();
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lblCustomizadoRelatorioAlunoSemLancamento_0").click();
    Aguardar tela de carregamento
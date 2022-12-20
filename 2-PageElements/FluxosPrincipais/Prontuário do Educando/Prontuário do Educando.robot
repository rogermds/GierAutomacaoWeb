*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${etapaModalidadeProntuarioEducando}        cphContent_ListaPiloto_ddlEtapaModalidade
${turmaProntuarioEducando}                  cphContent_ListaPiloto_ddlTurma

*** Keywords ***
Em Prontuário do Educando, em Etapa/Modalidade, selecionar "${etapaModalidade}" 
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'        Execute JavaScript   $('#${etapaModalidadeProntuarioEducando}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'        Execute JavaScript   $('#${etapaModalidadeProntuarioEducando}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'CII A (1º Semestre)'        Execute JavaScript   $('#${etapaModalidadeProntuarioEducando}').val("4").trigger('chosen:updated');
    Execute JavaScript   $('#${etapaModalidadeProntuarioEducando}').trigger('change');
    Aguardar tela de carregamento

Em Prontuário do Educando, no campo turma no Prontuário, selecionar "${turma}"    
    Run Keyword If    '${turma}' == 'EII A'        Execute JavaScript   $('#${turmaProntuarioEducando}').val("110667").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '5A'        Execute JavaScript   $('#${turmaProntuarioEducando}').val("112170").trigger('chosen:updated');
    Execute JavaScript   $('#${turmaProntuarioEducando}').trigger('change');
    Aguardar tela de carregamento

Em Prontuário do Educando, em Educando, selecionar "${educando}"
    Run Keyword If    '${educando}' == 'ALLAN KOJO DE ASSIS GOES'        Execute JavaScript   $('#cphContent_ListaPiloto_ddlAluno').val("2450101").trigger('chosen:updated');
    Run Keyword If    '${educando}' == 'BEATRIZ PEREIRA DA SILVA'        Execute JavaScript   $('#cphContent_ListaPiloto_ddlAluno').val("2571948").trigger('chosen:updated');
    Aguardar tela de carregamento

Em Prontuário do Educando, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_ListaPiloto_btnPesquisar").click();
    Aguardar tela de carregamento

Em Prontuário do Educando, clicar em Tipo de Compensação
    Wait Until Element Is Visible    cphContent_btnCompensacaoAusencia
    Execute JavaScript  document.getElementById("cphContent_btnCompensacaoAusencia").click();
    Aguardar tela de carregamento

Em Prontuário do Educando, clicar em Registrar Atestado
    Execute JavaScript  document.getElementById("cphContent_btnRegistrarAtestado").click();
    Aguardar tela de carregamento

Em Atestado de Educandos, em Tipo de Atestado, selecionar "MÉDICO"
    Wait Until Page Contains    Atestado de Educandos
    Execute JavaScript   $('#cphContent_ddlTipoAtestado').val("1").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoAtestado').trigger('change');
    Aguardar tela de carregamento

Em Atestado de Educandos, em Data Inicial, selecionar o dia atual
    ${dataAtual}    Get Current Date    result_format=%d/%m/%Y
    Input Text    cphContent_txtDataInicial    ${dataAtual}

Em Atestado de Educandos, em Data Final, selecionar o dia atual
    ${dataAtual}    Get Current Date    result_format=%d/%m/%Y
    Input Text    cphContent_txtDataFinal    ${dataAtual}

Em Atestado de Educandos, em Motivo, inserir "${motivoAtestado}"
    Set Suite Variable    ${motivoAtestado}
    Input Text    cphContent_txtMotivo    ${motivoAtestado}
    
Em Atestado de Educandos, em Nº Registro Profissional, inserir "${numeroRegistro}"
    Input Text    cphContent_txtRegistroProfissional    ${numeroRegistro}

Em Atestado de Educandos, em Nome do Profissional, inserir "${nomeMedico}"
    Input Text    cphContent_txtNomeProfissional    ${nomeMedico}

Em Atestado de Educandos, em Inserir Documento, inserir um arquivo teste
    Choose File   //input[contains(@class,'file txtFile')]    C:\\Users\\rogerio.santos\\Desktop\\AUTOMAÇÃO WEB - GIER\\Automação - Teste De Versão Gier\\4-Arquivos\\ARQUIVO TESTE DE ATESTADO MÉDICO.pdf
    
Em Atestado de Educandos, em Compensação de Ausências, verificar se o registro foi incluído
    Wait Until Element Contains    cphContent_dtlAtestadoAluno_lblMotivoTd_0    ${motivoAtestado}

Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlAtestadoAluno$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Em Atestado de Educandos, em Compensação de Ausências, clicar em Compensar Ausencia
    Execute JavaScript  document.getElementById("cphContent_dtlAtestadoAluno_lnkCompensarAusencia_0").click();
    Aguardar tela de carregamento

Em Atestado de Educandos, em Compensação de Ausências, clicar em Editar Compensação
    Execute JavaScript  document.getElementById("cphContent_dtlAtestadoAluno_lnkEditarCompensacao_0").click();
    Aguardar tela de carregamento
    
Em Atestado de Educandos, em Compensação de Ausências, clicar em Excluir Compensação
    Execute JavaScript  document.getElementById("cphContent_dtlAtestadoAluno_lnkExcluirCompensacao_0").click();
    Aguardar tela de carregamento
    
Em Atestado de Educandos, em Compensação de Ausências, verificar se o registro foi excluído
    Wait Until Element Is Not Visible    cphContent_dtlAtestadoAluno_lblMotivoTd_0

Em Prontuário do Educando, clicar em Finalizar
    Execute JavaScript  document.getElementById("cphContent_btnFinalizar").click();
    
Em Prontuário do Educando, clicar em Reabrir Relatório
    Execute JavaScript  document.getElementById("cphContent_btnReabrir").click();
    
Em Prontuário do Educando, verificar se o botão Finalizar está visível
    Wait Until Element Is Visible   cphContent_btnFinalizar
    
Em Prontuário do Educando, clicar em Mapa de Turma
    Execute JavaScript  document.getElementById("cphContent_ListaPiloto_btnMapaTurma").click();
    Aguardar tela de carregamento
    
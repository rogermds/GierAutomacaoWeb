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


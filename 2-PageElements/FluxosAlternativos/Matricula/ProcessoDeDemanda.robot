*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***
${campoAnoLetivo}                 cphContent_ddlAnoLetivo
${campoReservaTecnica}            cphContent_ddlReservaTecnica
${campoCriterioClassificacao}     cphContent_ddlCriteriosEscola


*** Keywords ***
Em Processo de Demanda, clicar em Cadastrar
    Wait Until Element Is Visible    cphContent_btnCadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCadastrar").click();
    Aguardar tela de carregamento

Em Processo de Demanda, na Descrição, inserir "${descricaoProcesso}"
    Set Suite Variable    ${descricaoProcesso}
    ${descricaoProcessoChave}    Set Variable    ${descricaoProcesso} #PROCESSO_TESTE_QA#
    ${codProcessoRandom}   Random Number   1
    Wait Until Element Is Visible    cphContent_btnIncluir
    Clear Element Text    cphContent_txtDescricao
    Input Text    cphContent_txtDescricao   ${descricaoProcessoChave}${codProcessoRandom}

Em Processo de Demanda, em Resolução, inserir "${resolucao}"
    Input Text    cphContent_txtResolucao    ${resolucao}

Em Processo de Demanda, em Ano Letivo, selecionar "${anoLetivo}"
    Execute JavaScript   $('#${campoAnoLetivo}').val("${anoLetivo}").trigger('chosen:updated');
    Execute JavaScript   $('#${campoAnoLetivo}').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "${reservaTecnica}"
    Run Keyword If    '${reservaTecnica}' == 'SIM'  Execute JavaScript   $('#${campoReservaTecnica}').val("1").trigger('chosen:updated');
    Run Keyword If    '${reservaTecnica}' == 'NÃO'  Execute JavaScript   $('#${campoReservaTecnica}').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#${campoReservaTecnica}').trigger('change');
    Aguardar tela de carregamento

Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "${criterioClassificacao}"
    Run Keyword If    '${criterioClassificacao}' == 'SIM'   Execute JavaScript   $('#${campoCriterioClassificacao}').val("1").trigger('chosen:updated');
    Run Keyword If    '${criterioClassificacao}' == 'NÃO'   Execute JavaScript   $('#${campoCriterioClassificacao}').val("0").trigger('chosen:updated');
    Execute JavaScript   $('#${campoCriterioClassificacao}').trigger('change');
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
    Sleep    15
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

Em Processo de Demanda, visualizar o modal de alerta contendo "${mensagemAlerta}"
    Wait Until Element Is Visible    cphContent_Mensagem_Padrao_btnOk
    Wait Until Element Contains    cphContent_Mensagem_Padrao_lblMsg    ${mensagemAlerta}  

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

Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Execute JavaScript   $("#cphContent_ddlProcesso").val($('option:contains("${descricaoProcesso}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlProcesso').trigger('change');
    Aguardar tela de carregamento

Em Programação de Processo, em Ambiente Utilizado, selecionar "${ambienteUtilizado}"
    Run Keyword If    '${ambienteUtilizado}' == 'Gier'    Execute JavaScript   document.getElementById("cphContent_rblAmbiente_0").click();
    Aguardar tela de carregamento

Em Programação de Processo, em Data Inicio, inserir "${data}"
    Clear Element Text    cphContent_txtDataInicio
    Input Text    cphContent_txtDataInicio    ${data}

Em Programação de Processo, em Data Fim, inserir "${data}"
    Clear Element Text    cphContent_txtDataFim
    Input Text    cphContent_txtDataFim    ${data}

Em Programação de Processo, em Hora Inicio, inserir "${hora}"
    Clear Element Text    cphContent_txtHoraInicio
    Input Text    cphContent_txtHoraInicio    ${hora}

Em Programação de Processo, em Hora Fim, inserir "${hora}"
    Clear Element Text    cphContent_txtHoraFim
    Input Text    cphContent_txtHoraFim    ${hora}

Em Programação de Processo, em Dias da Semana, selecionar "${diaSemana}"
    Run Keyword If    '${diaSemana}' == 'Todos'    Execute JavaScript   document.getElementById("cblDiaSemana_7").click();
    Aguardar tela de carregamento

Em Processo de Demanda, clicar em Inserir
    Execute JavaScript   document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Programação de Processo, clicar em Inserir
    Execute JavaScript   document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Programação de Processo, clicar em OK no modal
    Wait Until Element Is Visible    cphContent_Mensagem_Padrao_btnOk    60
    Execute JavaScript   document.getElementById("cphContent_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento
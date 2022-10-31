*** Settings ***
Library    SeleniumLibrary
Resource    ../../../1-Hooks/1-Principal.robot    

*** Variables ***


*** Keywords ***
Em Configurar Avaliação, clicar em Cadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, em Nome da Avaliação, inserir "${nomeAvaliacao}"
    Input Text    cphContent_txtNomeAvaliacao    ${nomeAvaliacao}

Em Configurar Avaliação, em Tipo de Lançamento, selecionar Individualizado
    Execute JavaScript  document.getElementById("cphContent_chkTipoLancamento_1").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, em Aplicação da Avaliação, selecionar On Line
    Execute JavaScript  document.getElementById("cphContent_rblAplicacao_1").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, em Aplicação da Avaliação, selecionar Off Line
    Execute JavaScript  document.getElementById("cphContent_rblAplicacao_0").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, em Proposta da Avaliação, inserir "${propostaAvaliacao}" 
    Input Text    cphContent_txtPropostaAvaliacao    ${propostaAvaliacao}

Em Configurar Avaliação, em Modelo de Avaliação, selecionar "${modeloAvaliacao}" 
    Execute JavaScript   $("#cphContent_ddlModeloAvaliacao").val($('option:contains("${modeloAvaliacao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlModeloAvaliacao').trigger('change');
    Aguardar tela de carregamento

Em Configurar Avaliação, em Periodo de Avaliação, selecionar "${periodoAvaliacao}" 
    Execute JavaScript   $("#cphContent_ddlUnidadeLetiva").val($('option:contains("${periodoAvaliacao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlUnidadeLetiva').trigger('change');
    Aguardar tela de carregamento

Em Configurar Avaliação, em Situação, selecionar Ativo
    Execute JavaScript   $("#cphContent_ddlSituacao").val($('option:contains("Ativo")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlSituacao').trigger('change');
    Aguardar tela de carregamento

Em Configurar Avaliação, em Situação, selecionar Individual Por Periodo 
    Execute JavaScript  document.getElementById("cphContent_chkIndividualPeriodo").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, em Pergunta, inserir "${perguntaAvaliacao}"
    Input Text    cphContent_txtPergunta    ${perguntaAvaliacao}

Em Configurar Avaliação, em Resposta, inserir "${respostaAvaliacao}"
    Input Text    cphContent_txtResposta    ${respostaAvaliacao}

Em Configurar Avaliação, em Etapa/Modalidade, selecionar "${etapaModalidadeAvaliacao}"
    Execute JavaScript   $("#cphContent_ddlModalidade").val($('option:contains("${etapaModalidadeAvaliacao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlModalidade').trigger('change');
    Aguardar tela de carregamento

Em Configurar Avaliação, em Curso, selecionar "${cursoAvaliacao}"
    Execute JavaScript   $("#cphContent_ddlCurso").val($('option:contains("${cursoAvaliacao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCurso').trigger('change');
    Aguardar tela de carregamento

Em Configurar Avaliação, em Ano/Ciclo, selecionar "${anoCicloAvaliacao}"
    Execute JavaScript   $("#cphContent_ddlCicloAnoSerie").val($('option:contains("${anoCicloAvaliacao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCicloAnoSerie').trigger('change');
    Aguardar tela de carregamento

Em Configurar Avaliação, adicionar o curso
    Execute JavaScript  document.getElementById("cphContent_btnAdicionar").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, em Nível, selecionar "${nivelAvaliacao}"
    Execute JavaScript   $("#cphContent_ddlNivel").val($('option:contains("${nivelAvaliacao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlNivel').trigger('change');
    Aguardar tela de carregamento

Em Configurar Avaliação, em Pontuação de, inserir "${pontuacaoDeAvaliacao}"
    Input Text    cphContent_txtPontucacaoDe    ${pontuacaoDeAvaliacao}

Em Configurar Avaliação, em Pontuação até, inserir "${pontuacaoAteAvaliacao}"
    Input Text    cphContent_txtPontuacaoAte    ${pontuacaoAteAvaliacao}

Em Configurar Avaliação, em Regra de pontuação, inserir "${regraPontuacaoAvaliacao}"  
    Input Text    cphContent_txtRegra    ${regraPontuacaoAvaliacao}

Em Configurar Avaliação, em Critérios de correção, inserir "${criterioCorrecaoAvaliacao}"
    Input Text    cphContent_txtCriterio    ${criterioCorrecaoAvaliacao}

Em Configurar Avaliação, clicar em Adicionar
    Execute JavaScript  document.getElementById("cphContent_btnAdicionarNivel").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, clicar em Salvar
    Execute JavaScript  document.getElementById("cphContent_btnSalvar").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, Cadastrar Questões, inserir a pergunta "${perguntaQuestoesAvaliacao}"
    Input Text    cphContent_txtPesquisarPergunta    ${perguntaQuestoesAvaliacao}

Em Configurar Avaliação, Cadastrar Questões, selecionar a Etapa/Modalidade "${etapaQuestoesAvaliacao}"
    Execute JavaScript   $("#cphContent_ddlTipoEnsino").val($('option:contains("${etapaQuestoesAvaliacao}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoEnsino').trigger('change');
    Aguardar tela de carregamento

Em Configurar Avaliação, Cadastrar Questões, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_btnPesquisa").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, Cadastrar Questões, clicar na questão
    Execute JavaScript  document.getElementById("cphContent_dtlPerguntaCadastrada_lbtSelecionar_0").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, Cadastrar Questões, clicar em Adicionar
    Execute JavaScript  document.getElementById("cphContent_btnAdicionarPergunta").click();
    Aguardar tela de carregamento

Em Configurar Avaliação, Cadastrar Questões, clicar em Voltar
    Execute JavaScript  document.getElementById("cphContent_btnVoltar").click();
    Aguardar tela de carregamento

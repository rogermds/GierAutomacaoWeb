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
Em Matricular Educando, em Nome, inserir o nome cadastrado
    Wait Until Element Is Visible    cphContent_PessoaResponsavel_btnPesquisa
    Input Text    cphContent_PessoaResponsavel_txtNome    ${nomeCompletoAluno}

Em Matricular Educando, em Data de Nascimento, inserir a data cadastrada
    Input Text    cphContent_PessoaResponsavel_txtDNasc    ${dataNascimento}

Em Matricular Educando, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_PessoaResponsavel_btnPesquisa").click();
    Aguardar tela de carregamento

Em Matricular Educando, em Grau de Parentesco, selecionar "${grauParentesco}"
    Wait Until Element Is Visible    cphContent_btnInserirParente
    Execute JavaScript   $("#cphContent_ddlGrauParentesco").val($('option:contains("${grauParentesco}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlGrauParentesco').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Grau de Parentesco, clicar em Responsável Legal
    Execute JavaScript  document.getElementById("cphContent_chkResponsavelLegal").click();
    Aguardar tela de carregamento

Em Matricular Educando, em Grau de Parentesco, clicar em Responsável Principal 
    Execute JavaScript  document.getElementById("cphContent_chkResponsavelPrincipal").click();
    Aguardar tela de carregamento
    
Em Matricular Educando, em Grau de Parentesco, clicar em Inserir Responsável
    Execute JavaScript  document.getElementById("cphContent_btnInserirParente").click();
    Aguardar tela de carregamento

Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "${ano}"
    ${anoSeguinte}    Evaluate    ${ano}+1
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').val("${anoSeguinte}").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').val("${ano}").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAnoLetivo').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Pessoa que Deseja Matricular, inserir "${alunoMatricula}"
    Clear Element Text    cphContent_PesquisaPessoa_txtNome
    Input Text    cphContent_PesquisaPessoa_txtNome    ${alunoMatricula}
    
Em Matricular Educando, em Pessoa que Deseja Matricular, clicar em Pesquisar
    Execute JavaScript  document.getElementById("cphContent_PesquisaPessoa_btnPesquisa").click();
    Aguardar tela de carregamento

Em Matricular Educando, clicar em Sim no Modal
    Wait Until Element Is Visible    cphContent_PesquisaPessoa_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_PesquisaPessoa_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Matricular Educando, em Rede de Origem, selecionar "${redeOrigem}"
    Wait Until Page Contains    Matricular Educando
    Execute JavaScript   $("#cphContent_ddlFormaIngresso").val($('option:contains("${redeOrigem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlFormaIngresso').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em País de Origem, selecionar "${paisOrigem}"
    Execute JavaScript   $("#cphContent_ddlPaisOrigem").val($('option:contains("${paisOrigem}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPaisOrigem').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Execute JavaScript   $("#cphContent_ddlTipoEnsino").val($('option:contains("${etapaModalidade}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTipoEnsino').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Curso, selecionar "${curso}"
    Execute JavaScript   $("#cphContent_ddlCurso").val($('option:contains("${curso}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCurso').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Periodo, selecionar "${periodo}"
    Execute JavaScript   $("#cphContent_ddlPeriodo").val($('option:contains("${periodo}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPeriodo').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, em Ciclo, selecionar "${ciclo}"
    Execute JavaScript   $("#cphContent_ddlCiclo").val($('option:contains("${ciclo}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCiclo').trigger('change');
    Aguardar tela de carregamento

Em Matricular Educando, selecionar uma turma com vagas
   FOR     ${index}    IN RANGE    0    20
    ${busca}    Set Variable    cphContent_dtlConsulta_lblVTeoricasTd_${index}
    ${resultado}    Run Keyword And Return Status   Element Text Should Not Be    ${busca}    0    
        IF  ${resultado}
            Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lbtSelecionar_${index}").click();
            Aguardar tela de carregamento
            IF    ${resultado}    
            Exit For Loop
            END
        END
    END
    Aguardar tela de carregamento

Em Matricular Educando, clicar em Matricular Educando
    Execute JavaScript  document.getElementById("cphContent_btnMatricularAluno").click();
    Aguardar tela de carregamento

Em Matricular Educando, clicar em Sim no Modal de Matrícula
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Matricular Educando, verificar se a matrícula foi efetuada com sucesso
    Wait Until Element Contains    cphContent_MensagemPadrao_lblMsg    MATRÍCULA EFETUADA COM SUCESSO
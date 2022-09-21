*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt-BR

*** Variable ***
${botaoCadastrar}               cphContent_btnCad   
${botaoPesquisar}               cphContent_btnPesquisar
${botaoEditar}                  cphContent_btnEditar
${botaoSalvar}                  cphContent_btnSalvar
${botaoFinalizar}               cphContent_btnFinalizar
${botaoVoltar}                  cphContent_btnVoltar
${botaoLimpar}                  cphContent_btnLimpar
${botaoFechar}                  cphContent_btFechar
${botaoImprimir}                cphContent_btnImprimir
${botaoDataHoje}                //button[@type='button'][contains(.,'Hoje')]
${campoObservacaoAta}           cphContent_txtObservacaoAtaConcelho
${botaoOKModal}                 cphContent_Mensagem_Padrao_btnOk
${botaoSimModal}                cphContent_Mensagem_Padrao_btnSim
${botaoNaoModal}                cphContent_Mensagem_Padrao_btnNao
${botaoSalvarAlteracoes}        cphContent_btnSalvarAlteracoes
${AnoLetivo}                    ddlAnoLetivo
${campoNome}                    cphContent_txtNome
${campoNomeEducando}            cphContent_txtNomeAluno
${campoSexo}                    cphContent_ddlSexo
${campoIdentidade}              cphContent_txtIdentidade
${campoOrgaoEmissor}            cphContent_ddlOrgaoEmissor
${campoDataDeNascimento}        cphContent_txtDataNascimento

*** Keywords ***
Abrir o navegador
    Open Browser    url=https://www.google.com/    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar o ambiente "${url}"
    Go to   ${url}

Aguardar tela de carregamento
    Wait Until Element Is Not Visible    class=carregando    300

Verificar se aparece o texto "${texto}"
    Wait Until Page Contains    ${texto}    20

Entrar no eixo "${nomeEixo}"
    Execute JavaScript  xPathResult = document.evaluate("//div[@class='divEixo'][contains(.,'${nomeEixo}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()  

Entrar no módulo "${nomeModulo}"
    IF    '${nomeModulo}' == 'Gestão'
        Execute JavaScript  xPathResult = document.evaluate("//span[contains(@id,'7')][contains(.,'Gestão')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
        Execute JavaScript  xPathResult.singleNodeValue.click()  
    ELSE
        Execute JavaScript  xPathResult = document.evaluate("//span[contains(.,'${nomeModulo}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
        Execute JavaScript  xPathResult.singleNodeValue.click()  
    END

Entrar na funcionalidade "${funcionalidade}"
    IF    '${funcionalidade}' == 'Processo de Demandas'
        Execute JavaScript  xPathResult = document.evaluate("//span[@title='Processo de Demandas']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
        Execute JavaScript  xPathResult.singleNodeValue.click()  
    ELSE 
        Execute JavaScript  xPathResult = document.evaluate("//span[contains(@title,'${funcionalidade}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
        Execute JavaScript  xPathResult.singleNodeValue.click() 
    END
    Aguardar tela de carregamento

Clicar no botão Cadastrar
    Execute JavaScript  document.getElementById("${botaoCadastrar}").click();
    Aguardar tela de carregamento

Clicar em Pesquisar
    Wait Until Element Is Visible    ${botaoPesquisar}
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click();
    Aguardar tela de carregamento

Clicar em Editar
    Wait Until Element Is Visible    ${botaoEditar}
    Execute JavaScript  document.getElementById("${botaoEditar}").click(); 
    Aguardar tela de carregamento

Clicar em Salvar
    Wait Until Element Is Visible    ${botaoSalvar}
    Execute JavaScript  document.getElementById("${botaoSalvar}").click(); 
    Aguardar tela de carregamento

Clicar em Finalizar
    Wait Until Element Is Visible    ${botaoFinalizar}
    Execute JavaScript  document.getElementById("${botaoFinalizar}").click(); 

Clicar em Fechar
    Wait Until Element Is Visible    ${botaoFechar}
    Execute JavaScript  document.getElementById("${botaoFechar}").click(); 
    Aguardar tela de carregamento

Clicar em Voltar
    Wait Until Element Is Visible    ${botaoVoltar}
    Execute JavaScript  document.getElementById("${botaoVoltar}").click();
    Aguardar tela de carregamento

Retornar a página anterior
    Go Back

Clicar em OK no Modal
    Wait Until Element Is Visible    ${botaoOKModal}
    Execute JavaScript  document.getElementById("${botaoOKModal}").click();
    Aguardar tela de carregamento
    
Clicar em Sim no Modal   
    Wait Until Element Is Visible    ${botaoSimModal}
    Execute JavaScript  document.getElementById("${botaoSimModal}").click();
    Aguardar tela de carregamento

Clicar em Não no Modal   
    Wait Until Element Is Visible    ${botaoNaoModal}
    Execute JavaScript  document.getElementById("${botaoNaoModal}").click();
    Aguardar tela de carregamento

Em nome, inserir "${nome}"
    Execute JavaScript  document.getElementById("${campoNome}").click();
    Input Text    ${campoNome}    ${nome}

Em Nome do Educando, informar "${Nome}"
    Execute JavaScript    document.getElementById("${campoNomeEducando}").click();
    Input Text    ${campoNomeEducando}    ${Nome}    
    
Em Sexo, selecionar "${Sexo}"
    Run Keyword If    '${Sexo}' == 'Selecione'  Execute JavaScript   $('#${campoSexo}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${Sexo}' == 'Feminino'  Execute JavaScript   $('#${campoSexo}').val("1").trigger('chosen:updated');
    Run Keyword If    '${Sexo}' == 'Masculino'  Execute JavaScript   $('#${campoSexo}').val("2").trigger('chosen:updated');
    Run Keyword If    '${Sexo}' == 'Não informado'  Execute JavaScript   $('#${campoSexo}').val("3").trigger('chosen:updated');
    Execute JavaScript   $('#${campoSexo}').trigger('change');
    Aguardar tela de carregamento    

Em Carteira de Identidade ou R.N.E informar um documento válido
    ${rg}    FakerLibrary.RG    
    Input Text  ${campoIdentidade}  ${rg}

Em Órgão Emissor, selecionar "${orgaoEmissor}"
    Run Keyword If    '${orgaoEmissor}' == 'Selecione'  Execute JavaScript   $('#${campoOrgaoEmissor}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${orgaoEmissor}' == 'Carteira Nacional de Habilitação'  Execute JavaScript   $('#${campoOrgaoEmissor}').val("67").trigger('chosen:updated');
    Run Keyword If    '${orgaoEmissor}' == 'Carteira de Estrangeiro'  Execute JavaScript   $('#${campoOrgaoEmissor}').val("64").trigger('chosen:updated');
    Run Keyword If    '${orgaoEmissor}' == 'Documento Estrangeiro'  Execute JavaScript   $('#${campoOrgaoEmissor}').val("59").trigger('chosen:updated');
    Run Keyword If    '${orgaoEmissor}' == 'SSP'  Execute JavaScript   $('#${campoOrgaoEmissor}').val("31").trigger('chosen:updated');
    Execute JavaScript   $('#${campoOrgaoEmissor}').trigger('change');
    Aguardar tela de carregamento    

Em campo Data de Nascimento, informar "${Data}"
    Execute JavaScript  document.getElementById("${campoDataDeNascimento}").click();
    Input Text    ${campoDataDeNascimento}    ${Data}

Clicar em Salvar Alterações
    Wait Until Element Is Visible    ${botaoSalvarAlteracoes}
    Execute JavaScript  document.getElementById("${botaoSalvarAlteracoes}").click(); 
    Aguardar tela de carregamento

Dormir
    Sleep    2

Aguardar carregamento Portal
    Wait Until Element Is Not Visible    wait    300
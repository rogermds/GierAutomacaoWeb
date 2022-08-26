*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***
${campoRotaViagens}                cphContent_ddlRota
${campoFrotaViagens}               cphContent_ddlFrota
${campoVeiculoViagens}             cphContent_ddlVeiculo
${campoVigenciaInicialViagens}     cphContent_txtVigenciaInicial
${campoVigenciaFinalViagens}       cphContent_txtVigenciaFinal  
${campoHoraInicialDeViagens}       cphContent_txtHoraInicialDe
${campoHoraInicialAteViagens}      cphContent_txtHoraInicialAte
${campoHoraFinalDeViagens}         cphContent_txtHoraFinalDe
${campoHoraFinalAteViagens}        cphContent_txtHoraFinalAte

*** Keywords ***
Entrar na funcionalidade de transporte "Viagens"
    Execute JavaScript  xPathResult = document.evaluate("//span[@title='Viagens']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()

Visualizar a mensagem: INFORME O NOME DA VIAGEM.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe o Nome da Viagem.')]

Visualizar a mensagem: INFORME A ROTA DA VIAGEM.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Rota da Viagem.')]

Em Rota, selecionar "${Rota}"
    Run Keyword If    '${Rota}' == 'Teste Qa'  Execute JavaScript   $('#${campoRotaViagens}').val("722").trigger('chosen:updated');
    Run Keyword If    '${Rota}' == 'ACLECIO SILVA SANTOS - MANHÃ'  Execute JavaScript   $('#${campoRotaViagens}').val("407").trigger('chosen:updated');
    Run Keyword If    '${Rota}' == 'ACLECIO SILVA SANTOS - TARDE'  Execute JavaScript   $('#${campoRotaViagens}').val("408").trigger('chosen:updated');
    Run Keyword If    '${Rota}' == 'ADÃO ALICIO DE LIMA - INTERMEDIARIO'  Execute JavaScript   $('#${campoRotaViagens}').val("306").trigger('chosen:updated');
    Execute JavaScript   $('#${campoRotaViagens}').trigger('change');
    Aguardar tela de carregamento

Visualizar a mensagem: INFORME A FROTA.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Frota.')]

Em Frota, selecionar "${Frota}"
    Run Keyword If    '${Frota}' == 'Transporte Escolar'  Execute JavaScript   $('#${campoFrotaViagens}').val("16").trigger('chosen:updated');
    Run Keyword If    '${Frota}' == 'Frota Interna'  Execute JavaScript   $('#${campoFrotaViagens}').val("17").trigger('chosen:updated');
    Run Keyword If    '${Frota}' == 'Frota Não Informada'  Execute JavaScript   $('#${campoFrotaViagens}').val("18").trigger('chosen:updated');
    Execute JavaScript   $('#${campoFrotaViagens}').trigger('change');

Visualizar a mensagem: INFORME O VEÍCULO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe o Veículo.')]

Em veículo, selecionar "${Veiculo}"
    Run Keyword If    '${Veiculo}' == 'FIAT - DUCATO NIKS MIC 20 - FUY2217'  Execute JavaScript   $('#${campoVeiculoViagens}').val("96").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'CITROEN - JUMPER M33M 23S - EOE7520'  Execute JavaScript   $('#${campoVeiculoViagens}').val("299").trigger('chosen:updated');
    Run Keyword If    '${Veiculo}' == 'MERCEDEZ BENZ - GUERRA MIC 16 - CSK1507'  Execute JavaScript   $('#${campoVeiculoViagens}').val("305").trigger('chosen:updated');
    Execute JavaScript   $('#${campoVeiculoViagens}').trigger('change');

Visualizar a mensagem: INFORME A DATA DE VIGÊNCIA.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Data de Vigência.')]

Em Vigência Inicial, infomar "${Data}"
    Execute JavaScript  document.getElementById("${campoVigenciaInicialViagens}").click();
    Input Text    ${campoVigenciaInicialViagens}    ${Data}

Em Vigência Final, infomar "${Data}"
    Execute JavaScript  document.getElementById("${campoVigenciaFinalViagens}").click();
    Input Text    ${campoVigenciaFinalViagens}    ${Data}

Visualizar a mensagem: DATA DE VIGÊNCIA INVÁLIDA.
    Wait Until Page Contains Element    //div[contains(@class,'rodape_acoes')]

Limpar Vigência Inicial, informar a data do dia atual
    Clear Element Text    ${campoVigenciaInicialViagens}
    Execute JavaScript  document.getElementById("${campoVigenciaInicialViagens}").click();
    Execute JavaScript  xPathResult = document.evaluate("${botaoDataHoje}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()

Limpar Vigência Final, informar a data do dia atual
    Clear Element Text    ${campoVigenciaFinalViagens}
    Execute JavaScript  document.getElementById("${campoVigenciaFinalViagens}").click();
    Execute JavaScript  xPathResult = document.evaluate("${botaoDataHoje}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()

Visualizar a mensagem: INFORME A HORÁRIO INICIAL DE.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Horário Inicial De.')]

Em Horário Inicial, informar "${Hora}" para De
    Execute JavaScript  document.getElementById("${campoHoraInicialDeViagens}").click();
    Input Text    ${campoHoraInicialDeViagens}    ${Hora}

Visualizar a mensagem: INFORME A HORÁRIO INICIAL ATÉ.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Horário Inicial Até.')]
    
Em Horário Inicial, informar "${Hora}" para até
    Execute JavaScript  document.getElementById("${campoHoraInicialAteViagens}").click();
    Input Text    ${campoHoraInicialAteViagens}    ${Hora}

Visualizar a mensagem: INFORME A HORÁRIO FiNAL DE.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Horário Final De.')]

Em Horário Final, informar "${Hora}" para De
    Execute JavaScript  document.getElementById("${campoHoraFinalDeViagens}").click();
    Input Text    ${campoHoraFinalDeViagens}    ${Hora}

Visualizar a mensagem: INFORME A HORÁRIO FINAL ATÉ.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe a Horário Final Até.')]

Em Horário Final, informar "${Hora}" para até
    Execute JavaScript  document.getElementById("${campoHoraFinalAteViagens}").click();
    Input Text    ${campoHoraFinalAteViagens}    ${Hora}

Visualizar a mensagem: INFORME OS DIAS DA SEMANA
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Informe os Dias da Semana')]
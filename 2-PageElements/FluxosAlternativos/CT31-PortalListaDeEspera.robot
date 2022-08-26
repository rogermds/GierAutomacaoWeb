*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     FakerLibrary
Library     DateTime


*** Variables ***
${botaoListaDeEsperaPortal}              //div[@class='containerBotaoMenuCentro containerBotaoTexto'][contains(.,'Lista de Espera')]
${campoNomeInscrito}                     txtNomeInscrito
${campoNomeResponsavel}                  txtNomeResponsavel 
${campoDataNascimentoPortal}             txtDataNascimento

*** Keywords ***
Clicar em Lista de Espera
    Execute JavaScript  xPathResult = document.evaluate("${botaoListaDeEsperaPortal}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Visualizar a mensagem: Necessário escolher um Ano Letivo
    Wait Until Page Contains Element    //div[@class='swal-title'][contains(.,'Atenção')]
    
Em Ano Letivo no Portal, selecionar o ano letivo corrente
    ${anoAtual}     Get Current Date    result_format=%Y
    ${anoSeguinte}    Evaluate     ${anoAtual}
    Execute JavaScript   $('#${AnoLetivo}').val("${anoSeguinte}").trigger('chosen:updated');
    Execute JavaScript   $('#${AnoLetivo}').trigger('change');

Visualizar a mensagem: Necessário informar o Nome do(a) Inscrito(a)
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Necessário informar o Nome do(a) Inscrito(a)')]

Em Nome do(a) Aluno(a), informar "${Nome}"
    Input Text    ${campoNomeInscrito}    ${Nome}
    Sleep    2

Visualizar a mensagem: Necessário informar a data de Nascimento.
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Necessário informar a Data de Nascimento')]

Em Data de Nascimento no Portal, informar "${Data}"
    Input Text    ${campoDataNascimentoPortal}    ${Data}
    Sleep    2

Visualizar a mensagem: Necessário informar o Nome do(a) Responsável
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Necessário informar o Nome do(a) Responsável')]

Em Nome do(a) Responsável, informar "${Nome}"
    Input Text    ${campoNomeResponsavel}    ${Nome}
    Sleep    10
    
Visualizar a mensagem: Nenhum registro encontrado com os dados informados
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Nenhum registro encontrado com os dados informados')]

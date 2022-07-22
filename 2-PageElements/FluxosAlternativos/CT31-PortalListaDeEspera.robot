*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     FakerLibrary
Library     DateTime


*** Variables ***
${botaoListaDeEsperaPortal}              //div[@class='containerBotaoMenuCentro containerBotaoTexto'][contains(.,'Lista de Espera')]
${campoNomeInscrito}                     txtNomeInscrito
${campoNomeResponsavel}                  txtNomeResponsavel 

*** Keywords ***
Clicar em Lista de Espera
    Execute JavaScript  xPathResult = document.evaluate("${botaoListaDeEsperaPortal}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Visualizar a mensagem: Necessário escolher um Ano Letivo
    Wait Until Page Contains Element    //div[@class='swal-title'][contains(.,'Atenção')]
    
Em Ano Letivo no Portal, selecionar o ano letivo corrente
    ${anoAtual}     Get Current Date    result_format=%Y
    Execute JavaScript  document.getElementById("${anoAtual}").click();

Visualizar a mensagem: Necessário informar o Nome do(a) Inscrito(a)
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Necessário informar o Nome do(a) Inscrito(a)')]

Em Nome do(a) Aluno(a), informar "${Nome}"
    Input Text    ${campoNomeInscrito}    ${Nome}
    Sleep    2
    
Visualizar a mensagem: Necessário informar a Data de Nascimento
    Wait Until Page Contains Element    //div[@class='swal-modal'][contains(.,'AtençãoNecessário informar a Data de Nascimento    Ok')]

Visualizar a mensagem: Necessário informar o Nome do(a) Responsável
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Necessário informar o Nome do(a) Responsável')]

Em Nome do(a) Responsável, informar "${Nome}"
    Input Text    ${campoNomeResponsavel}    ${Nome}
    Sleep    10
    
Visualizar a mensagem: Nenhum registro encontrado com os dados informados
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Nenhum registro encontrado com os dados informados')]

Clicar em Fechar no alerta no Portal
    Execute JavaScript  document.getElementById("${botaoFechar}").click()
    
Visualizar a mensagem: A Data de Nascimento informada é inválida
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'A Data de Nascimento informada é inválida')]
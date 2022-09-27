
*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     DateTime


*** Variables ***
${botaoConsultarSolicitacao}            //div[@class='containerBotaoMenuCentro containerBotaoTexto'][contains(.,'Consultar Solicitação')]
${botaoOkAlerta}                        //button[@class='swal-button swal-button--confirm'][contains(.,'Ok')]
${checkBrasileiro}                      BR
${campoProtocoloPortal}                 txtprotocolo
${campoCpfPortal}                       txtCpf     
${campoDataPortal}                      txtdatanascimento
${checkEstrangeiro}                      OU
${campoRnePortal}                        txtRne               


*** Keywords ***
Clicar em 'Consultar Solicitação'
    Execute JavaScript  xPathResult = document.evaluate("${botaoConsultarSolicitacao}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()

Clicar em pesquisar no Portal
    ${botaoPesquisar}    Set Variable    btnPesquisar
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click()
    Sleep    2
    
Visualizar a mensagem: Necessário escolher uma nacionalidade.
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Necessário escolher uma nacionalidade.')]

Clicar em Ok no alerta do Portal
    Execute JavaScript  xPathResult = document.evaluate("${botaoOkAlerta}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    3
    
Em Nacionalidade, selecionar "Brasileiro"
    Execute JavaScript  document.getElementById("${checkBrasileiro}").click()
    Sleep    5
    
Visualizar a mensagem: Necessário informar um protocolo válido. 
    Wait Until Page Contains Element  //div[@class='swal-text'][contains(.,'Necessário informar um protocolo válido.')]

Em Protocolo, informar "${Protocolo}"
    Input Text    ${campoProtocoloPortal}    ${Protocolo}
    Sleep    3
    
Em Data de Nascimento, informar "${Data}"
    Input Text    ${campoDataPortal}    ${Data}
    Sleep    3

Visualizar a mensagem: Necessário informar um documento.
    Wait Until Page Contains Element    //div[@class='swal-footer'][contains(.,'Ok')]

Em CPF, inserir "${CPF}"
    Input Text    ${campoCpfPortal}    ${CPF}
    Sleep    3

Visualizar a mensagem: Não foi localizado registro com os dados informados.
    Wait Until Page Contains Element    //td[@valign='top'][contains(.,'Não foi localizado registro com os dados informados.')]

Limpar o campo Data de Nascimento
    Clear Element Text    ${campoDataPortal}

Visualizar a mensagem: Necessário informar uma data de Nascimento.
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Necessário informar uma data de Nascimento.')]

Visualizar a mensagem: Formato de data inválida.
    Wait Until Page Contains Element    //div[@class='swal-text'][contains(.,'Formato de data inválida.')]

Em Nacionalidade, selecionar "Estrangeiro"
    Execute JavaScript  document.getElementById("${checkEstrangeiro}").click()
    Sleep    5

Em RNE, informar "${Rne}"
    Input Text    ${campoRnePortal}    ${Rne}    
    Sleep    3
*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${campoNomeEducando}                      cphContent_txtAluno  
${campoProtocolo}                         cphContent_txtProtocolo

*** Keywords ***
Em campo Educando, informar "${Nome}"
    Input Text    ${campoNomeEducando}      ${Nome}

Em campo Protocolo, informar "${Protocolo}"
    Input Text    ${campoProtocolo}      ${Protocolo}

Visualizar a mensagem: NÃO HÁ EDUCANDOS COM OS FILTROS SELECIONADOS.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Não há Educandos com os filtros selecionados.')]
    
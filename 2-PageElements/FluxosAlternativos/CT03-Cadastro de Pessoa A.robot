*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${campoPesquisaEstrutura}         //input[contains(@class,'textBuscaEstrutura')]
${primeiroResultadoEstrutura}     //html[1]/body[1]/form[1]/div[3]/div[1]/div[1]/div[3]/div[1]/div[2]/div[2]/table[1]/tbody[1]/tr[1]/td[1]

*** Keywords ***
Pesquisar "${pesquisaEstrutura}" e selecionar o primeiro resultado
    Input Text  ${campoPesquisaEstrutura}    ${pesquisaEstrutura}
    Click Element  ${primeiroResultadoEstrutura}

Selecionar o botão Cadastrar
    Click Button    locator=cphContent_btnCad
    

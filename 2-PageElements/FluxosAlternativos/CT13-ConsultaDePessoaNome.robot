*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${botaoPesquisar}    cphContent_btnPesquisa    

*** Keywords ***
Clicar no Botão "Pesquisar"
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click();

Visualizar a mensagem: OBRIGATÓRIO PREENCHER NOME E SOBRENOME OU NOME E DATA DE NASCIMENTO. 
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Obrigatório preencher NOME e SOBRENOME ou NOME e DATA DE NASCIMENTO.')]
*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***
${botaoPesquisa}            cphContent_btnPesquisa

*** Keywords ***
Clicar no Botão para "Pesquisar"
    Execute JavaScript  document.getElementById("${botaoPesquisa}").click();
    Aguardar tela de carregamento

Visualizar a mensagem: OBRIGATÓRIO PREENCHER NOME E SOBRENOME OU NOME E DATA DE NASCIMENTO. 
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Obrigatório preencher NOME e SOBRENOME ou NOME e DATA DE NASCIMENTO.')]
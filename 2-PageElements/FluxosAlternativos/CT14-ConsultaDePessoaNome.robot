*** Settings ***
Library    SeleniumLibrary
Library     FakerLibrary

*** Variables ***
${campoNomePesquisa}    cphContent_txtNome

*** Keywords ***
Clicar no campo de pesquisa 'Nome' e preencher o valor "${Nome}"
    Execute JavaScript  document.getElementById("${campoNomePesquisa}").click();
    Input Text    ${campoNomePesquisa}    ${Nome}
    
Visualizar a mensagem: NENHUM REGISTRO FOI ENCONTRADO.     
    Wait Until Page Contains Element    cphContent_MensagemPadrao_lblMsg
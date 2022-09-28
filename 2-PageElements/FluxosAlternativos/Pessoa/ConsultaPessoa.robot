*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***
${botaoPesquisa}            cphContent_btnPesquisa
${campoNomePesquisa}        cphContent_txtNome
${campoEmailPesquisa}       cphContent_txtEmail
${campoTipoDePesquisa}      cphContent_ddlTipoPesquisa

*** Keywords ***
Clicar no Botão para "Pesquisar"
    Execute JavaScript  document.getElementById("${botaoPesquisa}").click();
    Aguardar tela de carregamento

Visualizar a mensagem: OBRIGATÓRIO PREENCHER NOME E SOBRENOME OU NOME E DATA DE NASCIMENTO. 
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Obrigatório preencher NOME e SOBRENOME ou NOME e DATA DE NASCIMENTO.')]

Clicar no campo de pesquisa 'Nome' e preencher o valor "${Nome}"
    Execute JavaScript  document.getElementById("${campoNomePesquisa}").click();
    Input Text    ${campoNomePesquisa}    ${Nome}
    
Visualizar a mensagem: NENHUM REGISTRO FOI ENCONTRADO.     
    Wait Until Page Contains Element    //span[contains(.,'Nenhum registro foi encontrado.')]    5

Clicar no tipo de Pesquisa e selecionar o tipo "${tipoPesquisa}"
    Run Keyword If    '${tipoPesquisa}' == 'NOME'  Execute JavaScript   $('#${campoTipoDePesquisa}').val("1").trigger('chosen:updated');
    Run Keyword If    '${tipoPesquisa}' == 'CPF'  Execute JavaScript   $('#${campoTipoDePesquisa}').val("2").trigger('chosen:updated');
    Run Keyword If    '${tipoPesquisa}' == 'CADASTRO MUNÍCIPE'  Execute JavaScript   $('#${campoTipoDePesquisa}').val("3").trigger('chosen:updated');
    Run Keyword If    '${tipoPesquisa}' == 'CORREIO ELETRÔNICO'  Execute JavaScript   $('#${campoTipoDePesquisa}').val("4").trigger('chosen:updated');
    Run Keyword If    '${tipoPesquisa}' == 'NÚMERO DO RA'  Execute JavaScript   $('#${campoTipoDePesquisa}').val("5").trigger('chosen:updated');
    Run Keyword If    '${tipoPesquisa}' == 'NÚMERO DA CERTIDÃO DE NASCIMENTO'  Execute JavaScript   $('#${campoTipoDePesquisa}').val("6").trigger('chosen:updated');
    Run Keyword If    '${tipoPesquisa}' == 'NOVA MATRÍCULA DA CERTIDÃO'  Execute JavaScript   $('#${campoTipoDePesquisa}').val("7").trigger('chosen:updated');
    Run Keyword If    '${tipoPesquisa}' == 'NÚMERO DO RNE'  Execute JavaScript   $('#${campoTipoDePesquisa}').val("8").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTipoDePesquisa}').trigger('change');
    Element Attribute Value Should Be     ${campoTipoDePesquisa}  value   4
    Sleep    5

Clicar no campo de pesquisa 'Correio Eletrônico' e preencher o valor "${Email}"
    Execute JavaScript  document.getElementById("${campoEmailPesquisa}").click();
    Input Text    ${campoEmailPesquisa}    ${Email}
    
Visualizar a mensagem: INFORME UM CORREIO ELETRÔNICO VÁLIDO.
    Wait Until Page Contains Element    cphContent_MensagemPadrao_lblMsg
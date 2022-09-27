*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***
${respostaAAvaliacao}                        questao_0_resposta_0_hash_b0b9b5b7
${respostaBAvaliacao}                        questao_2_resposta_1_hash_b0b9b4b4
${respostaCAvaliacao}                        questao_5_resposta_2_hash_b0b9b7b9
${respostaDAvaliacao}                        questao_9_resposta_3_hash_b0b9b9b4

*** Keywords ***
Clicar na Resposta "A"
    Execute JavaScript  document.getElementById("${respostaAAvaliacao}").click();

Clicar na Resposta "B"
    Execute JavaScript  document.getElementById("${respostaBAvaliacao}").click();
 
Clicar na Resposta "C"
    Execute JavaScript  document.getElementById("${respostaCAvaliacao}").click();

Clicar na Resposta "D"
    Execute JavaScript  document.getElementById("${respostaDAvaliacao}").click();

Visualizar o texto: Perguntas não respondidas: 2, 4, 5, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18
    Wait Until Page Contains Element    //div[@class='col-12 avaliacao-nao-respondidas'][contains(.,'Perguntas não respondidas: 2, 4, 5, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18')]

Visualizar o botão Salvar desabilitado 
    Wait Until Page Contains Element    (//input[@value='Salvar'])[1]
    
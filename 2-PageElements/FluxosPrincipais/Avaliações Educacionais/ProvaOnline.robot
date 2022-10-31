*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Library    String
Library    FakerLibrary     locale=pt_BR
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***


*** Keywords ***
Entrar com as credenciais do aluno
    Entrar com as credenciais "${loginSenhaProva}" e "${loginSenhaProva}"

Clicar na Prova "${nomeProva}"
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(.,'${nomeProva}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 


Na Prova, na Pergunta 1, clicar na Resposta A
    Wait Until Element Is Visible    questao_0_resposta_0_hash_b2b4b5b9
    Execute JavaScript  document.getElementById("questao_0_resposta_0_hash_b2b4b5b9").click();
    Aguardar tela de carregamento

Na Prova, na Pergunta 2, clicar na Resposta B
    Wait Until Element Is Visible    questao_1_resposta_1_hash_b2b4b4b2
    Execute JavaScript  document.getElementById("questao_1_resposta_1_hash_b2b4b4b2").click();
    Aguardar tela de carregamento

Na Prova, na Pergunta 3, clicar na Resposta C
    Wait Until Element Is Visible    questao_2_resposta_2_hash_b2b4b4b9
    Execute JavaScript  document.getElementById("questao_2_resposta_2_hash_b2b4b4b9").click();
    Aguardar tela de carregamento

Na Prova, na Pergunta 4, clicar na Resposta D
    Wait Until Element Is Visible    questao_3_resposta_3_hash_b2b4b7b2
    Execute JavaScript  document.getElementById("questao_3_resposta_3_hash_b2b4b7b2").click();
    Aguardar tela de carregamento

Na Prova, na Pergunta 5, clicar na Resposta C
    Wait Until Element Is Visible    questao_4_resposta_2_hash_b2b4b7b7
    Execute JavaScript  document.getElementById("questao_4_resposta_2_hash_b2b4b7b7").click();
    Aguardar tela de carregamento

Na Prova, na Pergunta 6, clicar na Resposta B
    Wait Until Element Is Visible    questao_5_resposta_1_hash_b2b4b7b8
    Execute JavaScript  document.getElementById("questao_5_resposta_1_hash_b2b4b7b8").click();
    Aguardar tela de carregamento

Na Prova, na Pergunta 7, clicar na Resposta A
    Wait Until Element Is Visible    questao_6_resposta_0_hash_b2b4b6b1
    Execute JavaScript  document.getElementById("questao_6_resposta_0_hash_b2b4b6b1").click();
    Aguardar tela de carregamento

Na Prova, clicar em Avançar
    Execute JavaScript      document.getElementsByClassName("avaliacao-avanca-questao")[0].click();
    Aguardar tela de carregamento

Na Prova, clicar em Voltar
    Execute JavaScript      document.getElementsByClassName("avaliacao-volta-questao")[0].click();
    Aguardar tela de carregamento

Na Prova, clicar em Finalizar
    Execute JavaScript      document.getElementsByClassName("avaliacao-finaliza")[0].click();
    Aguardar tela de carregamento

Na Prova, clicar em Salvar
    Na Prova, clicar em Avançar
    Aguardar tela de carregamento

Na Prova, clicar em Navegue no questionário
    Execute JavaScript  xPathResult = document.evaluate("//div[@class='left'][contains(.,'Navegue no questionário')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click();

Na Prova, verificar se as questões 3, 2 e 1 estão em azul
    Element Attribute Value Should Be    //div[@onclick='SalvaResposta(false, 1)']    class    col-3 col-sm-2 col-lg-1 questao-respondida
    Element Attribute Value Should Be    //div[@onclick='SalvaResposta(false, 2)']    class    col-3 col-sm-2 col-lg-1 questao-respondida
    Sleep    1
    Element Attribute Value Should Be    //div[@onclick='SalvaResposta(false, 3)']    class    col-3 col-sm-2 col-lg-1 questao-respondida

Na Prova, verificar se as questões 4, 5, 6 e 7 estão em cinza
    Element Attribute Value Should Be    //div[@onclick='SalvaResposta(false, 4)']    class    col-3 col-sm-2 col-lg-1 questao-nao-respondida
    Element Attribute Value Should Be    //div[@onclick='SalvaResposta(false, 5)']    class    col-3 col-sm-2 col-lg-1 questao-nao-respondida
    Element Attribute Value Should Be    //div[@onclick='SalvaResposta(false, 6)']    class    col-3 col-sm-2 col-lg-1 questao-nao-respondida
    Element Attribute Value Should Be    //div[@onclick='SalvaResposta(false, 7)']    class    col-3 col-sm-2 col-lg-1 questao-nao-respondida

Na Prova, visualizar a mensagem de avaliação finalizada
    Wait Until Element Is Visible    class=mensagem-sair

Na Prova, clicar em Sair
    Execute JavaScript      document.getElementsByClassName("avaliacao-sair")[0].click();
    Aguardar tela de carregamento

Na Prova, verificar o campo da prova foi desativado
    Element Attribute Value Should Be    //a[contains(.,'Avaliação Teste - Automação')]    class    aspNetDisabled


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
    Wait Until Element Is Visible    (//input[contains(@type,'radio')])[1]
    Clicar no campo com xPath "(//input[contains(@type,'radio')])[1]"
    Aguardar tela de carregamento

Na Prova, na Pergunta 2, clicar na Resposta B
    Wait Until Element Is Visible    (//input[contains(@type,'radio')])[2]
    Clicar no campo com xPath "(//input[contains(@type,'radio')])[2]"
    Aguardar tela de carregamento

Na Prova, na Pergunta 3, clicar na Resposta C
    Wait Until Element Is Visible    (//input[contains(@type,'radio')])[3]
    Clicar no campo com xPath "(//input[contains(@type,'radio')])[3]"
    Aguardar tela de carregamento

Na Prova, na Pergunta 4, clicar na Resposta D
    Wait Until Element Is Visible    (//input[contains(@type,'radio')])[4]
    Clicar no campo com xPath "(//input[contains(@type,'radio')])[4]"
    Aguardar tela de carregamento

Na Prova, na Pergunta 5, clicar na Resposta C
    Wait Until Element Is Visible    (//input[contains(@type,'radio')])[3]
    Clicar no campo com xPath "(//input[contains(@type,'radio')])[3]"
    Aguardar tela de carregamento

Na Prova, na Pergunta 6, clicar na Resposta B
    Wait Until Element Is Visible    (//input[contains(@type,'radio')])[2]
    Clicar no campo com xPath "(//input[contains(@type,'radio')])[2]"
    Aguardar tela de carregamento

Na Prova, na Pergunta 7, clicar na Resposta A
    Wait Until Element Is Visible    (//input[contains(@type,'radio')])[1]
    Clicar no campo com xPath "(//input[contains(@type,'radio')])[1]"
    Aguardar tela de carregamento

Na Prova, clicar em Avançar
    Sleep    1
    Execute JavaScript      document.getElementsByClassName("avaliacao-avanca-questao")[0].click();
    Aguardar tela de carregamento

Na Prova, clicar em Voltar
    Sleep    2
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

Na Prova, verificar se o botão Salvar está desabilitado
    Wait Until Element Is Visible    (//input[contains(@value,'Salvar')])[1]
    Element Attribute Value Should Be    (//input[contains(@value,'Salvar')])[1]    class    avaliacao-avanca-questao botao-cinza botao-desabilitado

Na Prova, verificar se o botão Finalizar está desabilitado
    Wait Until Element Is Visible    (//input[contains(@value,'Finalizar')])[1]
    Element Attribute Value Should Be    (//input[contains(@value,'Finalizar')])[1]    class    avaliacao-finaliza botao-cinza botao-desabilitado
    
Na Prova, na Pergunta 3, verificar se a resposta C está marcada
    Wait Until Element Is Visible    (//input[contains(@type,'radio')])[3]
    Element Attribute Value Should Be    (//input[contains(@type,'radio')])[3]   checked    true

Na Prova, visualizar o texto "${textoProva}"
    Wait Until Page Contains    ${textoProva}
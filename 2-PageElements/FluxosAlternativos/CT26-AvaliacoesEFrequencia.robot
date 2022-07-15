*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary
Library     FakerLibrary

*** Keywords ***
Na consulta de avaliações, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL" 

Na consulta de avaliações, em Data de Referência, informar "00000000"

Visualizar a mensagem: INFORME UMA DATA VÁLIDA

Na consulta de avaliações, em Data de Referência, informar a data do dia atual

Na consulta de avaliações, em Professor, selecionar "PRISCILA DOMINGUES FERNANDES LOPES"

Na consulta de avaliações, em Turma, selecionar "3B"   

Clicar em Pesquisar

No primeiro aluno, em questionário, clicar em Diário de Bordo do Aluno

Clicar em "Salvar"

Visualizar a mensagem: INFORME A DESCRIÇÃO.

Em Descrição, informar o valor "Teste Automação Qualidade - Fluxo Negativo"

Visualizar a mensagem: UM TIPO DE AVALIAÇÃO DEVE SER SELECIONADO.
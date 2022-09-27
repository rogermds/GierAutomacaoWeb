*** Settings ***
Resource    ../../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***




*** Keywords ***
# Clicar no Processo de Demandas Contínuo
# Clicar no botão Solicitar Vaga 
# Clicar em Nacionalidade e selecionar "Estrangeiro"
# Clicar em RNE e informar "123456789qa"
# Clicar em Data de Entrada do candidato e informar "00/00/0000"
# Clicar em Nome Completo do cadidato e informar "Teste Nome Candidato Estrangeiro"
# Visualizar a mensagem: DATA DE ENTRADA (RNE) INVÁLIDA
# Clicar em Data de Entrada do candidato e informar "24/04/2021"
# Visualizar a mensagem: DATA DE ENTRADA (RNE) NÃO PODE SER MENOR OU IGUAL QUE A DATA DE NASCIMENTO
# Clicar em Data de Entrada do candidato e informar "25/04/2021"
# Visualizar a mensagem: VOCÊ NÃO PODE REALIZAR UMA NOVA INSCRIÇÃO, ALUNO JÁ POSSUI UMA INSCRIÇÃO ATIVA.

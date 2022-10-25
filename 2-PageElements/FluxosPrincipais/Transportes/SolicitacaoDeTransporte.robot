*** Settings ***
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Em Solicitação de Transporte, selecionar a Etapa/Modalidade "EDUCAÇÃO INFANTIL"
Em Solicitação de Transporte, selecionar a Situação "SEM SOLICITAÇÃO"
Em Solicitação de Transporte, clicar em Pesquisar
Em Solicitação de Transporte, clicar em um aluno para solicitar transporte
Em Solicitação de Transporte, clicar em Enviar Solicitação
Em Solicitação de Transporte, clicar no perfil e em Trocar Perfil
Em Solicitação de Transporte, selecionar a Situação "AGUARDANDO ANÁLISE"
Em Solicitação de Transporte, clicar em um aluno para analisar transporte
Em Solicitação de Transporte, clicar Deferir
Em Solicitação de Transporte, clicar Ok no modal
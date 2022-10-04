*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***


*** Keywords ***
Em Tipos de Frotas, clicar em Cadastrar
    Wait Until Element Is Visible    cphContent_btnCad
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

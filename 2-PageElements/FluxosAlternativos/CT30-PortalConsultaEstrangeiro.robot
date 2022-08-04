*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     DateTime


*** Variables ***
${checkEstrangeiro}                      OU
${campoRnePortal}                        txtRne

*** Keywords ***
Em Nacionalidade, selecionar "Estrangeiro"
    Execute JavaScript  document.getElementById("${checkEstrangeiro}").click()
    Sleep    5

Em RNE, informar "${Rne}"
    Input Text    ${campoRnePortal}    ${Rne}
    Sleep    3
    


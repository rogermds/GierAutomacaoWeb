*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Informar a Estrutura MMMMMM
    Input Text    locator=//input[contains(@type,'search')]    text=MMMMMM

Verificar se o sistema exibe a mensagem: Não há registros com o argumento pesquisado.
    Element Should Be Visible    locator=//td[@valign='top'][contains(.,'Não há registros com o argumento pesquisado.')]
    Wait Until Page Contains    text=Não há registros com o argumento pesquisado.
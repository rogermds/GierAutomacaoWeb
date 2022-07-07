*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Clicar no Campo "CPF" e Preencher o Valor "41316137864"
    Input Text    locator=txtCpf    text=41316137864
    Execute JavaScript  document.getElementById("btnEnviar").click();
    
Verificar se o sistema exibe a mensagem: Informe um email válido!
    Element Should Be Visible    locator=lblerroEmail
    Wait Until Page Contains     text=Informe um email válido!
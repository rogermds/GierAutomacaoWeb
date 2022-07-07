*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Clicar no Campo 'CPF' e Preencher o Valor "${CPF}"
    Input Text    locator=txtCpf    text=${CPF}
    Execute JavaScript  document.getElementById("btnEnviar").click();
    
Verificar se o sistema exibe a mensagem: Informe um email válido!
    Element Should Be Visible    locator=lblerroEmail
    Wait Until Page Contains     text=Informe um email válido!
*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Clicar em 'Esqueci minha Senha'
    Click Link    locator=lbtEsqueciSenha

Clicar no Campo 'EMAIL' e Preencher o Valor "${Email}"
    Input Text    locator=txtEmail   text=${Email}
    Execute JavaScript  document.getElementById("btnEnviar").click();

Verificar se o sistema exibe a mensagem: Informe um CPF válido!
    Element Should Be Visible    locator=lblerroCpf
    Wait Until Page Contains    text=Informe um CPF válido!

Clicar no Campo 'CPF' e Preencher o Valor "${CPF}"
    Input Text    locator=txtCpf    text=${CPF}
    Execute JavaScript  document.getElementById("btnEnviar").click();
    
Verificar se o sistema exibe a mensagem: Informe um email válido!
    Element Should Be Visible    locator=lblerroEmail
    Wait Until Page Contains     text=Informe um email válido!    
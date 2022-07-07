*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Clicar em "Esqueci minha Senha"
    Click Link    locator=lbtEsqueciSenha

Clicar no Campo "EMAIL" e Preencher o Valor "rafaela.domingos@tecnogroup.com.br"
    Input Text    locator=txtEmail   text=rafaela.domingos@tecnogroup.com.br
    Execute JavaScript  document.getElementById("btnEnviar").click();

Verificar se o sistema exibe a mensagem: Informe um CPF válido!
    Element Should Be Visible    locator=lblerroCpf
    Wait Until Page Contains    text=Informe um CPF válido!
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${tituloLogin}                     Label1
${campoLogin}                      txtLogin
${campoSenha}                      txtSenha1
${botaoLogin}                      btnAcessar

*** Keywords ***
Acessar o ambiente "${url}"
    Go to   ${url}

Entrar com as credenciais "${login}" e "${senha}" 
    Wait Until Element Is Visible   ${tituloLogin}   timeout=30
    Input Text  ${campoLogin}  ${login}
    Input Text  ${campoSenha}  ${senha}
    Click Button  ${botaoLogin}
*** Settings ***
Library    SeleniumLibrary

*** Variable ***
${botaoCadastrar}               cphContent_btnCad

*** Keywords ***
Abrir o navegador
    Open Browser    url=https://www.google.com/    browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Verificar se aparece o texto "${texto}"
    Wait Until Page Contains    ${texto}    20

Entrar no módulo "${nomeModulo}"
    Execute JavaScript  xPathResult = document.evaluate("//span[contains(.,'${nomeModulo}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()  

Entrar na funcionalidade "${funcionalidade}"  
    Execute JavaScript  xPathResult = document.evaluate("//span[contains(@title,'${funcionalidade}')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Clicar no botão Cadastrar
    Execute JavaScript  document.getElementById("${botaoCadastrar}").click();
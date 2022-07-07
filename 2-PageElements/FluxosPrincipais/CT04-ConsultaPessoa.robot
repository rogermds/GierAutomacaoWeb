*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${botaoPesquisar}           cphContent_btnPesquisa
${botaoAcoes}               //input[@name='ctl00$cphContent$dtlConsultaPessoa$ctl00$A2'][contains(@id,'0')]
${botaoVisualizar}          cphContent_dtlConsultaPessoa_lkbVisualizar_0

*** Keywords ***
Em consulta, no campo Nome, inserir o nome "${nome}"
    Set Suite Variable  ${campoNome}    cphContent_txtNome
    Input Text    ${campoNome}    ${nome}

Em consulta, no campo D. Nascimento, inserir a data "${dataNascimento}"
    Set Suite Variable  ${campoDataNascimento}            cphContent_txtDNasc
    Input Text    ${campoDataNascimento}    ${dataNascimento}

Clicar no botão "Pesquisar"
    Execute JavaScript  document.getElementById("${botaoPesquisar}").click();

Verificar se no grid é exibido o CPF "${CPF}"
    Wait Until Page Contains  ${CPF}    10

Verificar se no grid é exibido o RG "${RG}"
    Wait Until Page Contains  ${RG}    10

Verificar se no grid é exibido a Data de Nascimento "${dataNascimento}"
    Wait Until Page Contains  ${dataNascimento}    10

Clicar no botão "Ações"
    Execute JavaScript  xPathResult = document.evaluate("${botaoAcoes}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Clicar no botão "Visualizar"
    Execute JavaScript  document.getElementById("${botaoVisualizar}").click();

Verificar se é exibido o nome "${nome}"
    Set Suite Variable      ${campoNome}      ctl00$cphContent$ucDadosPessoais$txtNomeCompleto
    Element Attribute Value Should Be     ${campoNome}  value   ${nome}

Verificar se é exibido a data de nascimento "${dataNascimento}"
    Set Suite Variable      ${campoNascimento}      ctl00$cphContent$ucDadosPessoais$txtDNasc
    Element Attribute Value Should Be     ${campoNascimento}  value   ${dataNascimento}
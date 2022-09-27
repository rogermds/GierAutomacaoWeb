*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Resource    ../../../1-Hooks/1-Principal.robot

*** Variables ***
${botaoImprimir}        cphContent_btnImprimir

*** Keywords ***
Em Boletim Geral de Educando, no filtro Ano Letivo, selecionar "2022"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_0_lnkDinamico_5
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_5").click();

Em Boletim Geral de Educando, no filtro Turma, selecionar "EII A"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_24
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_24").click();
    
Em Boletim Geral de Educando, no filtro Turma, selecionar "CII A"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_34
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_34").click();
    
Em Boletim Geral de Educando, no filtro Turma, selecionar "5A"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_7
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_7").click();
    
Em Boletim Geral de Educando, no filtro Educando, selecionar "ALLAN KOJO DE ASSIS GOES"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_0
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_0").click();
    
Em Boletim Geral de Educando, no filtro Educando, selecionar "ALMERINDA SILVA CABRAL"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_0
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_0").click();
    
Em Boletim Geral de Educando, no filtro Educando, selecionar "MATHEUS OLIVEIRA SILVA"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_13
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_13").click();
    
Em Boletim Geral de Educando, clicar em Imprimir
    Wait Until Element Is Visible    ${botaoImprimir}
    Execute JavaScript  document.getElementById("${botaoImprimir}").click();
    
Em Boletim Geral de Educando, verificar se o Boletim foi emitido corretamente
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Wait Until Page Does Not Contain    OCORREU UM ERRO INESPERADO
    Sleep    2

Em Boletim Geral de Educando, fechar o Boletim Escolar
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Close window
    Switch Window   ${windowHandles}[0] 

Em Boletim Individual de Educando, no filtro Ano Letivo, selecionar "2022"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_0_lnkDinamico_5
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_5").click();

Em Boletim Individual de Educando, no filtro Ano Letivo, selecionar "2021"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_0_lnkDinamico_4
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_4").click();

Em Boletim Individual de Educando, no filtro Turma, selecionar "EII A"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_24
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_24").click();
    
Em Boletim Individual de Educando, no filtro Turma, selecionar "CII B"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_29
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_29").click();
    
Em Boletim Individual de Educando, no filtro Turma, selecionar "5 A"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_8
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_8").click();
    
Em Boletim Individual de Educando, no filtro Educando, selecionar "ANA BEATRIZ DE ANDRADE OLIVEIRA"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_1
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_1").click();
    
Em Boletim Individual de Educando, no filtro Educando, selecionar "ARACI DE PAULA SANTOS DIAS"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_0
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_0").click();
    
Em Boletim Individual de Educando, no filtro Educando, selecionar "DIEGO DA SILVA"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_3
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_3").click();
    
Em Boletim Individual de Educando, clicar em Imprimir
    Wait Until Element Is Visible    ${botaoImprimir}
    Execute JavaScript  document.getElementById("${botaoImprimir}").click();
    
Em Boletim Individual de Educando, verificar se o Boletim foi emitido corretamente
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Wait Until Page Does Not Contain    OCORREU UM ERRO INESPERADO
    Sleep    2

Em Boletim Individual de Educando, fechar o Boletim Escolar
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Close window
    Switch Window   ${windowHandles}[0] 

Em Boletim Individual de Educando M02, no filtro Ano Letivo, selecionar "2021"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_0_lnkDinamico_4
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_4").click();

Em Boletim Individual de Educando M02, no filtro Ano Letivo, selecionar "2022"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_0_lnkDinamico_5
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_5").click();

Em Boletim Individual de Educando M02, no filtro Turma, selecionar "EII C"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_32
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_32").click();
    
Em Boletim Individual de Educando M02, no filtro Turma, selecionar "CII A"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_34
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_34").click();
    
Em Boletim Individual de Educando M02, no filtro Turma, selecionar "5 A"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_1_lnkDinamico_8
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_8").click();
    
Em Boletim Individual de Educando M02, no filtro Educando, selecionar "BRAYAN BARBOSA"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_3
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_3").click();
    
Em Boletim Individual de Educando M02, no filtro Educando, selecionar "ANDERSON CASSEANO DA SILVA"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_2
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_2").click();
    
Em Boletim Individual de Educando M02, no filtro Educando, selecionar "CARLOS ALEXANDRE CORREIA VARGES"
    Wait Until Element Is Visible    cphContent_rptFiltros_rptDinamico_2_lnkDinamico_1
    Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_2_lnkDinamico_1").click();
    
Em Boletim Individual de Educando M02, clicar em Imprimir
    Wait Until Element Is Visible    ${botaoImprimir}
    Execute JavaScript  document.getElementById("${botaoImprimir}").click();
    
Em Boletim Individual de Educando M02, verificar se o Boletim foi emitido corretamente
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Wait Until Page Does Not Contain    OCORREU UM ERRO INESPERADO
    Sleep    2

Em Boletim Individual de Educando M02, fechar o Boletim Escolar
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Close window
    Switch Window   ${windowHandles}[0] 
*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library    SeleniumLibrary

*** Variables ***


*** Keywords ***
Clicar em Imprimir
    Execute JavaScript  document.getElementById("${botaoImprimir}").click();

Visualizar a mensagem: VERIFIQUE SE TODOS OS FILTROS FORAM PREENCHIDOS
    Wait Until Page Contains Element    //span[contains(.,'Verifique se todos os filtros foram preenchidos')]

No filtro Ano Letivo, selecionar "${anoLetivoBoletim}"
    Run Keyword If    '${anoLetivoBoletim}' == '2017'  Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_0").click();
    Run Keyword If    '${anoLetivoBoletim}' == '2018'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_1").click();
    Run Keyword If    '${anoLetivoBoletim}' == '2019'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_2").click();
    Run Keyword If    '${anoLetivoBoletim}' == '2020'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_3").click();
    Run Keyword If    '${anoLetivoBoletim}' == '2021'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_4").click();
    Run Keyword If    '${anoLetivoBoletim}' == '2022'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_5").click();
    Run Keyword If    '${anoLetivoBoletim}' == '2023'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_6").click();
    Run Keyword If    '${anoLetivoBoletim}' == '2024'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_0_lnkDinamico_7").click();
    Sleep    5

No filtro Turma, selecionar "${turmaBoletim}"
    Run Keyword If    '${turmaBoletim}' == '1A'  Execute JavaScript  document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_0").click();
    Run Keyword If    '${turmaBoletim}' == '1B'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_1").click();
    Run Keyword If    '${turmaBoletim}' == '2A'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_2").click();
    Run Keyword If    '${turmaBoletim}' == '3A'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_3").click();
    Run Keyword If    '${turmaBoletim}' == '3B'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_4").click();
    Run Keyword If    '${turmaBoletim}' == '4A'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_5").click();
    Run Keyword If    '${turmaBoletim}' == '4B'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_6").click();
    Run Keyword If    '${turmaBoletim}' == '5A'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_7").click();
    Run Keyword If    '${turmaBoletim}' == '5B'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_8").click();
    Run Keyword If    '${turmaBoletim}' == '5D'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_9").click();
    Run Keyword If    '${turmaBoletim}' == '5X'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_10").click();
    Run Keyword If    '${turmaBoletim}' == 'AEEA'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_11").click();
    Run Keyword If    '${turmaBoletim}' == 'AEEB'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_12").click();
    Run Keyword If    '${turmaBoletim}' == 'BI AT'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_13").click();
    Run Keyword If    '${turmaBoletim}' == 'BII AM'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_14").click();
    Run Keyword If    '${turmaBoletim}' == 'BII BM'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_15").click();
    Run Keyword If    '${turmaBoletim}' == 'BII BT'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_16").click();
    Run Keyword If    '${turmaBoletim}' == 'EI A'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_17").click();
    Run Keyword If    '${turmaBoletim}' == 'EI B'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_18").click();
    Run Keyword If    '${turmaBoletim}' == 'EI C'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_19").click();
    Run Keyword If    '${turmaBoletim}' == 'EI D'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_20").click();
    Run Keyword If    '${turmaBoletim}' == 'EI E'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_21").click();
    Run Keyword If    '${turmaBoletim}' == 'EI W'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_22").click();
    Run Keyword If    '${turmaBoletim}' == 'EI X'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_23").click();
    Run Keyword If    '${turmaBoletim}' == 'EII A'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_24").click();
    Run Keyword If    '${turmaBoletim}' == 'EII B'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_25").click();
    Run Keyword If    '${turmaBoletim}' == 'EII C'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_26").click();
    Run Keyword If    '${turmaBoletim}' == 'EII D'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_27").click();
    Run Keyword If    '${turmaBoletim}' == 'EII G'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_28").click();
    Run Keyword If    '${turmaBoletim}' == 'EII Z'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_29").click();
    Run Keyword If    '${turmaBoletim}' == 'MAT AI'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_30").click();
    Run Keyword If    '${turmaBoletim}' == 'MAT AM'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_31").click();
    Run Keyword If    '${turmaBoletim}' == 'MAT AT'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_32").click();
    Run Keyword If    '${turmaBoletim}' == 'MAT BI'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_33").click();
    Run Keyword If    '${turmaBoletim}' == 'MAT BM'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_34").click();
    Run Keyword If    '${turmaBoletim}' == 'MAT BT'  Execute JavaScript   document.getElementById("cphContent_rptFiltros_rptDinamico_1_lnkDinamico_35").click();

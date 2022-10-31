*** Settings ***
Library    SeleniumLibrary
Resource    ../../../1-Hooks/1-Principal.robot    

*** Variables ***

*** Keywords ***
Em Lançamento Individualizado, clicar em Cadastrar
    Execute JavaScript  document.getElementById("cphContent_btnCad").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, selecionar a unidade escolar "${escolaLancamentoIndividualizado}"
    Execute JavaScript   $("#cphContent_ddlUnidadeEscolar").val($('option:contains("${escolaLancamentoIndividualizado}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlUnidadeEscolar').trigger('change');
    Aguardar tela de carregamento

Em Lançamento Individualizado, selecionar a avaliação "${avaliacaoLancamentoIndividualizado}"
    Execute JavaScript   $("#cphContent_ddlAvaliacao").val($('option:contains("${avaliacaoLancamentoIndividualizado}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlAvaliacao').trigger('change');
    Aguardar tela de carregamento

Em Lançamento Individualizado, selecionar o período "${periodoLancamentoIndividualizado}"
    Execute JavaScript   $("#cphContent_ddlPeriodo").val($('option:contains("${periodoLancamentoIndividualizado}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlPeriodo').trigger('change');
    Aguardar tela de carregamento

Em Lançamento Individualizado, selecionar o ciclo "${cicloLancamentoIndividualizado}"
    Execute JavaScript   $("#cphContent_ddlCiclo").val($('option:contains("${cicloLancamentoIndividualizado}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlCiclo').trigger('change');
    Aguardar tela de carregamento

Em Lançamento Individualizado, selecionar a turma "${turmaLancamentoIndividualizado}"
    Execute JavaScript   $("#cphContent_ddlTurma").val($('option:contains("${turmaLancamentoIndividualizado}")').val()).trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_ddlTurma').trigger('change');
    Aguardar tela de carregamento

Em Lançamento Individualizado, no resultado da busca, clicar em um aluno com lançamento pendente
    FOR     ${index}    IN RANGE    100
        ${busca}    Set Variable    cphContent_dtlAlunos_lblLancamentoLi_${index}
        ${resultado}    Run Keyword And Return Status   Element Should Contain  ${busca}    PENDENTE
        IF  ${resultado}
            Execute JavaScript  document.getElementById("cphContent_dtlAlunos_lbtSelecionar_${index}").click();
            Aguardar tela de carregamento
            Exit For Loop
        END
    END

Em Lançamento Individualizado, na Pergunta 1, clicar na Resposta A
    Execute JavaScript  document.getElementById("cphContent_dtlResultados_rblRespostaUnica_0_0_0").click();
    Aguardar tela de carregamento
            
Em Lançamento Individualizado, na Pergunta 2, clicar na Resposta B
    Execute JavaScript  document.getElementById("cphContent_dtlResultados_rblRespostaUnica_1_1_1").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, na Pergunta 3, clicar na Resposta C
    Execute JavaScript  document.getElementById("cphContent_dtlResultados_rblRespostaUnica_2_2_2").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, na Pergunta 4, clicar na Resposta D
    Execute JavaScript  document.getElementById("cphContent_dtlResultados_rblRespostaUnica_3_3_3").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, na Pergunta 5, clicar na Resposta C
    Execute JavaScript  document.getElementById("cphContent_dtlResultados_rblRespostaUnica_4_2_4").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, na Pergunta 6, clicar na Resposta B
    Execute JavaScript  document.getElementById("cphContent_dtlResultados_rblRespostaUnica_5_1_5").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, na Pergunta 7, clicar na Resposta A
    Execute JavaScript  document.getElementById("cphContent_dtlResultados_rblRespostaUnica_6_0_6").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, na Pergunta 7, clicar em LIMPAR
    Execute JavaScript  document.getElementById("cphContent_dtlResultados_lnkLimpar_6").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, verificar se a questão foi limpa
    ${validacao}    	Run Keyword And Return Status    Element Attribute Value Should Be    cphContent_dtlResultados_rblRespostaUnica_6_0_6    checked    true
    IF    ${validacao}
        Fail 
    END

Em Lançamento Individualizado, anexar um arquivo e clicar em Anexar
    Choose File    cphContent_fuDocumento    C:\\Users\\rogerio.santos\\Desktop\\AUTOMAÇÃO WEB - GIER\\Automação - Teste De Versão Gier\\4-Arquivos\\ARQUIVO TESTE PDF.pdf
    Execute JavaScript  document.getElementById("cphContent_btnIncluirDocumento").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, em Justificativas, inserir "${justificativaLancamentoIndividualizado}"
    Input Text    cphContent_txtJustificativas    ${justificativaLancamentoIndividualizado}    
    Aguardar tela de carregamento

Em Lançamento Individualizado, clicar em Salvar e Próximo
    Sleep    2
    Execute JavaScript  document.getElementById("cphContent_btnSalvarProximo").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, clicar em Finalizar Turma
    Execute JavaScript  document.getElementById("cphContent_btnFinalizar").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, clicar em OK no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, clicar em Sim no modal
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Lançamento Individualizado, verificar se o totalizador abriu sem erros
    ${windowHandles}    Get Window Handles
    Switch Window   ${windowHandles}[1]
    Wait Until Page Does Not Contain    OCORREU UM ERRO INESPERADO
    Sleep    4
    Close window
    Switch Window   ${windowHandles}[0] 



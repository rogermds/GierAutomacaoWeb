*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Resource    ../../1-Hooks/1-Principal.robot

*** Variables ***
${campoEtapaModalidadeFrequencia}        cphContent_ddlEtapaModalidade
${campoProfessorFrequencia}              cphContent_ddlProfessor
${campoTurmaFrequencia}                  cphContent_ddlClasse
${campoDataFrequencia}                   cphContent_txtSemana
${campoTipoAvaliacaoFrequencia}  cphContent_ddlTipoAvaliacao
${campoTituloDiarioFrequencia}           cphContent_txtTitulo
${campoDescricaoDiarioFrequencia}        ctl00$cphContent$txtDescricao
${campoDiarioBordo}                      cphContent_dtlFrequencia_btnDiario_0


*** Keywords ***
No controle de frequência, em Etapa/Modalidade, selecionar "${etapaModalidade}"
    Set Suite Variable    ${etapaModalidade}
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'  Execute JavaScript   $('#${campoEtapaModalidadeFrequencia}').val("1").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'  Execute JavaScript   $('#${campoEtapaModalidadeFrequencia}').val("4").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeFrequencia}').val("5").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE'  Execute JavaScript   $('#${campoEtapaModalidadeFrequencia}').val("6").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEtapaModalidadeFrequencia}').trigger('change');
    Aguardar tela de carregamento

No controle de frequência, em Professor, selecionar "${professor}"
    Run Keyword If    '${professor}' == 'ADRIANA CRISTINA CAMPOS SCALICI'  Execute JavaScript   $('#${campoProfessorFrequencia}').val("6167").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'TANIA MARA DA SILVA'  Execute JavaScript   $('#${campoProfessorFrequencia}').val("7859").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'TANIA APARECIDA MINORELLI'  Execute JavaScript   $('#${campoProfessorFrequencia}').val("7491").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'PRISCILA DOMINGUES FERNANDES LOPES'  Execute JavaScript   $('#${campoProfessorFrequencia}').val("2588").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'MARIA FAUSTA JUSTINIANO SANTOS SILVEIRA'  Execute JavaScript   $('#${campoProfessorFrequencia}').val("3560").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'LUCIANA OLIVEIRA RIBEIRO TOLEDO'  Execute JavaScript   $('#${campoProfessorFrequencia}').val("7797").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'DANIELA MACHADO OLIVEIRA'  Execute JavaScript   $('#${campoProfessorFrequencia}').val("8702").trigger('chosen:updated');
    Run Keyword If    '${professor}' == 'DAIANE LINO SALVADOR'  Execute JavaScript   $('#${campoProfessorFrequencia}').val("4446").trigger('chosen:updated');
    Execute JavaScript   $('#${campoProfessorFrequencia}').trigger('change');
    Aguardar tela de carregamento

No controle de frequência, em Turma, selecionar "${turma}"
    Run Keyword If    '${turma}' == 'EII A'  Execute JavaScript   $('#${campoTurmaFrequencia}').val("110667").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '5B'  Execute JavaScript   $('#${campoTurmaFrequencia}').val("112173").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '3A'  Execute JavaScript   $('#${campoTurmaFrequencia}').val("110822").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '3B'  Execute JavaScript   $('#${campoTurmaFrequencia}').val("110825").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '1B'  Execute JavaScript   $('#${campoTurmaFrequencia}').val("110726").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '4A'  Execute JavaScript   $('#${campoTurmaFrequencia}').val("111827").trigger('chosen:updated');
    Run Keyword If    '${turma}' == '1A'  Execute JavaScript   $('#${campoTurmaFrequencia}').val("110725").trigger('chosen:updated');
    Run Keyword If    '${turma}' == 'CI A'  Execute JavaScript   $('#${campoTurmaFrequencia}').val("113554").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTurmaFrequencia}').trigger('change');
    Aguardar tela de carregamento

No controle de frequência, em Data Referência, insira "${data}"
    Input Text    ${campoDataFrequencia}    ${data}

Verificar se o botão Iniciar está visível
    Wait Until Element Is Enabled     cphContent_dtlDiaSemanaLabel_lkbIniciar_6

Iniciar as aulas para os 4 últimos dias da semana
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'6')][@title='Iniciar Aula'][contains(.,'Iniciar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_checkBoxTodos_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_btnIniciarAula").click();
    Aguardar tela de carregamento
    
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'5')][@title='Iniciar Aula'][contains(.,'Iniciar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_checkBoxTodos_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_checkBoxTodos_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_btnIniciarAula").click();
    Aguardar tela de carregamento

    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'4')][@title='Iniciar Aula'][contains(.,'Iniciar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_checkBoxTodos_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_checkBoxTodos_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_btnIniciarAula").click();
    Aguardar tela de carregamento

    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'3')][@title='Iniciar Aula'][contains(.,'Iniciar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_checkBoxTodos_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_checkBoxTodos_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_btnIniciarAula").click();
    Aguardar tela de carregamento

Cancelar as aulas que foram registradas
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'3')][@title='Cancelar Aula'][contains(.,'Cancelar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_chkHorarios_1").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_chkHorarios_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_btnIniciarAula").click();
    Aguardar tela de carregamento

    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'4')][@title='Cancelar Aula'][contains(.,'Cancelar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_chkHorarios_1").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_chkHorarios_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_btnIniciarAula").click();
    Aguardar tela de carregamento

    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'5')][@title='Cancelar Aula'][contains(.,'Cancelar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_chkHorarios_1").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_chkHorarios_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_btnIniciarAula").click();
    Aguardar tela de carregamento

    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'6')][@title='Cancelar Aula'][contains(.,'Cancelar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_chkHorarios_1").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_chkHorarios_0").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_IniciarAula_btnIniciarAula").click();
    Aguardar tela de carregamento

Iniciar as aulas nos 4 últimos dias da semana
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'6')][@title='Iniciar Aula'][contains(.,'Iniciar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'5')][@title='Iniciar Aula'][contains(.,'Iniciar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'4')][@title='Iniciar Aula'][contains(.,'Iniciar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'3')][@title='Iniciar Aula'][contains(.,'Iniciar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento

Registrar faltas para os 4 primeiros alunos
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl00$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl00$dtlDiaSemana$ctl05$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl00$dtlDiaSemana$ctl04$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl00$dtlDiaSemana$ctl03$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl01$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl01$dtlDiaSemana$ctl05$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl01$dtlDiaSemana$ctl04$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl02$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl02$dtlDiaSemana$ctl05$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl03$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Sleep    1

Verificar se o primeiro aluno possui 4 faltas e frequencia 0
    Element Text Should Be    cphContent_dtlFrequencia_lblTotalFaltas_0    4
    Element Text Should Be    cphContent_dtlFrequencia_lblPercentualLi_0    0

Verificar se o segundo aluno possui 3 faltas e frequencia 25
    Element Text Should Be    cphContent_dtlFrequencia_lblTotalFaltas_1    3
    Element Text Should Be    cphContent_dtlFrequencia_lblPercentualLi_1    25

Verificar se o terceiro aluno possui 2 faltas e frequencia 50
    Element Text Should Be    cphContent_dtlFrequencia_lblTotalFaltas_2    2
    Element Text Should Be    cphContent_dtlFrequencia_lblPercentualLi_2    50

Verificar se o quarto aluno possui 1 falta e frequencia 75
    Element Text Should Be    cphContent_dtlFrequencia_lblTotalFaltas_3    1
    Element Text Should Be    cphContent_dtlFrequencia_lblPercentualLi_3    75

Verificar se o quinto aluno possui 0 faltas e frequencia 100
    Element Text Should Be    cphContent_dtlFrequencia_lblTotalFaltas_4    0
    Element Text Should Be    cphContent_dtlFrequencia_lblPercentualLi_4    100

Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
##Caso ocorra erro nesta parte, inserir o campo de marcação de faltas, de um aluno que não esteja matriculado
    Element Attribute Value Should Be     ctl00$cphContent$dtlFrequencia$ctl09$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia      disabled    true

No primeiro aluno, clicar em Diário de Bordo do Aluno
    Execute JavaScript  document.getElementById("${campoDiarioBordo}").click();

Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    Wait Until Page Contains    Diário do Educando
    Execute JavaScript   $('#${campoTipoAvaliacaoFrequencia}').val("9").trigger('chosen:updated');
    Execute JavaScript   $('#${campoTipoAvaliacaoFrequencia}').trigger('change');
    Aguardar tela de carregamento

Em Diário do Educando, em Título, inserir "${titulo}"
    Input Text    ${campoTituloDiarioFrequencia}    ${titulo}

Em Diário do Educando, em Descrição, inserir "${descricaoDiario}"
    Set Suite Variable    ${descricaoDiario}
    Input Text    ${campoDescricaoDiarioFrequencia}    ${descricaoDiario}

Salvar o registro de Diário do Educando
    Execute JavaScript  document.getElementById("cphContent_btnIncluir").click();
    Aguardar tela de carregamento
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

Em Diário do Educando, verificar se o card foi adicionado ao histórico
    Wait Until Element Contains    cphContent_dtlConsulta_lblDescricao_0    ${descricaoDiario}
    
Em Diário do Educando, verificar se o card foi editado corretamente
    Wait Until Element Contains    cphContent_dtlConsulta_lblDescricao_0    ${descricaoEditada}

Em Diário do Educando, clicar em Editar, editando o card adicionado
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkEditarItem_0").click();
    Aguardar tela de carregamento

Em Diário do Educando, inserir o novo texto "${descricaoEditada}"
    Set Suite Variable    ${descricaoEditada}
    Clear Element Text    cphContent_dtlConsulta_txtDescricaoEdit_0
    Input Text    cphContent_dtlConsulta_txtDescricaoEdit_0    ${descricaoEditada}

Em Diário do Educando, clicar em Salvar o card editado
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkSalvarItem_0").click();
    Aguardar tela de carregamento

Em Diário do Educando, verificar se o card foi removido histórico
    Wait Until Page Does Not Contain Element    cphContent_dtlConsulta_lblDescricao_0

Em Diário do Educando, clicar em Remover, removendo o card adicionado
    Execute JavaScript  document.getElementById("cphContent_dtlConsulta_lnkExcluiriItem_0").click();

Em Diário do Educando, clicar em Sim no modal
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnSim
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnSim").click();
    Aguardar tela de carregamento

Em Diário do Educando, clicar em OK no modal
    Wait Until Element Is Visible    cphContent_MensagemPadrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_MensagemPadrao_btnOk").click();
    Aguardar tela de carregamento

No dia atual, clicar em inserir um Campo de Experiencia
    Execute JavaScript  document.getElementById("cphContent_dtlDiaSemanaLabel_imgRegistroAula_6").click();
    Aguardar tela de carregamento
    
Em Eixo, selecionar a primeira opção
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlComponenteCurricular').val("594").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlComponenteCurricular').trigger('change');
    Aguardar tela de carregamento

Em Eixo, selecionar a segunda opção
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlComponenteCurricular').val("565").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlComponenteCurricular').trigger('change');
    Aguardar tela de carregamento

Em Unidade Temática, selecionar a primeira opção
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlUnidadeTematica').val("217").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlUnidadeTematica').trigger('change');
    Aguardar tela de carregamento

Em Unidade Temática, selecionar a segunda opção
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlUnidadeTematica').val("219").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlUnidadeTematica').trigger('change');
    Aguardar tela de carregamento

Em Campo de Experiencia, selecionar a primeira opção
    Wait Until Page Contains    Cadastrar Registro de Aula
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlObjetoConhecimento2').val("8775").trigger('chosen:updated');
    Aguardar tela de carregamento

Em Registro de Aula, clicar em Ações e Excluir
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$CadastroRegistroAulaDinamico$dtlRegistroAulaSemAssimilacao$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_CadastroRegistroAulaDinamico_dtlRegistroAulaSemAssimilacao_lnkExcluir_0").click();
    Aguardar tela de carregamento
    Wait Until Element Is Visible    cphContent_CadastroRegistroAulaDinamico_Mensagem_Padrao_btnOk
    Execute JavaScript  document.getElementById("cphContent_CadastroRegistroAulaDinamico_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento

Em Descrição da Atividade, clicar em Salvar para salvar o registro editado
    Clicar em Inserir

Em Campo de Experiencia, selecionar a segunda opção
    Wait Until Page Contains    Cadastrar Registro de Aula
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_ddlObjetoConhecimento2').val("8795").trigger('chosen:updated');
    Aguardar tela de carregamento

Em Saberes, selecionar a primeira opção
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_lbSaberes').val("8775").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_lbSaberes').val("14101").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_lbSaberes').trigger('change');
    Aguardar tela de carregamento

Em Saberes, selecionar a segunda opção
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_lbSaberes').val("14281").trigger('chosen:updated');
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_lbSaberes').trigger('change');
    Aguardar tela de carregamento

Em Aprendizagem, selecionar a primeira opção
    Run Keyword If    '${etapaModalidade}' == 'EDUCAÇÃO INFANTIL'    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_lbAprendizagem').val("18025").trigger('chosen:updated');
    Run Keyword If    '${etapaModalidade}' == 'ENSINO FUNDAMENTAL'    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_lbAprendizagem').val("23207").trigger('chosen:updated');
    Aguardar tela de carregamento

Em Aprendizagem, selecionar a segunda opção
    Execute JavaScript   $('#cphContent_CadastroRegistroAulaDinamico_lbAprendizagem').val("25969").trigger('chosen:updated');
    Aguardar tela de carregamento

Em Descrição da Atividade, inserir "${descricaoAtividadeCampoExperiencia}"
    Set Suite Variable    ${descricaoAtividadeCampoExperiencia}
    Clear Element Text    cphContent_CadastroRegistroAulaDinamico_txtDescricaoAtividade
    Input Text    cphContent_CadastroRegistroAulaDinamico_txtDescricaoAtividade    ${descricaoAtividadeCampoExperiencia}

Clicar em Inserir
    Execute JavaScript   document.getElementById("cphContent_CadastroRegistroAulaDinamico_btnInserirRegistroAula").click();
    Aguardar tela de carregamento
    Execute JavaScript   document.getElementById("cphContent_CadastroRegistroAulaDinamico_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento

Em Registro de Aula, clicar em Salvar
    Execute JavaScript   document.getElementById("cphContent_CadastroRegistroAulaDinamico_btnSalvar").click();
    Aguardar tela de carregamento
    Execute JavaScript   document.getElementById("cphContent_CadastroRegistroAulaDinamico_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento

Verificar se a descrição foi salva no histórico
    Wait Until Element Is Visible    cphContent_CadastroRegistroAulaDinamico_dtlRegistroAulaSemAssimilacao_lblDescricaoAtividadeGrid_0
    Execute JavaScript   document.getElementById("cphContent_CadastroRegistroAulaDinamico_btnSalvar").click();
    Aguardar tela de carregamento

Verificar se a descrição foi excluída no histórico
    Wait Until Page Does Not Contain Element    cphContent_CadastroRegistroAulaDinamico_dtlRegistroAulaSemAssimilacao_lblDescricaoAtividadeGrid_0

Salvar a descrição inserida no histórico
    Execute JavaScript   document.getElementById("cphContent_CadastroRegistroAulaDinamico_Mensagem_Padrao_btnOk").click();
    Aguardar tela de carregamento

Em Registro de Aula, clicar em Ações e Editar
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$CadastroRegistroAulaDinamico$dtlRegistroAulaSemAssimilacao$ctl00$A2'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  document.getElementById("cphContent_CadastroRegistroAulaDinamico_dtlRegistroAulaSemAssimilacao_lnkEditar_0").click();
    Aguardar tela de carregamento

Desmarcar as faltas registradas
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl00$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl00$dtlDiaSemana$ctl05$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl00$dtlDiaSemana$ctl04$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl00$dtlDiaSemana$ctl03$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl01$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl01$dtlDiaSemana$ctl05$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl01$dtlDiaSemana$ctl04$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl02$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl02$dtlDiaSemana$ctl05$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Execute JavaScript  xPathResult = document.evaluate("//input[@name='ctl00$cphContent$dtlFrequencia$ctl03$dtlDiaSemana$ctl06$dtlMarcarAulas$ctl00$btnFrequencia'][contains(@id,'0')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 

Cancelar as aulas iniciadas
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'3')][@title='Cancelar Aula'][contains(.,'Cancelar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'4')][@title='Cancelar Aula'][contains(.,'Cancelar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'5')][@title='Cancelar Aula'][contains(.,'Cancelar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento
    Execute JavaScript  xPathResult = document.evaluate("//a[contains(@id,'6')][@title='Cancelar Aula'][contains(.,'Cancelar')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click() 
    Aguardar tela de carregamento

Verificar se os campos de faltas foram bloqueados
    Element Should Be Disabled    cphContent_dtlFrequencia_dtlDiaSemana_0_dtlMarcarAulas_6_btnFrequencia_0
    Element Should Be Disabled    cphContent_dtlFrequencia_dtlDiaSemana_1_dtlMarcarAulas_5_btnFrequencia_0
    Element Should Be Disabled    cphContent_dtlFrequencia_dtlDiaSemana_2_dtlMarcarAulas_4_btnFrequencia_0
    Element Should Be Disabled    cphContent_dtlFrequencia_dtlDiaSemana_3_dtlMarcarAulas_6_btnFrequencia_0

Clicar em Avaliações
    Execute JavaScript   document.getElementById("cphContent_btnAvaliacoes").click();
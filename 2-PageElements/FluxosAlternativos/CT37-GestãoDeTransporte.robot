*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library    FakerLibrary    locale=pt-BR

*** Variables ***
${cadastroBeneficiariosExternos}                         cphContent_btnCadastraAlunoForaRede
${campoEscolaOutraRede}                                  cphContent_ddlEscolaOutraRede
${botaoInserirResponsavel}                               cphContent_btnInserirResponsavel
${botaoCadastrarAlunoBeneficiarios}                      cphContent_btnCadastrarAluno
${campoNumeroResidencial}                                cphContent_txtNumeroResidencial
${botaoIncluirEndereco}                                  cphContent_btnIncluirResidencial

*** Keywords ***
Visualizar a mensagem: SELECIONE UMA SITUAÇÃO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Selecione uma situação.')]

Clicar em Cadastrar Beneficiários Externos
    Execute JavaScript  document.getElementById("${cadastroBeneficiariosExternos}").click();
    Aguardar tela de carregamento
    
Clicar em Salvar para cadastrar o aluno
    Execute JavaScript  document.getElementById("${botaoCadastrarAlunoBeneficiarios}").click();
    Aguardar tela de carregamento

Visualizar a mensagem: A ESCOLA DE ORIGEM DO EDUCANDO É OBRIGATÓRIO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'A Escola de Origem do Educando é obrigatório')]

Em Escola de Outra Rede, selecionar "${escolaExterna}"
    Run Keyword If    '${escolaExterna}' == 'Selecione'  Execute JavaScript   $('#${campoEscolaOutraRede}').val("-1").trigger('chosen:updated');
    Run Keyword If    '${escolaExterna}' == 'AGOSTINIANA SANTA MONICA CRECHE'  Execute JavaScript   $('#${campoEscolaOutraRede}').val("2217").trigger('chosen:updated');
    Run Keyword If    '${escolaExterna}' == 'ALLAN KARDEC ALICE PEREIRA INSTITUIÇAO'  Execute JavaScript   $('#${campoEscolaOutraRede}').val("2168").trigger('chosen:updated');
    Run Keyword If    '${escolaExterna}' == 'ALMEIDA LEITE COLEGIO'  Execute JavaScript   $('#${campoEscolaOutraRede}').val("2218").trigger('chosen:updated');
    Run Keyword If    '${escolaExterna}' == 'AMOR AO PRÓXIMO CASA'  Execute JavaScript   $('#${campoEscolaOutraRede}').val("2258").trigger('chosen:updated');
    Execute JavaScript   $('#${campoEscolaOutraRede}').trigger('change');
    Aguardar tela de carregamento

Visualizar a mensagem: O NOME DO EDUCANDO É OBRIGATÓRIO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'O Nome do Educando é obrigatório')]

Visualizar a mensagem: A DATA DE NASCIMENTO DO EDUCANDO É OBRIGATÓRIO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'A data de nascimento do Educando é obrigatório')]

Visualizar a mensagem: O SEXO DO EDUCANDO É OBRIGATÓRIO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'O sexo do Educando é obrigatório')]

Visualizar a mensagem: O ORGÃO EMISSOR DA CARTEIRA DE IDENTIDADE É OBRIGATÓRIO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'O Orgão Emissor da Carteira de Identidade é obrigatório')]
    
Visualizar a mensagem: É OBRIGATÓRIO INSERIR O ENDEREÇO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'É Obrigatório inserir o Endereço')]

Clicar em 'Numero' e digitar o valor "${Numero}"
    Execute JavaScript  document.getElementById("${campoNumeroResidencial}").click();
    Input Text   ${campoNumeroResidencial}    ${Numero}
    Sleep    5
    Input Text   ${campoNumeroResidencial}    ${Numero}

Clicar em "Incluir"
    Execute JavaScript  document.getElementById("${botaoIncluirEndereco}").click();
    Aguardar tela de carregamento

Visualizar a mensagem: É NECESSÁRIO INSERIR UM RESPONSÁVEL
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'É necessário inserir um responsável')]

Clicar no botão Inserir Responsável
    Execute JavaScript  document.getElementById("${botaoInserirResponsavel}").click();
    Aguardar tela de carregamento

Visualizar a mensagem: PESQUISE UM RESPONSÁVEL.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Pesquise um Responsável.')]
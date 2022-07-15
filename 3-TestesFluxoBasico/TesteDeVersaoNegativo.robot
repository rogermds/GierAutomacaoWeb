*** Settings ***
Documentation     Esse teste verifica se é possível efetuar login no Gier
Resource         ../1-Hooks/1-Principal.robot
Resource         ../2-PageElements/FluxosAlternativos/CT01_02-TelaDeLogin.robot
Resource         ../2-PageElements/FluxosAlternativos/CT03-EsqueiMinhaSenha.robot
Resource         ../2-PageElements/FluxosAlternativos/CT04-EsqueciMinhaSenha.robot
Resource         ../2-PageElements/FluxosAlternativos/CT05-SelecaoDeEstrutura.robot
Resource         ../2-PageElements/FluxosAlternativos/CT06-CadastroDePessoaEmail.robot
Resource         ../2-PageElements/FluxosAlternativos/CT07-CadastroDePessoaData.robot
Resource         ../2-PageElements/FluxosAlternativos/CT08-CadastroDePessoaNome.robot
Resource         ../2-PageElements/FluxosAlternativos/CT09-CadastroDePessoaSexo.robot
Resource         ../2-PageElements/FluxosAlternativos/CT10-CadastroDePessoaNacion.robot
Resource         ../2-PageElements/FluxosAlternativos/CT11-CadastroDePessoaEnd.robot
Resource         ../2-PageElements/FluxosAlternativos/CT12-CadastroDePessoaCep.robot
Resource         ../2-PageElements/FluxosAlternativos/CT13-ConsultaDePessoaNome.robot
Resource         ../2-PageElements/FluxosAlternativos/CT14-ConsultaDePessoaNome.robot
Resource         ../2-PageElements/FluxosAlternativos/CT15_16-ConsultaDePessoaEmail.robot
Resource         ../2-PageElements/FluxosAlternativos/CT17-CadastroDeTurmaRegular.robot
Resource         ../2-PageElements/FluxosAlternativos/CT18-CadastroDeTurmaMulti.robot
Resource         ../2-PageElements/FluxosAlternativos/CT19-ConsultaDeTurma.robot
Resource         ../2-PageElements/FluxosAlternativos/CT20-ControleDiarioDeFrequecia.robot
Resource         ../2-PageElements/FluxosAlternativos/CT21-AtaDeConselho.robot
Resource         ../2-PageElements/FluxosAlternativos/CT22-HistoricoEscolar.robot
Resource         ../2-PageElements/FluxosAlternativos/CT23-BoletimEscolar.robot
Resource         ../2-PageElements/FluxosAlternativos/CT24-ProntuarioDoEducando.robot
Resource         ../2-PageElements/FluxosAlternativos/CT25-ProntuarioDeTurma.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

#robot -d ./3-TestesFluxoBasico/results ./3-TestesFluxoBasico/TesteDeVersaoNegativo.robot

*** Test Cases ***

Cenário 01 - Acesso ao Sistema – Tela de Login Cenário A
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura
    ...    Com o usuário e senha especificados
    [Tags]    Seleção de Estrutura | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Entrar com as credenciais "41316137864" e "100200"	
    Verificar se o sistema exibe a mensagem: Login e/ou senha inválido(s)

Cenário 02 - Acesso ao Sistema – Tela de Login B 	
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Entrar com as credenciais "gieronline.com.br" e "123456789"		
    Verificar se o sistema exibe a mensagem: Login e/ou senha inválido(s)

CTenário 03 - Acesso ao Sistema – Tela de Login C 	
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Clicar em 'Esqueci minha Senha'    
    Clicar no Campo 'EMAIL' e Preencher o Valor "rafaela.domingos@tecnogroup.com.br"
    Verificar se o sistema exibe a mensagem: Informe um CPF válido! 	
	
Cenário 04 - Acesso ao Sistema – Tela de Login D 	
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Clicar em 'Esqueci minha Senha' 	
    Clicar no Campo 'CPF' e Preencher o Valor "41316137864"	
    Verificar se o sistema exibe a mensagem: Informe um email válido! 

Cenário 05 - Acesso ao Sistema – Seleção de Estrutura 
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Entrar com as credenciais "02867439817" e "12345678"	
    Informar a Estrutura MMMMMM
    Verificar se o sistema exibe a mensagem: Não há registros com o argumento pesquisado.

Cenário 06 - Cadastro de Pessoa - E-mail inválido
    [Documentation]    Esse teste verifica se é possível Cadastrar uma Pessoa
    [Tags]    Cadastrar uma Pessoa | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado        
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Selecionar o botão 'Cadastrar'    
    Clicar no campo 'Nome' e digitar o valor "Teste Pessoa Versão"
    Clicar no campo 'Sexo' e selecionar a opção "FEMININO"
    Clicar no campo 'Data de Nascimento' e digitar o valor "24/04/1993"
    Clicar no Campo 'Correio Eletrônico' e digitar o Valor "Teste"
    Clicar no campo 'Nacionalidade' e selecionar a opção "BRASILEIRA"
    Clicar no campo 'UF' e selecionar a opção "SP"
    Clicar no campo 'Cidade de Nascimento' e selecionar a opção "SAO PAULO"
    Clicar no campo 'Cor/Raça' e selecionar a opção "AMARELA"
    Clicar no campo 'Cep' e digitar o valor "07032000"
    Clicar no campo 'Numero' e digitar o valor "134"
    Clicar no campo 'Zona' e selecionar a opção "URBANO"
    Clicar no botão 'Incluir'
    Clicar no 'Botão Salvar'
    Visualizar a mensagem: CORREIO ELETRÔNICO INVÁLIDO     

Cenário 07 - Cadastro de Pessoa - Data de Nascimento sem preechimento
    [Documentation]    Esse teste verifica se é possível Cadastrar uma Pessoa
    [Tags]    Cadastrar uma Pessoa | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado        
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Selecionar o botão 'Cadastrar'    
    Clicar no campo 'Nome' e digitar o valor "Teste Pessoa Versão"
    Clicar no campo 'Sexo' e selecionar a opção "FEMININO"
    Clicar no Campo 'Correio Eletrônico' e digitar o Valor "Teste"
    Clicar no campo 'Nacionalidade' e selecionar a opção "BRASILEIRA"
    Clicar no campo 'UF' e selecionar a opção "SP"
    Clicar no campo 'Cidade de Nascimento' e selecionar a opção "SAO PAULO"
    Clicar no campo 'Cor/Raça' e selecionar a opção "AMARELA"
    Clicar no campo 'Cep' e digitar o valor "07032000"
    Clicar no campo 'Numero' e digitar o valor "134"
    Clicar no campo 'Zona' e selecionar a opção "URBANO"
    Clicar no botão 'Incluir'
    Clicar no 'Botão Salvar'
    Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: DATA DE NASCIMENTO    

Cenário 08 - Cadastro de Pessoa - Nome sem preechimento
    [Documentation]    Esse teste verifica se é possível Cadastrar uma Pessoa
    [Tags]    Cadastrar uma Pessoa | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado        
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Selecionar o botão 'Cadastrar' 
    Clicar no campo 'Data de Nascimento' e digitar o valor "24/04/1993"   
    Clicar no campo 'Sexo' e selecionar a opção "FEMININO"
    Clicar no Campo 'Correio Eletrônico' e digitar o Valor "testeQualidade@teste.com.br"
    Clicar no campo 'Nacionalidade' e selecionar a opção "BRASILEIRA"
    Clicar no campo 'UF' e selecionar a opção "SP"
    Clicar no campo 'Cidade de Nascimento' e selecionar a opção "SAO PAULO"
    Clicar no campo 'Cor/Raça' e selecionar a opção "AMARELA"
    Clicar no campo 'Cep' e digitar o valor "07032000"
    Clicar no campo 'Numero' e digitar o valor "134"
    Clicar no campo 'Zona' e selecionar a opção "URBANO"
    Clicar no botão 'Incluir'
    Clicar no 'Botão Salvar'
    Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: NOME      

Cenário 09 - Cadastro de Pessoa - Sexo sem preechimento
    [Documentation]    Esse teste verifica se é possível Cadastrar uma Pessoa
    [Tags]    Cadastrar uma Pessoa | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado        
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Selecionar o botão 'Cadastrar'
    Clicar no campo 'Nome' e digitar o valor "Teste Pessoa Versão" 
    Clicar no campo 'Data de Nascimento' e digitar o valor "24/04/1993"
    Clicar no Campo 'Correio Eletrônico' e digitar o Valor "testeQualidade@teste.com.br"
    Clicar no campo 'Nacionalidade' e selecionar a opção "BRASILEIRA"
    Clicar no campo 'UF' e selecionar a opção "SP"
    Clicar no campo 'Cidade de Nascimento' e selecionar a opção "SAO PAULO"
    Clicar no campo 'Cor/Raça' e selecionar a opção "AMARELA"
    Clicar no campo 'Cep' e digitar o valor "07032000"
    Clicar no campo 'Numero' e digitar o valor "134"
    Clicar no campo 'Zona' e selecionar a opção "URBANO"
    Clicar no botão 'Incluir'
    Clicar no 'Botão Salvar'
    Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: SEXO 

Cenário 10 - Cadastro de Pessoa - Nacionalidade sem preechimento
    [Documentation]    Esse teste verifica se é possível Cadastrar uma Pessoa
    [Tags]    Cadastrar uma Pessoa | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado        
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Selecionar o botão 'Cadastrar'
    Clicar no campo 'Nome' e digitar o valor "Teste Pessoa Versão" 
    Clicar no campo 'Sexo' e selecionar a opção "FEMININO"
    Clicar no campo 'Data de Nascimento' e digitar o valor "24/04/1993"   
    Clicar no Campo 'Correio Eletrônico' e digitar o Valor "testeQualidade@teste.com.br"
    Clicar no campo 'Cor/Raça' e selecionar a opção "AMARELA"
    Clicar no campo 'Cep' e digitar o valor "07032000"
    Clicar no campo 'Numero' e digitar o valor "134"
    Clicar no campo 'Zona' e selecionar a opção "URBANO"
    Clicar no botão 'Incluir'
    Clicar no 'Botão Salvar'
    Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: NACIONALIDADE 
    Clicar em "Ok" na mensagem    
    Clicar no campo 'Nacionalidade' e selecionar a opção "BRASILEIRA"
    Clicar no 'Botão Salvar'
    Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: UF NASCIMENTO, CIDADE DE NASCIMENTO
    Clicar em "Ok" na mensagem
    Clicar no campo 'UF' e selecionar a opção "SP"
    Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: CIDADE DE NASCIMENTO    

Cenário 11 - Cadastro de Pessoa - Endereço não informado
    [Documentation]    Esse teste verifica se é possível Cadastrar uma Pessoa
    [Tags]    Cadastrar uma Pessoa | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado        
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Selecionar o botão 'Cadastrar'    
    Clicar no campo 'Nome' e digitar o valor "Teste Pessoa Versão"
    Clicar no campo 'Sexo' e selecionar a opção "FEMININO"
    Clicar no campo 'Data de Nascimento' e digitar o valor "24/04/1993"
    Clicar no Campo 'Correio Eletrônico' e digitar o Valor "testeQualidade@teste.com.br"
    Clicar no campo 'Nacionalidade' e selecionar a opção "BRASILEIRA"
    Clicar no campo 'UF' e selecionar a opção "SP"
    Clicar no campo 'Cidade de Nascimento' e selecionar a opção "SAO PAULO"
    Clicar no campo 'Cor/Raça' e selecionar a opção "AMARELA"
    Clicar no campo 'Zona' e selecionar a opção "URBANO"
    Clicar no botão 'Incluir'
    Clicar no 'Botão Salvar'
    Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: ENDEREÇOS: AO MENOS UM ENDEREÇO RESIDENCIAL    

Cenário 12 - Cadastro de Pessoa - Cep inválido
    [Documentation]    Esse teste verifica se é possível Cadastrar uma Pessoa
    [Tags]    Cadastrar uma Pessoa | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado        
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Selecionar o botão 'Cadastrar'    
    Clicar no campo 'Nome' e digitar o valor "Teste Pessoa Versão"
    Clicar no campo 'Sexo' e selecionar a opção "FEMININO"
    Clicar no campo 'Data de Nascimento' e digitar o valor "24/04/1993"
    Clicar no Campo 'Correio Eletrônico' e digitar o Valor "testeQualidade@teste.com.br"
    Clicar no campo 'Nacionalidade' e selecionar a opção "BRASILEIRA"
    Clicar no campo 'UF' e selecionar a opção "SP"
    Clicar no campo 'Cidade de Nascimento' e selecionar a opção "SAO PAULO"
    Clicar no campo 'Cor/Raça' e selecionar a opção "AMARELA"
    Clicar no campo 'Cep' e digitar o valor "00000001"
    Clicar no campo 'Numero' e digitar o valor "134"
    Visualizar a mensagem: CEP NÃO ENCONTRADO

Cenário 13 - Acesso ao Sistema – Pessoa/ Consulta sem informar Nome
    [Documentation]    Esse teste verifica se é possível Consultar uma Pessoa
    [Tags]             Pessoa/ Consulta | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no Botão "Pesquisar"
    Visualizar a mensagem: OBRIGATÓRIO PREENCHER NOME E SOBRENOME OU NOME E DATA DE NASCIMENTO.   

Cenário 14 - Acesso ao Sistema – Pessoa/ Consulta inexistente por nome
    [Documentation]    Esse teste verifica se é possível Consultar uma Pessoa
    [Tags]             Pessoa/ Consulta | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no campo de pesquisa 'Nome' e preencher o valor "TESTE INVÁLIDO"    
    Clicar no Botão "Pesquisar"
    Visualizar a mensagem: NENHUM REGISTRO FOI ENCONTRADO.      

Cenário 15 - Acesso ao Sistema – Pessoa/ Consulta inexistente por E-mail
    [Documentation]    Esse teste verifica se é possível Consultar uma Pessoa
    [Tags]             Pessoa/ Consulta | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no tipo de Pesquisa e selecionar o tipo "CORREIO ELETRÔNICO"
    Clicar no campo de pesquisa 'Correio Eletrônico' e preencher o valor "TESTE@INVÁLIDO"    
    Clicar no Botão "Pesquisar"
    Visualizar a mensagem: INFORME UM CORREIO ELETRÔNICO VÁLIDO.

Cenário 16 - Acesso ao Sistema – Pessoa/ Consulta por E-mail campo vazio
    [Documentation]    Esse teste verifica se é possível Consultar uma Pessoa
    [Tags]             Pessoa/ Consulta | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "41316137864" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no tipo de Pesquisa e selecionar o tipo "CORREIO ELETRÔNICO"
    Clicar no Botão "Pesquisar"
    Visualizar a mensagem: INFORME UM CORREIO ELETRÔNICO VÁLIDO.    

Cenário 17 - Funcionalidade Cadastro de Turma – Regular
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma turma Regular
    [Tags]             Cadastro de Turma | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Clicar em Nova Turma Regular
    Na Turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Curso, selecionar "PRÉ-ESCOLA"
    Em Ciclo, selecionar "ESTÁGIO I"
    Em Período, selecionar "MANHÃ"
    Em Turma, selecionar "I"
    Em Grade de Aula, selecionar "GRADE DE HORARIO - MANHÃ"
    Em Programa Curricular, selecionar "ESTÁGIO I"
    Em Capacidade da Turma, inserir a quantidade "20"
    Na Turma, clicar em Salvar
    Visualizar a mensagem: SELECIONE UMA SALA FÍSICA PARA ASSOCIAR A TURMA.    
    Clicar em OK no modal
    Selecionar uma Sala Física
    Limpar a capacidade da turma 
    Na Turma, clicar em Salvar
    Visualizar a mensagem: INFORME A CAPACIDADE DA TURMA.
    Clicar em OK no modal
    Em Capacidade da Turma, inserir a quantidade "20"
    Em Grade de Aula, selecionar "SELECIONE"
    Na Turma, clicar em Salvar
    Visualizar a mensagem: INFORME A GRADE DE AULA.
    Clicar em OK no modal
    Em Grade de Aula, selecionar "GRADE DE HORARIO - MANHÃ"
    Na Turma, clicar em Salvar
    Visualizar a mensagem: INFORME O PROGRAMA CURRICULAR.    

Cenário 18 - Funcionalidade Cadastro de Turma – Multisseriada
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma turma Multisseriada
    [Tags]             Cadastro de Turma | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Clicar em Nova Turma Multisseriada
    Na Turma, clicar em Salvar
    Visualizar a mensagem: SELECIONE MAIS UMA MATRIZ CURRICULAR PARA CADASTRAR A TURMA MULTISSERIADA.
    Clicar em OK no modal
    Em Anual/Semanal, selecionar "ANUAL"
    Em Período, selecionar "MANHÃ"
    Em Grid, selecionar "ESTÁGIO I"
    Em Grid, selecionar "ESTÁGIO II"    
    Na Turma, clicar em Salvar
    Visualizar a mensagem: SELECIONE A TURMA
    Clicar em OK no modal
    Em Turma, selecionar "W"
    Na Turma, clicar em Salvar
    Visualizar a mensagem: SELECIONE UMA SALA FÍSICA PARA ASSOCIAR A TURMA.
    Clicar em OK no modal
    Selecionar uma Sala Física
    Na Turma, clicar em Salvar
    Visualizar a mensagem: INFORME A CAPACIDADE DA TURMA.
    Clicar em OK no modal

Cenário 19 - Funcionalidade Consulta de Turma 
    [Documentation]    Esse teste verifica se é possível efetuar a
    ...                Consulta de uma turma 
    [Tags]             Consulta de Turma | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Em Ano Letivo, clicar em "SELECIONE"      
    Clicar em 'Pesquisar'
    Visualizar a mensagem: CAMPOS OBRIGATÓRIOS NÃO PREENCHIDO

Cenário 20 - Funcionalidade Controle Diário de Frequência 
    [Documentation]    Esse teste verifica se é possível efetuar o acesso 
    ...                ao Diário de Frequência
    [Tags]             Controle de Frequência | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Controle Diário de Frequência"    
    Clicar em 'Pesquisar'
    Visualizar a mensagem: INFORME O PROFESSOR.
    Clicar em OK no modal
    Em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Clicar em Pesquisar
    Visualizar a mensagem: INFORME O PROFESSOR.
    Clicar em OK no modal
    Em Professor, selecionar "ALEXANDRE FERREIRA DE ALMEIDA"
    Clicar em Pesquisar
    Visualizar a mensagem: INFORME A TURMA.
    Clicar em OK no modal
    Em campo turma, selecionar "1B"    
    Clicar em 'Pesquisar'
    Clicar no botão 'Diário de Turma'
    Clicar em Salvar
    Visualizar a mensagem: É NECESSÁRIO SELECIONAR AO MENOS DOIS EDUCANDOS PARA PROSSEGUIR.
    Clicar em OK no modal de alerta   
    Selecionar dois Educandos na Grid 
    Clicar em 'Incluir' no Diário de Classe
    Clicar em Salvar
    Visualizar a mensagem: EXISTEM CAMPOS DE PREENCHIMENTO OBRIGATÓRIO NÃO PREENCHIDOS. PREENCHA OS CAMPOS PARA CONTINUAR.
        
Cenário 21 - Funcionalidade Ata de Conselho Final - Turma
    [Documentation]    Esse teste verifica se é possível efetuar o acesso 
    ...                a Ata de Conselho
    [Tags]             Controle de Frequência | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Ata de Conselho Final - Turma"
    Em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Clicar em Pesquisar
    Visualizar a mensagem: SELECIONE UMA TURMA PARA REALIZAR A PESQUISA.
    Clicar em OK no modal
    Em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Clicar em Pesquisar
    Visualizar a mensagem: SELECIONE UMA TURMA PARA REALIZAR A PESQUISA.

Cenário 22 - Funcionalidade Histórico Escolar
    [Documentation]    Esse teste verifica se é possível efetuar o acesso 
    ...                ao Histórico Escolar
    [Tags]             Histórico Escolar | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Histórico Escolar"
    Clicar em Pesquisar
    Visualizar a mensagem: NENHUM REGISTRO FOI ENCONTRADO.
    Clicar em OK no modal
    Em código do Educando, informar "103971"
    Em Educando, informar "AARON RODRIGO NINA YUJIRA"
    Clicar em Pesquisar
    Visualizar a mensagem: NENHUM REGISTRO FOI ENCONTRADO.
    Clicar em OK no modal
    Clicar no botão Limpar
    Em Educando, informar "."
    Clicar em Pesquisar
    Visualizar a mensagem: NENHUM REGISTRO FOI ENCONTRADO.
    Clicar em OK no modal
    Clicar no botão Limpar
    Em código do Educando, informar "1039710"
    Em Educando, informar "AARON RODRIGO NINA YUJIRA"    
    Clicar em Pesquisar
    Clicar na ação Histórico Escolar
    Clicar em 'Incluir' para a Observação
    Visualizar a mensagem: CAMPO CICLO OBRIGATÓRIO!
    Clicar em OK no modal de alerta
    Em Observações, selecionar "1°"
    Clicar em 'Incluir' para a Observação
    Visualizar a mensagem: CAMPO OBSERVAÇÕES GERAL DO ANO LETIVO OBRIGATÓRIO!

Cenário 23 - Funcionalidade Histórico Escolar
    [Documentation]    Esse teste verifica se é possível efetuar o acesso 
    ...                ao Boletim Escolar
    [Tags]             Boletim Escolar | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão"
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Geral de Educando (conceito)"
    Clicar em Imprimir
    Visualizar a mensagem: VERIFIQUE SE TODOS OS FILTROS FORAM PREENCHIDOS
    Clicar em OK no modal
    No filtro Ano Letivo, selecionar "2022"
    No filtro Turma, selecionar "1A"
    Clicar em Imprimir
    Visualizar a mensagem: VERIFIQUE SE TODOS OS FILTROS FORAM PREENCHIDOS
    Clicar em OK no modal
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando"
    Clicar em Imprimir
    Visualizar a mensagem: VERIFIQUE SE TODOS OS FILTROS FORAM PREENCHIDOS
    Clicar em OK no modal
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando M02"
    Clicar em Imprimir
    Visualizar a mensagem: VERIFIQUE SE TODOS OS FILTROS FORAM PREENCHIDOS
    No filtro Ano Letivo, selecionar "2022"
    Clicar em Imprimir
    Visualizar a mensagem: VERIFIQUE SE TODOS OS FILTROS FORAM PREENCHIDOS

Cenário 24 - Funcionalidade Prontuário do Educando
    [Documentation]    Esse teste verifica se é possível efetuar o acesso 
    ...                ao Prontuário do Educando
    [Tags]             Prontuário do Educando | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário do Educando"
    Em Etapa/Modalidade no Prontuário, selecionar "ENSINO FUNDAMENTAL"    
    Clicar em Pesquisar no Prontuário do Educando             
    Visualizar a mensagem: INFORME UMA TURMA
    Clicar em OK no modal de alerta do Prontuário
    Em campo turma no Prontuário, selecionar "1B"    
    Clicar em Pesquisar no Prontuário do Educando 
    Clicar em Adicionar para Apoio Escolar
    Visualizar a mensagem: INFORME UM COMPONENTE DE APOIO ESCOLAR.
    Clicar em OK no modal
    Clicar em Adicionar para Avaliação por Especialista
    Visualizar a mensagem: INFORME UMA ESPECIALIDADE.

Cenário 25 - Funcionalidade Prontuário da Turma
    [Documentation]    Esse teste verifica se é possível efetuar o acesso 
    ...                ao Prontuário da Turma
    [Tags]             Prontuário da Turma| Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário da Turma"
    Em Ano Letivo, clicar em "2022"
    Clicar em Pesquisar
    Visualizar a mensagem: INFORME A UNIDADE ESCOLAR.
    Clicar em OK no modal de alerta
    Em Turma, selecionar "1A"
    Clicar em Pesquisar
    Clicar em Salvar
    Visualizar a mensagem: SELECIONE O MÊS DA REUNIÃO.
    Clicar em OK no modal de alerta
    Em Mês de Reunião, selecionar "Janeiro"
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA A DATA DA REUNIÃO.

    













    














    

    
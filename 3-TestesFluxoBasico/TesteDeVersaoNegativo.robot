*** Settings ***
Documentation     Esse teste verifica se é possível efetuar login no Gier
Resource         ../1-Hooks/1-Principal.robot
Resource         ../2-PageElements/FluxosAlternativos/AtaDeConselhoFinal/AtaDeConselhoFinal.robot
Resource         ../2-PageElements/FluxosAlternativos/AvaliacaoEFreqquencia/AvaliacaoEFrequencia.robot
Resource         ../2-PageElements/FluxosAlternativos/Avaliacaoes/Apredizagem.robot
Resource         ../2-PageElements/FluxosAlternativos/Avaliacaoes/AvaliacaoEducacional.robot
Resource         ../2-PageElements/FluxosAlternativos/Avaliacaoes/AvaliacaoEducacional2.robot
Resource         ../2-PageElements/FluxosAlternativos/Avaliacaoes/BancoDeQuestoes.robot
Resource         ../2-PageElements/FluxosAlternativos/Avaliacaoes/GruposDePergunta.robot
Resource         ../2-PageElements/FluxosAlternativos/BoletimEscolar/BoletimEscolar.robot
Resource         ../2-PageElements/FluxosAlternativos/ControleDiarioDeFrequencia/ControleDiarioDeFrequencia.robot
Resource         ../2-PageElements/FluxosAlternativos/HistoricoEscolar.robot/HistoricoEscolar.robot
Resource         ../2-PageElements/FluxosAlternativos/Login/Login.robot
Resource         ../2-PageElements/FluxosAlternativos/Login/EsqueciMinhaSenha.robot
Resource         ../2-PageElements/FluxosAlternativos/Login/Estrutura.robot
Resource         ../2-PageElements/FluxosAlternativos/Pessoa/CadastroPessoa.robot
Resource         ../2-PageElements/FluxosAlternativos/Pessoa/ConsultaPessoa.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/GestaoDePreMatriculaEscola.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/GestãoDePreMatriculaSecret.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/JustificativasPreMatricula.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/LayoutDoPortal.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/PortalConsulta.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/Portal.robot    
Resource         ../2-PageElements/FluxosAlternativos/Matricula/ProcessoDeDemanda.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/ProgramacaoDeProcesso.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/PortalListaDeEspera.robot
Resource         ../2-PageElements/FluxosAlternativos/Matricula/MatricularEducando.robot
Resource         ../2-PageElements/FluxosAlternativos/Prontuario/ProntuarioEducando.robot
Resource         ../2-PageElements/FluxosAlternativos/Prontuario/ProntuarioTurma.robot
Resource         ../2-PageElements/FluxosAlternativos/Transporte/CadastroDeRotas.robot
Resource         ../2-PageElements/FluxosAlternativos/Transporte/CadastroViagens.robot
Resource         ../2-PageElements/FluxosAlternativos/Transporte/CredenciamentoCondutores.robot
Resource         ../2-PageElements/FluxosAlternativos/Transporte/GestãoDeTransporte.robot
Resource         ../2-PageElements/FluxosAlternativos/Transporte/SolicitacaoTransporte.robot
Resource         ../2-PageElements/FluxosAlternativos/Turma/CadastroDeTurma.robot
Resource         ../2-PageElements/FluxosAlternativos/Turma/ConsultaDeTurma.robot  
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

#robot -d ./3-TestesFluxoBasico/results ./3-TestesFluxoBasico/TesteDeVersaoNegativo.robot

*** Test Cases ***
Cenário 01 - Acesso ao Sistema – Tela de Login Cenário A
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura
    ...    Com o usuário e senha especificados
    [Tags]    Seleção de Estrutura | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Entrar com as credenciais "02867439817" e "100200"	
    Verificar se o sistema exibe a mensagem: Login e/ou senha inválido(s)

Cenário 02 - Acesso ao Sistema – Tela de Login B 	
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Entrar com as credenciais "gieronline.com.br" e "123456789"		
    Verificar se o sistema exibe a mensagem: Login e/ou senha inválido(s)

Cenário 03 - Acesso ao Sistema – Tela de Login C 	
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
    Entrar com as credenciais "02867439817" e "12345678"
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
    Entrar com as credenciais "02867439817" e "12345678"
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
    Entrar com as credenciais "02867439817" e "12345678"
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
    Entrar com as credenciais "02867439817" e "12345678"
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
    Entrar com as credenciais "02867439817" e "12345678"
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
    Clicar no 'Botão Salvar'
    Visualizar a mensagem: OS CAMPOS A SEGUIR SÃO DE PREENCHIMENTO OBRIGATÓRIO: DADOS PESSOAIS: CIDADE DE NASCIMENTO    

Cenário 11 - Cadastro de Pessoa - Endereço não informado
    [Documentation]    Esse teste verifica se é possível Cadastrar uma Pessoa
    [Tags]    Cadastrar uma Pessoa | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
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
    Entrar com as credenciais "02867439817" e "12345678"
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
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: OBRIGATÓRIO PREENCHER NOME E SOBRENOME OU NOME E DATA DE NASCIMENTO.   

Cenário 14 - Acesso ao Sistema – Pessoa/ Consulta inexistente por nome
    [Documentation]    Esse teste verifica se é possível Consultar uma Pessoa
    [Tags]             Pessoa/ Consulta | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no campo de pesquisa 'Nome' e preencher o valor "TESTE INVÁLIDO"    
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: NENHUM REGISTRO FOI ENCONTRADO.      

Cenário 15 - Acesso ao Sistema – Pessoa/ Consulta inexistente por E-mail
    [Documentation]    Esse teste verifica se é possível Consultar uma Pessoa
    [Tags]             Pessoa/ Consulta | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no tipo de Pesquisa e selecionar o tipo "CORREIO ELETRÔNICO"
    Clicar no campo de pesquisa 'Correio Eletrônico' e preencher o valor "TESTE@INVÁLIDO"    
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: INFORME UM CORREIO ELETRÔNICO VÁLIDO.

Cenário 16 - Acesso ao Sistema – Pessoa/ Consulta por E-mail campo vazio
    [Documentation]    Esse teste verifica se é possível Consultar uma Pessoa
    [Tags]             Pessoa/ Consulta | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no tipo de Pesquisa e selecionar o tipo "CORREIO ELETRÔNICO"
    Clicar no Botão para "Pesquisar"
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

Cenário 23 - Funcionalidade Boletim Escolar
    [Documentation]    Esse teste verifica se é possível efetuar o acesso 
    ...                ao Boletim Escolar
    [Tags]             Boletim Escolar | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Gestão"
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

Cenário 26: Funcionalidade Avaliações e Frequência
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar um diário do Educando em Avaliações
    [Tags]             Avaliações e Frequência Fundamental | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Avaliações e Frequência"
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"     
    Na consulta de avaliações, em Data de Referência, informar "00000000"
    Visualizar a mensagem: INFORME UMA DATA VÁLIDA
    Clicar em "Ok" na mensagem
    Na consulta de avaliações, em Data de Referência, informar a data do dia atual
    Na consulta de avaliações, em Professor, selecionar "PRISCILA DOMINGUES FERNANDES LOPES"
    Na consulta de avaliações, em Turma, selecionar "3B"   
    Clicar em Pesquisar
    No primeiro aluno, em questionário, clicar em Diário de Bordo do Aluno
    Clicar em "Salvar"
    Visualizar a mensagem: INFORME A DESCRIÇÃO.
    Clicar em OK no modal de alerta
    Em Descrição, informar o valor "Teste Automação Qualidade - Fluxo Negativo"
    Clicar em "Salvar"
    Visualizar a mensagem: UM TIPO DE AVALIAÇÃO DEVE SER SELECIONADO.

Cenário 27: Funcionalidade Justificativas da Pré-Matricula
    [Documentation]    Esse teste verifica se é possível cadastrar uma 
    ...                justificativa
    [Tags]             Justificativas da Pré-Matricula | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Justificativas da Pré-matrícula"
    Clicar em Cadastrar justificativas
    Clicar em Salvar a justificativa    
    Visualizar a mensagem: O CAMPO TIPO DE SITUAÇÃO É OBRIGATÓRIO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Tipo de Situação, selecionar "CANCELAMENTO"
    Clicar em Salvar a justificativa
    Visualizar a mensagem: O CAMPO JUSTIFICATIVA É OBRIGATÓRIO.    
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Tipo de Situação, selecionar "DETERMINAÇÃO LEGAL"        
    Clicar em Salvar a justificativa
    Visualizar a mensagem: O CAMPO JUSTIFICATIVA É OBRIGATÓRIO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Tipo de Situação, selecionar "DESFAZER AÇÃO"    
    Clicar em Salvar a justificativa
    Visualizar a mensagem: O CAMPO JUSTIFICATIVA É OBRIGATÓRIO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Tipo de Situação, selecionar "INDEFERIMENTO"    
    Clicar em Salvar a justificativa
    Visualizar a mensagem: O CAMPO JUSTIFICATIVA É OBRIGATÓRIO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Tipo de Situação, selecionar "PAUSADO"    
    Clicar em Salvar a justificativa
    Visualizar a mensagem: O CAMPO JUSTIFICATIVA É OBRIGATÓRIO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Tipo de Situação, selecionar "VAGA OFERTADA"    
    Clicar em Salvar a justificativa
    Visualizar a mensagem: O CAMPO JUSTIFICATIVA É OBRIGATÓRIO.
    Clicar em Ok no modal de alerta de campo obrigatório

Cenário 28: Funcionalidade Layout do Portal de Inscrições e Transferências
    [Documentation]    Esse teste verifica se é possível cadastrar um 
    ...                 Layout do Portal de Inscrições e Transferências
    [Tags]             Layout do Portal de Inscrições e Transferências | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Layout do Portal de Inscrições e Transferências"
    Clicar em Cadastrar Layout
    Clicar em Salvar e Próximo no passo 1
    Visualizar a mensagem: NECESSÁRIO PREENCHER O CAMPO DESCRIÇÃO DO PROCESSO PARA PROSSEGUIR.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Descrição do Processo, inserir "Descrição Teste Automação"
    Clicar em Salvar e Próximo no passo 1
    Visualizar a mensagem: NÃO É POSSÍVEL SALVAR O LAYOUT. JÁ EXISTE OUTRO LAYOUT CADASTRADO PARA O ANO LETIVO SELECIONADO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Ano Letivo, selecionar o Ano Letivo Seguinte
    Em Banner Web clicar em Inserir 
    Visualizar a mensagem: SELECIONE O ARQUIVO ANTES DE INCLUI-LO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em inserir Documento Web, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal Web, inserir "00000000"        
    Em Banner Web clicar em Inserir 
    Visualizar a mensagem: DATA DE INÍCIO DA VIGÊNCIA DO BANNER INVÁLIDA.    
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Aplicar no Portal Web, inserir a data do dia atual        
    Em Banner Web clicar em Inserir 
    Em inserir Documento móvel, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal móvel, inserir "00000000"        
    Em Banner móvel clicar em Inserir     
    Visualizar a mensagem: DATA DE INÍCIO DA VIGÊNCIA DO BANNER INVÁLIDA.    
    Clicar em Ok no modal de alerta de campo obrigatório
    Em Aplicar no Portal móvel, inserir a data do dia atual        
    Em Banner Web clicar em Inserir 
    Clicar em Salvar e Próximo no passo 1
    Clicar em Salvar e Próximo no passo 2
    Clicar em Salvar e Próximo no passo 3
    Clicar em Salvar e Próximo no passo 4
    Clicar em inserir no passo 5
    Visualizar a mensagem: É NECESSÁRIO INFORMAR A OBSERVAÇÃO DO COMPROVANTE DE INSCRIÇÃO
    Clicar em Ok no modal de alerta de campo obrigatório

Cenário 29: Portal de Inscrição - Consulta de Solicitação
    [Documentation]    Esse teste verifica se é possível realizar uma consulta    
    ...                de uma solicitação realizada no Portal
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/"
    Clicar em 'Consultar Solicitação'
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário escolher uma nacionalidade.
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Brasileiro"
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar um protocolo válido. 
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar um documento.
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em CPF, inserir "364.882.650-67"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Não foi localizado registro com os dados informados.
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em CPF, inserir "364.882.650-67"
    Limpar o campo Data de Nascimento    
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar uma data de Nascimento.
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em CPF, inserir "364.882.650-67"
    Em Data de Nascimento, informar "00000000" 
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Formato de data inválida.
    Clicar em Ok no alerta do Portal

Cenário 30: Portal de Inscrição - Consulta de Solicitação Estrangeiro
    [Documentation]    Esse teste verifica se é possível realizar uma consulta
    ...                de uma solicitação realizada no Portal
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/"
    Clicar em 'Consultar Solicitação'
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário escolher uma nacionalidade.
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Estrangeiro"    
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar um protocolo válido. 
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Estrangeiro"
    Em Protocolo, informar "123456789"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em pesquisar no Portal    
    Visualizar a mensagem: Necessário informar um documento.
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Estrangeiro"
    Em Protocolo, informar "123456789"
    Em RNE, informar "v565371"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Não foi localizado registro com os dados informados.
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Estrangeiro"
    Em Protocolo, informar "123456789"
    Em RNE, informar "v565371"
    Limpar o campo Data de Nascimento
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar uma data de Nascimento.
    Clicar em Ok no alerta do Portal
    Em Nacionalidade, selecionar "Estrangeiro"
    Em Protocolo, informar "123456789"
    Em RNE, informar "v565371"
    Em Data de Nascimento, informar "00000000" 
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Formato de data inválida.
    Clicar em Ok no alerta do Portal

Cenário 31: Portal de Inscrição - Lista de Espera
    [Documentation]    Esse teste verifica se é possível realizar uma consulta
    ...                de uma solicitação que esta em Lista de Espera
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/"
    Clicar em Lista de Espera    
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário escolher um Ano Letivo
    Clicar em Ok no alerta do Portal
    Em Ano Letivo no Portal, selecionar o ano letivo corrente
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar o Nome do(a) Inscrito(a)
    Clicar em Ok no alerta do Portal
    Em Nome do(a) Aluno(a), informar "Teste Aluno Automação"
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar a data de Nascimento.    
    Clicar em Ok no alerta do Portal
    Em Data de Nascimento no Portal, informar "24/04/1993"    
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar o Nome do(a) Responsável
    Clicar em Ok no alerta do Portal
    Em Nome do(a) Responsável, informar "Teste Responsável Automação"
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Nenhum registro encontrado com os dados informados

Cenário 32: Funcionalidade Gestão de Pré-matrícula Escola
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar as solicitações realizadas no Portal 
    [Tags]             Gestão de Pré-matrícula | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Viualizar o titulo Gestão de Pré-Matrícula    
    Em campo Educando, informar "Teste Automação Qualidade"
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: NÃO HÁ EDUCANDOS COM OS FILTROS SELECIONADOS.
    Clicar em OK no modal de alerta
    Clicar no botão Limpar
    Em campo Protocolo, informar "123456789"    
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: NÃO HÁ EDUCANDOS COM OS FILTROS SELECIONADOS.    
    Clicar em OK no modal de alerta
    Clicar no botão Limpar
    Em Situação, selecionar "AGUARDANDO ANÁLISE"
    Clicar no Botão para "Pesquisar"
    No primeiro aluno da pesquisa, clicar na ação "Indeferir"
    Clicar no botão salvar para o alerta de Justificativa    
    Visualizar a mensagem: SELECIONE UMA JUSTIFICATIVA    
    Clicar em Ok no alerta de Justificativa    
    Fechar o modal de Justificativa            
    No primeiro aluno da pesquisa, clicar na ação "Deferir"     
    Clicar em OK no modal de alerta
    No primeiro aluno da pesquisa, clicar na ação "Registro de Atendimento"
    Clicar em salvar o Registro de Atendimento     
    Visualizar a mensagem: SELECIONE O TIPO DE CONTATO.    
    Clicar em OK para o alerta de Registro    
    Selecionar a opção "Contato com Sucesso"    
    Clicar em salvar o Registro de Atendimento 
    Visualizar a mensagem: PREENCHA O CAMPO INFORMAÇÕES SOBRE O ATENDIMENTO.
    Clicar em OK para o alerta de Registro    
    Selecionar a opção "Contato sem Sucesso"
    Clicar em salvar o Registro de Atendimento 
    Visualizar a mensagem: PREENCHA O CAMPO INFORMAÇÕES SOBRE O ATENDIMENTO.
    Clicar em OK para o alerta de Registro
    Fechar o modal de Histórico de Contato     
    No primeiro aluno da pesquisa, clicar na ação "Determinação Legal"
    Clicar no botão salvar para o alerta de Justificativa
    Visualizar a mensagem: INSIRA A JUSTIFICATIVA PARA PROSSEGUIR
    Clicar em Ok no alerta de Justificativa
    Fechar o modal de Justificativa
    No primeiro aluno da pesquisa, clicar na ação "Pausar"
    Clicar no botão salvar para o alerta de Justificativa    
    Visualizar a mensagem: INSIRA A JUSTIFICATIVA PARA PROSSEGUIR
    Clicar em Ok no alerta de Justificativa
    No primeiro aluno da pesquisa, clicar na ação "Cancelar Inscrição"
    Clicar no botão salvar para o alerta de Justificativa    
    Visualizar a mensagem: INSIRA A JUSTIFICATIVA PARA PROSSEGUIR
    Clicar em Ok no alerta de Justificativa

Cenário 33: Funcionalidade Gestão de Pré-matrícula Secretaria
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar as solicitações realizadas no Portal 
    [Tags]             Gestão de Pré-matrícula | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Situação, selecionar "AGUARDANDO ANÁLISE"
    Em campo Educando, informar "Teste Automação Qualidade"
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: NÃO HÁ EDUCANDOS COM OS FILTROS SELECIONADOS.
    Clicar em OK no modal de alerta
    Clicar no botão Limpar
    Em campo Protocolo, informar "123456789"    
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: NÃO HÁ EDUCANDOS COM OS FILTROS SELECIONADOS.    
    Clicar em OK no modal de alerta
    Clicar no botão Limpar
    Em Ciclo Destino, selecionar "Creche-Maternal"
    Em Escola Destino, selecionar "EPG JOAO BALBINO FILHO"    
    Em Situação, selecionar "AGUARDANDO ANÁLISE"    
    Clicar no Botão para "Pesquisar"
    No primeiro aluno da pesquisa, clicar na ação "Registro de Atendimento"
    Clicar em salvar o Registro de Atendimento     
    Visualizar a mensagem: SELECIONE O TIPO DE CONTATO.    
    Clicar em OK para o alerta de Registro    
    Selecionar a opção "Contato com Sucesso"    
    Clicar em salvar o Registro de Atendimento 
    Visualizar a mensagem: PREENCHA O CAMPO INFORMAÇÕES SOBRE O ATENDIMENTO.
    Clicar em OK para o alerta de Registro    
    Selecionar a opção "Contato sem Sucesso"
    Clicar em salvar o Registro de Atendimento 
    Visualizar a mensagem: PREENCHA O CAMPO INFORMAÇÕES SOBRE O ATENDIMENTO.
    Clicar em OK para o alerta de Registro
    Fechar o modal de Histórico de Contato     
    No primeiro aluno da pesquisa, clicar na ação "Cancelar Inscrição"
    Clicar no botão salvar para o alerta de Justificativa    
    Visualizar a mensagem: INSIRA A JUSTIFICATIVA PARA PROSSEGUIR
    Clicar em Ok no alerta de Justificativa
    Fechar o modal de Justificativa
    No primeiro aluno da pesquisa, clicar na ação "Oferta de Vagas"
    Clicar no botão salvar para o alerta de Justificativa    
    Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS PARA PROSSEGUIR
    Clicar em Ok no alerta de Justificativa
    Fechar o modal de Justificativa
    Clicar no Check Box do aluno
    Clicar no botão Alterar Escola 
    Em alterar escola, selecionar "EPG ALFREDO VOLPI"
    Clicar em Pesquisar
    Clicar em Alterar    
    Clicar no botão salvar para o alerta de Justificativa Alterar Escola    

Cenário 34: Funcionalidade Credenciamento de Condutores
    [Documentation]    Esse teste verifica se é possível cadastrar
    ...                um credenciamento para um condutor 
    [Tags]             Credenciamento de Condutores | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"    
    Clicar em Cadastrar Condutores    
    Clicar no botão Salvar e Próximo 
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta    
    Clicar no botão Cadastro de Pessoa Jurídica
    Clicar em Salvar
    Visualizar a mensagem: O CAMPO RAZÃO SOCIAL É OBRIGATÓRIO.    
    Clicar em OK no modal de alerta 
    Em Razão Social, informar "Teste Qa Automação"
    Clicar em Salvar
    Visualizar a mensagem: O CAMPO NOME FANTASIA É OBRIGATÓRIO.
    Clicar em OK no modal de alerta 
    Em Nome Fantasia, informar "Teste Qa Automação"
    Clicar em Salvar
    Visualizar a mensagem: O CAMPO TIPO CPF/CNPJ É OBRIGATÓRIO.
    Clicar em OK no modal de alerta     
    Em CNPJ, inserir um CNPJ válido
    Clicar em Salvar    
    Em Data da Inscrição do Condutor, selecionar o dia atual     
    Clicar em selecionar 
    Clicar no botão Salvar e Próximo
    Clicar no botão Salvar e Próximo para o proximo passo   
    Visualizar a mensagem: SELECIONE AO MENOS UMA ESCOLA
    Clicar em OK no modal de alerta 
    Em Nome da Escola, inserir "Volpi"
    Clicar em Pesquisar
    Clicar em "Inserir"
    Clicar no botão Salvar e Próximo para o proximo passo  
    Clicar no botão Salvar e Próximo para o proximo passo  
    Visualizar a mensagem: SELECIONE OU ADICIONE UM VEÍCULO
    Clicar em OK no modal de alerta 
    Clicar no botão Adicionar Veículo    
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Marca, selecionar "FIAT"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Modelo, selecionar "UNO"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Ano de Fabricação, selecionar "2022"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Ano Modelo, selecionar "2022"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Código do Veículo, informar "12345"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Placa do Veículo informar "54321"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Prefixo do Veículo, informar "1"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Cor, selecionar "Pink"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Tipo de Veículo, selecionar "Ônibus"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta     
    Em Combustivél, selecionar "Gasolina"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta   
    Em Unidade de Medida, selecionar "Pessoas"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta   
    Em Números de Eixos, informar "6"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta   
    Em Estado, selecionar "São Paulo"
    Em Cidade do Veículo, selecionar "Guarulhos"
    Clicar no botão Adicionar Veículo
    Visualizar a mensagem: EXISTEM CAMPOS NÃO PREENCHIDOS QUE SÃO OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Em Vagas Convencional, informar "30"
    Clicar no botão Adicionar Veículo
    Clicar no botão Salvar e Próximo para o proximo passo
    Clicar no botão Salvar e Próximo para o proximo passo
    Clicar no Botão Salvar e Fechar 
    Visualizar a mensagem: NECESSÁRIO INFORMAR O NÚMERO DE CONTRATO    

Cenário 35: Funcionalidade Rotas
    [Documentation]    Esse teste verifica se é possível cadastrar
    ...                uma rota para Transporte 
    [Tags]             Rotas | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Rotas"
    Clicar no botão Cadastrar
    Em Tipo de Rota, selecionar "Centro"    
    Em Nome de Escola, inserir "Volpi"
    Clicar em Pesquisar
    Selecionar a busca realizada na pesquisa da Escola
    Clicar no botão 'Inserir'    
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA O CAMPO NOME.
    Clicar em OK no modal de alerta
    Em Nome, inserir "Teste Automação Qa Nome"
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA O CAMPO PONTO INICIAL.
    Clicar em OK no modal de alerta
    Em Ponto Inicial, inserir "Teste Automação Qa Ponto Inicial"
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA O CAMPO PONTO FINAL.
    Clicar em OK no modal de alerta
    Em Ponto Final, inserir "Teste Automação Qa Ponto Final"
    Em Tipo de Rota, selecionar "Selecione" 
    Clicar em Salvar
    Visualizar a mensagem: SELECIONE UM TIPO DE ROTA    
    Clicar em OK no modal de alerta

Cenário 36: Funcionalidade Viagens 
    [Documentation]    Esse teste verifica se é possível cadastrar
    ...                uma rota para Transporte 
    [Tags]             Viagens | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade de transporte "Viagens"    
    Clicar no botão Cadastrar
    Clicar em Salvar
    Visualizar a mensagem: INFORME O NOME DA VIAGEM.
    Clicar em OK no modal de alerta
    Em Nome, inserir "Teste Automação Qa Nome"
    Clicar em Salvar
    Visualizar a mensagem: INFORME A ROTA DA VIAGEM.    
    Clicar em OK no modal de alerta    
    Em Rota, selecionar "Teste Qa"
    Clicar em Salvar
    Visualizar a mensagem: INFORME A FROTA.
    Clicar em OK no modal de alerta
    Em Frota, selecionar "Transporte Escolar"
    Clicar em Salvar
    Visualizar a mensagem: INFORME O VEÍCULO.
    Clicar em OK no modal de alerta
    Em veículo, selecionar "CITROEN - JUMPER M33M 23S - EOE7520"
    Clicar em Salvar
    Visualizar a mensagem: INFORME A DATA DE VIGÊNCIA.
    Clicar em OK no modal de alerta
    Em Vigência Inicial, infomar "00/00/0000"
    Em Vigência Final, infomar "00/00/0000"
    Clicar em Salvar
    Visualizar a mensagem: DATA DE VIGÊNCIA INVÁLIDA.
    Clicar em OK no modal de alerta
    Limpar Vigência Inicial, informar a data do dia atual 
    Limpar Vigência Final, informar a data do dia atual 
    Clicar em Salvar
    Visualizar a mensagem: INFORME A HORÁRIO INICIAL DE.
    Clicar em OK no modal de alerta
    Em Horário Inicial, informar "08:00" para De
    Clicar em Salvar
    Visualizar a mensagem: INFORME A HORÁRIO INICIAL ATÉ.
    Clicar em OK no modal de alerta
    Em Horário Inicial, informar "12:00" para até
    Clicar em Salvar
    Visualizar a mensagem: INFORME A HORÁRIO FiNAL DE.
    Clicar em OK no modal de alerta
    Em Horário Final, informar "13:00" para De
    Clicar em Salvar
    Visualizar a mensagem: INFORME A HORÁRIO FINAL ATÉ.
    Clicar em OK no modal de alerta
    Em Horário Final, informar "18:00" para até
    Clicar em Salvar
    Visualizar a mensagem: INFORME OS DIAS DA SEMANA
    Clicar em OK no modal de alerta

Cenário 37: Funcionalidade Transportes Secretaria 
    [Documentation]    Esse teste verifica se é possível solicitar
    ...                uma transporte através da secretaria
    [Tags]             Gestão de Transporte | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Gestão de Solicitação de Transporte" 
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: SELECIONE UMA SITUAÇÃO.
    Clicar em OK no modal de alerta
    Clicar em Cadastrar Beneficiários Externos
    Clicar em Salvar para cadastrar o aluno
    Visualizar a mensagem: A ESCOLA DE ORIGEM DO EDUCANDO É OBRIGATÓRIO
    Clicar em OK no modal de alerta
    Em Escola de Outra Rede, selecionar "AMOR AO PRÓXIMO CASA"
    Clicar em Salvar para cadastrar o aluno
    Visualizar a mensagem: O NOME DO EDUCANDO É OBRIGATÓRIO
    Clicar em OK no modal de alerta
    Em Nome do Educando, informar "Teste Qa Automação"
    Clicar em Salvar para cadastrar o aluno
    Visualizar a mensagem: A DATA DE NASCIMENTO DO EDUCANDO É OBRIGATÓRIO
    Clicar em OK no modal de alerta
    Em campo Data de Nascimento, informar "00/00/0000"  
    Clicar em Salvar para cadastrar o aluno
    Visualizar a mensagem: O SEXO DO EDUCANDO É OBRIGATÓRIO
    Clicar em OK no modal de alerta
    Em Sexo, selecionar "Feminino"
    Em Carteira de Identidade ou R.N.E informar um documento válido
    Clicar em Salvar para cadastrar o aluno
    Visualizar a mensagem: O ORGÃO EMISSOR DA CARTEIRA DE IDENTIDADE É OBRIGATÓRIO
    Clicar em OK no modal de alerta
    Em Órgão Emissor, selecionar "SSP"
    Clicar em Salvar para cadastrar o aluno
    Visualizar a mensagem: É OBRIGATÓRIO INSERIR O ENDEREÇO
    Clicar em OK no modal de alerta
    Clicar no campo 'Cep' e digitar o valor "07032-000"
    Clicar em 'Numero' e digitar o valor "134"    
    Clicar em "Incluir"    
    Clicar em Salvar para cadastrar o aluno
    Visualizar a mensagem: É NECESSÁRIO INSERIR UM RESPONSÁVEL
    Clicar em OK no modal de alerta
    Clicar no botão Inserir Responsável
    Visualizar a mensagem: PESQUISE UM RESPONSÁVEL.    
    Clicar em OK no modal de alerta

Cenário 38: Funcionalidade Transportes Escola 
    [Documentation]    Esse teste verifica se é possível solicitar
    ...                uma transporte através da escola
    [Tags]             Solicitação de Transporte | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Solicitação de Transporte" 
    Clicar no Botão para "Pesquisar"
    Visualizar a mensagem: CAMPO OBRIGATÓRIO. ETAPA/MODALIDADE
    Clicar em OK no modal de alerta
    Em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Situação da Solicitação, selecionar "Deferida sem Veiculo"    
    Clicar no Botão para "Pesquisar"
    Clicar em Ações    
    Em ações, selecionar "Editar"
    Clicar em Salvar
    Visualizar a mensagem: É NECESSÁRIO SELECIONAR UMA LINHA PREFERENCIAL DO FRETADO.


Cenário 39: Funcionalidade Aprendizagem
    [Documentation]    Esse teste verifica se é possível cadastrar
    ...                e editar uma Aprendizagem
    [Tags]             Aprendizagem | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Aprendizagem"
    Visualizar o Titulo Consulta de Descrição de Aprendizagem    
    Clicar no botão Cadastrar  
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS    
    Clicar em OK no modal de alerta
    Em Sigla, informar "Teste Automação Qa Sigla"    
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS
    Clicar em OK no modal de alerta
    Em Ordem, informar "123"      
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS
    Clicar em OK no modal de alerta    
    Clicar em Voltar
    Visualizar a mensagem: OS DADOS NÃO SALVOS SERÃO PERDIDOS, DESEJA CONTINUAR?
    Clicar no botão 'Sim'    
    Clicar no Botão para "Pesquisar"
    Clicar na ação "Editar"    
    Limpar o campo Sigla        
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Limpar o campo Ordem 
    Clicar em Salvar    
    Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS
    Clicar em OK no modal de alerta 
    Limpar o campo Descrição        
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS
    Clicar em OK no modal de alerta 

Cenário 40: Funcionalidade Grupos de Pergunta
    [Documentation]    Esse teste verifica se é possível cadastrar
    ...                um Grupos de Pergunta
    [Tags]             Grupos de Pergunta | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Grupos de Pergunta"
    Visualizar o Titulo Consultar Grupos de Pergunta   
    Clicar no botão Cadastrar  
    Clicar em Salvar
    Visualizar a mensagem de alerta: INFORME A DESCRIÇÃO.    
    Clicar em OK no modal 
    Em Descrição, informar o valor "Teste Qualidade Automação"
    Clicar em Salvar
    Visualizar a mensagem: INFORME A SIGLA.    
    Clicar em OK no modal 
    Clicar em Voltar
    Clicar no Botão para "Pesquisar"
    Clicar na ação "Editar"
    Limpar o campo Sigla         
    Clicar em Salvar
    Visualizar a mensagem: INFORME A SIGLA.
    Clicar em OK no modal 
    Limpar o campo Descrição        
    Clicar em Salvar
    Visualizar a mensagem de alerta: INFORME A DESCRIÇÃO. 
    Clicar em OK no modal 

Cenário 41: Funcionalidade Banco de Questões
    [Documentation]    Esse teste verifica se é possível cadastrar
    ...                um Banco de Questões
    [Tags]             Banco de Questões | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Banco de Questões" 
    Clicar no botão Cadastrar  
    Clicar em Salvar
    Visualizar a mensagem: UTILIZAÇÃO DA QUESTÃO É OBRIGATÓRIO            
    Clicar em OK no modal de alerta
    Em Utilização da Questão, selecionar "Pedagógico"
    Clicar em Salvar
    Visualizar a mensagem: INFORME A PERGUNTA.
    Clicar em OK no modal de alerta
    Em Pergunta, informar "Teste Automação Qa Pergunta"    
    Clicar em Salvar
    Visualizar a mensagem: INFORME A SIGLA.
    Clicar em OK no modal de alerta
    Em Sigla, informar "TQA"
    Clicar em Salvar
    Visualizar a mensagem: INFORME A ETAPA/MODALIDADE.
    Clicar em OK no modal de alerta
    Em Etapa/Modalidade, selecionar o tipo de ensino "Ensino Fundamental"       
    Clicar em Salvar
    Visualizar a mensagem: INFORME O ANO/CICLO.
    Clicar em OK no modal de alerta 

Cenário 42: Avaliação Educacional 
    [Documentation]    Esse teste verifica se é possível realizar a prova
    ...                Educacional sem o preenchimento de todas as respostas 
    [Tags]             Avaliação Educacional | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "4282670" e "4282670"
    Clicar na Prova Prova Automação Qa   
    Visualizar a Questão 1 de 18       
    Clicar no Botão Avançar 
    Visualizar a Questão 2 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 3 de 18
    Clicar no Botão Avançar
    Visualizar a Questão 4 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 5 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 6 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 7 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 8 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 9 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 10 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 11 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 12 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 13 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 14 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 15 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 16 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 17 de 18
    Clicar no Botão Avançar 
    Visualizar a Questão 18 de 18
    Visualizar o texto: Perguntas não respondidas: 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18
    
Cenário 43: Avaliação Educacional 
    [Documentation]    Esse teste verifica se é possível realizar a prova
    ...                Educacional com o preenchimento parcial das perguntas
    [Tags]             Avaliação Educacional | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "4282671" e "4282671"
    Clicar na Prova Prova Automação Qa  
    Visualizar a Questão 1 de 18       
    Clicar na Resposta "A"
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Visualizar a Questão 3 de 18  
    Clicar na Resposta "B"
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Visualizar a Questão 6 de 18  
    Clicar na Resposta "C"
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Visualizar a Questão 10 de 18  
    Clicar na Resposta "D"
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Clicar no Botão Avançar 
    Visualizar o texto: Perguntas não respondidas: 2, 4, 5, 7, 8, 9, 11, 12, 13, 14, 15, 16, 17, 18    
    Visualizar o botão Salvar desabilitado 

Cenário 44: Processo de Demanda
    [Documentation]    Esse teste efetua o fluxo negativo do Processo de Demanda
    [Tags]             Processo de Demanda | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, visualizar o modal de alerta contendo "PREENCHA OS CAMPOS DO CRITÉRIO"
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, na Descrição, inserir "TESTE NEGATIVO PROCESSO DEMANDA"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO CONTÍNUO"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "TODOS"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, visualizar o modal de alerta contendo "O CAMPO DATA INICIAL DO AGRUPAMENTO É OBRIGATÓRIO"
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/01/1900"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, visualizar o modal de alerta contendo "O CAMPO DATA FIM DO AGRUPAMENTO É OBRIGATÓRIO"
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/12/2005"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, visualizar o modal de alerta contendo "O CAMPO 'VERIFICA AUTORIZAÇÃO DE MATRICULA' É OBRIGATÓRIO"
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, visualizar o modal de alerta contendo "O CAMPO PERMITE 'MATRICULA MESMO MATRICULADO' É OBRIGATÓRIO"
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, visualizar o modal de alerta contendo "O CAMPO PERMITE 'PERMITE INSCRIÇÃO NA MESMA ESCOLA?' É OBRIGATÓRIO"
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, clicar em Salvar
    Em Processo de Demanda, visualizar o modal de alerta contendo "PREENCHA TODOS OS CAMPOS DO PROCESSO"
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, Seleção de Escolas, em Selecionar Diversas Escolas, selecionar "NÃO"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Verifica Dados, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite alterar escolas, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite Inscrição Pré-Matrícula, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite Quando For, selecionar ATENDIDO e INDEFERIDO
    Em Processo de Demanda, clicar em Salvar
    Em Processo de Demanda, clicar em OK no modal
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/09/2022"
    Em Programação de Processo, em Data Fim, inserir "30/09/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Em Processo de Demanda, clicar em Pesquisar
    Em Processo de Demanda, nos resultados, clicar em Ações e Excluir
    Em Processo de Demanda, clicar em Sim no modal
    Em Processo de Demanda, visualizar o modal de alerta contendo "EXCLUSÃO NÃO PERMITIDA, PROGRAMAÇÃO VINCULADA AO PROCESSO"
    
Cenário 45: Programação de Processo
    [Documentation]    Esse teste efetua o fluxo negativo de Programação de Processo
    [Tags]             Programação de Processo | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "TESTE NEGATIVO PARA PROGRAMAÇÃO DE PROCESSO"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO CONTÍNUO"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "TODOS"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/01/1900"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/12/2005"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Seleção de Escolas, em Selecionar Diversas Escolas, selecionar "NÃO"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Verifica Dados, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite alterar escolas, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite Inscrição Pré-Matrícula, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite Quando For, selecionar ATENDIDO e INDEFERIDO
    Em Processo de Demanda, clicar em Salvar
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Em Processo de Demanda, clicar em Pesquisar
    Em Processo de Demanda, verificar se o processo foi encontrado na pesquisa
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, visualizar o modal de alerta contendo "PREENCHA A DATA INÍCIO"
    Em Programação de Processo, clicar em OK no modal
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "TESTE NEGATIVO PARA PROGRAMAÇÃO DE PROCESSO"
    Em Programação de Processo, em Data Inicio, inserir "02/01/2022"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, visualizar o modal de alerta contendo "PREENCHA A DATA FIM"
    Em Programação de Processo, clicar em OK no modal
    Em Programação de Processo, em Data Fim, inserir "01/01/2022"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, visualizar o modal de alerta contendo "DATA INÍCIO NÃO PODE SER MAIOR QUE A DATA FIM"
    Em Programação de Processo, clicar em OK no modal
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, visualizar o modal de alerta contendo "SELECIONE OS DIAS DA SEMANA"
    Em Programação de Processo, clicar em OK no modal
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, visualizar o modal de alerta contendo "SELECIONE O AMBIENTE"
    Em Programação de Processo, clicar em OK no modal
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Em Programação de Processo, em Processo, selecionar o processo "TESTE PARA PROGRAMAÇÃO DE PROCESSO NEGATIVO #PROCESSO_TESTE_QA#"
    Em Programação de Processo, em Processo, selecionar o processo "TESTE NEGATIVO PARA PROGRAMAÇÃO DE PROCESSO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, visualizar o modal de alerta contendo "JÁ ESTÃO INSERIDOS!"
    Em Programação de Processo, clicar em OK no modal

Cenário 46: Portal de Inscrição - Infantil Inicial 
    [Documentation]    Esse teste verifica se é possível realizar uma 
    ...                solicitação para a etapa Infantil
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Entrar no Portal 
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07032-000"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, visualizar a mensagem "Não existem escolas disponíveis a partir dos dados informados"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "00000-002"
    No Portal, visualizar a mensagem "Não foi possível localizar a coordenada para listar escolas"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2018"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF inválido
    No Portal, visualizar a mensagem "O CPF informado é inválido"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "CPF não informado"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "40136061869"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, visualizar a mensagem "Não é possível continuar com a inscrição"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "23498175041"
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "AMANDA SANTOS"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "MURILO LIMA"
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão inválida
    No Portal, visualizar a mensagem "Número de Certidão de Nascimento Inválido"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão válida
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "00/00/0000"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações 
    No Portal, visualizar a mensagem "Data de Emissão da Certidão é inválida"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "24/04/1990"
    No Portal, clicar nos campos de declarações 
    No Portal, visualizar a mensagem "Data de Emissão da Certidão de Nascimento não pode ser menor que a Data de Nascimento"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "24/04/2021"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa MURILO LIMA já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "ROBERT DENIRO"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa ROBERT DENIRO já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "HAGRID SANTOS"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa HAGRID SANTOS já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "DANILO LEAL"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa DANILO LEAL já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal


Cenário 47: Portal de Inscrição - Fundamental Inicial 
    [Documentation]    Esse teste verifica se é possível realizar uma 
    ...                solicitação para a etapa Fundamental
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Entrar no Portal 
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07032-000"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, visualizar a mensagem "Não existem escolas disponíveis a partir dos dados informados"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "00000-002"
    No Portal, visualizar a mensagem "Não foi possível localizar a coordenada para listar escolas"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, clicar em Pesquisar Escolas
    No Portal, verificar se o botão Selecionar Escolas está desativado
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF inválido
    No Portal, visualizar a mensagem "O CPF informado é inválido"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "CPF não informado"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "401.360.618-69"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, visualizar a mensagem "Não é possível continuar com a inscrição"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "234.981.750-41"
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "AMANDA SANTOS"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "ROBERTO SALES"
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em RNE, inserir um RNE válido
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa ROBERTO SALES já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "ENRICO CARVALHO"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa ENRICO CARVALHO já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "AUGUSTO NOGUEIRA"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa AUGUSTO NOGUEIRA já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "MIGUEL DA CUNHA"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa MIGUEL DA CUNHA já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "TESTE NEGATIVO FUDAMENTAL INICIAL"

 
Cenário 48: Portal de Inscrição - EJA Inicial 
    [Documentation]    Esse teste verifica se é possível realizar uma 
    ...                solicitação para a etapa EJA
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07032-000"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, visualizar a mensagem "Não existem escolas disponíveis a partir dos dados informados"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "00000-002"
    No Portal, visualizar a mensagem "Não foi possível localizar a coordenada para listar escolas"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, clicar em Pesquisar Escolas
    No Portal, verificar se o botão Selecionar Escolas está desativado
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF inválido
    No Portal, visualizar a mensagem "O CPF informado é inválido"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "CPF não informado"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "401.360.618-69"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, visualizar a mensagem "Não é possível continuar com a inscrição"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "257.158.308-50"
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "CARLOS JOSE DA SILVA"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Masculino"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações 
    No Portal, visualizar a mensagem "A pessoa CARLOS JOSE DA SILVA já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "34129850741"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "YASMIN MORAES"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07031996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Pai"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa YASMIN MORAES já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "19070384000"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "RICARDO SIMOES"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07031996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Pai"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa RICARDO SIMOES já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "32423662041"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "LEANDRO LEONARDO"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07031996"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Pai"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "A pessoa LEANDRO LEONARDOmai já está inscrito(a) na rede de ensino!"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "95631027895"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "TESTE NEGATIVO EJA II INICIAL"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07031996"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Pai"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"

Cenário 49: Portal de Inscrição - Infantil Contínuo 
    [Documentation]    Esse teste verifica se é possível realizar uma 
    ...                solicitação para a etapa Infantil
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Entrar no Portal 
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07032-000"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, visualizar a mensagem "Não existem escolas disponíveis a partir dos dados informados"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "00000-002"
    No Portal, visualizar a mensagem "Não foi possível localizar a coordenada para listar escolas"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2018"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Solicitar Vaga
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF inválido
    No Portal, visualizar a mensagem "O CPF informado é inválido"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "CPF não informado"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "40136061869"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, visualizar a mensagem "Não é possível continuar com a inscrição"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "23498175041"
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "AMANDA SANTOS"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "PEDRO HENRIQUE MARTINS"
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão inválida
    No Portal, visualizar a mensagem "Número de Certidão de Nascimento Inválido"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão válida
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "00/00/0000"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações 
    No Portal, visualizar a mensagem "Data de Emissão da Certidão é inválida"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "24041990"
    No Portal, clicar nos campos de declarações 
    No Portal, visualizar a mensagem "Data de Emissão da Certidão de Nascimento não pode ser menor que a Data de Nascimento"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "24042021"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "GUILHERME ARAUJO"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 50: Portal de Inscrição - Fundamental Contínuo 
    [Documentation]    Esse teste verifica se é possível realizar uma 
    ...                solicitação para a etapa Fundamental
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Entrar no Portal 
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07032-000"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, visualizar a mensagem "Não existem escolas disponíveis a partir dos dados informados"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "00000-002"
    No Portal, visualizar a mensagem "Não foi possível localizar a coordenada para listar escolas"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Solicitar Vaga
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF inválido
    No Portal, visualizar a mensagem "O CPF informado é inválido"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "CPF não informado"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "401.360.618-69"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, visualizar a mensagem "Não é possível continuar com a inscrição"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "234.981.750-41"
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "AMANDA SANTOS"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "CARRILHO ESCOBAR"
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em RNE, inserir um RNE válido
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome "DOURIVAL JUNIOR"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 51: Portal de Inscrição - EJA Contínuo 
    [Documentation]    Esse teste verifica se é possível realizar uma 
    ...                solicitação para a etapa EJA
    [Tags]             Portal de Inscrição | Fluxo Negativo
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07032-000"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, visualizar a mensagem "Não existem escolas disponíveis a partir dos dados informados"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "00000-002"
    No Portal, visualizar a mensagem "Não foi possível localizar a coordenada para listar escolas"
    No Portal, fechar o modal
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, clicar em Pesquisar Escolas
    No Portal, verificar se o botão Selecionar Escolas está desativado
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Solicitar Vaga
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF inválido
    No Portal, visualizar a mensagem "O CPF informado é inválido"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "CPF não informado"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "401.360.618-69"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "00/00/0000"
    No Portal, visualizar a mensagem "Data de Nascimento inválida"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, visualizar a mensagem "Não é possível continuar com a inscrição"
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "90670308056"
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "EDUARDO SUPLICY"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Masculino"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Existem campos obrigatórios não preenchidos"
    No Portal, fechar o modal
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações 
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF "09432884015"
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome "HARLEY DAVID"
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07031996"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Pai"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 52: Funcionalidade Gier - Portal: Cancelado - Infantil Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - Infantil Contínuo | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Matricular Educando"
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Pessoa que Deseja Matricular, inserir "JOSIAS ADALBERTO"
    Em Matricular Educando, em Pessoa que Deseja Matricular, clicar em Pesquisar
    Em Matricular Educando, clicar em Sim no Modal
    Em Cadastro de Pessoa, no campo Nome, inserir um nome aleatório
    Em Cadastro de Pessoa, no campo Sexo, selecionar "MASCULINO"
    Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "07/03/2020"
    Clicar no checkbox Pessoa não possui correio eletrônico
    Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "BRASILEIRA"
    Em Cadastro de Pessoa, no campo UF Nascimento, selecionar "SP"
    Em Cadastro de Pessoa, no campo Cidade de Nascimento, selecionar "GUARULHOS"
    Em Cadastro de Pessoa, no campo CPF, inserir um CPF válido
    Em Cadastro de Pessoa, em Certidão de Nascimento, clicar em Nova Certidão de Nascimento
    Em Cadastro de Pessoa, em Matrícula Certidão, inserir uma certidão válida
    Em Cadastro de Pessoa, em Certidão, em Data de Emissão, inserir "01/01/2022"
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, em Vínculos de Parentesco, inserir o Nome "JOSIAS ADALBERTO"
    Em Cadastro de Pessoa, em Vínculos de Parentesco, clicar em Pesquisar
    Em Cadastro Rapido de Pessoa, clicar em Sim no Modal
    Em Cadastro Rapido de Pessoa, em Nome, inserir um nome aleatório
    Em Cadastro Rapido de Pessoa, em Data de Nascimento, inserir "07/03/1996"
    Em Cadastro Rapido de Pessoa, em Sexo, selecionar "Feminino"
    Em Cadastro Rapido de Pessoa, em CPF, inserir um CPF válido
    Em Cadastro Rapido de Pessoa, clicar em Salvar
    Em Cadastro Rapido de Pessoa, clicar em OK no Modal
    Em Cadastro de Pessoa, em Grau de Parentesco, selecionar "Mãe"
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Legal
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Principal
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Inserir Parente
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123-140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "33"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar em Salvar
    Clicar em OK no Modal
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Rede de Origem, selecionar "Municipal"
    Em Matricular Educando, em País de Origem, selecionar "Brasil"
    Em Matricular Educando, em Etapa/Modalidade, selecionar "Educação Infantil"
    Em Matricular Educando, em Curso, selecionar "Creche"
    Em Matricular Educando, em Periodo, selecionar "MANHÃ"
    Em Matricular Educando, em Ciclo, selecionar "Bercário II"
    Em Matricular Educando, selecionar uma turma com vagas
    Em Matricular Educando, clicar em Matricular Educando
    Em Matricular Educando, clicar em Sim no Modal de Matrícula
    Em Matricular Educando, verificar se a matrícula foi efetuada com sucesso
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, no modal de alerta, clicar em Sim
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Cancelar
    Em Gestão de Pré-Matrícula, em Justificativa, selecionar "OUTROS"
    Em Gestão de Pré-Matrícula, em Justificativa, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa, clicar em Salvar
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG BRAGUINHA"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 53: Funcionalidade Gier - Portal: Cancelado - Fundamental Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - Fundamental Contínuo | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Matricular Educando"
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Pessoa que Deseja Matricular, inserir "JOSIAS ADALBERTO"
    Em Matricular Educando, em Pessoa que Deseja Matricular, clicar em Pesquisar
    Em Matricular Educando, clicar em Sim no Modal
    Em Cadastro de Pessoa, no campo Nome, inserir um nome aleatório
    Em Cadastro de Pessoa, no campo Sexo, selecionar "MASCULINO"
    Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "07/03/2013"
    Clicar no checkbox Pessoa não possui correio eletrônico
    Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "ESTRANGEIRO"
    Em Cadastro de Pessoa, no campo País Origem, selecionar "PORTUGAL"
    Em Cadastro de Pessoa, no campo RNE, inserir um RNE válido
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, em Vínculos de Parentesco, inserir o Nome "JOSIAS ADALBERTO"
    Em Cadastro de Pessoa, em Vínculos de Parentesco, clicar em Pesquisar
    Em Cadastro Rapido de Pessoa, clicar em Sim no Modal
    Em Cadastro Rapido de Pessoa, em Nome, inserir um nome aleatório
    Em Cadastro Rapido de Pessoa, em Data de Nascimento, inserir "07/03/1996"
    Em Cadastro Rapido de Pessoa, em Sexo, selecionar "Feminino"
    Em Cadastro Rapido de Pessoa, em CPF, inserir um CPF válido
    Em Cadastro Rapido de Pessoa, clicar em Salvar
    Em Cadastro Rapido de Pessoa, clicar em OK no Modal
    Em Cadastro de Pessoa, em Grau de Parentesco, selecionar "Mãe"
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Legal
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Principal
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Inserir Parente
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123-140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "33"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar no botão Salvar       
    Clicar em OK no Modal
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Rede de Origem, selecionar "Municipal"
    Em Matricular Educando, em País de Origem, selecionar "Brasil"
    Em Matricular Educando, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Matricular Educando, em Curso, selecionar "Ciclo II"
    Em Matricular Educando, em Periodo, selecionar "MANHÃ"
    Em Matricular Educando, em Ciclo, selecionar "4º Ano"
    Em Matricular Educando, selecionar uma turma com vagas
    Em Matricular Educando, clicar em Matricular Educando
    Em Matricular Educando, clicar em Sim no Modal de Matrícula
    Em Matricular Educando, verificar se a matrícula foi efetuada com sucesso
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, no modal de alerta, clicar em Sim
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Cancelar
    Em Gestão de Pré-Matrícula, em Justificativa, selecionar "OUTROS"
    Em Gestão de Pré-Matrícula, em Justificativa, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa, clicar em Salvar
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido    
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 53: Funcionalidade Gier - Portal: Cancelado - EJA Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - EJA Contínuo | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Matricular Educando"
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Pessoa que Deseja Matricular, inserir "JOSIAS ADALBERTO"
    Em Matricular Educando, em Pessoa que Deseja Matricular, clicar em Pesquisar
    Em Matricular Educando, clicar em Sim no Modal
    Em Cadastro de Pessoa, no campo Nome, inserir um nome aleatório
    Em Cadastro de Pessoa, no campo Sexo, selecionar "MASCULINO"
    Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "07/03/1996"
    Clicar no checkbox Pessoa não possui correio eletrônico
    Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "BRASILEIRA"
    Em Cadastro de Pessoa, no campo UF Nascimento, selecionar "SP"
    Em Cadastro de Pessoa, no campo Cidade de Nascimento, selecionar "GUARULHOS"
    Em Cadastro de Pessoa, no campo CPF, inserir um CPF válido
    Em Cadastro de Pessoa, em Certidão de Nascimento, clicar em Nova Certidão de Nascimento
    Em Cadastro de Pessoa, em Matrícula Certidão, inserir uma certidão válida
    Em Cadastro de Pessoa, em Certidão, em Data de Emissão, inserir "01/01/2022"
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123-140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "33"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar no botão Salvar       
    Clicar em OK no Modal
    Em Matricular Educando, em Nome, inserir o nome cadastrado
    Em Matricular Educando, em Data de Nascimento, inserir a data cadastrada
    Em Matricular Educando, clicar em Pesquisar
    Em Matricular Educando, em Grau de Parentesco, selecionar "O Próprio"
    Em Matricular Educando, em Grau de Parentesco, clicar em Responsável Legal
    Em Matricular Educando, em Grau de Parentesco, clicar em Responsável Principal
    Em Matricular Educando, em Grau de Parentesco, clicar em Inserir Responsável
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Rede de Origem, selecionar "Municipal"
    Em Matricular Educando, em País de Origem, selecionar "Brasil"
    Em Matricular Educando, em Etapa/Modalidade, selecionar "Educação de Jovens e Adultos 2º Semestre"
    Em Matricular Educando, em Curso, selecionar "Ciclo II"
    Em Matricular Educando, em Periodo, selecionar "NOITE"
    Em Matricular Educando, em Ciclo, selecionar "Semestre 2"
    Em Matricular Educando, selecionar uma turma com vagas
    Em Matricular Educando, clicar em Matricular Educando
    Em Matricular Educando, clicar em Sim no Modal de Matrícula
    Em Matricular Educando, verificar se a matrícula foi efetuada com sucesso
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, no modal de alerta, clicar em Sim
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Cancelar
    Em Gestão de Pré-Matrícula, em Justificativa, selecionar "OUTROS"
    Em Gestão de Pré-Matrícula, em Justificativa, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa, clicar em Salvar
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG AMADEU PEREIRA LIMA"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 54: Funcionalidade Gier - Portal: Pausado - Infantil Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - Infantil Contínuo | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão válida
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Pausar
    Em Gestão de Pré-Matrícula, em Justificativa, selecionar "TESTE QA"
    Em Gestão de Pré-Matrícula, em Justificativa, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa, clicar em Salvar
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG BRAGUINHA"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 55: Funcionalidade Gier - Portal: Pausado - Fundamental Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - Fundamental Contínuo | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão válida
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Pausar
    Em Gestão de Pré-Matrícula, em Justificativa, selecionar "TESTE QA"
    Em Gestão de Pré-Matrícula, em Justificativa, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa, clicar em Salvar
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 56: Funcionalidade Gier - Portal: Pausado - EJA Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - EJA Contínuo | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Pausar
    Em Gestão de Pré-Matrícula, em Justificativa, selecionar "TESTE QA"
    Em Gestão de Pré-Matrícula, em Justificativa, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa, clicar em Salvar
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG AMADEU PEREIRA LIMA"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Solicitar Vaga
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, visualizar a mensagem "Você não pode realizar uma nova inscrição, Aluno já possui uma inscrição ativa."
    No Portal, fechar o modal

Cenário 57: Funcionalidade Gier - Portal - Infantil Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - Infantil Inicial | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Matricular Educando"
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Pessoa que Deseja Matricular, inserir "JOSIAS ADALBERTO"
    Em Matricular Educando, em Pessoa que Deseja Matricular, clicar em Pesquisar
    Em Matricular Educando, clicar em Sim no Modal
    Em Cadastro de Pessoa, no campo Nome, inserir um nome aleatório
    Em Cadastro de Pessoa, no campo Sexo, selecionar "MASCULINO"
    Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "07/03/2020"
    Clicar no checkbox Pessoa não possui correio eletrônico
    Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "BRASILEIRA"
    Em Cadastro de Pessoa, no campo UF Nascimento, selecionar "SP"
    Em Cadastro de Pessoa, no campo Cidade de Nascimento, selecionar "GUARULHOS"
    Em Cadastro de Pessoa, no campo CPF, inserir um CPF válido
    Em Cadastro de Pessoa, em Certidão de Nascimento, clicar em Nova Certidão de Nascimento
    Em Cadastro de Pessoa, em Matrícula Certidão, inserir uma certidão válida
    Em Cadastro de Pessoa, em Certidão, em Data de Emissão, inserir "01/01/2022"
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, em Vínculos de Parentesco, inserir o Nome "JOSIAS ADALBERTO"
    Em Cadastro de Pessoa, em Vínculos de Parentesco, clicar em Pesquisar
    Em Cadastro Rapido de Pessoa, clicar em Sim no Modal
    Em Cadastro Rapido de Pessoa, em Nome, inserir um nome aleatório
    Em Cadastro Rapido de Pessoa, em Data de Nascimento, inserir "07/03/1996"
    Em Cadastro Rapido de Pessoa, em Sexo, selecionar "Feminino"
    Em Cadastro Rapido de Pessoa, em CPF, inserir um CPF válido
    Em Cadastro Rapido de Pessoa, clicar em Salvar
    Em Cadastro Rapido de Pessoa, clicar em OK no Modal
    Em Cadastro de Pessoa, em Grau de Parentesco, selecionar "Mãe"
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Legal
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Principal
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Inserir Parente
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123-140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "33"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar em Salvar
    Clicar em OK no Modal
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Rede de Origem, selecionar "Municipal"
    Em Matricular Educando, em País de Origem, selecionar "Brasil"
    Em Matricular Educando, em Etapa/Modalidade, selecionar "Educação Infantil"
    Em Matricular Educando, em Curso, selecionar "Creche"
    Em Matricular Educando, em Periodo, selecionar "MANHÃ"
    Em Matricular Educando, em Ciclo, selecionar "Bercário II"
    Em Matricular Educando, selecionar uma turma com vagas
    Em Matricular Educando, clicar em Matricular Educando
    Em Matricular Educando, clicar em Sim no Modal de Matrícula
    Em Matricular Educando, verificar se a matrícula foi efetuada com sucesso
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está matriculada
    No Portal, fechar o modal

Cenário 58: Funcionalidade Gier - Portal - Fundamental Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - Infantil Inicial | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Matricular Educando"
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Pessoa que Deseja Matricular, inserir "JOSIAS ADALBERTO"
    Em Matricular Educando, em Pessoa que Deseja Matricular, clicar em Pesquisar
    Em Matricular Educando, clicar em Sim no Modal
    Em Cadastro de Pessoa, no campo Nome, inserir um nome aleatório
    Em Cadastro de Pessoa, no campo Sexo, selecionar "MASCULINO"
    Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "07/03/2013"
    Clicar no checkbox Pessoa não possui correio eletrônico
    Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "ESTRANGEIRO"
    Em Cadastro de Pessoa, no campo País Origem, selecionar "PORTUGAL"
    Em Cadastro de Pessoa, no campo RNE, inserir um RNE válido
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, em Vínculos de Parentesco, inserir o Nome "JOSIAS ADALBERTO"
    Em Cadastro de Pessoa, em Vínculos de Parentesco, clicar em Pesquisar
    Em Cadastro Rapido de Pessoa, clicar em Sim no Modal
    Em Cadastro Rapido de Pessoa, em Nome, inserir um nome aleatório
    Em Cadastro Rapido de Pessoa, em Data de Nascimento, inserir "07/03/1996"
    Em Cadastro Rapido de Pessoa, em Sexo, selecionar "Feminino"
    Em Cadastro Rapido de Pessoa, em CPF, inserir um CPF válido
    Em Cadastro Rapido de Pessoa, clicar em Salvar
    Em Cadastro Rapido de Pessoa, clicar em OK no Modal
    Em Cadastro de Pessoa, em Grau de Parentesco, selecionar "Mãe"
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Legal
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Responsável Principal
    Em Cadastro de Pessoa, em Grau de Parentesco, clicar em Inserir Parente
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123-140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "33"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar no botão Salvar       
    Clicar em OK no Modal
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Rede de Origem, selecionar "Municipal"
    Em Matricular Educando, em País de Origem, selecionar "Brasil"
    Em Matricular Educando, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Matricular Educando, em Curso, selecionar "Ciclo II"
    Em Matricular Educando, em Periodo, selecionar "MANHÃ"
    Em Matricular Educando, em Ciclo, selecionar "4º Ano"
    Em Matricular Educando, selecionar uma turma com vagas
    Em Matricular Educando, clicar em Matricular Educando
    Em Matricular Educando, clicar em Sim no Modal de Matrícula
    Em Matricular Educando, verificar se a matrícula foi efetuada com sucesso
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está matriculada
    No Portal, fechar o modal

Cenário 59: Funcionalidade Gier - Portal - EJA Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Gier > Portal - Infantil Inicial | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Matricular Educando"
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Pessoa que Deseja Matricular, inserir "JOSIAS ADALBERTO"
    Em Matricular Educando, em Pessoa que Deseja Matricular, clicar em Pesquisar
    Em Matricular Educando, clicar em Sim no Modal
    Em Cadastro de Pessoa, no campo Nome, inserir um nome aleatório
    Em Cadastro de Pessoa, no campo Sexo, selecionar "MASCULINO"
    Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "07/03/1996"
    Clicar no checkbox Pessoa não possui correio eletrônico
    Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "BRASILEIRA"
    Em Cadastro de Pessoa, no campo UF Nascimento, selecionar "SP"
    Em Cadastro de Pessoa, no campo Cidade de Nascimento, selecionar "GUARULHOS"
    Em Cadastro de Pessoa, no campo CPF, inserir um CPF válido
    Em Cadastro de Pessoa, em Certidão de Nascimento, clicar em Nova Certidão de Nascimento
    Em Cadastro de Pessoa, em Matrícula Certidão, inserir uma certidão válida
    Em Cadastro de Pessoa, em Certidão, em Data de Emissão, inserir "01/01/2022"
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123-140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "33"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar no botão Salvar       
    Clicar em OK no Modal
    Em Matricular Educando, em Nome, inserir o nome cadastrado
    Em Matricular Educando, em Data de Nascimento, inserir a data cadastrada
    Em Matricular Educando, clicar em Pesquisar
    Em Matricular Educando, em Grau de Parentesco, selecionar "O Próprio"
    Em Matricular Educando, em Grau de Parentesco, clicar em Responsável Legal
    Em Matricular Educando, em Grau de Parentesco, clicar em Responsável Principal
    Em Matricular Educando, em Grau de Parentesco, clicar em Inserir Responsável
    Em Matricular Educando, em Ano Letivo da Matrícula, selecionar o ano de "2022"
    Em Matricular Educando, em Rede de Origem, selecionar "Municipal"
    Em Matricular Educando, em País de Origem, selecionar "Brasil"
    Em Matricular Educando, em Etapa/Modalidade, selecionar "Educação de Jovens e Adultos 2º Semestre"
    Em Matricular Educando, em Curso, selecionar "Ciclo II"
    Em Matricular Educando, em Periodo, selecionar "NOITE"
    Em Matricular Educando, em Ciclo, selecionar "Semestre 2"
    Em Matricular Educando, selecionar uma turma com vagas
    Em Matricular Educando, clicar em Matricular Educando
    Em Matricular Educando, clicar em Sim no Modal de Matrícula
    Em Matricular Educando, verificar se a matrícula foi efetuada com sucesso
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está matriculada
    No Portal, fechar o modal

Cenário 60: Funcionalidade Portal - Gier - Infantil Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Gier - Infantil Inicial | Fluxo Negativo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão válida
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados Candidato
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "34"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar no botão Salvar    
    Clicar em OK no Modal
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Deferir
    Em Gestão de Pré-Matrícula, selecionar uma turma com vagas
    Em Gestão de Pré-Matrícula, clicar em Matricular Educando
    Em Gestão de Pré-Matrícula, clicar em OK no modal
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG BRAGUINHA"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal

Cenário 61: Funcionalidade Portal - Gier - Fundamental Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Gier - Fundamental Inicial | Fluxo Negativo
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir um RNE válido
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados Candidato
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "34"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar no botão Salvar    
    Clicar em OK no Modal
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Deferir
    Em Gestão de Pré-Matrícula, selecionar uma turma com vagas
    Em Gestão de Pré-Matrícula, clicar em Matricular Educando
    Em Gestão de Pré-Matrícula, clicar em OK no modal
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal

Cenário 62: Funcionalidade Portal - Gier - EJA Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Gier - EJA Inicial | Fluxo Negativo
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Educando, inserir o nome do educando cadastrado
    Em Gestão de Pré-Matrícula, em Educando, inserir o protocolo do comprovande de matrícula
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados Candidato
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "34"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar no botão Salvar    
    Clicar em OK no Modal
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Deferir
    Em Gestão de Pré-Matrícula, selecionar uma turma com vagas
    Em Gestão de Pré-Matrícula, clicar em Matricular Educando
    Em Gestão de Pré-Matrícula, clicar em OK no modal
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido    
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG AMADEU PEREIRA LIMA"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido    
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal

Cenário 63: Funcionalidade Portal - Portal - Infantil Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Portal - Infantil Inicial | Fluxo Negativo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir uma certidão válida
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2020"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG BRAGUINHA"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Aluno, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade de Nascimento, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Cadastro do Aluno, em Certidão de Nascimento, clicar em Nova
    No Portal, em Cadastro do Aluno, em Matrícula Certidão, inserir a certidão cadastrada
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "01/01/2022"
    No Portal, em Cadastro do Aluno, em UF da Certidão, selecionar "SP"
    No Portal, em Cadastro do Aluno, em Cidade do Cartório, selecionar "GUARULHOS"
    No Portal, em Cadastro do Aluno, em Cartório, inserir "CARTÓRIO TESTE"
    No Portal, em Cadastro do Aluno, em Distrito, inserir "DISTRITO TESTE"
    No Portal, em Cadastro do Aluno, em Comarca, inserir "COMARCA TESTE"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal

Cenário 64: Funcionalidade Portal - Portal - Fundamental Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Portal - Fundamental Inicial | Fluxo Negativo
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir um RNE válido
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2013"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "4º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "Mãe"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Aluno, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Aluno, em RNE, inserir O RNE cadastrado
    No Portal, em Cadastro do Aluno, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Aluno, em Sexo, inserir "Masculino"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal

Cenário 65: Funcionalidade Portal - Portal - EJA Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Portal - EJA Inicial | Fluxo Negativo
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir um CPF válido
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir um nome aleatório
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido    
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG AMADEU PEREIRA LIMA"
    No Portal, em Ano/Ciclo selecionar "Ciclo II"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Cadastro do Responsável, em UF Nascimento, selecionar "SP"
    No Portal, em Cadastro do Responsável, em Cidade de Nascimento, selecionar "SAO PAULO"
    No Portal, em Cadastro do Responsável, em CPF, inserir o CPF cadastrado
    No Portal, em Cadastro do Responsável, em Nome Completo, inserir o nome cadastrado
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Cadastro do Responsável, em Sexo, inserir "Feminino"
    No Portal, em Cadastro do Aluno, em Grau de Parentesco, inserir "O Próprio"
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido    
    No Portal, clicar nos campos de declarações
    No Portal, verificar se é exibida a mensagem que a pessoa já está inscrita
    No Portal, fechar o modal

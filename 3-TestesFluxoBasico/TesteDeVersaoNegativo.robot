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
Resource         ../2-PageElements/FluxosAlternativos/CT26-AvaliacoesEFrequencia.robot
Resource         ../2-PageElements/FluxosAlternativos/CT27-JustificativasPreMatr.robot
Resource         ../2-PageElements/FluxosAlternativos/CT28-LayoutDoPortal.robot
Resource         ../2-PageElements/FluxosAlternativos/CT29-PortalConsultaBrasileiro.robot
Resource         ../2-PageElements/FluxosAlternativos/CT30-PortalConsultaEstrangeiro.robot
Resource         ../2-PageElements/FluxosAlternativos/CT31-PortalListaDeEspera.robot
Resource         ../2-PageElements/FluxosAlternativos/CT32-GestaoPreMatriculaEscola.robot
Resource         ../2-PageElements/FluxosAlternativos/CT33-GestaoPreMatriculaSecret.robot
Resource         ../2-PageElements/FluxosAlternativos/CT34-CredenciamentoCondutores.robot
Resource         ../2-PageElements/FluxosAlternativos/CT35-CadastroDeRotas.robot
Resource         ../2-PageElements/FluxosAlternativos/CT36-CadastroViagens.robot
Resource         ../2-PageElements/FluxosAlternativos/CT37-GestãoDeTransporte.robot
Resource         ../2-PageElements/FluxosAlternativos/CT38-SolicitacaoTransporte.robot
Resource         ../2-PageElements/FluxosAlternativos/CT39-Apredizagem.robot
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
    Clicar no Botão para "Pesquisar"
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
    Clicar no Botão para "Pesquisar"
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
    Clicar no Botão para "Pesquisar"
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

Cenário 23 - Funcionalidade Histórico Escolar
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
    Em CPF, inserir "364.882.650-67"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em pesquisar no Portal    
    Visualizar a mensagem: Necessário informar um protocolo válido.
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
    Em RNE, informar "v565371"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em pesquisar no Portal
    Visualizar a mensagem: Necessário informar um protocolo válido.
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
    Em Sigla, informar "Teste Automação Qa Siga"    
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
    Limpar o campo Descrição de Aprendizagem        
    Clicar em Salvar
    Visualizar a mensagem: PREENCHA OS CAMPOS OBRIGATÓRIOS
    Clicar em OK no modal de alerta 





























    










    

    







    













    




    




    






        






    






    













    














    

    
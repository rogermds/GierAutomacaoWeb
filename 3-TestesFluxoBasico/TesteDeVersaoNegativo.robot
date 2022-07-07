*** Settings ***
Documentation     Esse teste verifica se é possível efetuar login no Gier
Resource         ../1-Hooks/1-Principal.robot
Resource         ../2-PageElements/FluxosAlternativos/CT01_02-TelaDeLogin.robot
Resource         ../2-PageElements/FluxosAlternativos/CT03-EsqueiMinhaSenha.robot
Resource         ../2-PageElements/FluxosAlternativos/CT04-EsqueciMinhaSenha.robot
Resource         ../2-PageElements/FluxosAlternativos/CT05-SelecaoDeEstrutura.robot
Resource         ../2-PageElements/FluxosAlternativos/CT06-CadastroDePessoa.robot
Resource         ../2-PageElements/FluxosAlternativos/CT07-CadastroDePessoa.robot

Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

#robot -d ./3-TestesFluxoBasico/results ./3-TestesFluxoBasico/TesteDeVersaoNegativo.robot

*** Test Cases ***

CT01 - Acesso ao Sistema – Tela de Login Cenário A
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura
    ...    Com o usuário e senha especificados
    [Tags]    Seleção de Estrutura | Fluxo Negativo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Entrar com as credenciais "41316137864" e "100200"	
    Verificar se o sistema exibe a mensagem: Login e/ou senha inválido(s)

CT02 - Acesso ao Sistema – Tela de Login B 	
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Entrar com as credenciais "gieronline.com.br" e "123456789"		
    Verificar se o sistema exibe a mensagem: Login e/ou senha inválido(s)

CT03 - Acesso ao Sistema – Tela de Login C 	
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Clicar em 'Esqueci minha Senha'    
    Clicar no Campo 'EMAIL' e Preencher o Valor "rafaela.domingos@tecnogroup.com.br"
    Verificar se o sistema exibe a mensagem: Informe um CPF válido! 	
	
CT04 - Acesso ao Sistema – Tela de Login D 	
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Clicar em 'Esqueci minha Senha' 	
    Clicar no Campo 'CPF' e Preencher o Valor "41316137864"	
    Verificar se o sistema exibe a mensagem: Informe um email válido! 

CT05 - Acesso ao Sistema – Seleção de Estrutura 
    [Documentation]    Esse teste verifica se é possível selecionar uma Estrutura	
    ...    Com o usuário e senha especificados	
    [Tags]    Seleção de Estrutura | Fluxo Negativo	
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"	
    Entrar com as credenciais "02867439817" e "12345678"	
    Informar a Estrutura MMMMMM
    Verificar se o sistema exibe a mensagem: Não há registros com o argumento pesquisado.

CT06 - Cadastro de Pessoa - E-mail inválido
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

CT07 - Cadastro de Pessoa - Data de Nascimento sem preechimento
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
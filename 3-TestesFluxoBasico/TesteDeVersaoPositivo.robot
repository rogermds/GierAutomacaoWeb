*** Settings ***
# Documentation    Essa suite efetua login e busca um educando no Gier
Resource         ../1-Hooks/1-Principal.robot
Resource         ../2-PageElements/FluxosPrincipais/CT01-Login.robot
Resource         ../2-PageElements/FluxosPrincipais/CT02-SelecaodeEstrutura.robot
Resource         ../2-PageElements/FluxosPrincipais/CT03-CadastroPessoa.robot
Resource         ../2-PageElements/FluxosPrincipais/CT04-ConsultaPessoa.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

#robot -d ./3-TestesFluxoBasico/results ./3-TestesFluxoBasico/TesteDeVersaoPositivo.robot

*** Test Cases ***

# Cenário 01: Acesso ao Sistema – Tela de Login
#     [Documentation]    Esse teste verifica se é possível efetuar login no Gier
#     ...                Com o usuário e senha especificados
#     [Tags]             Login | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"  
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"

# Cenário 02: Acesso ao Sistema – Seleção de estrutura
#     [Documentation]    Esse teste verifica se é possível selecionar uma
#     ...                estrutura após efetuar o login
#     [Tags]             Seleção de Estrutura | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"

# Cenário 03-A: Funcionalidade Cadastro de Pessoa – Escola
#     [Documentation]    Esse teste verifica se é possível efetuar o
#     ...                cadastro de uma pessoa na escola
#     [Tags]             Cadastro de Pessoa - Escola | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Pessoa"
#     Clicar no botão Cadastrar
#     Verificar se aparece o texto "Cadastrar Pessoa"
#     No campo Nome, inserir o nome "Teste Cadastro Automacao "
#     No campo Sexo, selecionar "MASCULINO"
#     No campo Data de Nascimento, inserir a data "07/03/1996"
#     Clicar no checkbox Pessoa não possui correio eletrônico
#     No campo Nacionalidade, selecionar "BRASILEIRA"
#     No campo UF Nascimento, selecionar "SP"
#     No campo Cidade de Nascimento, selecionar "SAO PAULO"
#     No campo CPF, inserir um CPF válido
#     No campo Carteira de Identidade ou R.N.E., inserir um RG válido
#     No campo Dígito, inserir o dígito do RG
#     No campo Órgão Emissor, selecionar "SSP"
#     No campo Data de Expedição, inserir a data "20/01/2020"
#     No campo Cor/Raça, selecionar "PRETA"
#     No campo CEP, inserir o CEP "02176-010"
#     No campo Número, inserir o número "13"
#     No campo Zona, selecionar "URBANO"
#     Clicar no botão Incluir
#     Clicar no botão Salvar
#     No modal Deseja Cadastrar Outra Pessoa?, clicar em "Não"
#     Verificar se o sistema retorna a página Consultar Pessoa

# Cenário 03-B: Funcionalidade Cadastro de Pessoa – Secretaria
#     [Documentation]    Esse teste verifica se é possível efetuar o
#     ...                cadastro de uma pessoa na secretaria
#     [Tags]             Cadastro de Pessoa - Secretaria | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "SECRETARIA" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Pessoas"
#     Entrar na funcionalidade "Pessoa"
#     Clicar no botão Cadastrar
#     Verificar se aparece o texto "Cadastrar Pessoa"
#     No campo Nome, inserir o nome "Teste Cadastro Automacao "
#     No campo Sexo, selecionar "MASCULINO"
#     No campo Data de Nascimento, inserir a data "07/03/1996"
#     Clicar no checkbox Pessoa não possui correio eletrônico
#     No campo Nacionalidade, selecionar "BRASILEIRA"
#     No campo UF Nascimento, selecionar "SP"
#     No campo Cidade de Nascimento, selecionar "SAO PAULO"
#     No campo CPF, inserir um CPF válido
#     No campo Carteira de Identidade ou R.N.E., inserir um RG válido
#     No campo Dígito, inserir o dígito do RG
#     No campo Órgão Emissor, selecionar "SSP"
#     No campo Data de Expedição, inserir a data "20/01/2020"
#     No campo Cor/Raça, selecionar "PRETA"
#     No campo CEP, inserir o CEP "02176-010"
#     No campo Número, inserir o número "13"
#     No campo Zona, selecionar "URBANO"
#     Clicar no botão Incluir
#     Clicar no botão Salvar
#     No modal Deseja Cadastrar Outra Pessoa?, clicar em "Não"
#     Verificar se o sistema retorna a página Consultar Pessoa

Cenário 04-A: Funcionalidade Consulta de Pessoa – Secretaria
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma pessoa na secretaria
    [Tags]             Cadastro de Pessoa - Secretaria | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pessoas"
    Entrar na funcionalidade "Pessoa"
    Em consulta, no campo Nome, inserir o nome "AGATHA GABRIELLY DOS SANTOS SOUZA"
    Em consulta, no campo D. Nascimento, inserir a data "15/06/2013"
    Clicar no botão "Pesquisar"
    Verificar se no grid é exibido o CPF "57266385814"
    Verificar se no grid é exibido o RG "60483237"
    Verificar se no grid é exibido a Data de Nascimento "15/06/2013"
    Clicar no botão "Ações"
    Clicar no botão "Visualizar"
    Verificar se aparece o texto "Visualizar Pessoa"
    Verificar se é exibido o nome "AGATHA GABRIELLY DOS SANTOS SOUZA"
    Verificar se é exibido a data de nascimento "15/06/2013"
    

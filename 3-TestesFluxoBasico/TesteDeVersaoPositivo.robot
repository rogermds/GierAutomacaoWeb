*** Settings ***
# Documentation    Essa suite efetua login e busca um educando no Gier
Resource         ../1-Hooks/1-Principal.robot
Resource         ../2-PageElements/FluxosPrincipais/CT01-Login.robot
Resource         ../2-PageElements/FluxosPrincipais/CT02-SelecaodeEstrutura.robot
Resource         ../2-PageElements/FluxosPrincipais/CT03-CadastroPessoa.robot
Resource         ../2-PageElements/FluxosPrincipais/CT04-ConsultaPessoa.robot
Resource         ../2-PageElements/FluxosPrincipais/CT05-CadastroDeTurma.robot
Resource         ../2-PageElements/FluxosPrincipais/CT06-ConsultaDeTurma.robot
Resource         ../2-PageElements/FluxosPrincipais/CT07-AvaliacoesFrequencia.robot
Resource         ../2-PageElements/FluxosPrincipais/CT08-ControleDiarioFrequencia.robot
Resource         ../2-PageElements/FluxosPrincipais/CT09-AtaDeConselho.robot
Resource         ../2-PageElements/FluxosPrincipais/CT10-HistoricoEscolar.robot
Resource         ../2-PageElements/FluxosPrincipais/CT11-BoletimEscolar.robot
Resource         ../2-PageElements/FluxosPrincipais/CT12-ProntuarioDaTurma.robot
Resource         ../2-PageElements/FluxosPrincipais/CT13-ProntuarioDoAluno.robot
Resource         ../2-PageElements/FluxosPrincipais/CT14-Matricula.robot
Resource         ../2-PageElements/FluxosPrincipais/CT15-Transportes.robot
Resource         ../2-PageElements/FluxosPrincipais/CT16-AvaliacoesEducacionais.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

#robot -d ./3-TestesFluxoBasico/results ./3-TestesFluxoBasico/TesteDeVersaoPositivo.robot

#Inserir editar na consulta de turma
#Cadastro no minimo 2x
#Consultar o que foi cadastrado
## EJA PRECISA ESPERAR VIRAR O SEMESTRE PARA ALTERAR INFORMAÇÕES


*** Test Cases ***
Cenário 01: Acesso ao Sistema – Tela de Login
    [Documentation]    Esse teste verifica se é possível efetuar login no Gier
    ...                Com o usuário e senha especificados
    [Tags]             Login | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"  
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"

Cenário 02: Acesso ao Sistema – Seleção de estrutura
    [Documentation]    Esse teste verifica se é possível selecionar uma
    ...                estrutura após efetuar o login
    [Tags]             Seleção de Estrutura | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"

Cenário 03-A: Funcionalidade Cadastro de Pessoa – Escola
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma pessoa na escola
    [Tags]             Cadastro de Pessoa - Escola | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no botão Cadastrar
    Verificar se aparece o texto "Cadastrar Pessoa"
    No campo Nome, inserir o nome "Teste Cadastro Automacao"
    No campo Sexo, selecionar "MASCULINO"
    No campo Data de Nascimento, inserir a data "07/03/1996"
    Clicar no checkbox Pessoa não possui correio eletrônico
    No campo Nacionalidade, selecionar "BRASILEIRA"
    No campo UF Nascimento, selecionar "SP"
    No campo Cidade de Nascimento, selecionar "SAO PAULO"
    No campo CPF, inserir um CPF válido
    No campo Carteira de Identidade ou R.N.E., inserir um RG válido
    No campo Dígito, inserir o dígito do RG
    No campo Órgão Emissor, selecionar "SSP"
    No campo Data de Expedição, inserir a data "20/01/2020"
    No campo Cor/Raça, selecionar "PRETA"
    No campo CEP, inserir o CEP "02176-010"
    No campo Número, inserir o número "13"
    No campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Clicar em Salvar
    No modal Deseja Cadastrar Outra Pessoa?, clicar em "Não"
    Verificar se o sistema retorna a página Consultar Pessoa

Cenário 03-B: Funcionalidade Cadastro de Pessoa – Secretaria
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
    Clicar em Cadastrar
    Verificar se aparece o texto "Cadastrar Pessoa"
    No campo Nome, inserir o nome "Teste Cadastro Automacao "
    No campo Sexo, selecionar "MASCULINO"
    No campo Data de Nascimento, inserir a data "07/03/1996"
    Clicar no checkbox Pessoa não possui correio eletrônico
    No campo Nacionalidade, selecionar "BRASILEIRA"
    No campo UF Nascimento, selecionar "SP"
    No campo Cidade de Nascimento, selecionar "SAO PAULO"
    No campo CPF, inserir um CPF válido
    No campo Carteira de Identidade ou R.N.E., inserir um RG válido
    No campo Dígito, inserir o dígito do RG
    No campo Órgão Emissor, selecionar "SSP"
    No campo Data de Expedição, inserir a data "20/01/2020"
    No campo Cor/Raça, selecionar "PRETA"
    No campo CEP, inserir o CEP "02176-010"
    No campo Número, inserir o número "13"
    No campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Clicar em Salvar
    No modal Deseja Cadastrar Outra Pessoa?, clicar em "Não"
    Verificar se o sistema retorna a página Consultar Pessoa

Cenário 04-A: Funcionalidade Consulta de Pessoa – Escola
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma pessoa na secretaria
    [Tags]             Cadastro de Pessoa - Escola | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Em consulta, no campo Nome, inserir o nome "AGATHA GABRIELLY DOS SANTOS SOUZA"
    Em consulta, no campo D. Nascimento, inserir a data "15/06/2013"
    Clicar em Pesquisar
    Verificar se no grid é exibido o CPF "57266385814"
    Verificar se no grid é exibido o RG "60483237"
    Verificar se no grid é exibido a Data de Nascimento "15/06/2013"
    Clicar no botão "Ações"
    Clicar no botão "Visualizar"
    Verificar se aparece o texto "Visualizar Pessoa"
    Verificar se é exibido o nome "AGATHA GABRIELLY DOS SANTOS SOUZA"
    Verificar se é exibido a data de nascimento "15/06/2013"

Cenário 04-B: Funcionalidade Consulta de Pessoa – Secretaria
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
    Clicar em Pesquisar
    Verificar se no grid é exibido o CPF "57266385814"
    Verificar se no grid é exibido o RG "60483237"
    Verificar se no grid é exibido a Data de Nascimento "15/06/2013"
    Clicar no botão "Ações"
    Clicar no botão "Visualizar"
    Verificar se aparece o texto "Visualizar Pessoa"
    Verificar se é exibido o nome "AGATHA GABRIELLY DOS SANTOS SOUZA"
    Verificar se é exibido a data de nascimento "15/06/2013"
    
Cenário 05-A: Funcionalidade Cadastro de Turma – Infantil
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma turma da Etapa Infantil
    [Tags]             Cadastro de Turma | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Clicar em Nova Turma Regular
    No cadastro de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Curso, selecionar "PRÉ-ESCOLA"
    Em Ciclo, selecionar "ESTÁGIO II"
    Em Período, selecionar "MISTO"
    Em Turma, selecionar "W"
    Em Grade de Aula, selecionar "GRADE DE HORARIO - MISTO"
    Em Programa Curricular, selecionar "ESTÁGIO II"
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "20"
    Clicar em Salvar
    No modal para cadastrar outra turma, clique em Não
    Verificar se a página retornou a busca de turma

Cenário 05-B: Funcionalidade Cadastro de Turma – Fundamental
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma turma da Etapa Fundamental
    [Tags]             Cadastro de Turma | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Clicar em Nova Turma Regular
    No cadastro de turma, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Curso, selecionar "CICLO II"
    Em Ciclo, selecionar "5° ANO"
    Em Período, selecionar "TARDE"
    Em Turma, selecionar "R"
    Em Grade de Aula, selecionar "GRADE DE HORARIO - TARDE"
    Em Programa Curricular, selecionar "5º ANO"
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "20"
    Clicar em Salvar
    No modal para cadastrar outra turma, clique em Não
    Verificar se a página retornou a busca de turma

Cenário 05-C: Funcionalidade Cadastro de Turma – EJA
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma turma da Etapa EJA
    [Tags]             Cadastro de Turma | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Clicar em Nova Turma Regular
    No cadastro de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    Em Curso, selecionar "CICLO I"
    Em Ciclo, selecionar "SEMESTRE 3"
    Em Período, selecionar "NOITE"
    Em Turma, selecionar "W"
    Em Grade de Aula, selecionar "GRADE DE HORARIO - NOITE"
    Em Programa Curricular, selecionar "EJA"
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "20"
    Clicar em Salvar
    No modal para cadastrar outra turma, clique em Não
    Verificar se a página retornou a busca de turma

Cenário 05-D: Funcionalidade Cadastro de Turma Multisseriada
    [Documentation]    Esse teste verifica se é possível efetuar o
    ...                cadastro de uma turma multisseriada
    [Tags]             Cadastro de Turma Multisseriada | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Clicar em Nova Turma Multisseriada
    Em Anual/Semanal, selecionar "ANUAL"
    Em Período, selecionar "INTERMEDIÁRIO"
    No grid de Etapa, selecionar "1° ANO - EE"
    No grid de Etapa, selecionar "2° ANO - EE"
    Em Turma, selecionar "Q"
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "20"
    Clicar em Salvar
    No modal para cadastrar outra turma, clique em Não
    Verificar se a página retornou a busca de turma

Cenário 06A: Funcionalidade Consulta de Turma - Infantil
    [Documentation]    Esse teste verifica se é possível efetuar a
    ...                consulta de uma turma da Etapa Infantil
    [Tags]             Consulta de Turma Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Na consulta de turma, em Curso, selecionar "PRÉ-ESCOLA"
    Na consulta de turma, em Período, selecionar "MANHÃ"
    Na consulta de turma, em Ciclo, selecionar "ESTÁGIO II"
    Clicar em Pesquisar
    Verificar se aparece o texto "Resultado da Busca"

Cenário 06B: Funcionalidade Consulta de Turma - Fundamental
    [Documentation]    Esse teste verifica se é possível efetuar a
    ...                consulta de uma turma da Etapa Fundamental
    [Tags]             Consulta de Turma Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Na consulta de turma, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na consulta de turma, em Curso, selecionar "CICLO II"
    Na consulta de turma, em Período, selecionar "MANHÃ"
    Na consulta de turma, em Ciclo, selecionar "5° ANO"
    Clicar em Pesquisar
    Verificar se aparece o texto "Resultado da Busca"

Cenário 06C: Funcionalidade Consulta de Turma - EJA
    [Documentation]    Esse teste verifica se é possível efetuar a
    ...                consulta de uma turma da Etapa EJA
    [Tags]             Consulta de Turma EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    Na consulta de turma, em Curso, selecionar "CICLO I"
    Na consulta de turma, em Período, selecionar "NOITE"
    Na consulta de turma, em Ciclo, selecionar "SEMESTRE 3"
    Clicar em Pesquisar
    Verificar se aparece o texto "Resultado da Busca"

Cenário 06D: Funcionalidade Consulta de Turma Multisseriada
    [Documentation]    Esse teste verifica se é possível efetuar a
    ...                consulta de uma turma multisseriada
    [Tags]             Consulta de Turma Multisseriada | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO ESPECIAL EXCLUSIVA"
    Na consulta de turma, em Curso, selecionar "CICLO I"
    Na consulta de turma, em Período, selecionar "INTERMEDIÁRIO"
    Na consulta de turma, em Ciclo, selecionar "1º ANO - EE"
    Clicar em Pesquisar
    Verificar se aparece o texto "Resultado da Busca"

Cenário 07A: Funcionalidade Avaliações e Frequência - Infantil
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar nota para a Etapa Infantil
    [Tags]             Avaliações e Frequência Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Avaliações e Frequência"
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Na consulta de avaliações, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
    Na consulta de avaliações, em Turma, selecionar "EII A"
    Clicar em Pesquisar
    No primeiro aluno, em questionário, clicar em "Responder"
    Marcar "ATINGIU OS OBJETIVOS" nas questões
    Clicar em Salvar e Fechar
    No modal de alerta, clicar em Ok
    Clicar em Salvar
    No modal de Cadastro Efetuado com Sucesso, clicar em Ok
    No primeiro aluno, em questionário, clicar em "Responder"
    Verificar se as questões foram marcadas conforme foram salvas

Cenário 07B: Funcionalidade Avaliações e Frequência - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar nota para a Etapa Fundamental
    [Tags]             Avaliações e Frequência Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Avaliações e Frequência"
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na consulta de avaliações, em Professor, selecionar "PRISCILA DOMINGUES FERNANDES LOPES"
    Na consulta de avaliações, em Turma, selecionar "3B"
    Clicar em Pesquisar
    No primeiro aluno, em questionário, clicar em "Responder"
    Marcar "ATINGIU OS OBJETIVOS" nas questões
    Em Relatório, digitar um texto para envio
    Clicar em Enviar para Validação
    Clicar em Salvar e Fechar
    No modal de alerta, clicar em Ok
    Verificar se aparece o status "RELATÓRIO AGUARDANDO VALIDAÇÃO"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Validação de Relatório de Desenvolvimento de Educandos"
    Em Validação de Relatório, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Validação de Relatório, em Turma, selecionar "3B"
    Em Validação de Relatório, clicar em Pesquisar
    Verificar se a Situação de Validação está como "AGUARDANDO VALIDAÇÃO"
    Clicar em VISUALIZAR EDUCANDOS
    Verificar se a Situação de Validação está como "AGUARDANDO VALIDAÇÃO"
    Clicar em VISUALIZAR RELATORIO
    Verificar se o texto inserido aparece nesta tela
    Clicar em Encaminhar para Ajustes
    Digitar uma justificativa
    Clicar em Salvar
    Verificar se este texto aparece no histórico
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Avaliações e Frequência"
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na consulta de avaliações, em Professor, selecionar "PRISCILA DOMINGUES FERNANDES LOPES"
    Na consulta de avaliações, em Turma, selecionar "3B"
    Clicar em Pesquisar
    Verificar se aparece o status "RELATÓRIO AGUARDANDO AJUSTES"    
    No primeiro aluno, em questionário, clicar em "Responder"
    Verificar se as questões foram marcadas conforme foram salvas
    Verificar se a Justificativa de Devolução é exibida
    Clicar em Realizar Ajustes
    Inserir um novo texto no relatório
    Clicar em Salvar Ajustes
    Clicar em Salvar e Fechar
    No modal de alerta, clicar em Ok
    Verificar se aparece o status "RELATÓRIO VALIDADO APÓS AJUSTES"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Validação de Relatório de Desenvolvimento de Educandos"
    Em Validação de Relatório, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Validação de Relatório, em Turma, selecionar "3B"
    Em Validação de Relatório, clicar em Pesquisar
    Verificar se a Situação de Validação está como "VALIDADO COM AJUSTES"
    Clicar em VISUALIZAR EDUCANDOS
    Verificar se a Situação de Validação está como "VALIDADO APÓS AJUSTES"
    Clicar em VISUALIZAR RELATORIO
    Verificar se o texto alterado aparece nesta tela

## ESTÁ FORA DOS PARAMETROS DA UNIDADE LETIVA > NECESSÁRIO CONFIGURAR
# Cenário 07C: Funcionalidade Avaliações e Frequência - EJA
#     [Documentation]    Esse teste verifica se é possível consultar e
#     ...                registrar nota para a Etapa Fundamental
#     [Tags]             Avaliações e Frequência EJA | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Avaliações e Frequência"
#     Na consulta de avaliações, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE"
#     Na consulta de avaliações, em Professor, selecionar "PRISCILA DOMINGUES FERNANDES LOPES"
#     Na consulta de avaliações, em Turma, selecionar "3B"
#     Clicar em Pesquisar
#     No primeiro aluno, em questionário, clicar em "Responder"
#     Marcar "ATINGIU OS OBJETIVOS" nas questões
#     Em Relatório, digitar um texto para envio
#     Clicar em Enviar para Validação
#     Clicar em Salvar e Fechar
#     No modal de alerta, clicar em Ok
#     Verificar se aparece o status "RELATÓRIO AGUARDANDO VALIDAÇÃO"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Validação de Relatório de Desenvolvimento de Educandos"
#     Em Validação de Relatório, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
#     Em Validação de Relatório, em Turma, selecionar "3B"
#     Em Validação de Relatório, clicar em Pesquisar
#     Verificar se a Situação de Validação está como "AGUARDANDO VALIDAÇÃO"
#     Clicar em VISUALIZAR EDUCANDOS
#     Verificar se a Situação de Validação está como "AGUARDANDO VALIDAÇÃO"
#     Clicar em VISUALIZAR RELATORIO
#     Verificar se o texto inserido aparece nesta tela
#     Clicar em Encaminhar para Ajustes
#     Digitar uma justificativa
#     Clicar em Salvar
#     Verificar se este texto aparece no histórico
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Avaliações e Frequência"
#     Na consulta de avaliações, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
#     Na consulta de avaliações, em Professor, selecionar "PRISCILA DOMINGUES FERNANDES LOPES"
#     Na consulta de avaliações, em Turma, selecionar "3B"
#     Clicar em Pesquisar
#     Verificar se aparece o status "RELATÓRIO AGUARDANDO AJUSTES"    
#     No primeiro aluno, em questionário, clicar em "Responder"
#     Verificar se as questões foram marcadas conforme foram salvas
#     Verificar se a Justificativa de Devolução é exibida
#     Clicar em Realizar Ajustes
#     Inserir um novo texto no relatório
#     Clicar em Salvar Ajustes
#     Clicar em Salvar e Fechar
#     No modal de alerta, clicar em Ok
#     Verificar se aparece o status "RELATÓRIO VALIDADO APÓS AJUSTES"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Validação de Relatório de Desenvolvimento de Educandos"
#     Em Validação de Relatório, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
#     Em Validação de Relatório, em Turma, selecionar "3B"
#     Em Validação de Relatório, clicar em Pesquisar
#     Verificar se a Situação de Validação está como "VALIDADO COM AJUSTES"
#     Clicar em VISUALIZAR EDUCANDOS
#     Verificar se a Situação de Validação está como "VALIDADO APÓS AJUSTES"
#     Clicar em VISUALIZAR RELATORIO
#     Verificar se o texto alterado aparece nesta tela

Cenário 08A: Funcionalidade Controle Diário de Frequência - Infantil
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar frequencia para a Etapa Infantil
    [Tags]             Controle de Frequencia | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Controle Diário de Frequência"
    No controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    No controle de frequência, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
    No controle de frequência, em Turma, selecionar "EII A"
    Clicar em Pesquisar
    Verificar se o botão Iniciar está visível
    Iniciar as aulas nos 4 últimos dias da semana
    Registrar faltas para os 4 primeiros alunos
    Clicar em Pesquisar
    Verificar se o primeiro aluno possui 4 faltas e frequencia 0
    Verificar se o segundo aluno possui 3 faltas e frequencia 25
    Verificar se o terceiro aluno possui 2 faltas e frequencia 50
    Verificar se o quarto aluno possui 1 falta e frequencia 75
    Verificar se o quinto aluno possui 0 faltas e frequencia 100
    Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
    No primeiro aluno, clicar em Diário de Bordo do Aluno
    Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
    Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
    Salvar o registro de Diário do Educando
    Em Diário do Educando, verificar se o card foi adicionado ao histórico
    Clicar em Voltar
    No dia atual, clicar em inserir um Campo de Experiencia
    Em Campo de Experiencia, selecionar a primeira opção
    Em Saberes, selecionar a primeira opção
    Em Aprendizagem, selecionar a primeira opção
    Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    Clicar em Inserir
    Verificar se a descrição foi salva no histórico e Salvar
    Desmarcar as faltas registradas
    Cancelar as aulas iniciadas
    Verificar se os campos de faltas foram bloqueados
    Clicar em Avaliações
    Verificar se aparece o texto "Avaliações e Frequências"

Cenário 08B: Funcionalidade Controle Diário de Frequência - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar frequencia para a Etapa Fundamental
    [Tags]             Controle de Frequencia | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Controle Diário de Frequência"
    No controle de frequência, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    No controle de frequência, em Professor, selecionar "DANIELA MACHADO OLIVEIRA"
    No controle de frequência, em Turma, selecionar "1A"
    Clicar em Pesquisar
    Verificar se o botão Iniciar está visível
    Iniciar as aulas nos 4 últimos dias da semana
    Registrar faltas para os 4 primeiros alunos
    Clicar em Pesquisar
    Verificar se o primeiro aluno possui 4 faltas e frequencia 0
    Verificar se o segundo aluno possui 3 faltas e frequencia 25
    Verificar se o terceiro aluno possui 2 faltas e frequencia 50
    Verificar se o quarto aluno possui 1 falta e frequencia 75
    Verificar se o quinto aluno possui 0 faltas e frequencia 100
    Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
    No primeiro aluno, clicar em Diário de Bordo do Aluno
    Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
    Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
    Salvar o registro de Diário do Educando
    Em Diário do Educando, verificar se o card foi adicionado ao histórico
    Clicar em Voltar
    No dia atual, clicar em inserir um Campo de Experiencia
    Em Campo de Experiencia, selecionar a primeira opção
    Em Saberes, selecionar a primeira opção
    Em Aprendizagem, selecionar a primeira opção
    Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    Clicar em Inserir
    Verificar se a descrição foi salva no histórico e Salvar
    Desmarcar as faltas registradas
    Cancelar as aulas iniciadas
    Verificar se os campos de faltas foram bloqueados
    Clicar em Avaliações
    Verificar se aparece o texto "Avaliações e Frequências"

## ESTÁ FORA DOS PARAMETROS DA UNIDADE LETIVA > NECESSÁRIO CONFIGURAR
# Cenário 08C: Funcionalidade Controle Diário de Frequência - EJA
#     [Documentation]    Esse teste verifica se é possível consultar e
#     ...                registrar frequencia para a Etapa EJA
#     [Tags]             Controle de Frequencia | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Controle Diário de Frequência"
#     No controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
#     No controle de frequência, em Professor, selecionar "DANIELA MACHADO OLIVEIRA"
#     No controle de frequência, em Turma, selecionar "1A"
#     Clicar em Pesquisar
#     Verificar se o botão Iniciar está visível
#     Iniciar as aulas nos 4 últimos dias da semana
#     Registrar faltas para os 4 primeiros alunos
#     Clicar em Pesquisar
#     Verificar se o primeiro aluno possui 4 faltas e frequencia 0
#     Verificar se o segundo aluno possui 3 faltas e frequencia 25
#     Verificar se o terceiro aluno possui 2 faltas e frequencia 50
#     Verificar se o quarto aluno possui 1 falta e frequencia 75
#     Verificar se o quinto aluno possui 0 faltas e frequencia 100
#     Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
#     No primeiro aluno, clicar em Diário de Bordo do Aluno
#     Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
#     Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
#     Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
#     Salvar o registro de Diário do Educando
#     Em Diário do Educando, verificar se o card foi adicionado ao histórico
#     Clicar em Voltar
#     No dia atual, clicar em inserir um Campo de Experiencia
#     Em Campo de Experiencia, selecionar a primeira opção
#     Em Saberes, selecionar a primeira opção
#     Em Aprendizagem, selecionar a primeira opção
#     Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
#     Clicar em Inserir
#     Verificar se a descrição foi salva no histórico e Salvar
#     Desmarcar as faltas registradas
#     Cancelar as aulas iniciadas
#     Verificar se os campos de faltas foram bloqueados
#     Clicar em Avaliações
#     Verificar se aparece o texto "Avaliações e Frequências"

Cenário 09A: Funcionalidade Ata de Conselho - Infantil
    [Documentation]    Esse teste verifica se é possível consultar a
    ...                Ata de Conselho Final e todas as suas ações
    ...                para a Etapa Infantil                 
    [Tags]             Ata De Conselho Final - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Ata de Conselho Final - Turma"
    Na tela de Ata de Conselho, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Na tela de Ata de Conselho, em Turma, selecionar "EII A"
    Clicar em Pesquisar
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Fechamento do Período Letivo no primeiro aluno
    Verificar se a página foi redirecionada para Fechamento de Período Letivo
    Clicar em Voltar
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Prontuário do Aluno no primeiro aluno
    Verificar se a página foi redirecionada para Prontuário do Educando
    Retornar a página anterior
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro das Observações, inserir uma observação
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Clicar em Fechar
    Na tela de Ata de Conselho, clicar em Finalizar Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Reabrir Conselho é exibido
    Na tela de Ata de Conselho, clicar no botão Reabrir Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Finalizar Conselho é exibido

Cenário 09B: Funcionalidade Ata de Conselho - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar a
    ...                Ata de Conselho Final e todas as suas ações
    ...                para a Etapa Fundamental                 
    [Tags]             Ata De Conselho Final - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Ata de Conselho Final - Turma"
    Na tela de Ata de Conselho, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Na tela de Ata de Conselho, em Turma, selecionar "EII A"
    Clicar em Pesquisar
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Fechamento do Período Letivo no primeiro aluno
    Verificar se a página foi redirecionada para Fechamento de Período Letivo
    Clicar em Voltar
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Prontuário do Aluno no primeiro aluno
    Verificar se a página foi redirecionada para Prontuário do Educando
    Retornar a página anterior
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro das Observações, inserir uma observação
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Clicar em Fechar
    Na tela de Ata de Conselho, clicar em Finalizar Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Reabrir Conselho é exibido
    Na tela de Ata de Conselho, clicar no botão Reabrir Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Finalizar Conselho é exibido

Cenário 09C: Funcionalidade Ata de Conselho - EJA
    [Documentation]    Esse teste verifica se é possível consultar a
    ...                Ata de Conselho Final e todas as suas ações
    ...                para a Etapa EJA                 
    [Tags]             Ata De Conselho Final - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Ata de Conselho Final - Turma"
    Na tela de Ata de Conselho, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Na tela de Ata de Conselho, em Turma, selecionar "EII A"
    Clicar em Pesquisar
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Fechamento do Período Letivo no primeiro aluno
    Verificar se a página foi redirecionada para Fechamento de Período Letivo
    Clicar em Voltar
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Prontuário do Aluno no primeiro aluno
    Verificar se a página foi redirecionada para Prontuário do Educando
    Retornar a página anterior
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro das Observações, inserir uma observação
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Clicar em Fechar
    Na tela de Ata de Conselho, clicar em Finalizar Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Reabrir Conselho é exibido
    Na tela de Ata de Conselho, clicar no botão Reabrir Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Finalizar Conselho é exibido

Cenário 10A: Funcionalidade Histórico Escolar - Infantil
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Histórico Escolar para a Etapa Infantil                 
    [Tags]             Histórico Escolar - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Histórico Escolar"


Cenário 10B: Funcionalidade Histórico Escolar - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Histórico Escolar para a Etapa Fundamental                 
    [Tags]             Histórico Escolar - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Histórico Escolar"

Cenário 10C: Funcionalidade Histórico Escolar - EJA
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Histórico Escolar para a Etapa EJA                 
    [Tags]             Histórico Escolar - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Histórico Escolar"
    
Cenário 11A: Funcionalidade Boletim Escolar - Infantil
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Boletim Escolar e todas as suas ações
    ...                para a Etapa Infantil                 
    [Tags]             Boletim Escolar - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Gestão"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Boletim Geral de Educando (conceito)"
    No filtro Ano Letivo, selecionar "2022"
    No filtro Turma, selecionar "1A"
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando"
    Clicar em Imprimir
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando M02"
    Clicar em Imprimir


Cenário 11B: Funcionalidade Boletim Escolar - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Boletim Escolar e todas as suas ações
    ...                para a Etapa Fundamental                 
    [Tags]             Boletim Escolar - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Gestão"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Boletim Geral de Educando (conceito)"
    No filtro Ano Letivo, selecionar "2022"
    No filtro Turma, selecionar "1A"
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando"
    Clicar em Imprimir
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando M02"
    Clicar em Imprimir

Cenário 11C: Funcionalidade Boletim Escolar - EJA
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Boletim Escolar e todas as suas ações
    ...                para a Etapa EJA                 
    [Tags]             Boletim Escolar - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Gestão"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Boletim Geral de Educando (conceito)"
    No filtro Ano Letivo, selecionar "2022"
    No filtro Turma, selecionar "1A"
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando"
    Clicar em Imprimir
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando M02"
    Clicar em Imprimir

Cenário 12A: Funcionalidade Prontuário da Turma - Infantil
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Prontuário da Turma e todas as suas ações
    ...                para a Etapa Infantil                 
    [Tags]             Prontuário da Turma - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário da Turma"
    Em Ano Letivo, clicar em "2022"
    Em Turma, selecionar "1A"
    Em Mês de Reunião, selecionar "Janeiro"

Cenário 12B: Funcionalidade Prontuário da Turma - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Prontuário da Turma e todas as suas ações
    ...                para a Etapa Fundamental                 
    [Tags]             Boletim Escolar - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário da Turma"
    Em Ano Letivo, clicar em "2022"
    Em Turma, selecionar "1A"
    Em Mês de Reunião, selecionar "Janeiro"

Cenário 12C: Funcionalidade Prontuário da Turma - EJA
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Prontuário da Turma e todas as suas ações
    ...                para a Etapa EJA                 
    [Tags]             Boletim Escolar - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário da Turma"
    Em Ano Letivo, clicar em "2022"
    Em Turma, selecionar "1A"
    Em Mês de Reunião, selecionar "Janeiro"

Cenário 13A: Funcionalidade Prontuário do Aluno - Infantil
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Prontuário do Aluno e todas as suas ações
    ...                para a Etapa Infantil                 
    [Tags]             Prontuário do Aluno - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário do Educando"
    Em Etapa/Modalidade no Prontuário, selecionar "ENSINO FUNDAMENTAL"    
    Em campo turma no Prontuário, selecionar "1B"    


Cenário 13B: Funcionalidade Prontuário do Aluno - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Prontuário do Aluno e todas as suas ações
    ...                para a Etapa Fundamental                 
    [Tags]             Prontuário do Aluno - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário do Educando"
    Em Etapa/Modalidade no Prontuário, selecionar "ENSINO FUNDAMENTAL"    
    Em campo turma no Prontuário, selecionar "1B"  

Cenário 13C: Funcionalidade Prontuário do Aluno - EJA
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Prontuário do Aluno e todas as suas ações
    ...                para a Etapa EJA                 
    [Tags]             Prontuário do Aluno - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário do Educando"
    Em Etapa/Modalidade no Prontuário, selecionar "ENSINO FUNDAMENTAL"    
    Em campo turma no Prontuário, selecionar "1B"  
    
Cenário 14A: Funcionalidade Matricula - Infantil
    [Documentation]    Esse teste verifica se é possível efetuar a
    ...                matrícula para um aluno da Etapa Infantil                 
    [Tags]             Matricula - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Justificativas da Pré-matrícula"
    Clicar em Cadastrar justificativas
    ----------        
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Layout do Portal de Inscrições e Transferências"
    Clicar em Cadastrar Layout
    Em Descrição do Processo, inserir "Descrição Teste Automação"
    Clicar em Salvar e Próximo no passo 1
    Em Ano Letivo, selecionar o Ano Letivo Seguinte
    Em Banner Web clicar em Inserir 
    Visualizar a mensagem: SELECIONE O ARQUIVO ANTES DE INCLUI-LO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em inserir Documento Web, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal Web, inserir "00000000"        
    Em Banner Web clicar em Inserir     
    Em Aplicar no Portal Web, inserir a data do dia atual        
    Em Banner Web clicar em Inserir 
    Em inserir Documento móvel, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal móvel, inserir "00000000"        
    Em Banner móvel clicar em Inserir     
    Em Aplicar no Portal móvel, inserir a data do dia atual        
    Em Banner Web clicar em Inserir 
    Clicar em Salvar e Próximo no passo 1
    Clicar em Salvar e Próximo no passo 2
    Clicar em Salvar e Próximo no passo 3
    Clicar em Salvar e Próximo no passo 4
    Clicar em inserir no passo 5
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/"
    Clicar em 'Consultar Solicitação'
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em Data de Nascimento, informar "10/01/1965"
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em CPF, inserir "364.882.650-67"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em Ok no alerta do Portal
    FAZER GESTÃO DE PRÉ MATRICULA

Cenário 14B: Funcionalidade Matricula - Fundamental
    [Documentation]    Esse teste verifica se é possível efetuar a
    ...                matrícula para um aluno da Etapa Fundamental                 
    [Tags]             Matricula - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Justificativas da Pré-matrícula"
    Clicar em Cadastrar justificativas
    ----------        
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Layout do Portal de Inscrições e Transferências"
    Clicar em Cadastrar Layout
    Em Descrição do Processo, inserir "Descrição Teste Automação"
    Clicar em Salvar e Próximo no passo 1
    Em Ano Letivo, selecionar o Ano Letivo Seguinte
    Em Banner Web clicar em Inserir 
    Visualizar a mensagem: SELECIONE O ARQUIVO ANTES DE INCLUI-LO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em inserir Documento Web, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal Web, inserir "00000000"        
    Em Banner Web clicar em Inserir     
    Em Aplicar no Portal Web, inserir a data do dia atual        
    Em Banner Web clicar em Inserir 
    Em inserir Documento móvel, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal móvel, inserir "00000000"        
    Em Banner móvel clicar em Inserir     
    Em Aplicar no Portal móvel, inserir a data do dia atual        
    Em Banner Web clicar em Inserir 
    Clicar em Salvar e Próximo no passo 1
    Clicar em Salvar e Próximo no passo 2
    Clicar em Salvar e Próximo no passo 3
    Clicar em Salvar e Próximo no passo 4
    Clicar em inserir no passo 5
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/"
    Clicar em 'Consultar Solicitação'
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em Data de Nascimento, informar "10/01/1965"
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em CPF, inserir "364.882.650-67"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em Ok no alerta do Portal
    FAZER GESTÃO DE PRÉ MATRICULA

Cenário 14C: Funcionalidade Matricula - EJA
    [Documentation]    Esse teste verifica se é possível efetuar a
    ...                matrícula para um aluno da Etapa EJA                 
    [Tags]             Matricula - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Justificativas da Pré-matrícula"
    Clicar em Cadastrar justificativas
    ----------        
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Layout do Portal de Inscrições e Transferências"
    Clicar em Cadastrar Layout
    Em Descrição do Processo, inserir "Descrição Teste Automação"
    Clicar em Salvar e Próximo no passo 1
    Em Ano Letivo, selecionar o Ano Letivo Seguinte
    Em Banner Web clicar em Inserir 
    Visualizar a mensagem: SELECIONE O ARQUIVO ANTES DE INCLUI-LO.
    Clicar em Ok no modal de alerta de campo obrigatório
    Em inserir Documento Web, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal Web, inserir "00000000"        
    Em Banner Web clicar em Inserir     
    Em Aplicar no Portal Web, inserir a data do dia atual        
    Em Banner Web clicar em Inserir 
    Em inserir Documento móvel, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal móvel, inserir "00000000"        
    Em Banner móvel clicar em Inserir     
    Em Aplicar no Portal móvel, inserir a data do dia atual        
    Em Banner Web clicar em Inserir 
    Clicar em Salvar e Próximo no passo 1
    Clicar em Salvar e Próximo no passo 2
    Clicar em Salvar e Próximo no passo 3
    Clicar em Salvar e Próximo no passo 4
    Clicar em inserir no passo 5
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/"
    Clicar em 'Consultar Solicitação'
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em Data de Nascimento, informar "10/01/1965"
    Em Nacionalidade, selecionar "Brasileiro"
    Em Protocolo, informar "123456789"
    Em CPF, inserir "364.882.650-67"
    Em Data de Nascimento, informar "10/01/1965"
    Clicar em Ok no alerta do Portal
    FAZER GESTÃO DE PRÉ MATRICULA

Cenário 15A: Funcionalidade Transportes - Infantil
    [Documentation]    Esse teste verifica se é possível solicitar
    ...                transporte para um aluno da Etapa Infantil                 
    [Tags]             Transportes - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"    
    Clicar em Cadastrar Condutores 
    -------------
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Rotas"
    Clicar no botão Cadastrar
    Em Tipo de Rota, selecionar "Centro"    
    Em Nome de Escola, inserir "Volpi"
    ---------
    Entrar no módulo "Transportes"
    Entrar na funcionalidade de transporte "Viagens"    
    Clicar no botão Cadastrar
    -----------------
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Gestão de Solicitação de Transporte" 
    -------------------
    Acessar o ambiente "http://guarulhos.suporte.gier.intranet.local/"
    Entrar com as credenciais "gier@gieronline.com.br" e "123456789"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Solicitação de Transporte" 
    -----------------

Cenário 15B: Funcionalidade Transportes - Fundamental
    [Documentation]    Esse teste verifica se é possível solicitar
    ...                transporte para um aluno da Etapa Fundamental                 
    [Tags]             Transportes - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"    
    Clicar em Cadastrar Condutores 
    -------------
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Rotas"
    Clicar no botão Cadastrar
    Em Tipo de Rota, selecionar "Centro"    
    Em Nome de Escola, inserir "Volpi"
    ---------
    Entrar no módulo "Transportes"
    Entrar na funcionalidade de transporte "Viagens"    
    Clicar no botão Cadastrar
    -----------------
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Gestão de Solicitação de Transporte" 
    -------------------
    Acessar o ambiente "http://guarulhos.suporte.gier.intranet.local/"
    Entrar com as credenciais "gier@gieronline.com.br" e "123456789"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Solicitação de Transporte" 
    -----------------

Cenário 15C: Funcionalidade Transportes - EJA
    [Documentation]    Esse teste verifica se é possível solicitar
    ...                transporte para um aluno da Etapa EJA                 
    [Tags]             Transportes - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"    
    Clicar em Cadastrar Condutores 
    -------------
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Rotas"
    Clicar no botão Cadastrar
    Em Tipo de Rota, selecionar "Centro"    
    Em Nome de Escola, inserir "Volpi"
    ---------
    Entrar no módulo "Transportes"
    Entrar na funcionalidade de transporte "Viagens"    
    Clicar no botão Cadastrar
    -----------------
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Gestão de Solicitação de Transporte" 
    -------------------
    Acessar o ambiente "http://guarulhos.suporte.gier.intranet.local/"
    Entrar com as credenciais "gier@gieronline.com.br" e "123456789"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Solicitação de Transporte" 
    -----------------

Cenário 16A: Funcionalidade Avaliações Educacionais - Infantil
    [Documentation]    Esse teste verifica se é possível agendar e 
    ...                efetuar prova online para um aluno da Etapa Infantil                 
    [Tags]             Avaliações Educacionais - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Aprendizagem"
    Visualizar o Titulo Consulta de Descrição de Aprendizagem    
    Clicar no botão Cadastrar  
    -----------
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Grupos de Pergunta"
    Visualizar o Titulo Consultar Grupos de Pergunta   
    Clicar no botão Cadastrar  
    ----------
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Banco de Questões" 
    Clicar no botão Cadastrar  
    ----------

Cenário 16B: Funcionalidade Avaliações Educacionais - Fundamental
    [Documentation]    Esse teste verifica se é possível agendar e 
    ...                efetuar prova online para um aluno da Etapa Infantil                 
    [Tags]             Avaliações Educacionais - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Aprendizagem"
    Visualizar o Titulo Consulta de Descrição de Aprendizagem    
    Clicar no botão Cadastrar  
    -----------
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Grupos de Pergunta"
    Visualizar o Titulo Consultar Grupos de Pergunta   
    Clicar no botão Cadastrar  
    ----------
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Banco de Questões" 
    Clicar no botão Cadastrar  
    ----------

Cenário 16C: Funcionalidade Avaliações Educacionais - EJA
    [Documentation]    Esse teste verifica se é possível agendar e 
    ...                efetuar prova online para um aluno da Etapa Infantil                 
    [Tags]             Avaliações Educacionais - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Aprendizagem"
    Visualizar o Titulo Consulta de Descrição de Aprendizagem    
    Clicar no botão Cadastrar  
    -----------
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Grupos de Pergunta"
    Visualizar o Titulo Consultar Grupos de Pergunta   
    Clicar no botão Cadastrar  
    ----------
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Banco de Questões" 
    Clicar no botão Cadastrar  
    ----------

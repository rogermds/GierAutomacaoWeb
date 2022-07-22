*** Settings ***
# Documentation    Essa suite efetua login e busca um educando no Gier
Resource         ../1-Hooks/1-Principal.robot
Resource         ../2-PageElements/FluxosPrincipais/CT01-Login.robot
Resource         ../2-PageElements/FluxosPrincipais/CT02-SelecaodeEstrutura.robot
Resource         ../2-PageElements/FluxosPrincipais/CT03-CadastroPessoa.robot
Resource         ../2-PageElements/FluxosPrincipais/CT04-ConsultaPessoa.robot
Resource         ../2-PageElements/FluxosPrincipais/CT05A-Calendario.robot
Resource         ../2-PageElements/FluxosPrincipais/CT05B-CadastroDeTurma.robot
Resource         ../2-PageElements/FluxosPrincipais/CT06-ConsultaDeTurma.robot
Resource         ../2-PageElements/FluxosPrincipais/CT07-AvaliacoesFrequencia.robot
Resource         ../2-PageElements/FluxosPrincipais/CT08-ControleDiarioFrequencia.robot
Resource         ../2-PageElements/FluxosPrincipais/CT09-HistoricoEscolar.robot
Resource         ../2-PageElements/FluxosPrincipais/CT10-AtaDeConselho.robot

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

# Cenário 04-A: Funcionalidade Consulta de Pessoa – Secretaria
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
#     Em consulta, no campo Nome, inserir o nome "AGATHA GABRIELLY DOS SANTOS SOUZA"
#     Em consulta, no campo D. Nascimento, inserir a data "15/06/2013"
#     Clicar no botão "Pesquisar"
#     Verificar se no grid é exibido o CPF "57266385814"
#     Verificar se no grid é exibido o RG "60483237"
#     Verificar se no grid é exibido a Data de Nascimento "15/06/2013"
#     Clicar no botão "Ações"
#     Clicar no botão "Visualizar"
#     Verificar se aparece o texto "Visualizar Pessoa"
#     Verificar se é exibido o nome "AGATHA GABRIELLY DOS SANTOS SOUZA"
#     Verificar se é exibido a data de nascimento "15/06/2013"
    
#### PRECISARÁ CADASTRAR ATIVIDADE NÃO LETIVA NA SECRETARIA
#### DEPOIS FINALIZAR CALENDARIO NA ESCOLA
# Cenário 05-A: Funcionalidade Calendário – Educação Especial
#     [Documentation]    Esse teste verifica se é possível vincular modalidades
#     ...                ao calendário escolar
#     [Tags]             Cadastro de Etapa/Modalide no Calendário | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Calendário Escolar"
#     No Calendário, em Etapa/Modalidade, selecionar "EDUCAÇÃO ESPECIAL EXCLUSIVA"
#     Em Calendário, selecionar CALENDÁRIO ESCOLAR SME 2022
#     Clicar em Pesquisar
#     Clicar em Editar
#     Clicar em Salvar
#     Clicar em OK no modal Sucesso
####  AQUI DEVE ENTRAR NA SECRETARIA E INSERIR ATIVIDADE NAO LETIVA
#     Em Calendário, selecionar novamente CALENDÁRIO ESCOLAR SME 2022
#     Clicar em Pesquisar
#     Clicar em Finalizar
    # Clicar em OK no modal

# Cenário 05-B: Funcionalidade Cadastro de Turma – Infantil
#     [Documentation]    Esse teste verifica se é possível efetuar o
#     ...                cadastro de uma turma da Etapa Infantil
#     [Tags]             Cadastro de Turma | Fluxo Positivo
    # Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    # Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Turmas"
#     Clicar em Nova Turma Regular
#     Na Turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
#     Em Curso, selecionar "PRÉ-ESCOLA"
#     Em Ciclo, selecionar "ESTÁGIO II"
#     Em Período, selecionar "MISTO"
#     Em Turma, selecionar "W"
#     Em Grade de Aula, selecionar "GRADE DE HORARIO - MISTO"
#     Em Programa Curricular, selecionar "ESTÁGIO II"
#     Selecionar uma Sala Física
#     Em Capacidade da Turma, inserir a quantidade "20"
#     Na Turma, clicar em Salvar
#     No modal para cadastrar outra turma, clique em Não

# Cenário 05-C: Funcionalidade Cadastro de Turma – Fundamental
#     [Documentation]    Esse teste verifica se é possível efetuar o
#     ...                cadastro de uma turma da Etapa Fundamental
#     [Tags]             Cadastro de Turma | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Turmas"
#     Clicar em Nova Turma Regular
#     Na Turma, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
#     Em Curso, selecionar "CICLO II"
#     Em Ciclo, selecionar "5° ANO"
#     Em Período, selecionar "TARDE"
#     Em Turma, selecionar "X"
#     Em Grade de Aula, selecionar "GRADE DE HORARIO - TARDE"
#     Em Programa Curricular, selecionar "5º ANO"
#     Selecionar uma Sala Física
#     Em Capacidade da Turma, inserir a quantidade "20"
#     Na Turma, clicar em Salvar
#     No modal para cadastrar outra turma, clique em Não

# Cenário 05-D: Funcionalidade Cadastro de Turma – EJA
#     [Documentation]    Esse teste verifica se é possível efetuar o
#     ...                cadastro de uma turma da Etapa EJA
#     [Tags]             Cadastro de Turma | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Turmas"
#     Clicar em Nova Turma Regular
#     No cadastro de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
#     Em Curso, selecionar "CICLO I"
#     Em Ciclo, selecionar "SEMESTRE 3"
#     Em Período, selecionar "NOITE"
#     Em Turma, selecionar "W"
#     Em Grade de Aula, selecionar "GRADE DE HORARIO - NOITE"
#     Em Programa Curricular, selecionar "EJA"
#     Selecionar uma Sala Física
#     Em Capacidade da Turma, inserir a quantidade "20"
#     Na Turma, clicar em Salvar
#     No modal para cadastrar outra turma, clique em Não

# Cenário 05-E: Funcionalidade Cadastro de Turma Multisseriada
#     [Documentation]    Esse teste verifica se é possível efetuar o
#     ...                cadastro de uma turma multisseriada
#     [Tags]             Cadastro de Turma Multisseriada | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Turmas"
#     Clicar em Nova Turma Multisseriada
#     Em Anual/Semanal, selecionar "ANUAL"
#     Em Período, selecionar "INTERMEDIÁRIO"
#     No grid de Etapa, selecionar "1° ANO - EE"
#     No grid de Etapa, selecionar "2° ANO - EE"
#     Em Turma, selecionar "R"
#     Selecionar uma Sala Física
#     Em Capacidade da Turma, inserir a quantidade "20"
#     Na Turma, clicar em Salvar
#     No modal para cadastrar outra turma, clique em Não

# Cenário 06A: Funcionalidade Consulta de Turma - Infantil
#     [Documentation]    Esse teste verifica se é possível efetuar a
#     ...                consulta de uma turma da Etapa Infantil
#     [Tags]             Consulta de Turma Infantil | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Turmas"
#     Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
#     Na consulta de turma, em Curso, selecionar "PRÉ-ESCOLA"
#     Na consulta de turma, em Período, selecionar "MANHÃ"
#     Na consulta de turma, em Ciclo, selecionar "ESTÁGIO II"
#     Clicar em Pesquisar
#     Verificar se aparece o texto "Resultado da Busca"

# Cenário 06B: Funcionalidade Consulta de Turma - Fundamental
#     [Documentation]    Esse teste verifica se é possível efetuar a
#     ...                consulta de uma turma da Etapa Fundamental
#     [Tags]             Consulta de Turma Fundamental | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Turmas"
#     Na consulta de turma, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
#     Na consulta de turma, em Curso, selecionar "CICLO II"
#     Na consulta de turma, em Período, selecionar "MANHÃ"
#     Na consulta de turma, em Ciclo, selecionar "5° ANO"
#     Clicar em Pesquisar
#     Verificar se aparece o texto "Resultado da Busca"

# Cenário 06C: Funcionalidade Consulta de Turma - EJA
#     [Documentation]    Esse teste verifica se é possível efetuar a
#     ...                consulta de uma turma da Etapa EJA
#     [Tags]             Consulta de Turma EJA | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Turmas"
#     Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
#     Na consulta de turma, em Curso, selecionar "CICLO I"
#     Na consulta de turma, em Período, selecionar "NOITE"
#     Na consulta de turma, em Ciclo, selecionar "SEMESTRE 3"
#     Clicar em Pesquisar
#     Verificar se aparece o texto "Resultado da Busca"

# Cenário 06D: Funcionalidade Consulta de Turma Multisseriada
#     [Documentation]    Esse teste verifica se é possível efetuar a
#     ...                consulta de uma turma multisseriada
#     [Tags]             Consulta de Turma Multisseriada | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Gestão Escolar"
#     Entrar na funcionalidade "Turmas"
#     Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO ESPECIAL EXCLUSIVA"
#     Na consulta de turma, em Curso, selecionar "CICLO I"
#     Na consulta de turma, em Período, selecionar "INTERMEDIÁRIO"
#     Na consulta de turma, em Ciclo, selecionar "1º ANO - EE"
#     Clicar em Pesquisar
#     Verificar se aparece o texto "Resultado da Busca"

# Cenário 07A: Funcionalidade Avaliações e Frequência - Infantil
#     [Documentation]    Esse teste verifica se é possível consultar e
#     ...                registrar nota para a Etapa Infantil
#     [Tags]             Avaliações e Frequência Infantil | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Avaliações e Frequência"
#     Na consulta de avaliações, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
#     Na consulta de avaliações, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
#     Na consulta de avaliações, em Turma, selecionar "EII A"
#     Clicar em Pesquisar
#     No primeiro aluno, em questionário, clicar em "Responder"
#     Marcar "ATINGIU OS OBJETIVOS" nas questões
#     Clicar em Salvar e Fechar
#     No modal de alerta, clicar em Ok
#     Clicar em Salvar
#     No modal de Cadastro Efetuado com Sucesso, clicar em Ok
#     No primeiro aluno, em questionário, clicar em "Responder"
#     Verificar se as questões foram marcadas conforme foram salvas

# Cenário 07B: Funcionalidade Avaliações e Frequência - Fundamental
#     [Documentation]    Esse teste verifica se é possível consultar e
#     ...                registrar nota para a Etapa Fundamental
#     [Tags]             Avaliações e Frequência Fundamental | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Avaliações e Frequência"
#     Na consulta de avaliações, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
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

### EJA PRECISA ESPERAR VIRAR O SEMESTRE PARA ALTERAR INFORMAÇÕES
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
#     Na consulta de avaliações, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
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

# Cenário 08A: Funcionalidade Controle Diário de Frequência - Infantil
#     [Documentation]    Esse teste verifica se é possível consultar e
#     ...                registrar nota para a Etapa Fundamental
#     [Tags]             Consulta de Turma | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Controle Diário de Frequência"
#     Na controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
#     Na controle de frequência, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
#     Na controle de frequência, em Turma, selecionar "EII A"
#     Na controle de frequência, em Data Referência, insira "01/07/2022"
#     Clicar em Pesquisar
#     Verificar se o botão Iniciar está desativado
#     Do dia 23 ao 30, clicar em Iniciar
#     Registrar faltas para os 3 primeiros alunos
#     Clicar em Pesquisar
#     Verificar se o primeiro aluno possui 5 faltas e frequencia 17
#     Verificar se o segundo aluno possui 3 faltas e frequencia 50
#     Verificar se o terceiro aluno possui 2 faltas e frequencia 67
#     Verificar se o quarto aluno possui 0 faltas e frequencia 100
#     Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
#     No primeiro aluno, clicar em Diário de Bordo do Aluno
#     Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
#     Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
#     Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
#     Clicar em Salvar
#     No modal de alerta, clicar em Ok
#     Em Diário do Educando, verificar se o card foi adicionado ao histórico
#     Clicar em Voltar
#     No dia 30, inserir um Campo de Experiencia
#     Em Campo de Experiencia, selecionar a primeira opção
#     Em Saberes, selecionar a primeira opção
#     Em Aprendizagem, selecionar a primeira opção
#     Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
#     Clicar em Inserir
#     No modal de alerta, clicar em Ok
#     Verificar se a descrição foi salva no histórico
#     Clicar em Salvar
#     No modal de alerta, clicar em Ok
#     No dia 23, cancelar a aula iniciada
#     Verificar se os campos foram bloqueados no dia 23
#     Clicar em Avaliações
#     Verificar se aparece o texto "Avaliações e Frequências"
    

# Cenário 08B: Funcionalidade Controle Diário de Frequência - Fundamental
#     [Documentation]    Esse teste verifica se é possível consultar e
#     ...                registrar nota para a Etapa Fundamental
#     [Tags]             Consulta de Turma | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "VOLPI" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Controle Diário de Frequência"
#     Na controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO FUNDAMENTAL"
#     Na controle de frequência, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
#     Na controle de frequência, em Turma, selecionar "EII A"
#     Na controle de frequência, em Data Referência, insira "01/07/2022"
#     Clicar em Pesquisar
#     Verificar se o botão Iniciar está desativado
#     Do dia 23 ao 30, clicar em Iniciar
#     Registrar faltas para os 3 primeiros alunos
#     Clicar em Pesquisar
#     Verificar se o primeiro aluno possui 5 faltas e frequencia 17
#     Verificar se o segundo aluno possui 3 faltas e frequencia 50
#     Verificar se o terceiro aluno possui 2 faltas e frequencia 67
#     Verificar se o quarto aluno possui 0 faltas e frequencia 100
#     Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
#     No primeiro aluno, clicar em Diário de Bordo do Aluno
#     Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
#     Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
#     Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
#     Clicar em Salvar
#     No modal de alerta, clicar em Ok
#     Em Diário do Educando, verificar se o card foi adicionado ao histórico
#     Clicar em Voltar
#     No dia 30, inserir um Campo de Experiencia
#     Em Campo de Experiencia, selecionar a primeira opção
#     Em Saberes, selecionar a primeira opção
#     Em Aprendizagem, selecionar a primeira opção
#     Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
#     Clicar em Inserir
#     No modal de alerta, clicar em Ok
#     Verificar se a descrição foi salva no histórico
#     Clicar em Salvar
#     No modal de alerta, clicar em Ok
#     No dia 23, cancelar a aula iniciada
#     Verificar se os campos foram bloqueados no dia 23
#     Clicar em Avaliações
#     Verificar se aparece o texto "Avaliações e Frequências"

    # Cenário 08C: Funcionalidade Controle Diário de Frequência - EJA
    # [Documentation]    Esse teste verifica se é possível consultar e
    # ...                registrar nota para a Etapa EJA
    # [Tags]             Consulta de Turma | Fluxo Positivo
    # Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    # Entrar com as credenciais "02867439817" e "12345678"
    # Verificar se aparece o texto "Estrutura"
    # Pesquisar "VOLPI" e selecionar o primeiro resultado
    # Verificar se aparece o texto "Operação"
    # Entrar no módulo "Pedagógico"
    # Entrar na funcionalidade "Controle Diário de Frequência"
    # Na controle de frequência, em Etapa/Modalidade, selecionar ""
    # Na controle de frequência, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
    # Na controle de frequência, em Turma, selecionar "EII A"
    # Na controle de frequência, em Data Referência, insira "01/07/2022"
    # Clicar em Pesquisar
    # Verificar se o botão Iniciar está desativado
    # Do dia 23 ao 30, clicar em Iniciar
    # Registrar faltas para os 3 primeiros alunos
    # Clicar em Pesquisar
    # Verificar se o primeiro aluno possui 5 faltas e frequencia 17
    # Verificar se o segundo aluno possui 3 faltas e frequencia 50
    # Verificar se o terceiro aluno possui 2 faltas e frequencia 67
    # Verificar se o quarto aluno possui 0 faltas e frequencia 100
    # Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
    # No primeiro aluno, clicar em Diário de Bordo do Aluno
    # Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    # Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
    # Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # Em Diário do Educando, verificar se o card foi adicionado ao histórico
    # Clicar em Voltar
    # No dia 30, inserir um Campo de Experiencia
    # Em Campo de Experiencia, selecionar a primeira opção
    # Em Saberes, selecionar a primeira opção
    # Em Aprendizagem, selecionar a primeira opção
    # Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    # Clicar em Inserir
    # No modal de alerta, clicar em Ok
    # Verificar se a descrição foi salva no histórico
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # No dia 23, cancelar a aula iniciada
    # Verificar se os campos foram bloqueados no dia 23
    # Clicar em Avaliações
    # Verificar se aparece o texto "Avaliações e Frequências"

    # Cenário 09A: Funcionalidade Ata de Conselho - Infantil
    # [Documentation]    Esse teste verifica se é possível consultar e
    # ...                registrar nota para a Etapa Fundamental
    # [Tags]             Consulta de Turma | Fluxo Positivo
    # Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    # Entrar com as credenciais "02867439817" e "12345678"
    # Verificar se aparece o texto "Estrutura"
    # Pesquisar "VOLPI" e selecionar o primeiro resultado
    # Verificar se aparece o texto "Operação"
    # Entrar no módulo "Pedagógico"
    # Entrar na funcionalidade "Controle Diário de Frequência"
    # Na controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    # Na controle de frequência, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
    # Na controle de frequência, em Turma, selecionar "EII A"
    # Na controle de frequência, em Data Referência, insira "01/07/2022"
    # Clicar em Pesquisar
    # Verificar se o botão Iniciar está desativado
    # Do dia 23 ao 30, clicar em Iniciar
    # Registrar faltas para os 3 primeiros alunos
    # Clicar em Pesquisar
    # Verificar se o primeiro aluno possui 5 faltas e frequencia 17
    # Verificar se o segundo aluno possui 3 faltas e frequencia 50
    # Verificar se o terceiro aluno possui 2 faltas e frequencia 67
    # Verificar se o quarto aluno possui 0 faltas e frequencia 100
    # Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
    # No primeiro aluno, clicar em Diário de Bordo do Aluno
    # Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    # Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
    # Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # Em Diário do Educando, verificar se o card foi adicionado ao histórico
    # Clicar em Voltar
    # No dia 30, inserir um Campo de Experiencia
    # Em Campo de Experiencia, selecionar a primeira opção
    # Em Saberes, selecionar a primeira opção
    # Em Aprendizagem, selecionar a primeira opção
    # Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    # Clicar em Inserir
    # No modal de alerta, clicar em Ok
    # Verificar se a descrição foi salva no histórico
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # No dia 23, cancelar a aula iniciada
    # Verificar se os campos foram bloqueados no dia 23
    # Clicar em Avaliações
    # Verificar se aparece o texto "Avaliações e Frequências"

    # Cenário 09B: Funcionalidade Controle Diário de Frequência - Fundamental
    # [Documentation]    Esse teste verifica se é possível consultar e
    # ...                registrar nota para a Etapa Fundamental
    # [Tags]             Consulta de Turma | Fluxo Positivo
    # Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    # Entrar com as credenciais "02867439817" e "12345678"
    # Verificar se aparece o texto "Estrutura"
    # Pesquisar "VOLPI" e selecionar o primeiro resultado
    # Verificar se aparece o texto "Operação"
    # Entrar no módulo "Pedagógico"
    # Entrar na funcionalidade "Controle Diário de Frequência"
    # Na controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    # Na controle de frequência, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
    # Na controle de frequência, em Turma, selecionar "EII A"
    # Na controle de frequência, em Data Referência, insira "01/07/2022"
    # Clicar em Pesquisar
    # Verificar se o botão Iniciar está desativado
    # Do dia 23 ao 30, clicar em Iniciar
    # Registrar faltas para os 3 primeiros alunos
    # Clicar em Pesquisar
    # Verificar se o primeiro aluno possui 5 faltas e frequencia 17
    # Verificar se o segundo aluno possui 3 faltas e frequencia 50
    # Verificar se o terceiro aluno possui 2 faltas e frequencia 67
    # Verificar se o quarto aluno possui 0 faltas e frequencia 100
    # Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
    # No primeiro aluno, clicar em Diário de Bordo do Aluno
    # Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    # Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
    # Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # Em Diário do Educando, verificar se o card foi adicionado ao histórico
    # Clicar em Voltar
    # No dia 30, inserir um Campo de Experiencia
    # Em Campo de Experiencia, selecionar a primeira opção
    # Em Saberes, selecionar a primeira opção
    # Em Aprendizagem, selecionar a primeira opção
    # Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    # Clicar em Inserir
    # No modal de alerta, clicar em Ok
    # Verificar se a descrição foi salva no histórico
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # No dia 23, cancelar a aula iniciada
    # Verificar se os campos foram bloqueados no dia 23
    # Clicar em Avaliações
    # Verificar se aparece o texto "Avaliações e Frequências"

    # Cenário 09C: Funcionalidade Ata de Conselho - EJA
    # [Documentation]    Esse teste verifica se é possível consultar e
    # ...                registrar nota para a Etapa Fundamental
    # [Tags]             Consulta de Turma | Fluxo Positivo
    # Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    # Entrar com as credenciais "02867439817" e "12345678"
    # Verificar se aparece o texto "Estrutura"
    # Pesquisar "VOLPI" e selecionar o primeiro resultado
    # Verificar se aparece o texto "Operação"
    # Entrar no módulo "Pedagógico"
    # Entrar na funcionalidade "Controle Diário de Frequência"
    # Na controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    # Na controle de frequência, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
    # Na controle de frequência, em Turma, selecionar "EII A"
    # Na controle de frequência, em Data Referência, insira "01/07/2022"
    # Clicar em Pesquisar
    # Verificar se o botão Iniciar está desativado
    # Do dia 23 ao 30, clicar em Iniciar
    # Registrar faltas para os 3 primeiros alunos
    # Clicar em Pesquisar
    # Verificar se o primeiro aluno possui 5 faltas e frequencia 17
    # Verificar se o segundo aluno possui 3 faltas e frequencia 50
    # Verificar se o terceiro aluno possui 2 faltas e frequencia 67
    # Verificar se o quarto aluno possui 0 faltas e frequencia 100
    # Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
    # No primeiro aluno, clicar em Diário de Bordo do Aluno
    # Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    # Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
    # Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # Em Diário do Educando, verificar se o card foi adicionado ao histórico
    # Clicar em Voltar
    # No dia 30, inserir um Campo de Experiencia
    # Em Campo de Experiencia, selecionar a primeira opção
    # Em Saberes, selecionar a primeira opção
    # Em Aprendizagem, selecionar a primeira opção
    # Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    # Clicar em Inserir
    # No modal de alerta, clicar em Ok
    # Verificar se a descrição foi salva no histórico
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # No dia 23, cancelar a aula iniciada
    # Verificar se os campos foram bloqueados no dia 23
    # Clicar em Avaliações
    # Verificar se aparece o texto "Avaliações e Frequências"

    # Cenário 10A: Funcionalidade Ata de Conselho - Infantil
    # [Documentation]    Esse teste verifica se é possível consultar e
    # ...                registrar nota para a Etapa Fundamental
    # [Tags]             Consulta de Turma | Fluxo Positivo
    # Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    # Entrar com as credenciais "02867439817" e "12345678"
    # Verificar se aparece o texto "Estrutura"
    # Pesquisar "VOLPI" e selecionar o primeiro resultado
    # Verificar se aparece o texto "Operação"
    # Entrar no módulo "Pedagógico"
    # Entrar na funcionalidade "Controle Diário de Frequência"
    # Na controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    # Na controle de frequência, em Professor, selecionar "ADRIANA CRISTINA CAMPOS SCALICI"
    # Na controle de frequência, em Turma, selecionar "EII A"
    # Na controle de frequência, em Data Referência, insira "01/07/2022"
    # Clicar em Pesquisar
    # Verificar se o botão Iniciar está desativado
    # Do dia 23 ao 30, clicar em Iniciar
    # Registrar faltas para os 3 primeiros alunos
    # Clicar em Pesquisar
    # Verificar se o primeiro aluno possui 5 faltas e frequencia 17
    # Verificar se o segundo aluno possui 3 faltas e frequencia 50
    # Verificar se o terceiro aluno possui 2 faltas e frequencia 67
    # Verificar se o quarto aluno possui 0 faltas e frequencia 100
    # Verificar se um aluno que não esteja matriculado possui as faltas bloqueadas
    # No primeiro aluno, clicar em Diário de Bordo do Aluno
    # Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    # Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
    # Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # Em Diário do Educando, verificar se o card foi adicionado ao histórico
    # Clicar em Voltar
    # No dia 30, inserir um Campo de Experiencia
    # Em Campo de Experiencia, selecionar a primeira opção
    # Em Saberes, selecionar a primeira opção
    # Em Aprendizagem, selecionar a primeira opção
    # Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    # Clicar em Inserir
    # No modal de alerta, clicar em Ok
    # Verificar se a descrição foi salva no histórico
    # Clicar em Salvar
    # No modal de alerta, clicar em Ok
    # No dia 23, cancelar a aula iniciada
    # Verificar se os campos foram bloqueados no dia 23
    # Clicar em Avaliações
    # Verificar se aparece o texto "Avaliações e Frequências"

Cenário 10B: Funcionalidade Ata De Conselho Final - Fundamental
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
    Na tela de Ata de Conselho, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na tela de Ata de Conselho, em Turma, selecionar "3A"
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

# Cenário 10C: Funcionalidade Ata De Conselho Final - EJA
#     [Documentation]    Esse teste verifica se é possível consultar a
#     ...                Ata de Conselho Final e todas as suas ações
#     ...                para a Etapa EJA                 
#     [Tags]             Ata De Conselho Final - EJA | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
#     Verificar se aparece o texto "Operação"
#     Entrar no módulo "Pedagógico"
#     Entrar na funcionalidade "Ata de Conselho Final - Turma"
#     Na tela de Ata de Conselho, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
#     Na tela de Ata de Conselho, em Turma, selecionar "CI A (1º Semestre)"
#     Clicar em Pesquisar
#     Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
#     Na tela de Ata de Conselho, em ações, clicar em Fechamento do Período Letivo no primeiro aluno
#     Verificar se a página foi redirecionada para Fechamento de Período Letivo
#     Clicar em Voltar
#     Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
#     Na tela de Ata de Conselho, em ações, clicar em Prontuário do Aluno no primeiro aluno
#     Verificar se a página foi redirecionada para Prontuário do Educando
#     Retornar a página anterior
#     Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
#     Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
#     Na tela de Ata de Conselho, em Registro das Observações, inserir uma observação
#     Clicar em Salvar
#     Clicar em OK no modal
#     Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
#     Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
#     Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
#     Clicar em Fechar
#     Na tela de Ata de Conselho, clicar em Finalizar Conselho
#     Clicar em Sim no Modal
#     Na tela de Ata de Conselho, verificar se o botão Reabrir Conselho é exibido
#     Na tela de Ata de Conselho, clicar no botão Reabrir Conselho
#     Clicar em Sim no Modal
#     Na tela de Ata de Conselho, verificar se o botão Finalizar Conselho é exibido
    
    
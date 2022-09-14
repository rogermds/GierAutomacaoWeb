*** Settings ***
Resource         ../1-Hooks/1-Principal.robot
Resource         ../2-PageElements/FluxosPrincipais/CT01-Login.robot
Resource         ../2-PageElements/FluxosPrincipais/CT02-SelecaodeEstrutura.robot
Resource         ../2-PageElements/FluxosPrincipais/CT03-Pessoa.robot
Resource         ../2-PageElements/FluxosPrincipais/CT04-Turma.robot
Resource         ../2-PageElements/FluxosPrincipais/CT05-AvaliacoesFrequencia.robot
Resource         ../2-PageElements/FluxosPrincipais/CT06-ControleDiarioFrequencia.robot
Resource         ../2-PageElements/FluxosPrincipais/CT07-AtaDeConselho.robot
Resource         ../2-PageElements/FluxosPrincipais/CT08-HistoricoEscolar.robot
Resource         ../2-PageElements/FluxosPrincipais/CT09-BoletimEscolar.robot
Resource         ../2-PageElements/FluxosPrincipais/CT10-ProntuarioDaTurma.robot
Resource         ../2-PageElements/FluxosPrincipais/CT11-ProntuarioDoAluno.robot
Resource         ../2-PageElements/FluxosPrincipais/CT12-Matricula.robot
Resource         ../2-PageElements/FluxosPrincipais/CT13-Transportes.robot
Resource         ../2-PageElements/FluxosPrincipais/CT14-AvaliacoesEducacionais.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador

#robot -d ./3-TestesFluxoBasico/results ./3-TestesFluxoBasico/TesteDeVersaoPositivo.robot

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

Cenário 03: Funcionalidade Pessoa – Escola
    [Documentation]    Esse teste verifica se é possível efetuar o cadastro, edição, 
    ...                visualização e desativação de uma pessoa na escola
    [Tags]             Pessoa - Escola | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Pessoa"
    Clicar no botão Cadastrar
    Verificar se aparece o texto "Cadastrar Pessoa"
    Em Cadastro de Pessoa, no campo Nome, inserir o nome "Teste Cadastro Automacao "
    Em Cadastro de Pessoa, no campo Sexo, selecionar "MASCULINO"
    Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "07/03/1996"
    Clicar no checkbox Pessoa não possui correio eletrônico
    Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "BRASILEIRA"
    Em Cadastro de Pessoa, no campo UF Nascimento, selecionar "SP"
    Em Cadastro de Pessoa, no campo Cidade de Nascimento, selecionar "SAO PAULO"
    Em Cadastro de Pessoa, no campo CPF, inserir um CPF válido
    Em Cadastro de Pessoa, no campo Carteira de Identidade ou R.N.E., inserir um RG válido
    Em Cadastro de Pessoa, no campo Dígito, inserir o dígito do RG
    Em Cadastro de Pessoa, no campo Órgão Emissor, selecionar "SSP"
    Em Cadastro de Pessoa, no campo Data de Expedição, inserir a data "20/01/2020"
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "02176-010"
    Em Cadastro de Pessoa, no campo Número, inserir o número "13"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Clicar em Salvar
    No modal Deseja Cadastrar Outra Pessoa?, clicar em "Não"
    Verificar se o sistema retorna a página Consultar Pessoa
    Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Em Consulta de Pessoa, inserir o CPF cadastrado
    Em Consulta de Pessoa, clicar em Pesquisar
    Clicar no botão "Ações"
    Clicar no botão "Editar"
    Em Editar Pessoa, no campo Nome, inserir o nome "TESTE CADASTRO AUTOMACAO EDITADO"
    Em Editar Pessoa, no campo Data de Nascimento, inserir a data "01/01/2000"
    Clicar em Salvar
    Clicar em OK no Modal
    Verificar se o sistema retorna a página Consultar Pessoa
    Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Em Consulta de Pessoa, inserir o CPF cadastrado
    Em Consulta de Pessoa, clicar em Pesquisar
    Verificar se no grid é exibido o nome "TESTE CADASTRO AUTOMACAO EDITADO"
    Verificar se no grid é exibido a Data de Nascimento "01/01/2000"
    Clicar no botão "Ações"
    Clicar no botão "Visualizar"
    Verificar se aparece o texto "Visualizar Pessoa"
    Verificar se é exibido o nome "TESTE CADASTRO AUTOMACAO EDITADO"
    Verificar se é exibido a data de nascimento "01/01/2000"
    Em Visualizar Pessoa, clicar em Voltar
    Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Em Consulta de Pessoa, inserir o CPF cadastrado
    Em Consulta de Pessoa, clicar em Pesquisar
    Clicar no botão "Ações"
    Em Consulta de Pessoa, verificar se o botão Desativar está inativo

Cenário 04: Funcionalidade Pessoa – Secretaria
    [Documentation]    Esse teste verifica se é possível efetuar o cadastro, edição, 
    ...                visualização e desativação de uma pessoa na Secretaria
    [Tags]             Pessoa - Secretaria | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pessoas"
    Entrar na funcionalidade "Pessoa"
    Clicar no botão Cadastrar
    Verificar se aparece o texto "Cadastrar Pessoa"
    Em Cadastro de Pessoa, no campo Nome, inserir o nome "Teste Cadastro Automacao "
    Em Cadastro de Pessoa, no campo Sexo, selecionar "MASCULINO"
    Em Cadastro de Pessoa, no campo Data de Nascimento, inserir a data "07/03/1996"
    Clicar no checkbox Pessoa não possui correio eletrônico
    Em Cadastro de Pessoa, no campo Nacionalidade, selecionar "BRASILEIRA"
    Em Cadastro de Pessoa, no campo UF Nascimento, selecionar "SP"
    Em Cadastro de Pessoa, no campo Cidade de Nascimento, selecionar "SAO PAULO"
    Em Cadastro de Pessoa, no campo CPF, inserir um CPF válido
    Em Cadastro de Pessoa, no campo Carteira de Identidade ou R.N.E., inserir um RG válido
    Em Cadastro de Pessoa, no campo Dígito, inserir o dígito do RG
    Em Cadastro de Pessoa, no campo Órgão Emissor, selecionar "SSP"
    Em Cadastro de Pessoa, no campo Data de Expedição, inserir a data "20/01/2020"
    Em Cadastro de Pessoa, no campo Cor/Raça, selecionar "PRETA"
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "02176-010"
    Em Cadastro de Pessoa, no campo Número, inserir o número "13"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Clicar em Salvar
    No modal Deseja Cadastrar Outra Pessoa?, clicar em "Não"
    Verificar se o sistema retorna a página Consultar Pessoa
    Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Em Consulta de Pessoa, inserir o CPF cadastrado
    Em Consulta de Pessoa, clicar em Pesquisar
    Clicar no botão "Ações"
    Clicar no botão "Editar"
    Em Editar Pessoa, no campo Nome, inserir o nome "TESTE CADASTRO AUTOMACAO EDITADO"
    Em Editar Pessoa, no campo Data de Nascimento, inserir a data "01/01/2000"
    Clicar em Salvar
    Clicar em OK no Modal
    Verificar se o sistema retorna a página Consultar Pessoa
    Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Em Consulta de Pessoa, inserir o CPF cadastrado
    Em Consulta de Pessoa, clicar em Pesquisar
    Verificar se no grid é exibido o nome "TESTE CADASTRO AUTOMACAO EDITADO"
    Verificar se no grid é exibido a Data de Nascimento "01/01/2000"
    Clicar no botão "Ações"
    Clicar no botão "Visualizar"
    Verificar se aparece o texto "Visualizar Pessoa"
    Verificar se é exibido o nome "TESTE CADASTRO AUTOMACAO EDITADO"
    Verificar se é exibido a data de nascimento "01/01/2000"
    Em Visualizar Pessoa, clicar em Voltar
    Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Em Consulta de Pessoa, inserir o CPF cadastrado
    Em Consulta de Pessoa, clicar em Pesquisar
    Clicar no botão "Ações"
    Clicar no botão "Desativar"
    Clicar em OK no Modal de Desativado com Sucesso
    Em Consulta de Pessoa, clicar em Pesquisar
    Em Consulta de Pessoa, verificar se aparece o texto "NENHUM REGISTRO FOI ENCONTRADO"
    
Cenário 05: Funcionalidade Turma – Infantil
    [Documentation]    Esse teste verifica se é possível efetuar o cadastro, edição, 
    ...                visualização e exclusão de uma turma da Etapa Infantil
    [Tags]             Turma - Infantil | Fluxo Positivo
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
    Em Turma, selecionar "R"
    No cadastro de Turma, selecionar Calendário
    Em Grade de Aula, selecionar "GRADE DE HORARIO - MISTO"
    Em Programa Curricular, selecionar "ESTÁGIO II"
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "20"
    Clicar em Salvar
    No modal para cadastrar outra turma, clique em Não
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Na consulta de turma, em Curso, selecionar "PRÉ-ESCOLA"
    Na consulta de turma, em Período, selecionar "MISTO"
    Na consulta de turma, em Ciclo, selecionar "ESTÁGIO II"
    Clicar em Pesquisar
    Verificar se aparece o texto "Resultado da Busca"
    Buscar e editar o resultado que corresponde a sala criada
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "30"
    Em Professor Responsável, clicar em INSERIR
    Em Professor Responsável, selecionar ADRIANA HOLLAIS SANTOS REIS
    Clicar em Salvar
    Clicar em OK no Modal
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Na consulta de turma, em Curso, selecionar "PRÉ-ESCOLA"
    Na consulta de turma, em Período, selecionar "MISTO"
    Na consulta de turma, em Ciclo, selecionar "ESTÁGIO II"
    Clicar em Pesquisar
    Buscar e visualizar o resultado que corresponde a sala criada
    Verificar se em Etapa/Modalidade está selecionado "Educação Infantil"
    Verificar se em Curso está selecionado "Pré-Escola"
    Verificar se em Ciclo está selecionado "Estágio II"
    Verificar se em Período está selecionado "MISTO"
    Verificar se em Capacidade da Turma está a quantidade "30"
    Verificar se o professor responsável é "ADRIANA HOLLAIS SANTOS REIS"
    Clicar em Voltar
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Na consulta de turma, em Curso, selecionar "PRÉ-ESCOLA"
    Na consulta de turma, em Período, selecionar "MISTO"
    Na consulta de turma, em Ciclo, selecionar "ESTÁGIO II"
    Clicar em Pesquisar
    Buscar e excluir o resultado que corresponde a sala criada
    No modal de exclusão, clicar em Sim
    No modal de exclusão, clicar em Ok
    Clicar em Pesquisar
    Verificar se a sala não aparece nos resultados

Cenário 06: Funcionalidade Turma – Fundamental
    [Documentation]    Esse teste verifica se é possível efetuar o cadastro, edição, 
    ...                visualização e exclusão de uma turma da Etapa Fundamental
    [Tags]             Turma - Infantil | Fluxo Positivo
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
    Em Turma, selecionar "S"
    No cadastro de Turma, selecionar Calendário
    Em Grade de Aula, selecionar "GRADE DE HORARIO - TARDE"
    Em Programa Curricular, selecionar "5º ANO"
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "20"
    Clicar em Salvar
    No modal para cadastrar outra turma, clique em Não
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na consulta de turma, em Curso, selecionar "CICLO II"
    Na consulta de turma, em Período, selecionar "TARDE"
    Na consulta de turma, em Ciclo, selecionar "5° ANO"
    Clicar em Pesquisar
    Verificar se aparece o texto "Resultado da Busca"
    Buscar e editar o resultado que corresponde a sala criada
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "30"
    Em Professor Responsável, clicar em INSERIR
    Em Professor Responsável, selecionar ADRIANA HOLLAIS SANTOS REIS
    Clicar em Salvar
    Clicar em OK no Modal
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na consulta de turma, em Curso, selecionar "CICLO II"
    Na consulta de turma, em Período, selecionar "TARDE"
    Na consulta de turma, em Ciclo, selecionar "5° ANO"
    Clicar em Pesquisar
    Buscar e visualizar o resultado que corresponde a sala criada
    Verificar se em Etapa/Modalidade está selecionado "Ensino Fundamental"
    Verificar se em Curso está selecionado "Ciclo II"
    Verificar se em Ciclo está selecionado "5º Ano"
    Verificar se em Período está selecionado "TARDE"
    Verificar se em Capacidade da Turma está a quantidade "30"
    Verificar se o professor responsável é "ADRIANA HOLLAIS SANTOS REIS"
    Clicar em Voltar
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na consulta de turma, em Curso, selecionar "CICLO II"
    Na consulta de turma, em Período, selecionar "TARDE"
    Na consulta de turma, em Ciclo, selecionar "5° ANO"
    Clicar em Pesquisar
    Buscar e excluir o resultado que corresponde a sala criada
    No modal de exclusão, clicar em Sim
    No modal de exclusão, clicar em Ok
    Clicar em Pesquisar
    Verificar se a sala não aparece nos resultados

Cenário 07: Funcionalidade Turma Multisseriada – EJA
    [Documentation]    Esse teste verifica se é possível efetuar o cadastro, edição, 
    ...                visualização e exclusão de uma turma da Etapa EJA
    [Tags]             Turma - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Turmas"
    Clicar em Nova Turma Multisseriada
    Em Anual/Semanal, selecionar "2° SEMESTRE"
    Em Período, selecionar "NOITE"
    No grid de Etapa, selecionar os semestres correspondentes
    Em Turma, selecionar "T"
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "20"
    Clicar em Salvar
    No modal para cadastrar outra turma, clique em Não
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE"
    Na consulta de turma, em Curso, selecionar "CICLO II"
    Na consulta de turma, em Período, selecionar "NOITE"
    Clicar em Pesquisar
    Verificar se aparece o texto "Resultado da Busca"
    Buscar e editar o resultado que corresponde a sala criada
    Selecionar uma Sala Física
    Em Capacidade da Turma, inserir a quantidade "30"
    Em Professor Responsável, clicar em EXCLUIR
    Em Professor Responsável, selecionar ADRIANA HOLLAIS SANTOS REIS
    Clicar em Salvar
    Clicar em OK no Modal
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE"
    Na consulta de turma, em Curso, selecionar "CICLO II"
    Na consulta de turma, em Período, selecionar "NOITE"
    Clicar em Pesquisar
    Buscar e visualizar o resultado que corresponde a sala criada
    Verificar se em Etapa/Modalidade, em Multisseriada, está selecionado "Educação de Jovens e Adultos 2º Semestre"
    Verificar se em Curso, em Multisseriada, está selecionado "Ciclo II"
    Verificar se em Período, em Multisseriada, está selecionado "NOITE"
    Verificar se em Capacidade da Turma está a quantidade "30"
    Verificar se o professor responsável é "ADRIANA HOLLAIS SANTOS REIS"
    Clicar em Voltar
    Verificar se a página retornou a busca de turma
    Na consulta de turma, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE"
    Na consulta de turma, em Curso, selecionar "CICLO II"
    Na consulta de turma, em Período, selecionar "NOITE"
    Clicar em Pesquisar
    Buscar e excluir o resultado que corresponde a sala criada
    No modal de exclusão, clicar em Sim
    No modal de exclusão, clicar em Ok
    Clicar em Pesquisar
    Verificar se a sala não aparece nos resultados

Cenário 08: Funcionalidade Avaliações e Frequência - Infantil
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar nota para a Etapa Infantil
    [Tags]             Avaliações e Frequência - Infantil | Fluxo Positivo
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

Cenário 09: Funcionalidade Avaliações e Frequência - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar, registrar notas
    ...                e validar os relatórios para a Etapa Fundamental
    [Tags]             Avaliações e Frequência - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Avaliações e Frequência"
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na consulta de avaliações, em Professor, selecionar "TANIA MARA DA SILVA"
    Na consulta de avaliações, em Turma, selecionar "5B"
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
    Em Validação de Relatório, em Turma, selecionar "5B"
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
    Na consulta de avaliações, em Professor, selecionar "TANIA MARA DA SILVA"
    Na consulta de avaliações, em Turma, selecionar "5B"
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
    Em Validação de Relatório, em Turma, selecionar "5B"
    Em Validação de Relatório, clicar em Pesquisar
    Verificar se a Situação de Validação está como "VALIDADO COM AJUSTES"
    Clicar em VISUALIZAR EDUCANDOS
    Verificar se a Situação de Validação está como "VALIDADO APÓS AJUSTES"
    Clicar em VISUALIZAR RELATORIO
    Verificar se o texto alterado aparece nesta tela

## PODE SER NECESSÁRIO CONFIGURAR O GERIR LANÇAMENTOS ABAIXO DESTE TESTE
Cenário 10: Funcionalidade Avaliações e Frequência - EJA
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar notas para a Etapa EJA
    [Tags]             Avaliações e Frequência - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Avaliações e Frequência"
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    Na consulta de avaliações, em Data de Referência, informar "05072022"
    Na consulta de avaliações, em Professor, selecionar "DAIANE LINO SALVADOR"
    Na consulta de avaliações, em Turma, selecionar "CII B (1º Semestre)"
    Clicar em Pesquisar
    No primeiro aluno, em questionário, clicar em "Responder"
    Marcar "ATINGIU OS OBJETIVOS" nas questões
    Clicar em Salvar e Fechar
    No modal de alerta, clicar em Ok
    Clicar em Salvar
    No modal de Cadastro Efetuado com Sucesso, clicar em Ok
    No primeiro aluno, em questionário, clicar em "Responder"
    Verificar se as questões foram marcadas conforme foram salvas

## NECESSÁRIO CONFIGURAR O TESTE EXTRA: GERIR LANÇAMENTOS ABAIXO,
## CASO O TESTE ACIMA PARA O EJA NÃO CONSIGA SELECIONAR UM PROFESSOR 
Cenário EXTRA: Funcionalidade Gerir Lançamentos - EJA
    [Documentation]    Esse teste verifica se é possível consultar e
    ...                registrar notas para a Etapa EJA
    [Tags]             Avaliações e Frequência - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão"
    Entrar na funcionalidade "Gerir Lançamentos"
    Em Gerir Lançamentos, em Etapa/Modalidade, selecionar "Educação de Jovens e Adultos 2º Semestre"
    Em Gerir Lançamentos, clicar em Ações e Editar
    Em Gerir Lançamentos, alterar as datas para "01122022"
    Clicar em Salvar Alterações
    Em Gerir Lançamentos, clicar em OK no Modal
    Em Gerir Lançamentos, em Etapa/Modalidade, selecionar "Educação de Jovens e Adultos 1º Semestre"
    Em Gerir Lançamentos, clicar em Ações e Editar
    Em Gerir Lançamentos, alterar as datas para "30112022"
    Clicar em Salvar Alterações
    Em Gerir Lançamentos, clicar em OK no Modal

Cenário 11: Funcionalidade Controle Diário de Frequência - Infantil
    [Documentation]    Esse teste verifica se é possível consultar e registrar frequencia, 
    ...                avaliação e campo de experiência  para a Etapa Infantil
    [Tags]             Controle de Frequencia - Infantil | Fluxo Positivo
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
    Em Diário do Educando, clicar em Editar, editando o card adicionado
    Em Diário do Educando, inserir o novo texto "CARD EDITADO COM SUCESSO"
    Em Diário do Educando, clicar em Salvar o card editado
    Em Diário do Educando, clicar em OK no modal
    Em Diário do Educando, verificar se o card foi editado corretamente
    Em Diário do Educando, clicar em Remover, removendo o card adicionado
    Em Diário do Educando, clicar em Sim no modal
    Em Diário do Educando, clicar em OK no modal
    Em Diário do Educando, verificar se o card foi removido histórico
    Clicar em Voltar
    No dia atual, clicar em inserir um Campo de Experiencia
    Em Campo de Experiencia, selecionar a primeira opção
    Em Saberes, selecionar a primeira opção
    Em Aprendizagem, selecionar a primeira opção
    Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    Clicar em Inserir
    Verificar se a descrição foi salva no histórico
    Em Registro de Aula, clicar em Salvar
    No dia atual, clicar em inserir um Campo de Experiencia
    Em Registro de Aula, clicar em Ações e Editar
    Em Campo de Experiencia, selecionar a segunda opção
    Em Descrição da Atividade, inserir "TESTE DE DESCRIÇÃO EDITADA"
    Em Descrição da Atividade, clicar em Salvar para salvar o registro editado
    Verificar se a descrição foi salva no histórico
    Em Registro de Aula, clicar em Salvar
    No dia atual, clicar em inserir um Campo de Experiencia
    Em Registro de Aula, clicar em Ações e Excluir
    Verificar se a descrição foi excluída no histórico
    Em Registro de Aula, clicar em Salvar
    Desmarcar as faltas registradas
    Cancelar as aulas iniciadas
    Verificar se os campos de faltas foram bloqueados
    Clicar em Avaliações
    Verificar se aparece o texto "Avaliações e Frequências"

Cenário 12: Funcionalidade Controle Diário de Frequência - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar e registrar frequencia, 
    ...                avaliação e campo de experiência  para a Etapa Fundamental
    [Tags]             Controle de Frequencia - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Controle Diário de Frequência"
    No controle de frequência, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    No controle de frequência, em Professor, selecionar "MARIA FAUSTA JUSTINIANO SANTOS SILVEIRA"
    No controle de frequência, em Turma, selecionar "1B"
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
    Em Diário do Educando, clicar em Editar, editando o card adicionado
    Em Diário do Educando, inserir o novo texto "CARD EDITADO COM SUCESSO"
    Em Diário do Educando, clicar em Salvar o card editado
    Em Diário do Educando, clicar em OK no modal
    Em Diário do Educando, verificar se o card foi editado corretamente
    Em Diário do Educando, clicar em Remover, removendo o card adicionado
    Em Diário do Educando, clicar em Sim no modal
    Em Diário do Educando, clicar em OK no modal
    Em Diário do Educando, verificar se o card foi removido histórico
    Clicar em Voltar
    No dia atual, clicar em inserir um Campo de Experiencia
    Em Eixo, selecionar a primeira opção
    Em Unidade Temática, selecionar a primeira opção
    Em Saberes, selecionar a primeira opção
    Em Aprendizagem, selecionar a primeira opção
    Em Descrição da Atividade, inserir "Atividade efetuada com sucesso"
    Clicar em Inserir
    Verificar se a descrição foi salva no histórico
    Em Registro de Aula, clicar em Salvar
    No dia atual, clicar em inserir um Campo de Experiencia
    Em Registro de Aula, clicar em Ações e Editar
    Em Eixo, selecionar a segunda opção
    Em Unidade Temática, selecionar a segunda opção
    Em Saberes, selecionar a segunda opção
    Em Aprendizagem, selecionar a segunda opção
    Em Descrição da Atividade, inserir "TESTE DE DESCRIÇÃO EDITADA"
    Em Descrição da Atividade, clicar em Salvar para salvar o registro editado
    Verificar se a descrição foi salva no histórico
    Em Registro de Aula, clicar em Salvar
    No dia atual, clicar em inserir um Campo de Experiencia
    Em Registro de Aula, clicar em Ações e Excluir
    Verificar se a descrição foi excluída no histórico
    Em Registro de Aula, clicar em Salvar
    Desmarcar as faltas registradas
    Cancelar as aulas iniciadas
    Verificar se os campos de faltas foram bloqueados
    Clicar em Avaliações
    Verificar se aparece o texto "Avaliações e Frequências"

## SE ESTIVER FORA DOS PARÂMETROS, EDITAR O CALENDARIO PARA INCLUIR O ANO INTEIRO
Cenário 13: Funcionalidade Controle Diário de Frequência - EJA
    [Documentation]    Esse teste verifica se é possível consultar e registrar frequencia, 
    ...                avaliação e campo de experiência  para a Etapa EJA
    [Tags]             Controle de Frequencia - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Controle Diário de Frequência"
    No controle de frequência, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    No controle de frequência, em Professor, selecionar "DAIANE LINO SALVADOR"
    No controle de frequência, em Turma, selecionar "CI A"
    Clicar em Pesquisar
    Verificar se o botão Iniciar está visível
    Iniciar as aulas para os 4 últimos dias da semana
    No primeiro aluno, clicar em Diário de Bordo do Aluno
    Em Diário do Educando, em Tipo de Avaliação, selecionar "SAÚDE LEVE"
    Em Diário do Educando, em Título, inserir "PASSOU MAL COM DOR DE ESTOMAGO"
    Em Diário do Educando, em Descrição, inserir "O responsável do aluno o buscou no colégio"
    Salvar o registro de Diário do Educando
    Em Diário do Educando, verificar se o card foi adicionado ao histórico
    Em Diário do Educando, clicar em Editar, editando o card adicionado
    Em Diário do Educando, inserir o novo texto "CARD EDITADO COM SUCESSO"
    Em Diário do Educando, clicar em Salvar o card editado
    Em Diário do Educando, clicar em OK no modal
    Em Diário do Educando, verificar se o card foi editado corretamente
    Em Diário do Educando, clicar em Remover, removendo o card adicionado
    Em Diário do Educando, clicar em Sim no modal
    Em Diário do Educando, clicar em OK no modal
    Em Diário do Educando, verificar se o card foi removido histórico
    Clicar em Voltar
    Cancelar as aulas que foram registradas
    Clicar em Avaliações
    Verificar se aparece o texto "Avaliações e Frequências"

Cenário 14: Funcionalidade Ata de Conselho - Infantil
    [Documentation]    Esse teste verifica se é possível consultar a Ata de Conselho Final
    ...                e todas as suas ações para a Etapa Infantil                             
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
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE INSERÇÃO DE OBSERVAÇÃO"
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE EDIÇÃO DE OBSERVAÇÃO"
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Clicar em Fechar
    Na tela de Ata de Conselho, em Observação, inserir "REGISTRO DE OBSERVAÇÃO AUTOMAÇÃO"
    Na tela de Ata de Conselho, clicar em Finalizar Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Reabrir Conselho é exibido
    Na tela de Ata de Conselho, em Observação, verificar se a observação foi salva
    Na tela de Ata de Conselho, clicar no botão Reabrir Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Finalizar Conselho é exibido

Cenário 15: Funcionalidade Ata de Conselho - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar a Ata de Conselho Final
    ...                e todas as suas ações para a Etapa Fundamental  
    [Tags]             Ata De Conselho Final - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Ata de Conselho Final - Turma"
    Na tela de Ata de Conselho, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Na tela de Ata de Conselho, em Turma, selecionar "5B"
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
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE INSERÇÃO DE OBSERVAÇÃO"
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE EDIÇÃO DE OBSERVAÇÃO"
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Clicar em Fechar
    Na tela de Ata de Conselho, em Observação, inserir "REGISTRO DE OBSERVAÇÃO AUTOMAÇÃO"
    Na tela de Ata de Conselho, clicar em Finalizar Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Reabrir Conselho é exibido
    Na tela de Ata de Conselho, em Observação, verificar se a observação foi salva
    Na tela de Ata de Conselho, clicar no botão Reabrir Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Finalizar Conselho é exibido

Cenário 16: Funcionalidade Ata de Conselho - EJA
    [Documentation]    Esse teste verifica se é possível consultar a Ata de Conselho Final
    ...                e todas as suas ações para a Etapa EJA                  
    [Tags]             Ata De Conselho Final - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Ata de Conselho Final - Turma"
    Na tela de Ata de Conselho, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    Na tela de Ata de Conselho, em Turma, selecionar "CII B"
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
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE INSERÇÃO DE OBSERVAÇÃO"
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE EDIÇÃO DE OBSERVAÇÃO"
    Clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Clicar em Fechar
    Na tela de Ata de Conselho, em Observação, inserir "REGISTRO DE OBSERVAÇÃO AUTOMAÇÃO"
    Na tela de Ata de Conselho, clicar em Finalizar Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Reabrir Conselho é exibido
    Na tela de Ata de Conselho, em Observação, verificar se a observação foi salva
    Na tela de Ata de Conselho, clicar no botão Reabrir Conselho
    Clicar em Sim no Modal
    Na tela de Ata de Conselho, verificar se o botão Finalizar Conselho é exibido

Cenário 17: Funcionalidade Histórico Escolar - Infantil
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
    Em Histórico Escolar, pesquisar "ARTHUR GABRIEL FRANCISCO DE SOUZA"
    Clicar em Pesquisar
    Em Histórico Escolar, clicar em HISTORICO ESCOLAR
    Em Histórico Escolar, clicar em Fechar Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, clicar em Salvar Historico
    Em Histórico Escolar, clicar em OK no Modal
    Em Histórico Escolar, clicar em Emitir Historico
    Em Histórico Escolar, verificar se o Historico foi emitido corretamente
    Em Histórico Escolar, fechar o Historico Escolar
    Em Histórico Escolar, clicar em Abrir Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, verificar se o botão Salvar Historico foi habilitado
    Clicar em Voltar
    Em Histórico Escolar, pesquisar "HIGOR DIAS SACRAMENTO"
    Clicar em Pesquisar
    Em Histórico Escolar, clicar em HISTORICO ESCOLAR
    Em Histórico Escolar, clicar em Fechar Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, clicar em Salvar Historico
    Em Histórico Escolar, clicar em OK no Modal
    Em Histórico Escolar, clicar em Emitir Historico
    Em Histórico Escolar, verificar se o Historico foi emitido corretamente
    Em Histórico Escolar, fechar o Historico Escolar
    Em Histórico Escolar, clicar em Abrir Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, verificar se o botão Salvar Historico foi habilitado

Cenário 18: Funcionalidade Histórico Escolar - Fundamental
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
    Em Histórico Escolar, pesquisar "ENZO RAFAEL NEVES ZALEM"
    Clicar em Pesquisar
    Em Histórico Escolar, clicar em HISTORICO ESCOLAR
    Em Histórico Escolar, selecionar a Etapa/Modalidade "ENSINO FUNDAMENTAL"
    Em Histórico Escolar, clicar em Fechar Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, clicar em Salvar Historico
    Em Histórico Escolar, clicar em OK no Modal
    Em Histórico Escolar, clicar em Emitir Historico
    Em Histórico Escolar, verificar se o Historico foi emitido corretamente
    Em Histórico Escolar, fechar o Historico Escolar
    Em Histórico Escolar, clicar em Abrir Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, verificar se o botão Salvar Historico foi habilitado
    Clicar em Voltar
    Em Histórico Escolar, pesquisar "JAMILLY VITORIA ROSA DE OLIVEIRA"
    Clicar em Pesquisar
    Em Histórico Escolar, clicar em HISTORICO ESCOLAR
    Em Histórico Escolar, selecionar a Etapa/Modalidade "ENSINO FUNDAMENTAL"
    Em Histórico Escolar, clicar em Fechar Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, clicar em Salvar Historico
    Em Histórico Escolar, clicar em OK no Modal
    Em Histórico Escolar, clicar em Emitir Historico
    Em Histórico Escolar, verificar se o Historico foi emitido corretamente
    Em Histórico Escolar, fechar o Historico Escolar
    Em Histórico Escolar, clicar em Abrir Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, verificar se o botão Salvar Historico foi habilitado

Cenário 19: Funcionalidade Histórico Escolar - EJA
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Histórico Escolar para a Etapa EJA                 
    [Tags]             Histórico Escolar - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Educandos"
    Entrar na funcionalidade "Histórico Escolar"
    Em Histórico Escolar, pesquisar "DONIZETE ANTONIO DA SILVA"
    Clicar em Pesquisar
    Em Histórico Escolar, clicar em HISTORICO ESCOLAR
    Em Histórico Escolar, selecionar a Etapa/Modalidade "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    Em Histórico Escolar, clicar em Fechar Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, clicar em Salvar Historico
    Em Histórico Escolar, clicar em OK no Modal
    Em Histórico Escolar, clicar em Emitir Historico
    Em Histórico Escolar, verificar se o Historico foi emitido corretamente
    Em Histórico Escolar, fechar o Historico Escolar
    Em Histórico Escolar, clicar em Abrir Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, verificar se o botão Salvar Historico foi habilitado
    Clicar em Voltar
    Em Histórico Escolar, pesquisar "RODRIGO DE ASSIS RIBEIRO"
    Clicar em Pesquisar
    Em Histórico Escolar, clicar em HISTORICO ESCOLAR
    Em Histórico Escolar, selecionar a Etapa/Modalidade "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    Em Histórico Escolar, clicar em Fechar Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, clicar em Salvar Historico
    Em Histórico Escolar, clicar em OK no Modal
    Em Histórico Escolar, clicar em Emitir Historico
    Em Histórico Escolar, verificar se o Historico foi emitido corretamente
    Em Histórico Escolar, fechar o Historico Escolar
    Em Histórico Escolar, clicar em Abrir Historico
    Em Histórico Escolar, clicar em Sim no Modal
    Em Histórico Escolar, verificar se o botão Salvar Historico foi habilitado
    
Cenário 20: Funcionalidade Boletim Escolar - Infantil
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Boletim Escolar e todas as suas ações para a Etapa Infantil                               
    [Tags]             Boletim Escolar - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Gestão"
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Geral de Educando (conceito)"
    Em Boletim Geral de Educando, no filtro Ano Letivo, selecionar "2022"
    Em Boletim Geral de Educando, no filtro Turma, selecionar "EII A"
    Em Boletim Geral de Educando, no filtro Educando, selecionar "ALLAN KOJO DE ASSIS GOES"
    Em Boletim Geral de Educando, clicar em Imprimir
    Em Boletim Geral de Educando, verificar se o Boletim foi emitido corretamente
    Em Boletim Geral de Educando, fechar o Boletim Escolar
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando"
    Em Boletim Individual de Educando, no filtro Ano Letivo, selecionar "2022"
    Em Boletim Individual de Educando, no filtro Turma, selecionar "EII A"
    Em Boletim Individual de Educando, no filtro Educando, selecionar "ANA BEATRIZ DE ANDRADE OLIVEIRA"
    Em Boletim Individual de Educando, clicar em Imprimir
    Em Boletim Individual de Educando, verificar se o Boletim foi emitido corretamente
    Em Boletim Individual de Educando, fechar o Boletim Escolar
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando M02"
    Em Boletim Individual de Educando M02, no filtro Ano Letivo, selecionar "2021"
    Em Boletim Individual de Educando M02, no filtro Turma, selecionar "EII C"
    Em Boletim Individual de Educando M02, no filtro Educando, selecionar "BRAYAN BARBOSA"
    Em Boletim Individual de Educando M02, clicar em Imprimir
    Em Boletim Individual de Educando M02, verificar se o Boletim foi emitido corretamente
    Em Boletim Individual de Educando M02, fechar o Boletim Escolar

Cenário 21: Funcionalidade Boletim Escolar - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Boletim Escolar e todas as suas ações para a Etapa Fundamental                  
    [Tags]             Boletim Escolar - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Gestão"
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Geral de Educando (conceito)"
    Em Boletim Geral de Educando, no filtro Ano Letivo, selecionar "2022"
    Em Boletim Geral de Educando, no filtro Turma, selecionar "5A"
    Em Boletim Geral de Educando, no filtro Educando, selecionar "MATHEUS OLIVEIRA SILVA"
    Em Boletim Geral de Educando, clicar em Imprimir
    Em Boletim Geral de Educando, verificar se o Boletim foi emitido corretamente
    Em Boletim Geral de Educando, fechar o Boletim Escolar
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando"
    Em Boletim Individual de Educando, no filtro Ano Letivo, selecionar "2021"
    Em Boletim Individual de Educando, no filtro Turma, selecionar "5 A"
    Em Boletim Individual de Educando, no filtro Educando, selecionar "DIEGO DA SILVA"
    Em Boletim Individual de Educando, clicar em Imprimir
    Em Boletim Individual de Educando, verificar se o Boletim foi emitido corretamente
    Em Boletim Individual de Educando, fechar o Boletim Escolar
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando M02"
    Em Boletim Individual de Educando M02, no filtro Ano Letivo, selecionar "2021"
    Em Boletim Individual de Educando M02, no filtro Turma, selecionar "5 A"
    Em Boletim Individual de Educando M02, no filtro Educando, selecionar "CARLOS ALEXANDRE CORREIA VARGES"
    Em Boletim Individual de Educando M02, clicar em Imprimir
    Em Boletim Individual de Educando M02, verificar se o Boletim foi emitido corretamente
    Em Boletim Individual de Educando M02, fechar o Boletim Escolar

Cenário 22: Funcionalidade Boletim Escolar - EJA
    [Documentation]    Esse teste verifica se é possível consultar o
    ...                Boletim Escolar e todas as suas ações para a Etapa EJA                  
    [Tags]             Boletim Escolar - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Gestão"
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Geral de Educando (conceito)"
    Em Boletim Geral de Educando, no filtro Ano Letivo, selecionar "2022"
    Em Boletim Geral de Educando, no filtro Turma, selecionar "CII A"
    Em Boletim Geral de Educando, no filtro Educando, selecionar "ALMERINDA SILVA CABRAL"
    Em Boletim Geral de Educando, clicar em Imprimir
    Em Boletim Geral de Educando, verificar se o Boletim foi emitido corretamente
    Em Boletim Geral de Educando, fechar o Boletim Escolar
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando"
    Em Boletim Individual de Educando, no filtro Ano Letivo, selecionar "2021"
    Em Boletim Individual de Educando, no filtro Turma, selecionar "CII B"
    Em Boletim Individual de Educando, no filtro Educando, selecionar "ARACI DE PAULA SANTOS DIAS"
    Em Boletim Individual de Educando, clicar em Imprimir
    Em Boletim Individual de Educando, verificar se o Boletim foi emitido corretamente
    Em Boletim Individual de Educando, fechar o Boletim Escolar
    Entrar no módulo "Relatorios de Educandos"
    Entrar na funcionalidade "Boletim Individual de Educando M02"
    Em Boletim Individual de Educando M02, no filtro Ano Letivo, selecionar "2022"
    Em Boletim Individual de Educando M02, no filtro Turma, selecionar "CII A"
    Em Boletim Individual de Educando M02, no filtro Educando, selecionar "ANDERSON CASSEANO DA SILVA"
    Em Boletim Individual de Educando M02, clicar em Imprimir
    Em Boletim Individual de Educando M02, verificar se o Boletim foi emitido corretamente
    Em Boletim Individual de Educando M02, fechar o Boletim Escolar

Cenário 23: Funcionalidade Prontuário da Turma - Infantil
    [Documentation]    Esse teste verifica se é possível consultar o Prontuário da Turma 
    ...                e todas as suas ações para a Etapa Infantil                   
    [Tags]             Prontuário da Turma - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário da Turma"
    Em Prontuário da Turma, em Ano Letivo, selecionar "2022"
    Em Prontuário da Turma, em Turma, selecionar "EII A"
    Clicar em Pesquisar
    Em Prontuário da Turma, em Mês de Reunião, selecionar "Março"
    Em Prontuário da Turma, em Data da Reunião, inserir o dia atual
    Clicar em Salvar
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, clicar em Finalizar Ata do Conselho
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se o botão foi desativado

Cenário 24: Funcionalidade Prontuário da Turma - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar o Prontuário da Turma 
    ...                e todas as suas ações para a Etapa Fundamental                   
    [Tags]             Prontuário da Turma - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário da Turma"
    Em Prontuário da Turma, em Ano Letivo, selecionar "2022"
    Em Prontuário da Turma, em Turma, selecionar "5A"
    Clicar em Pesquisar
    Em Prontuário da Turma, em Mês de Reunião, selecionar "Março"
    Em Prontuário da Turma, em Data da Reunião, inserir o dia atual
    Clicar em Salvar
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, clicar em Finalizar Ata do Conselho
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se o botão foi desativado

Cenário 25: Funcionalidade Prontuário da Turma - EJA
    [Documentation]    Esse teste verifica se é possível consultar o Prontuário da Turma 
    ...                e todas as suas ações para a Etapa EJA                   
    [Tags]             Prontuário da Turma - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário da Turma"
    Em Prontuário da Turma, em Ano Letivo, selecionar "2022"
    Em Prontuário da Turma, em Turma, selecionar "CII A (1º Semestre)"
    Clicar em Pesquisar
    Em Prontuário da Turma, em Mês de Reunião, selecionar "Março"
    Em Prontuário da Turma, em Data da Reunião, inserir o dia atual
    Clicar em Salvar
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, clicar em Finalizar Ata do Conselho
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se o botão foi desativado

Cenário 26: Funcionalidade Prontuário do Aluno - Infantil
    [Documentation]    Esse teste verifica se é possível consultar o Prontuário do Aluno 
    ...                e todas as suas ações para a Etapa Infantil                   
    [Tags]             Prontuário da Turma - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário do Educando"
    Em Prontuário do Educando, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"    
    Em Prontuário do Educando, no campo turma no Prontuário, selecionar "EII A"    
    Em Prontuário do Educando, em Educando, selecionar "AGHATA SOPHIA GOMES PEREIRA"
    Em Prontuário do Educando, clicar em Pesquisar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Prontuário do Educando, clicar em Registrar Atestado
    Em Tipo de A 




Cenário 27: Funcionalidade Prontuário do Aluno - Fundamental
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

Cenário 28: Funcionalidade Prontuário do Aluno - EJA
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

Cenário 29: Funcionalidade - Escola Autorizada à Receber Matrícula
    [Documentation]    Esse teste efetua a configuração das escolas que
    ...                estão autorizadas a receber matrícula             
    [Tags]             Escola Autorizada à Receber Matrícula | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Escola Autorizada à Receber Matrícula"

Cenário 30: Funcionalidade - Justificativas da Pré-Matrícula
    [Documentation]    Esse teste efetua o cadastro de justificativas
    ...                para cada tipo de situação             
    [Tags]             Justificativas da Pré-Matrícula | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Justificativas da Pré-Matrícula"

Cenário 31: Funcionalidade - Layout do Portal de Inscrições e Transferências
    [Documentation]    Esse teste efetua o cadastro e edição do Portal
    ...                Online de Matrícula            
    [Tags]             Layout do Portal de Inscrições e Transferências | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Layout do Portal de Inscrições e Transferências"
    
Cenário 32: Funcionalidade Processo de Demanda
    [Documentation]    Esse teste efetua a configuração do Processo de Demanda
    ...                Inicial e Contínuo para as etapas/modalidades             
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO INFANTIL INICIAL 2023"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2023"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "Não"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "Sim"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "Sim"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO INICIAL"

Cenário 33: Funcionalidade Programação de Processo
    [Documentation]    Esse teste efetua o cadastro da Programação de Processo de Pré-Matrícula
    ...                para o Portal (todas as etapas), e de transferência para o GIER                  
    [Tags]             Programação de Processo - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Configuração Processo de Demandas"
    Clicar em Cadastrar

Cenário 34: Funcionalidade Portal
    [Documentation]    Esse teste efetua a solicitaão de matrícula no Portal,
    ...                para todas as etapas/modalidades.                
    [Tags]             Portal - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhosportalhomolog.gier.com.br/index.html"


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
    Clicar em Cadastrar
    Em Gestão de Demanda, em Tipo de Situação, selecionar "CANCELAMENTO"
    Em Gestão de Demanda, em Justificativa, inserir "TESTE CADASTRO JUSTIFICATIVA CANCELAMENTO"
    Clicar em Salvar
    Clicar em OK no Modal
    Clicar em Cadastrar
    Em Gestão de Demanda, em Tipo de Situação, selecionar "INDEFERIMENTO"
    Em Gestão de Demanda, em Justificativa, inserir "TESTE CADASTRO JUSTIFICATIVA INDEFERIMENTO"
    Clicar em Salvar
    Clicar em OK no Modal 
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Layout do Portal de Inscrições e Transferências"
    Clicar em Cadastrar
    Em Descrição do Processo, inserir "DESCRIÇÃO TESTE AUTOMACAO LAYOUT"
    Em inserir Documento Web, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal móvel, inserir "00000000"        
    Em Banner móvel clicar em Inserir     
    Em inserir Documento Móvel, inserir o arquivo "Crianças1.jpg"
    Em Aplicar no Portal móvel, inserir "00000000"        
    Em Banner móvel clicar em Inserir     
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

Cenário 17: Funcionalidade Aprendizagem
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Aprendizagem"
    Verificar se aparece o texto "Consulta de Descrição de Aprendizagem"
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST99"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "99"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 99"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 99"
    Em Consulta de Descrição de Aprendizagem, clicar em Pesquisar
    Em Consulta de Descrição de Aprendizagem, nos resultados, clicar em ações
    Em Consulta de Descrição de Aprendizagem, nos resultados, clicar em editar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST01"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "1"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 01"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 01"
    Em Consulta de Descrição de Aprendizagem, clicar em Pesquisar
    Em Consulta de Descrição de Aprendizagem, nos resultados, verificar se a descrição de aprendizagem está como "TESTE DE DESCRICAO DE APRENDIZAGEM 01"
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST02"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "2"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 02"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST03"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "3"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 03"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST04"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "4"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 04"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST05"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "5"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 05"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST06"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "6"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 06"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST07"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "7"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 07"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST08"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "8"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 08"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST09"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "9"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 09"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST10"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "10"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 10"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, clicar no botão Cadastrar
    Em Cadastro de Descrição de Aprendizagem, em Sigla, inserir "TST88"
    Em Cadastro de Descrição de Aprendizagem, em Ordem, inserir "88"
    Em Cadastro de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 88"
    Clicar em Salvar
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 88"
    Em Consulta de Descrição de Aprendizagem, clicar em Pesquisar
    Em Consulta de Descrição de Aprendizagem, nos resultados, clicar em ações
    Em Consulta de Descrição de Aprendizagem, nos resultados, clicar em excluir
    Em Cadastro de Descrição de Aprendizagem, clicar em Sim no Modal
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Cadastro de Descrição de Aprendizagem, clicar em OK no Modal
    Em Consulta de Descrição de Aprendizagem, em Descrição de Aprendizagem, inserir "TESTE DE DESCRICAO DE APRENDIZAGEM 88"
    Em Consulta de Descrição de Aprendizagem, clicar em Pesquisar
    Em Consulta de Descrição de Aprendizagem, verificar se aparece o texto "NENHUM REGISTRO FOI ENCONTRADO"
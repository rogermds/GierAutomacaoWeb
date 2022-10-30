*** Settings ***
Resource         ../1-Hooks/1-Principal.robot
Resource         ../2-PageElements/FluxosPrincipais/Login/Login.robot
Resource         ../2-PageElements/FluxosPrincipais/Seleção de Estrutura/Seleção de Estrutura.robot
Resource         ../2-PageElements/FluxosPrincipais/Pessoa/Pessoa.robot
Resource         ../2-PageElements/FluxosPrincipais/Turma/Turma.robot
Resource         ../2-PageElements/FluxosPrincipais/Avaliacoes e Frequencia/Avaliacoes e Frequencia.robot
Resource         ../2-PageElements/FluxosPrincipais/Controle Diario de Frequencia/Controle Diário de Frequência.robot
Resource         ../2-PageElements/FluxosPrincipais/Ata de Conselho/Ata de Conselho.robot
Resource         ../2-PageElements/FluxosPrincipais/Historico Escolar/Histórico Escolar.robot
Resource         ../2-PageElements/FluxosPrincipais/Boletim Escolar/Boletim Escolar.robot
Resource         ../2-PageElements/FluxosPrincipais/Prontuário da Turma/Prontuário da Turma.robot
Resource         ../2-PageElements/FluxosPrincipais/Prontuário do Educando/Prontuário do Educando.robot
Resource         ../2-PageElements/FluxosPrincipais/Matricula/Escola Autorizada A Receber Matrícula.robot
Resource         ../2-PageElements/FluxosPrincipais/Matricula/Gestão de Pré-Matrícula.robot
Resource         ../2-PageElements/FluxosPrincipais/Matricula/Justificativas da Pré-Matrícula.robot
Resource         ../2-PageElements/FluxosPrincipais/Matricula/Layout do Portal.robot
Resource         ../2-PageElements/FluxosPrincipais/Matricula/Matricular Educando.robot
Resource         ../2-PageElements/FluxosPrincipais/Matricula/Portal.robot
Resource         ../2-PageElements/FluxosPrincipais/Matricula/Processo de Demanda.robot
Resource         ../2-PageElements/FluxosPrincipais/Matricula/Programação de Processo.robot
Resource         ../2-PageElements/FluxosPrincipais/Transportes/ParametrosDeTransporte.robot
Resource         ../2-PageElements/FluxosPrincipais/Transportes/Rotas.robot
Resource         ../2-PageElements/FluxosPrincipais/Transportes/TiposDeRotas.robot
Resource         ../2-PageElements/FluxosPrincipais/Transportes/TiposDeFrotas.robot
Resource         ../2-PageElements/FluxosPrincipais/Transportes/Frotas.robot
Resource         ../2-PageElements/FluxosPrincipais/Transportes/Viagens.robot
Resource         ../2-PageElements/FluxosPrincipais/Transportes/CredenciamentoDeCondutores.robot
Resource         ../2-PageElements/FluxosPrincipais/Transportes/SolicitacaoDeTransporte.robot
Resource         ../2-PageElements/FluxosPrincipais/Avaliações Educacionais/Aprendizagem.robot
Resource         ../2-PageElements/FluxosPrincipais/Avaliações Educacionais/GruposDePergunta.robot
Resource         ../2-PageElements/FluxosPrincipais/Avaliações Educacionais/BancoDeQuestoes.robot
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
    Em Cadastro de Pessoa, clicar no botão Salvar
    No modal Deseja Cadastrar Outra Pessoa?, clicar em "Não"
    Verificar se o sistema retorna a página Consultar Pessoa
    Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Em Consulta de Pessoa, inserir o CPF cadastrado
    Em Consulta de Pessoa, clicar em Pesquisar
    Clicar no botão "Ações"
    Clicar no botão "Editar"
    Em Editar Pessoa, no campo Nome, inserir o nome "TESTE CADASTRO AUTOMACAO EDITADO"
    Em Editar Pessoa, no campo Data de Nascimento, inserir a data "01/01/2000"
    Em Cadastro de Pessoa, clicar no botão Salvar
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
    Em Cadastro de Pessoa, no campo CEP, inserir o CEP "07123-140"
    Em Cadastro de Pessoa, no campo Número, inserir o número "13"
    Em Cadastro de Pessoa, no campo Zona, selecionar "URBANO"
    Clicar no botão Incluir
    Em Cadastro de Pessoa, clicar no botão Salvar
    No modal Deseja Cadastrar Outra Pessoa?, clicar em "Não"
    Verificar se o sistema retorna a página Consultar Pessoa
    Em Consulta de Pessoa, em Tipo de Pesquisa, selecionar CPF
    Em Consulta de Pessoa, inserir o CPF cadastrado
    Em Consulta de Pessoa, clicar em Pesquisar
    Clicar no botão "Ações"
    Clicar no botão "Editar"
    Em Editar Pessoa, no campo Nome, inserir o nome "TESTE CADASTRO AUTOMACAO EDITADO"
    Em Editar Pessoa, no campo Data de Nascimento, inserir a data "01/01/2000"
    Em Cadastro de Pessoa, clicar no botão Salvar
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
    Em Turma, selecionar "X"
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
    Em Professor Responsável, selecionar ADRIANA HOLLAIS SANTOS
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
    Verificar se o professor responsável é "ADRIANA HOLLAIS SANTOS"
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
    Em Turma, selecionar "X"
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
    Em Professor Responsável, selecionar ADRIANA HOLLAIS SANTOS
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
    Verificar se o professor responsável é "ADRIANA HOLLAIS SANTOS"
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
    Em Turma, selecionar "X"
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
    Em Professor Responsável, selecionar ADRIANA HOLLAIS SANTOS
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
    Verificar se o professor responsável é "ADRIANA HOLLAIS SANTOS"
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
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "Educação Infantil"
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

### INCIDENTE - OS 84969
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
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "Ensino Fundamental"
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
    Em Validação de Relatório, em Etapa/Modalidade, selecionar a etapa/modalidade utilizada
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
    Na consulta de avaliações, em Etapa/Modalidade, selecionar a etapa/modalidade utilizada
    Na consulta de avaliações, em Professor, selecionar o professor utilizado
    Na consulta de avaliações, em Turma, selecionar a turma utilizada
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
    Em Validação de Relatório, em Etapa/Modalidade, selecionar a etapa/modalidade utilizada
    Em Validação de Relatório, em Turma, selecionar a turma utilizada
    Em Validação de Relatório, clicar em Pesquisar
    Verificar se a Situação de Validação está como "VALIDADO COM AJUSTES"
    Clicar em VISUALIZAR EDUCANDOS
    Verificar se a Situação de Validação está como "VALIDADO APÓS AJUSTES"
    Clicar em VISUALIZAR RELATORIO
    Verificar se o texto alterado aparece nesta tela

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
    Na consulta de avaliações, em Etapa/Modalidade, selecionar "Educação de Jovens e Adultos 1º Semestre"
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
    No controle de frequência, em Professor, selecionar "TANIA MARA DA SILVA"
    No controle de frequência, em Turma, selecionar "5B"
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
    Na tela de Ata de Conselho, clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE EDIÇÃO DE OBSERVAÇÃO"
    Na tela de Ata de Conselho, clicar em Salvar
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
    Na tela de Ata de Conselho, clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE EDIÇÃO DE OBSERVAÇÃO"
    Na tela de Ata de Conselho, clicar em Salvar
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
    Na tela de Ata de Conselho, clicar em Salvar
    Clicar em OK no modal
    Na tela de Ata de Conselho, clicar em Ações no primeiro aluno
    Na tela de Ata de Conselho, em ações, clicar em Registrar Observações no primeiro aluno
    Na tela de Ata de Conselho, em Registro de Observações, verificar se a observação foi incluída
    Na tela de Ata de Conselho, em Registro das Observações, inserir a observação "TESTE DE EDIÇÃO DE OBSERVAÇÃO"
    Na tela de Ata de Conselho, clicar em Salvar
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
    Em Boletim Individual de Educando, no filtro Educando, selecionar "ANA BEATRIZ ANDRADE OLIVEIRA"
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

## ALTERAR PARA O MÊS SEGUINTE CASO O TESTE FALHE. VERIFICAR O MÊS JÁ ESTÁ FECHADO
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
    Em Prontuário da Turma, em Turma, selecionar "EII B"
    Clicar em Pesquisar
    Em Prontuário da Turma, em Mês de Reunião, selecionar "Junho"
    Em Prontuário da Turma, em Data da Reunião, inserir o dia atual
    Em Prontuário da Turma, em Impressões do Conselho de Turma, inserir "TESTE DE IMPRESSÃO DO CONSELHO DE TURMA"
    Clicar em Salvar
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, clicar em Finalizar Ata do Conselho
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se o texto foi salvo
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se campo não está mais editável
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, verificar se o botão Finalizar Ata do Conselho foi desativado

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
    Em Prontuário da Turma, em Mês de Reunião, selecionar "Junho"
    Em Prontuário da Turma, em Data da Reunião, inserir o dia atual
    Em Prontuário da Turma, em Impressões do Conselho de Turma, inserir "TESTE DE IMPRESSÃO DO CONSELHO DE TURMA"
    Clicar em Salvar
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, clicar em Finalizar Ata do Conselho
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se o texto foi salvo
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se campo não está mais editável
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, verificar se o botão Finalizar Ata do Conselho foi desativado

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
    Em Prontuário da Turma, em Mês de Reunião, selecionar "Maio"
    Em Prontuário da Turma, em Data da Reunião, inserir o dia atual
    Em Prontuário da Turma, em Impressões do Conselho de Turma, inserir "TESTE DE IMPRESSÃO DO CONSELHO DE TURMA"
    Clicar em Salvar
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, clicar em Finalizar Ata do Conselho
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se o texto foi salvo
    Em Prontuário da Turma, em Impressões do Conselho de Turma, verificar se campo não está mais editável
    Em Prontuário da Turma, clicar em OK no Modal
    Em Prontuário da Turma, verificar se o botão Finalizar Ata do Conselho foi desativado

#### ALTERAR LOCALIZAÇÃO DO ARQUIVO. SÓ FUNCIONA PELA PASTA ESPECIFICA DA PASTA
Cenário 26: Funcionalidade Prontuário do Educando - Infantil
    [Documentation]    Esse teste verifica se é possível consultar o Prontuário do Educando 
    ...                e todas as suas ações para a Etapa Infantil                   
    [Tags]             Prontuário do Educando - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário do Educando"
    Em Prontuário do Educando, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Prontuário do Educando, no campo turma no Prontuário, selecionar "EII A"    
    Em Prontuário do Educando, em Educando, selecionar "ALLAN KOJO DE ASSIS GOES"
    Em Prontuário do Educando, clicar em Pesquisar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Prontuário do Educando, clicar em Registrar Atestado
    Em Atestado de Educandos, em Tipo de Atestado, selecionar "MÉDICO"
    Em Atestado de Educandos, em Data Inicial, selecionar o dia atual
    Em Atestado de Educandos, em Data Final, selecionar o dia atual
    Em Atestado de Educandos, em Motivo, inserir "TESTE DE INCLUSÃO DE MOTIVO MÉDICO"
    Em Atestado de Educandos, em Nº Registro Profissional, inserir "123456"
    Em Atestado de Educandos, em Nome do Profissional, inserir "TESTE NOME MÉDICO"
    Em Atestado de Educandos, em Inserir Documento, inserir um arquivo teste
    Clicar em Salvar
    Clicar em OK no Modal
    Clicar em Voltar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, verificar se o registro foi incluído
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Compensar Ausencia
    Clicar em OK no Modal
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Editar Compensação
    Em Atestado de Educandos, em Motivo, inserir "TESTE DE EDIÇÃO DE MOTIVO MÉDICO"
    Em Atestado de Educandos, em Inserir Documento, inserir um arquivo teste
    Clicar em Salvar
    Clicar em OK no Modal
    Clicar em Voltar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Excluir Compensação
    Clicar em OK no Modal
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, verificar se o registro foi excluído
    Clicar em Salvar
    Clicar em OK no Modal
    Em Prontuário do Educando, clicar em Finalizar
    Clicar em OK no Modal
    Em Prontuário do Educando, clicar em Reabrir Relatório
    Clicar em OK no Modal
    Em Prontuário do Educando, verificar se o botão Finalizar está visível
    Em Prontuário do Educando, clicar em Mapa de Turma
    Verificar se aparece o texto "Mapa da Turma"

## CONFIGURAR FREQUENCIA PARA VALIDAR PARECER FINAL
Cenário 27: Funcionalidade Prontuário do Educando - Fundamental
    [Documentation]    Esse teste verifica se é possível consultar o Prontuário do Educando 
    ...                e todas as suas ações para a Etapa Fundamental                   
    [Tags]             Prontuário da Turma - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário do Educando"
    Em Prontuário do Educando, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Prontuário do Educando, no campo turma no Prontuário, selecionar "5A"    
    Em Prontuário do Educando, em Educando, selecionar "BEATRIZ PEREIRA DA SILVA"
    Em Prontuário do Educando, clicar em Pesquisar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Prontuário do Educando, clicar em Registrar Atestado
    Em Atestado de Educandos, em Tipo de Atestado, selecionar "MÉDICO"
    Em Atestado de Educandos, em Data Inicial, selecionar o dia atual
    Em Atestado de Educandos, em Data Final, selecionar o dia atual
    Em Atestado de Educandos, em Motivo, inserir "TESTE DE INCLUSÃO DE MOTIVO MÉDICO"
    Em Atestado de Educandos, em Nº Registro Profissional, inserir "123456"
    Em Atestado de Educandos, em Nome do Profissional, inserir "TESTE NOME MÉDICO"
    Em Atestado de Educandos, em Inserir Documento, inserir um arquivo teste
    Clicar em Salvar
    Clicar em OK no Modal
    Clicar em Voltar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, verificar se o registro foi incluído
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Compensar Ausencia
    Clicar em OK no Modal
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Editar Compensação
    Em Atestado de Educandos, em Motivo, inserir "TESTE DE EDIÇÃO DE MOTIVO MÉDICO"
    Em Atestado de Educandos, em Inserir Documento, inserir um arquivo teste
    Clicar em Salvar
    Clicar em OK no Modal
    Clicar em Voltar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Excluir Compensação
    Clicar em OK no Modal
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, verificar se o registro foi excluído
    Clicar em Salvar
    Clicar em OK no Modal
    # Em Prontuário do Educando, em Parecer Final, selecionar "PROMOVIDO(A)"
    # Em Prontuário do Educando, em Qualificação do Parecer Final, selecionar "xxxxx"
    # Em Prontuário do Educando, clicar em Finalizar
    # Clicar em OK no Modal
    # Em Prontuário do Educando, clicar em Reabrir Relatório
    # Clicar em OK no Modal
    # Em Prontuário do Educando, verificar se o botão Finalizar está visível
    Em Prontuário do Educando, clicar em Mapa de Turma
    Verificar se aparece o texto "Mapa da Turma"

Cenário 28: Funcionalidade Prontuário do Educando - EJA
    [Documentation]    Esse teste verifica se é possível consultar o Prontuário do Educando 
    ...                e todas as suas ações para a Etapa EJA                   
    [Tags]             Prontuário da Turma - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Entrar no módulo "Pedagógico"
    Entrar na funcionalidade "Prontuário do Educando"
    Em Prontuário do Educando, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Prontuário do Educando, no campo turma no Prontuário, selecionar "5A"    
    Em Prontuário do Educando, em Educando, selecionar "BEATRIZ PEREIRA DA SILVA"
    Em Prontuário do Educando, clicar em Pesquisar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Prontuário do Educando, clicar em Registrar Atestado
    Em Atestado de Educandos, em Tipo de Atestado, selecionar "MÉDICO"
    Em Atestado de Educandos, em Data Inicial, selecionar o dia atual
    Em Atestado de Educandos, em Data Final, selecionar o dia atual
    Em Atestado de Educandos, em Motivo, inserir "TESTE DE INCLUSÃO DE MOTIVO MÉDICO"
    Em Atestado de Educandos, em Nº Registro Profissional, inserir "123456"
    Em Atestado de Educandos, em Nome do Profissional, inserir "TESTE NOME MÉDICO"
    Em Atestado de Educandos, em Inserir Documento, inserir um arquivo teste
    Clicar em Salvar
    Clicar em OK no Modal
    Clicar em Voltar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, verificar se o registro foi incluído
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Compensar Ausencia
    Clicar em OK no Modal
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Editar Compensação
    Em Atestado de Educandos, em Motivo, inserir "TESTE DE EDIÇÃO DE MOTIVO MÉDICO"
    Em Atestado de Educandos, em Inserir Documento, inserir um arquivo teste
    Clicar em Salvar
    Clicar em OK no Modal
    Clicar em Voltar
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Ações
    Em Atestado de Educandos, em Compensação de Ausências, clicar em Excluir Compensação
    Clicar em OK no Modal
    Em Prontuário do Educando, clicar em Tipo de Compensação
    Em Atestado de Educandos, em Compensação de Ausências, verificar se o registro foi excluído
    Clicar em Salvar
    Clicar em OK no Modal
    # Em Prontuário do Educando, em Parecer Final, selecionar "PROMOVIDO(A)"
    # Em Prontuário do Educando, em Qualificação do Parecer Final, selecionar "xxxxx"
    # Em Prontuário do Educando, clicar em Finalizar
    # Clicar em OK no Modal
    # Em Prontuário do Educando, clicar em Reabrir Relatório
    # Clicar em OK no Modal
    # Em Prontuário do Educando, verificar se o botão Finalizar está visível
    Em Prontuário do Educando, clicar em Mapa de Turma
    Verificar se aparece o texto "Mapa da Turma"

Cenário 29: Funcionalidade - Escola Autorizada A Receber Matrícula
    [Documentation]    Esse teste efetua a configuração das escolas que
    ...                estão autorizadas a receber matrícula             
    [Tags]             Escola Autorizada A Receber Matrícula | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Operação"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Escola Autorizada A Receber Matrícula"
    Em Escola Autorizada A Receber Matrícula, em Tipo de Estabelecimento, selecionar "ESCOLA"
    Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "EPG ALFREDO VOLPI"
    Clicar em Pesquisar
    Em Escola Autorizada A Receber Matrícula, verificar se as opções estão selecionadas, e selecionar caso não estejam
    Clicar em Salvar
    Clicar em OK no Modal
    Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "EPG ALFREDO VOLPI"
    Clicar em Pesquisar
    Em Escola Autorizada A Receber Matrícula, verificar se as opções estão selecionadas, e selecionar caso não estejam
    Clicar em Salvar
    Clicar em OK no Modal
    Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1° SEMESTRE"
    Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "EPG CRISPINIANO SOARES"
    Clicar em Pesquisar
    Em Escola Autorizada A Receber Matrícula, verificar se as opções estão selecionadas, e selecionar caso não estejam
    Clicar em Salvar
    Clicar em OK no Modal
    Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 2° SEMESTRE"
    Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "EPG CRISPINIANO SOARES"
    Clicar em Pesquisar
    Em Escola Autorizada A Receber Matrícula, verificar se as opções estão selecionadas, e selecionar caso não estejam
    Clicar em Salvar
    Clicar em OK no Modal
    Em Escola Autorizada A Receber Matrícula, em Tipo de Estabelecimento, selecionar "ESCOLA"
    Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "EPG ALFREDO VOLPI"
    Clicar em Pesquisar
    Em Escola Autorizada A Receber Matrícula, verificar se as opções foram salvas corretamente
    Clicar em Salvar
    Clicar em OK no Modal
    Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "EPG ALFREDO VOLPI"
    Clicar em Pesquisar
    Em Escola Autorizada A Receber Matrícula, verificar se as opções foram salvas corretamente
    Clicar em Salvar
    Clicar em OK no Modal
    Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1° SEMESTRE"
    Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "EPG CRISPINIANO SOARES"
    Clicar em Pesquisar
    Em Escola Autorizada A Receber Matrícula, verificar se as opções foram salvas corretamente
    Clicar em Salvar
    Clicar em OK no Modal
    Em Escola Autorizada A Receber Matrícula, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 2° SEMESTRE"
    Em Escola Autorizada A Receber Matrícula, em Escola, selecionar "EPG CRISPINIANO SOARES"
    Clicar em Pesquisar
    Em Escola Autorizada A Receber Matrícula, verificar se as opções foram salvas corretamente
    Clicar em Salvar
    Clicar em OK no Modal

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
    Entrar na funcionalidade "Justificativas da Pré-matrícula"
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "CANCELAMENTO"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA DE "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Editar
    Em Edição de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA EDITADO"
    Em Edição de Justificativas da Pré-Matrícula, clicar em Alterar
    Em Edição de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa editada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa editada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Excluir
    Em Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "CANCELAMENTO"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA PARA "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "DETERMINAÇÃO LEGAL"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA DE "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Editar
    Em Edição de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA EDITADO"
    Em Edição de Justificativas da Pré-Matrícula, clicar em Alterar
    Em Edição de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa editada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa editada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Excluir
    Em Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "DETERMINAÇÃO LEGAL"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA PARA "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "DESFAZER AÇÃO"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA DE "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Editar
    Em Edição de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA EDITADO"
    Em Edição de Justificativas da Pré-Matrícula, clicar em Alterar
    Em Edição de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa editada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa editada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Excluir
    Em Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "DESFAZER AÇÃO"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA PARA "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "INDEFERIMENTO"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA DE "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Editar
    Em Edição de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA EDITADO"
    Em Edição de Justificativas da Pré-Matrícula, clicar em Alterar
    Em Edição de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa editada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa editada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Excluir
    Em Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "INDEFERIMENTO"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA PARA "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "PAUSADO"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA DE "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Editar
    Em Edição de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA EDITADO"
    Em Edição de Justificativas da Pré-Matrícula, clicar em Alterar
    Em Edição de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa editada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa editada foi salva
    Em Justificativas da Pré-Matrícula, no resultado, clicar em Ações e Excluir
    Em Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "PAUSADO"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA PARA "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    Em Justificativas da Pré-Matrícula, clicar em Cadastrar
    Em Cadastro de Justificativas da Pré-Matrícula, em Tipo de Situação, selecionar "VAGA OFERTADA"
    Em Cadastro de Justificativas da Pré-Matrícula, em Justificativa, inserir "TESTE DE JUSTIFICATIVA DE "
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em Salvar
    Em Cadastro de Justificativas da Pré-Matrícula, clicar em OK no Modal
    Em Justificativas da Pré-Matrícula, em Justificativa, inserir a justificativa cadastrada
    Em Justificativas da Pré-Matrícula, clicar em Pesquisar
    Em Justificativas da Pré-Matrícula, verificar se a justificativa cadastrada foi salva
    
Cenário 31: Funcionalidade - Cadastro: Layout do Portal de Inscrições e Transferências
    [Documentation]    Esse teste efetua o cadastro e exclusão do Portal
    ...                Online de Matrícula            
    [Tags]             Layout do Portal de Inscrições e Transferências | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Layout do Portal de Inscrições e Transferências"
    Em Layout do Portal, clicar em Cadastrar
    Em Layout do Portal, Página Inicial, em Ano Letivo, selecionar o ano subsequente
    Em Layout do Portal, Página Inicial, em Descrição do Processo, inserir "LAYOUT PORTAL AUTOMAÇÃO"
    Em Layout do Portal, Página Inicial, no Banner Inicial Web, inserir uma imagem
    Em Layout do Portal, Página Inicial, no Banner Inicial Web, inserir a data "01/01/2024"
    Em Layout do Portal, Página Inicial, no Banner Inicial Web, clicar em Inserir
    Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, inserir uma imagem
    Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, inserir a data "31/12/2024"
    Em Layout do Portal, Página Inicial, no Banner Inicial Móvel, clicar em Inserir
    Em Layout do Portal, Página Inicial, clicar em Salvar e Próximo
    Em Layout do Portal, Informações Importantes, em Informações Gerais selecionar "EDUCAÇÃO INFANTIL"
    Em Layout do Portal, Informações Importantes, em Descrição, inserir "TESTE DESCRIÇÃO AUTOMACAO "
    Em Layout do Portal, Informações Importantes, clicar em Inserir
    Em Layout do Portal, Informações Importantes, em Informações Gerais selecionar "ENSINO FUNDAMENTAL"
    Em Layout do Portal, Informações Importantes, em Descrição, inserir "TESTE DESCRIÇÃO AUTOMACAO "
    Em Layout do Portal, Informações Importantes, clicar em Inserir
    Em Layout do Portal, Informações Importantes, clicar em Salvar e Próximo
    Em Layout do Portal, Layout Inscrição, selecionar os campos conforme o ambiente de produção
    Em Layout do Portal, Layout Inscrição, clicar em Salvar e Próximo
    Em Layout do Portal, Layout Transferência, clicar em Salvar e Próximo
    Em Layout do Portal, Observações Importantes, selecionar a Etapa "EDUCAÇÃO INFANTIL"
    Em Layout do Portal, Observações Importantes, selecionar o curso "PRÉ-ESCOLA"
    Em Layout do Portal, Observações Importantes, selecionar em inscrição "INSCRIÇÃO"
    Em Layout do Portal, Observações Importantes, selecionar em vaga "SIM"
    Em Layout do Portal, Observações Importantes, em Observações inserir "TESTE OBSERVAÇÃO AUTOMACAO "
    Em Layout do Portal, Observações Importantes, clicar em Inserir
    Em Layout do Portal, Observações Importantes, selecionar a Etapa "ENSINO FUNDAMENTAL"
    Em Layout do Portal, Observações Importantes, selecionar o curso "CICLO II"
    Em Layout do Portal, Observações Importantes, selecionar em inscrição "INSCRIÇÃO"
    Em Layout do Portal, Observações Importantes, selecionar em vaga "SIM"
    Em Layout do Portal, Observações Importantes, em Observações inserir "TESTE OBSERVAÇÃO AUTOMACAO "
    Em Layout do Portal, Observações Importantes, clicar em Inserir
    Em Layout do Portal, Observações Importantes, clicar em Salvar
    Em Layout do Portal, Observações Importantes, clicar em OK no Modal
    Em Layout do Portal, em Ano Letivo, selecionar "2024"
    Em Layout do Portal, clicar em Pesquisar
    Em Layout do Portal, clicar em Ações e Excluir
    Em Layout do Portal, clicar em OK no modal
    Em Layout do Portal, em Ano Letivo, selecionar "2024"
    Em Layout do Portal, em Descrição do Processo, inserir a descrição criada
    Em Layout do Portal, clicar em Pesquisar
    Em Layout do Portal, verificar se o Layout foi excluído

Cenário 32: Funcionalidade - Edição: Layout do Portal de Inscrições e Transferências
    [Documentation]    Esse teste efetua a edição e verificação das informações no 
    ...                Portal Online de Matrícula            
    [Tags]             Layout do Portal de Inscrições e Transferências | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Layout do Portal de Inscrições e Transferências"
    Em Layout do Portal, em Ano Letivo, selecionar "2022"
    Em Layout do Portal, clicar em Pesquisar
    Em Layout do Portal, clicar em Ações e Continuar Configuração
    Em Layout do Portal, Página Inicial, clicar em Salvar e Próximo
    Em Layout do Portal, Informações Importantes, editar o texto da etapa Educação Infantil
    Em Layout do Portal, Informações Importantes, editar o texto da etapa Ensino Fundamental
    Em Layout do Portal, Informações Importantes, clicar em Salvar e Próximo
    Em Layout do Portal, Layout Inscrição, verificar se os campos estão marcados conforme o ambiente de produção
    Em Layout do Portal, Layout Inscrição, clicar em Salvar e Próximo
    Em Layout do Portal, Layout Transferência, clicar em Salvar e Próximo
    Em Layout do Portal, Observações Importantes, editar o texto da etapa Educação Infantil
    Em Layout do Portal, Observações Importantes, selecionar a Etapa "ENSINO FUNDAMENTAL"
    Em Layout do Portal, Observações Importantes, selecionar o curso "CICLO II"
    Em Layout do Portal, Observações Importantes, selecionar em inscrição "INSCRIÇÃO"
    Em Layout do Portal, Observações Importantes, selecionar em vaga "SIM"
    Em Layout do Portal, Observações Importantes, em Observações inserir "TESTE OBSERVAÇÃO AUTOMACAO "
    Em Layout do Portal, Observações Importantes, clicar em Inserir
    Em Layout do Portal, Observações Importantes, editar o texto da etapa Ensino Fundamental
    Em Layout do Portal, Observações Importantes, clicar em Salvar
    Em Layout do Portal, Observações Importantes, clicar em OK no Modal

    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, verificar se o texto exibido é igual ao cadastrado em Educação Infantil
    No Portal, fechar o modal de informações importantes
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, verificar se o texto exibido é igual ao cadastrado em Ensino Fundamental
    No Portal, fechar o modal de informações importantes
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07032018"
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
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "07/03/2018"
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

    No Portal, clicar em "Consultar Solicitação"
    No Portal, em Consultar Solicitação, selecionar a nacionalidade "Brasileiro"
    No Portal, em Consultar Solicitação, em Protocolo inserir o protocolo do comprovande de matrícula    
    No Portal, em Consultar Solicitação, em CPF inserir o CPF do responsavel cadastrado
    No Portal, em Consultar Solicitação, em Data de Nascimento inserir data de nascimento do responsavel cadastrado
    No Portal, em Consultar Solicitação, clicar em Pesquisar
    No Portal, em Consultar Solicitação, no resultado clicar em Emitir 2ª Via
    No Portal, no Comprovante, verificar se o texto foi salvo para a etapa Educação Infantil    
    
Cenário 33: Funcionalidade Processo de Demanda Inicial - Infantil
    [Documentation]    Esse teste efetua a configuração do Processo de Demanda
    ...                Inicial e Contínuo para a etapas/modalidade Infantil
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO INFANTIL INICIAL"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO INICIAL"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CRECHE - BERCÁRIO I"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2020"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/07/2021"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CRECHE - BERCÁRIO II"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2019"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2020"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CRECHE - MATERNAL"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2018"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2019"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "PRÉ-ESCOLA - ESTÁGIO I"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2017"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2018"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "PRÉ-ESCOLA - ESTÁGIO II"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2016"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2017"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Seleção de Escolas, em Selecionar Diversas Escolas, selecionar "NÃO"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Verifica Dados, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite alterar escolas, selecionar "SIM"
    Em Processo de Demanda, clicar em Salvar
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Em Processo de Demanda, clicar em Pesquisar
    Em Processo de Demanda, verificar se o processo foi encontrado na pesquisa
    
Cenário 34: Funcionalidade Processo de Demanda Inicial - Fundamental
    [Documentation]    Esse teste efetua a configuração do Processo de Demanda
    ...                Inicial e Contínuo para a etapas/modalidade Fundamental
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO FUNDAMENTAL INICIAL"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO INICIAL"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO I - 1º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2015"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/07/2016"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO I - 2º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2014"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2015"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO I - 3º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2013"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2014"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO II - 4º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2012"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2013"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO II - 5º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2011"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2012"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Seleção de Escolas, em Selecionar Diversas Escolas, selecionar "NÃO"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Verifica Dados, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite alterar escolas, selecionar "SIM"
    Em Processo de Demanda, clicar em Salvar
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Em Processo de Demanda, clicar em Pesquisar
    Em Processo de Demanda, verificar se o processo foi encontrado na pesquisa

Cenário 35: Funcionalidade Processo de Demanda Inicial - EJA
    [Documentation]    Esse teste efetua a configuração do Processo de Demanda
    ...                Inicial e Contínuo para a etapas/modalidade Fundamental
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO EJA 1º SEMESTRE INICIAL"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "NÃO"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO INICIAL"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "TODOS"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/01/1900"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/12/2005"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Seleção de Escolas, em Selecionar Diversas Escolas, selecionar "NÃO"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Verifica Dados, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite alterar escolas, selecionar "SIM"
    Em Processo de Demanda, clicar em Salvar
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Em Processo de Demanda, clicar em Pesquisar
    Em Processo de Demanda, verificar se o processo foi encontrado na pesquisa
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO EJA 2º SEMESTRE INICIAL"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "NÃO"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO INICIAL"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "TODOS"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/01/1900"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/12/2005"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Seleção de Escolas, em Selecionar Diversas Escolas, selecionar "NÃO"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Verifica Dados, selecionar "SIM"
    Em Processo de Demanda, Gestão Pré-Matrícula, em Permite alterar escolas, selecionar "SIM"
    Em Processo de Demanda, clicar em Salvar
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Em Processo de Demanda, clicar em Pesquisar
    Em Processo de Demanda, verificar se o processo foi encontrado na pesquisa

Cenário 36: Funcionalidade Processo de Demanda Contínuo - Infantil
    [Documentation]    Esse teste efetua a configuração do Processo de Demanda
    ...                Inicial e Contínuo para a etapas/modalidade Infantil
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO INFANTIL CONTÍNUO"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO CONTÍNUO"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CRECHE - BERCÁRIO I"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2020"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/07/2021"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CRECHE - BERCÁRIO II"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2019"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2020"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CRECHE - MATERNAL"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2018"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2019"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "PRÉ-ESCOLA - ESTÁGIO I"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2017"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2018"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO INFANTIL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "PRÉ-ESCOLA - ESTÁGIO II"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2016"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2017"
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
    
Cenário 37: Funcionalidade Processo de Demanda Contínuo - Fundamental
    [Documentation]    Esse teste efetua a configuração do Processo de Demanda
    ...                Inicial e Contínuo para a etapas/modalidade Fundamental
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO FUNDAMENTAL CONTÍNUO"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO CONTÍNUO"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO I - 1º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2015"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/07/2016"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO I - 2º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2014"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2015"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO I - 3º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2013"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2014"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO II - 4º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2012"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2013"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Mesma Escola, selecionar "SIM"
    Em Processo de Demanda, clicar em Incluir
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "ENSINO FUNDAMENTAL"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "CICLO II - 5º ANO"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/04/2011"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/03/2012"
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

Cenário 38: Funcionalidade Processo de Demanda Contínuo - EJA
    [Documentation]    Esse teste efetua a configuração do Processo de Demanda
    ...                Inicial e Contínuo para a etapas/modalidade EJA
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO EJA 1º SEMESTRE CONTÍNUO"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO CONTÍNUO"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
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
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "AUTOMACAO EJA 2º SEMESTRE CONTÍNUO"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO CONTÍNUO"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 2º SEMESTRE"
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

Cenário 39: Funcionalidade Processo de Demanda - Edição e Exclusão
    [Documentation]    Esse teste efetua a configuração do Processo de Demanda
    ...                Inicial e Contínuo para a etapas/modalidade EJA
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "PROCESSO DEMANDA"
    Em Processo de Demanda, em Resolução, inserir "RESOLUÇÃO TESTE"
    Em Processo de Demanda, em Ano Letivo, selecionar "2022"
    Em Processo de Demanda, em Reserva Técnica de Vagas, selecionar "NÃO"
    Em Processo de Demanda, em Critérios de Classificação por Escola, selecionar "SIM"
    Em Processo de Demanda, em Processamento Único da Classificação, selecionar "SIM"
    Em Processo de Demanda, em Tipo de Demanda, selecionar "CADASTRO CONTÍNUO"
    Em Processo de Demanda, Critérios, em Estabelecimento Destino, selecionar "ESCOLA"
    Em Processo de Demanda, Critérios, em Esfera Destino, selecionar "MUNICIPAL"
    Em Processo de Demanda, Critérios, em Etapa/Modalidade, selecionar "EDUCAÇÃO DE JOVENS E ADULTOS 1º SEMESTRE"
    Em Processo de Demanda, Critérios, em Ciclo de Destino, selecionar "TODOS"
    Em Processo de Demanda, Critérios, em Lista de Espera, selecionar "NÃO PERMITE LISTA DE ESPERA"
    Em Processo de Demanda, Critérios, em Data Inicial Agrupamento, inserir "01/01/1900"
    Em Processo de Demanda, Critérios, em Data Final Agrupamento, inserir "31/12/2005"
    Em Processo de Demanda, Critérios, em Permite Troca, selecionar "NÃO"
    Em Processo de Demanda, Critérios, em Tipo de Busca, selecionar "GEORREFERENCIAMENTO LISTA"
    Em Processo de Demanda, Critérios, em Autorização de Matrícula, selecionar "SIM"
    Em Processo de Demanda, Critérios, em Permite Inscrição Matriculado, selecionar "NÃO"
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
    Em Processo de Demanda, nos resultados, clicar em Ações e Editar
    Em Processo de Demanda, na Descrição, inserir "PROCESSO DEMANDA EDITADO"
    Em Processo de Demanda, clicar em Salvar
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Em Processo de Demanda, clicar em Pesquisar
    Em Processo de Demanda, verificar se o processo foi encontrado na pesquisa
    Em Processo de Demanda, nos resultados, clicar em Ações e Excluir
    Em Processo de Demanda, clicar em Sim no modal
    Em Processo de Demanda, clicar em OK no modal
    Em Processo de Demanda, em Descrição, inserir o título do processo cadastrado
    Em Processo de Demanda, clicar em Pesquisar
    Em Processo de Demanda, verificar se o processo não foi encontrado na pesquisa

Cenário 40: Processo de Demanda para Programação de Processo
    [Documentation]    Esse teste efetua um cadastro de processo para ser editado
    ...                e excluído na Programação de Processo
    [Tags]             Processo de Demanda | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Processo de Demandas"
    Em Processo de Demanda, clicar em Cadastrar
    Em Processo de Demanda, na Descrição, inserir "TESTE PARA PROGRAMAÇÃO DE PROCESSO"
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

Cenário 41: Funcionalidade Programação de Processo - Infantil Inicial
    [Documentation]    Esse teste efetua o cadastro da Programação de Processo de Pré-Matrícula
    ...                para o Portal (todas as etapas), e de transferência para o GIER                  
    [Tags]             Programação de Processo - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO INFANTIL INICIAL"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/01/2022"
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Portal de Inscrições"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO INFANTIL INICIAL"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados

Cenário 42: Funcionalidade Programação de Processo - Fundamental Inicial
    [Documentation]    Esse teste efetua o cadastro da Programação de Processo de Pré-Matrícula
    ...                para o Portal (todas as etapas), e de transferência para o GIER                  
    [Tags]             Programação de Processo - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO FUNDAMENTAL INICIAL"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/01/2022"
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Portal de Inscrições"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO FUNDAMENTAL INICIAL"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados

Cenário 43: Funcionalidade Programação de Processo - EJA Inicial
    [Documentation]    Esse teste efetua o cadastro da Programação de Processo de Pré-Matrícula
    ...                para o Portal (todas as etapas), e de transferência para o GIER                  
    [Tags]             Programação de Processo - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO EJA 1º SEMESTRE INICIAL"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/01/2022"
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Portal de Inscrições"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO EJA 1º SEMESTRE INICIAL"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO EJA 2º SEMESTRE INICIAL"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/01/2022"
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Portal de Inscrições"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO EJA 2º SEMESTRE INICIAL"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados

Cenário 44: Funcionalidade Programação de Processo - Infantil Contínuo
    [Documentation]    Esse teste efetua o cadastro da Programação de Processo de Pré-Matrícula
    ...                para o Portal (todas as etapas), e de transferência para o GIER                  
    [Tags]             Programação de Processo - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO INFANTIL CONTÍNUO"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/01/2022"
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Portal de Inscrições"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO INFANTIL CONTÍNUO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados

Cenário 45: Funcionalidade Programação de Processo - Fundamental Contínuo
    [Documentation]    Esse teste efetua o cadastro da Programação de Processo de Pré-Matrícula
    ...                para o Portal (todas as etapas), e de transferência para o GIER                  
    [Tags]             Programação de Processo - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO FUNDAMENTAL CONTÍNUO"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/01/2022"
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Portal de Inscrições"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO FUNDAMENTAL CONTÍNUO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados

Cenário 46: Funcionalidade Programação de Processo - EJA Contínuo
    [Documentation]    Esse teste efetua o cadastro da Programação de Processo de Pré-Matrícula
    ...                para o Portal (todas as etapas), e de transferência para o GIER                  
    [Tags]             Programação de Processo - EJA | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO EJA 1º SEMESTRE CONTÍNUO"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/01/2022"
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Portal de Inscrições"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO EJA 1º SEMESTRE CONTÍNUO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO EJA 2º SEMESTRE CONTÍNUO"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/01/2022"
    Em Programação de Processo, em Data Fim, inserir "31/12/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo cadastrado
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Portal de Inscrições"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "AUTOMACAO EJA 2º SEMESTRE CONTÍNUO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados

Cenário 47: Funcionalidade Programação de Processo - Edição e Exclusão
    [Documentation]    Esse teste efetua o cadastro da Programação de Processo de Pré-Matrícula
    ...                para o Portal (todas as etapas), e de transferência para o GIER                  
    [Tags]             Programação de Processo - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no eixo "Configuração"
    Entrar no módulo "Gestão de Demandas"
    Entrar na funcionalidade "Programação de Processo"
    Em Programação de Processo, clicar em Cadastrar
    Em Programação de Processo, em Ano Letivo, selecionar "2022"
    Em Programação de Processo, em Tipo de Processo, selecionar "PREMATRICULA"
    Em Programação de Processo, em Processo, selecionar o processo "TESTE PARA PROGRAMAÇÃO DE PROCESSO"
    Em Programação de Processo, em Ambiente Utilizado, selecionar "Gier"
    Em Programação de Processo, em Data Inicio, inserir "01/09/2022"
    Em Programação de Processo, em Data Fim, inserir "30/09/2022"
    Em Programação de Processo, em Hora Inicio, inserir "00:00"
    Em Programação de Processo, em Hora Fim, inserir "22:22"
    Em Programação de Processo, em Dias da Semana, selecionar "Todos"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "TESTE PARA PROGRAMAÇÃO DE PROCESSO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, em Data Inicio, inserir "01/10/2022"
    Em Programação de Processo, em Data Fim, inserir "30/10/2022"
    Em Programação de Processo, em Hora Fim, inserir "23:59"
    Em Programação de Processo, em Dias da Semana, selecionar "Segunda-Feira"
    Em Programação de Processo, clicar em Inserir
    Em Programação de Processo, clicar em OK no modal
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "TESTE PARA PROGRAMAÇÃO DE PROCESSO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Editar
    Em Programação de Processo, verificar se a data "24/10/2022" foi inserida 
    Em Programação de Processo, verificar se o horário "23:59" foi inserida 
    Clicar em Voltar
    Em Programação de Processo, em Processo, selecionar o processo "TESTE PARA PROGRAMAÇÃO DE PROCESSO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se o processo aparece nos resultados
    Em Programação de Processo, clicar em Ações e Excluir
    Em Programação de Processo, clicar em Sim no modal
    Em Programação de Processo, em Processo, selecionar o processo "TESTE PARA PROGRAMAÇÃO DE PROCESSO"
    Em Programação de Processo, clicar em Pesquisar
    Em Programação de Processo, verificar se é exibida a mensagem "NENHUM REGISTRO FOI ENCONTRADO"

Cenário 48: Funcionalidade Portal - Gier - Infantil Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Gier - Infantil Inicial | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2018"
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
    No Portal, em Cadastro do Aluno, em Data de Emissão da Certidão, inserir "07/03/2018"
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
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados do Responsável
    Em Cadastro de Pessoa, no campo Nome, inserir o nome cadastrado
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

Cenário 50: Funcionalidade Portal - Gier - Fundamental Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Gier - Fundamental Inicial | Fluxo Positivo
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
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Responsável, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Responsável, em RNE, inserir um RNE válido
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
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados do Responsável
    Em Cadastro de Pessoa, no campo Nome, inserir o nome cadastrado
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

Cenário 51: Funcionalidade Portal - Gier - EJA Inicial
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal > Gier - EJA Inicial | Fluxo Positivo
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

Cenário 52: Funcionalidade Gier Portal - Infantil Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal - Infantil Contínuo | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2018"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
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
    Pesquisar "EPG CRISPINIANO SOARES" e selecionar o primeiro resultado
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
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Dados do Responsável
    Em Cadastro de Pessoa, no campo Nome, inserir o nome cadastrado
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
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2018"
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
    No Portal, em Contato, em Telefone 1, inserir o telefone cadastrado
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
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Indeferir
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, selecionar "Outros"
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Salvar
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Sim
    Em Gestão de Pré-Matrícula, verificar se o aluno foi indeferido
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Ok
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/2018"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG CRISPINIANO SOARES"
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
    No Portal, em Contato, em Telefone 1, inserir o telefone cadastrado
    No Portal, clicar nos campos de declarações
    No Portal, no modal de alerta, clicar em Sim 
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela

Cenário 53: Funcionalidade Gier Portal - Fundamental Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             Portal - Fundamental Contínuo | Fluxo Positivo
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
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Indeferir
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, selecionar "Outros"
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Salvar
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Sim
    Em Gestão de Pré-Matrícula, verificar se o aluno foi indeferido
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Ok
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
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela

Cenário 54: Funcionalidade Portal Gier - EJA Contínuo
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula
    ...                no Portal, para todas as etapas/modalidades.                
    [Tags]             EJA - Fundamental Contínuo | Fluxo Positivo
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
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Indeferir
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, selecionar "Outros"
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, inserir "TESTE JUSTIFICATIVA AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Salvar
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Sim
    Em Gestão de Pré-Matrícula, verificar se o aluno foi indeferido
    Em Gestão de Pré-Matrícula, em Justificativa de Indeferimento, clicar em Ok
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
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela

Cenário 55: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (Infantil Inicial) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "06/06/2016"
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
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Pré-Escola-Estágio II"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "05/06/2016"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Pré-Escola-Estágio II"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera

Cenário 56: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (Fundamental Inicial) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "02/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "5º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Responsável, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Responsável, em RNE, inserir um RNE válido
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
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "01/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "2º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Responsável, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Responsável, em RNE, inserir um RNE válido
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera

Cenário 57: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (EJA Inicial) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
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
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-Semestre 1"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG CRISPINIANO SOARES"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera
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
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-Semestre 1"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG CRISPINIANO SOARES"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera

Cenário 58: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (Infantil Contínuo) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "08/06/2016"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
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
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Pré-Escola-Estágio II"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/06/2016"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Pré-Escola-Estágio II"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera

Cenário 59: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (Fundamental Contínuo) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "06/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "5º Ano"
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
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "05/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "5º Ano"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera

Cenário 60: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (EJA Contínuo) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "01/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
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
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "01/03/1996"
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
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-Semestre 1"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG CRISPINIANO SOARES"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-Semestre 1"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG CRISPINIANO SOARES"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera

Cenário 55: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (Infantil Inicial) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "06/06/2016"
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
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Pré-Escola-Estágio II"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "05/06/2016"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Pré-Escola-Estágio II"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera

Cenário 61: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (Fundamental Inicial) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "02/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "5º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Responsável, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Responsável, em RNE, inserir um RNE válido
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
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL INICIAL"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "01/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "2º Ano"
    No Portal, clicar em Selecionar Escolas
    No Portal, clicar em Próximo
    No Portal, em Cadastro do Responsável, em Nacionalidade, selecionar "Estrangeiro"
    No Portal, em Cadastro do Responsável, em País de Nascimento, selecionar "PORTUGAL"
    No Portal, em Cadastro do Responsável, em RNE, inserir um RNE válido
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera

Cenário 62: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (EJA Inicial) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
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
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-Semestre 1"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG CRISPINIANO SOARES"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera
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
    No Portal, em Cadastro do Aluno, em Nacionalidade, selecionar "Brasileira"
    No Portal, em Contato, em Telefone 1, inserir um telefone válido
    No Portal, clicar nos campos de declarações
    No Portal, clicar em Concluir Inscrição
    No Portal, verificar se o comprovante é exibido em tela
    No Portal, gravar o número de protocolo gerado
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-Semestre 1"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG CRISPINIANO SOARES"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO INICIAL', verificar se o aluno entrou em último lugar na fila de espera

Cenário 63: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (Infantil Contínuo) - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "08/06/2016"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
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
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Pré-Escola-Estágio II"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    Entrar no Portal
    No Portal, clicar em "Educação Infantil"
    No Portal, selecionar o processo para a etapa "INFANTIL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/06/2016"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Pré-Escola-Estágio II"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera

Cenário 64: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (Fundamental Contínuo) - Escola
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "08/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "5º Ano"
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
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123-140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "5º Ano"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Ensino Fundamental"
    No Portal, selecionar o processo para a etapa "FUNDAMENTAL CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "08/04/2011"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
    No Portal, em Escolha da Escola, em Número da Residência, inserir "33"
    No Portal, clicar em Pesquisar Escolas
    No Portal, selecionar a escola "EPG ALFREDO VOLPI"
    No Portal, em Ano/Ciclo selecionar "5º Ano"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em penúltimo lugar na fila de espera

Cenário 65: Funcionalidade Gestão de Pré-Matrícula: Lista de Espera (EJA Contínuo) - Escola
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "01/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
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
    No Portal, em Cadastro do Responsável, em Data de Nascimento, inserir "01/03/1996"
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
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-Semestre 1"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera
    Entrar no Portal
    No Portal, clicar em "Educação de Jovens e Adultos"
    No Portal, selecionar o processo para a etapa "EJA 2º SEMESTRE CONTÍNUO"
    No Portal, clicar em Iniciar inscrição
    No Portal, em Escolha da Escola, em Data de Nascimento, inserir "07/03/1996"
    No Portal, em Escolha da Escola, em CEP, inserir "07123140"
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
    Verificar se aparece o texto "Estrutura"
    Pesquisar "CRISPINIANO" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-Semestre 1"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, em 'CADASTRO CONTÍNUO', verificar se o aluno entrou em último lugar na fila de espera

Cenário 66: Funcionalidade Gestão de Pré-Matrícula: Ações - Escola
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão Escolar"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Registro de Atendimento
    Em Gestão de Pré-Matrícula, em Histórico de Contato, selecionar Contato com Sucesso
    Em Gestão de Pré-Matrícula, em Histórico de Contato, em Informações, inserir "TESTE INFORMAÇÃO AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Histórico de Contato, clicar em Salvar
    Em Gestão de Pré-Matrícula, em Histórico de Contato, clicar em OK
    Em Gestão de Pré-Matrícula, em Histórico de Contato, verificar se o registro foi salvo
    Em Gestão de Pré-Matrícula, em Histórico de Contato, fechar o modal
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Origem e Documentação
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em Rede de Origem, selecionar "Municipal"
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em Escola Origem, inserir "ESCOLA ORIGEM AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em Estado Origem, selecionar "SP"
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em País Origem, selecionar "Brasil"
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em Documentos Aprensentados, selecionar CPF e RG
    Em Gestão de Pré-Matrícula, em Origem e Documentação, clicar em Salvar
    Em Gestão de Pré-Matrícula, em Origem e Documentação, clicar em Ok
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Origem e Documentação
    Em Gestão de Pré-Matrícula, em Origem e Documentação, verificar se os campos foram salvos corretamente
    Em Gestão de Pré-Matrícula, em Origem e Documentação, fechar o modal
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Histórico de Alterações
    Em Gestão de Pré-Matrícula, em Histórico de Alterações, verificar se o registro foi salvo
    Em Gestão de Pré-Matrícula, em Histórico de Alterações, clicar em Fechar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Determinação Legal
    Em Gestão de Pré-Matrícula, em Determinação Legal, selecionar "TESTE AUTOMAÇÃO QA"
    Em Gestão de Pré-Matrícula, em Determinação Legal, em Observações, inserir "OBSERVAÇÃO DETERMINAÇÃO LEGAL AUTOMAÇÃO"
    Em Gestão de Pré-Matrícula, em Determinação Legal, clicar em Salvar
    Em Gestão de Pré-Matrícula, em Escolas Selecionadas, clicar em Ações e Cancelar Indicação
    Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, selecionar "OUTROS"
    Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, em Observações, inserir "OBSERVAÇÃO CANCELAMENTO AUTOMAÇÃO"
    Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, clicar em Salvar

Cenário 67: Funcionalidade Gestão de Pré-Matrícula: Ações - Secretaria
    [Documentation]    Esse teste efetua a solicitação e consulta de matrícula  
    ...                dentro do GIER, para todas as etapas/modalidades.                
    [Tags]             Gestão de Pré-Matrícula | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Gestão de Educandos"
    Entrar na funcionalidade "Gestão de Pré-matrícula"
    Em Gestão de Pré-Matrícula, em Ciclo Destino, selecionar "Ciclo II-5º Ano"
    Em Gestão de Pré-Matrícula, em Escola Destino, selecionar "EPG ALFREDO VOLPI"
    Em Gestão de Pré-Matrícula, em Situação, selecionar "Aguardando Análise"
    Em Gestão de Pré-Matrícula, clicar em Pesquisar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Registro de Atendimento
    Em Gestão de Pré-Matrícula, em Histórico de Contato, selecionar Contato com Sucesso
    Em Gestão de Pré-Matrícula, em Histórico de Contato, em Informações, inserir "TESTE INFORMAÇÃO AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Histórico de Contato, clicar em Salvar
    Em Gestão de Pré-Matrícula, em Histórico de Contato, clicar em OK
    Em Gestão de Pré-Matrícula, em Histórico de Contato, verificar se o registro foi salvo
    Em Gestão de Pré-Matrícula, em Histórico de Contato, fechar o modal
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Origem e Documentação
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em Rede de Origem, selecionar "Municipal"
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em Escola Origem, inserir "ESCOLA ORIGEM AUTOMACAO"
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em Estado Origem, selecionar "SP"
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em País Origem, selecionar "Brasil"
    Em Gestão de Pré-Matrícula, em Origem e Documentação, em Documentos Aprensentados, selecionar CPF e RG
    Em Gestão de Pré-Matrícula, em Origem e Documentação, clicar em Salvar
    Em Gestão de Pré-Matrícula, em Origem e Documentação, clicar em Ok
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Origem e Documentação
    Em Gestão de Pré-Matrícula, em Origem e Documentação, verificar se os campos foram salvos corretamente
    Em Gestão de Pré-Matrícula, em Origem e Documentação, fechar o modal
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Histórico de Alterações
    Em Gestão de Pré-Matrícula, em Histórico de Alterações, verificar se o registro foi salvo
    Em Gestão de Pré-Matrícula, em Histórico de Alterações, clicar em Fechar
    Em Gestão de Pré-Matrícula, no Resultado, clicar em Ações e Cancelar Inscrição
    Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, selecionar "OUTROS"
    Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, em Observações, inserir "OBSERVAÇÃO CANCELAMENTO AUTOMAÇÃO"
    Em Gestão de Pré-Matrícula, em Justificativa de Cancelamento, clicar em Salvar

Cenário 68: Funcionalidade Parâmetros do Processo de Transporte
    [Documentation]    Esse teste efetua o cadastro, configuração e edição
    ...                dos Parâmetros do Processo de Transporte                 
    [Tags]             Parâmetros do Processo de Transporte | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Configuração"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Parâmetros do Processo de Transporte"
    Em Parâmetros de Transporte, clicar em Cadastrar
    No cadastro de Parâmetros de Transporte, em Data Inicial, inserir "01/01/2023"
    No cadastro de Parâmetros de Transporte, em Data Final, inserir "31/12/2023"
    No cadastro de Parâmetros de Transporte, em Processo de Transporte, inserir "PROCESSO DE TRANSPORTE AUTOMACAO"
    No cadastro de Parâmetros de Transporte, em permite o deferimento e indeferimento pelas escolas, selecionar "Não"
    No cadastro de Parâmetros de Transporte, em utilizar o indeferimento automático, selecionar "Sim"
    No cadastro de Parâmetros de Transporte, em estruturas do indeferimento, selecionar "Escola"
    No cadastro de Parâmetros de Transporte, em permite a escolha de veículo, selecionar "Não"
    No cadastro de Parâmetros de Transporte, em retornar para o solicitante após o deferimento, selecionar "Sim"
    No cadastro de Parâmetros de Transporte, em solicitação de transporte para beneficiários fora da rede, selecionar "Sim"
    No cadastro de Parâmetros de Transporte, em Etapa/Modalidade, selecionar "Educação Infantil"
    No cadastro de Parâmetros de Transporte, em Curso, selecionar "Pré-Escola"
    No cadastro de Parâmetros de Transporte, clicar em Incluir
    No cadastro de Parâmetros de Transporte, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    No cadastro de Parâmetros de Transporte, em Curso, selecionar "Ciclo I"
    No cadastro de Parâmetros de Transporte, clicar em Incluir
    No cadastro de Parâmetros de Transporte, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    No cadastro de Parâmetros de Transporte, em Curso, selecionar "Ciclo II"
    No cadastro de Parâmetros de Transporte, clicar em Incluir
    No cadastro de Parâmetros de Transporte, em TEG, selecionar "Sim"
    No cadastro de Parâmetros de Transporte, em Distância entre a residência e a escola, inserir "2"
    No cadastro de Parâmetros de Transporte, em Parâmetro de Distância, selecionar "Carro"
    No cadastro de Parâmetros de Transporte, em Cálculo de Distância, selecionar "Roteirizada"
    No cadastro de Parâmetros de Transporte, em TEG Adaptado, selecionar "Sim"
    No cadastro de Parâmetros de Transporte, em Necessidades especiais incluídas, selecionar "Cadeirante"
    No cadastro de Parâmetros de Transporte, em Necessidades Especiais, clicar em Incluir
    No cadastro de Parâmetros de Transporte, em Necessidades especiais incluídas, selecionar "Deficiência Física - Cadeirante"
    No cadastro de Parâmetros de Transporte, em Necessidades Especiais, clicar em Incluir
    No cadastro de Parâmetros de Transporte, em grupo de campos, selecionar "Sim"
    No cadastro de Parâmetros de Transporte, clicar em Salvar
    No cadastro de Parâmetros de Transporte, clicar em OK no modal
    Em Parâmetros de Transporte, selecionar o ano "2023"
    Em Parâmetros de Transporte, clicar em Pesquisar
    Em Parâmetros de Transporte, verificar se o cadastro foi efetuado
    Em Parâmetros de Transporte, clicar em Ações e Editar
    No cadastro de Parâmetros de Transporte, em Processo de Transporte, inserir "PROCESSO DE TRANSPORTE EDITADO"
    No cadastro de Parâmetros de Transporte, clicar em Salvar
    No cadastro de Parâmetros de Transporte, clicar em OK no modal
    Em Parâmetros de Transporte, selecionar o ano "2023"
    Em Parâmetros de Transporte, clicar em Pesquisar
    Em Parâmetros de Transporte, verificar se o cadastro foi efetuado
    Em Parâmetros de Transporte, clicar em Ações e Inativar
    Em Parâmetros de Transporte, clicar em Sim no modal
    Em Parâmetros de Transporte, clicar em Ok no modal
    Em Parâmetros de Transporte, selecionar o ano "2023"
    Em Parâmetros de Transporte, clicar em Pesquisar
    Em Parâmetros de Transporte, verificar se o cadastro foi excluído

Cenário 69: Funcionalidade Tipos de Rotas
    [Documentation]    Esse teste verifica se é possível cadastrar, editar
    ...                editar e excluir uma Rota                
    [Tags]             Rotas | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Configuração"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Tipos de Rotas"
    Em Tipos de Rotas, clicar em Cadastrar
    Em Tipos de Rotas, em Descrição, inserir "TIPO DE ROTA AUTOMACAO QA"
    Em Tipos de Rotas, clicar em Salvar
    Em Tipos de Rotas, clicar em OK no modal
    Em Tipos de Rotas, em Descrição, inserir "TIPO DE ROTA AUTOMACAO QA"
    Em Tipos de Rotas, clicar em Pesquisar
    Em Tipos de Rotas, verificar se aparece o resultado "TIPO DE ROTA AUTOMACAO QA"
    Em Tipos de Rotas, nos resultado, clicar em Ações e Editar
    Em Tipos de Rotas, em Descrição, inserir "TIPO DE ROTA AUTOMACAO EDITADO QA"
    Em Tipos de Rotas, clicar em Salvar
    Em Tipos de Rotas, clicar em OK no modal
    Em Tipos de Rotas, em Descrição, inserir "TIPO DE ROTA AUTOMACAO EDITADO QA"
    Em Tipos de Rotas, clicar em Pesquisar
    Em Tipos de Rotas, verificar se aparece o resultado "TIPO DE ROTA AUTOMACAO EDITADO QA"
    Em Tipos de Rotas, nos resultado, clicar em Ações e Excluir
    Em Tipos de Rotas, clicar em Sim no modal 
    Em Tipos de Rotas, clicar em OK no modal
    Em Tipos de Rotas, clicar em Cadastrar
    Em Tipos de Rotas, em Descrição, inserir "TIPO DE ROTA AUTOMACAO QA"
    Em Tipos de Rotas, clicar em Salvar
    Em Tipos de Rotas, clicar em OK no modal
    Em Tipos de Rotas, clicar em OK no modal
    Em Tipos de Rotas, em Descrição, inserir "TIPO DE ROTA AUTOMACAO QA"
    Em Tipos de Rotas, clicar em Pesquisar
    Em Tipos de Rotas, verificar se aparece o resultado "TIPO DE ROTA AUTOMACAO QA"

Cenário 70: Funcionalidade Rotas
    [Documentation]    Esse teste verifica se é possível cadastrar, editar
    ...                editar e excluir uma Rota                
    [Tags]             Rotas | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Rotas"
    Em Rotas, clicar em Cadastrar
    Em Cadastrar Rota, selecionar o Tipo de Rota "TIPO DE ROTA AUTOMACAO Qa"
    Em Cadastrar Rota, em Nome, inserir "AUTOMACAO ROTA QA"
    Em Cadastrar Rota, em Ponto Inicial, inserir "AUTOMACAO PONTO INICIAL"
    Em Cadastrar Rota, em Ponto Final, inserir "AUTOMACAO PONTO FINAL"
    Em Cadastrar Rota, em Km, inserir "10"
    Em Cadastrar Rota, em Vincular Escolar a Rota, em Nome de Escola, inserir "VOLPI"
    Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Pesquisar
    Em Cadastrar Rota, em Vincular Escolar a Rota, selecionar a escola pesquisada
    Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Inserir
    Em Cadastrar Rota, em Vincular Escolar a Rota, em Nome de Escola, inserir "CRISPINIANO"
    Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Pesquisar
    Em Cadastrar Rota, em Vincular Escolar a Rota, selecionar a escola pesquisada
    Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Inserir
    Em Cadastrar Rota, clicar em Salvar
    Em Cadastrar Rota, clicar em OK no Modal
    Em Rotas, em Descrição, inserir "AUTOMACAO ROTA QA"
    Em Rotas, clicar em Pesquisar
    Em Rotas, verificar se a rota foi cadastrada
    Em Rotas, no Resultado da Busca, clicar em Ações e Editar
    Em Cadastrar Rota, em Nome, inserir "AUTOMACAO ROTA EDITADO QA"
    Em Cadastrar Rota, em Km, inserir "7"
    Em Cadastrar Rota, clicar em Salvar
    Em Cadastrar Rota, clicar em OK no Modal
    Em Rotas, em Descrição, inserir "AUTOMACAO ROTA EDITADO QA"
    Em Rotas, clicar em Pesquisar
    Em Rotas, verificar se a rota foi cadastrada
    Em Rotas, no Resultado da Busca, clicar em Ações e Excluir
    Em Rotas, clicar em Sim no modal
    Em Cadastrar Rota, clicar em OK no Modal
    Em Rotas, em Descrição, inserir "AUTOMACAO ROTA EDITADO QA"
    Em Rotas, clicar em Pesquisar
    Em Rotas, verificar se a rota foi excluída
    Em Rotas, clicar em Cadastrar
    Em Cadastrar Rota, selecionar o Tipo de Rota "TIPO DE ROTA AUTOMACAO QA"
    Em Cadastrar Rota, em Nome, inserir "AUTOMACAO ROTA"
    Em Cadastrar Rota, em Ponto Inicial, inserir "AUTOMACAO PONTO INICIAL"
    Em Cadastrar Rota, em Ponto Final, inserir "AUTOMACAO PONTO FINAL"
    Em Cadastrar Rota, em Km, inserir "10"
    Em Cadastrar Rota, em Vincular Escolar a Rota, em Nome de Escola, inserir "VOLPI"
    Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Pesquisar
    Em Cadastrar Rota, em Vincular Escolar a Rota, selecionar a escola pesquisada
    Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Inserir
    Em Cadastrar Rota, em Vincular Escolar a Rota, em Nome de Escola, inserir "CRISPINIANO"
    Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Pesquisar
    Em Cadastrar Rota, em Vincular Escolar a Rota, selecionar a escola pesquisada
    Em Cadastrar Rota, em Vincular Escolar a Rota, clicar em Inserir
    Em Cadastrar Rota, clicar em Salvar
    Em Cadastrar Rota, clicar em OK no Modal
    Em Rotas, em Descrição, inserir "AUTOMACAO ROTA QA"
    Em Rotas, clicar em Pesquisar
    Em Rotas, verificar se a rota foi cadastrada

Cenário 71: Funcionalidade Tipos de Frotas
    [Documentation]    Esse teste verifica se é possível cadastrar, editar
    ...                editar e excluir uma Viagem                
    [Tags]             Viagens | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Configuração"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Tipos de Frotas"
    Em Tipos de Frotas, clicar em Cadastrar
    Em Tipos de Frotas, em Descrição, inserir "TIPO FROTA AUTOMACAO QA"
    Em Tipos de Frotas, em Sigla, inserir "TFA"
    Em Tipos de Frotas, clicar em Salvar
    Em Tipos de Frotas, clicar em OK no modal
    Em Tipos de Frotas, em Descrição, inserir o nome da frota cadastrado
    Em Tipos de Frotas, clicar em Pesquisar
    Em Tipos de Frotas, verificar se o tipo de rota foi cadastrado
    Em Tipos de Frotas, clicar em Ações e Editar
    Em Tipos de Frotas, em Descrição, inserir "TIPO FROTA AUTOMACAO EDITADO QA"
    Em Tipos de Frotas, clicar em Salvar
    Em Tipos de Frotas, clicar em OK no modal
    Em Tipos de Frotas, em Descrição, inserir o nome da frota cadastrado
    Em Tipos de Frotas, clicar em Pesquisar
    Em Tipos de Frotas, verificar se o tipo de rota foi cadastrado
    Em Tipos de Frotas, clicar em Ações e Excluir
    Em Tipos de Frotas, clicar em Sim no modal
    Em Tipos de Frotas, clicar em OK no modal
    Em Tipos de Frotas, clicar em Cadastrar
    Em Tipos de Frotas, em Descrição, inserir "TIPO FROTA AUTOMACAO QA"
    Em Tipos de Frotas, em Sigla, inserir "TFA"
    Em Tipos de Frotas, clicar em Salvar
    Em Tipos de Frotas, clicar em OK no modal
    Em Tipos de Frotas, em Descrição, inserir o nome da frota cadastrado

Cenário 72: Funcionalidade Frotas
    [Documentation]    Esse teste verifica se é possível cadastrar, editar
    ...                editar e excluir uma Viagem
    [Tags]             Viagens | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Frotas"
    Em Frotas, clicar em Cadastrar
    Em Frotas, em Descrição, inserir "FROTA AUTOMACAO QA"
    Em Frotas, em Sigla, inserir "FRAT"
    Em Frotas, em Tipo, selecionar "TIPO FROTA AUTOMACAO QA"
    Em Frotas, em Forma de Gerenciamento, selecionar "Frota Gerenciada"
    Em Frotas, clicar em Salvar
    Em Frotas, clicar em OK
    Em Frotas, em Descrição, inserir a frota cadastrada
    Em Frotas, clicar em Pesquisar
    Em Frotas, verificar se a frota foi cadastrada
    Em Frotas, clicar em Ações e Editar
    Em Frotas, em Descrição, inserir "FROTA AUTOMACAO EDITADA QA"
    Em Frotas, clicar em Salvar
    Em Frotas, clicar em OK
    Em Frotas, em Descrição, inserir a frota cadastrada
    Em Frotas, clicar em Pesquisar
    Em Frotas, verificar se a frota foi cadastrada
    Em Frotas, clicar em Ações e Excluir
    Em Frotas, clicar em Sim
    Em Frotas, clicar em OK
    Em Frotas, clicar em Cadastrar
    Em Frotas, em Descrição, inserir "FROTA AUTOMACAO QA"
    Em Frotas, em Sigla, inserir "FRAT"
    Em Frotas, em Tipo, selecionar "TIPO FROTA AUTOMACAO QA"
    Em Frotas, em Forma de Gerenciamento, selecionar "Frota Gerenciada"
    Em Frotas, clicar em Salvar
    Em Frotas, clicar em OK
    Em Frotas, em Descrição, inserir a frota cadastrada
    Em Frotas, clicar em Pesquisar
    Em Frotas, verificar se a frota foi cadastrada

Cenário 73: Funcionalidade Credenciamento de Condutores
    [Documentation]    Esse teste efetua o cadastro e edição do Credenciamento de Condutores                               
    [Tags]             Credenciamento de Condutores | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no eixo "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"
    Em Credenciamento de Condutores, clicar em Cadastrar Condutores
    Em Credenciamento de Condutores, clicar em Cadastro de Pessoa Juridica
    Em Cadastrar Fornecedores, inserir a razão social "TESTE AUTOMACAO"
    Em Cadastrar Fornecedores, inserir o nome fantasia "TESTE AUTOMACAO "
    Em Cadastrar Fornecedores, inserir um CNPJ aleatório
    Em Cadastrar Fornecedores, Clicar em Salvar
    Em Credenciamento de Condutores, clicar em Selecionar
    Em Credenciamento de Condutores, em data de inscrição do condutor, inserir "25/10/2022"
    Em Credenciamento de Condutores, clicar em Salvar e Próximo
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"
    Em Credenciamento de Condutores, Nome do Condutor selecionar o cadastro criado
    Em Credenciamento de Condutores, em consulta, clicar em Pesquisar
    Em Credenciamento de Condutores, verificar se o status está como "EM CADASTRO"
    Em Credenciamento de Condutores, clicar em Ações e Analisar Credenciamento
    Em Credenciamento de Condutores, clicar em Salvar e Próximo
    Em Credenciamento de Condutores, em Nome da Escola inserir "EPG ALFREDO VOLPI"
    Em Credenciamento de Condutores, clicar em Pesquisar
    Em Credenciamento de Condutores, selecionar o período "MANHÃ"
    Em Credenciamento de Condutores, selecionar o período "TARDE"
    Em Credenciamento de Condutores, clicar em INSERIR
    Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 2
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"
    Em Credenciamento de Condutores, Nome do Condutor selecionar o cadastro criado
    Em Credenciamento de Condutores, em consulta, clicar em Pesquisar
    Em Credenciamento de Condutores, verificar se o status está como "EM CADASTRO"
    Em Credenciamento de Condutores, clicar em Ações e Analisar Credenciamento
    Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 2
    Em Credenciamento de Condutores, selecionar a marca "HYUNDAI"
    Em Credenciamento de Condutores, selecionar o modelo "H100 GLS"
    Em Credenciamento de Condutores, selecionar o ano de fabricação "2020"
    Em Credenciamento de Condutores, selecionar o ano modelo "2020"
    Em Credenciamento de Condutores, inserir o código do veículo "TST AUT"
    Em Credenciamento de Condutores, inserir a placa do veículo "AUT"
    Em Credenciamento de Condutores, inserir o prefixo do veículo "TST AUT"
    Em Credenciamento de Condutores, inserir a cor do veículo "AZUL"
    Em Credenciamento de Condutores, selecionar o tipo do veículo "ÔNIBUS"
    Em Credenciamento de Condutores, selecionar o tipo do combústivel "Gasolina"
    Em Credenciamento de Condutores, selecionar a unidade de medida "Pessoas"
    Em Credenciamento de Condutores, inserir o número de eixos "2"
    Em Credenciamento de Condutores, selecionar o Estado do veículo "Sao Paulo"
    Em Credenciamento de Condutores, selecionar a Cidade do veículo "SAO PAULO"
    Em Credenciamento de Condutores, selecionar em veículo PCD "Sim"
    Em Credenciamento de Condutores, inserir em vagas convencionais "50"
    Em Credenciamento de Condutores, inserir em vagas PCD "50"
    Em Credenciamento de Condutores, clicar em Adicionar Veículo
    Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 3
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"
    Em Credenciamento de Condutores, Nome do Condutor selecionar o cadastro criado
    Em Credenciamento de Condutores, em consulta, clicar em Pesquisar
    Em Credenciamento de Condutores, verificar se o status está como "EM CADASTRO"
    Em Credenciamento de Condutores, clicar em Ações e Analisar Credenciamento
    Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 3
    Em Credenciamento de Condutores, selecionar 3 anexos
    Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 4
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"
    Em Credenciamento de Condutores, Nome do Condutor selecionar o cadastro criado
    Em Credenciamento de Condutores, em consulta, clicar em Pesquisar
    Em Credenciamento de Condutores, verificar se o status está como "AGUARDANDO DOCUMENTAÇÃO"
    Em Credenciamento de Condutores, clicar em Ações e Analisar Credenciamento
    Em Credenciamento de Condutores, selecionar os anexos restantes
    Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 4
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Credenciamento de Condutores"
    Em Credenciamento de Condutores, Nome do Condutor selecionar o cadastro criado
    Em Credenciamento de Condutores, em consulta, clicar em Pesquisar
    Em Credenciamento de Condutores, verificar se o status está como "AGUARDANDO ANÁLISE"
    Em Credenciamento de Condutores, verificar se o status da documentação está como "SIM"
    Em Credenciamento de Condutores, clicar em Ações e Analisar Credenciamento
    Em Credenciamento de Condutores, clicar em Salvar e Próximo no passo 4  
    Em Credenciamento de Condutores, em número do contrato inserir "AUTO 001"
    Em Credenciamento de Condutores, em vigência de contrato inserir "01/01/2022"
    Em Credenciamento de Condutores, clicar em Salvar e Fechar
    Em Credenciamento de Condutores, Nome do Condutor selecionar o cadastro criado
    Em Credenciamento de Condutores, em consulta, clicar em Pesquisar
    Em Credenciamento de Condutores, clicar em Ações e Credenciar
    Em Credenciamento de Condutores, clicar em Sim no Modal
    Em Credenciamento de Condutores, clicar em Ok no Modal
    Em Credenciamento de Condutores, verificar se o status está como "CREDENCIADO"

Cenário 74: Funcionalidade Viagens
    [Documentation]    Esse teste verifica se é possível cadastrar, editar
    ...                editar e excluir uma Viagem                
    [Tags]             Viagens | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Viagens"
    Em Viagens, clicar em Cadastrar
    Em Viagens, em Nome, inserir "VIAGEM AUTOMACAO"
    Em Cadastrar Viagens, em Rota, selecionar "AUTOMACAO ROTA"
    Em Cadastrar Viagens, em Vigência Inicial, inserir "01/01/2022"
    Em Cadastrar Viagens, em Vigência Final, inserir "31/12/2022"
    Em Cadastrar Viagens, em Frota, selecionar "FROTA INTERNA"
    Em Cadastrar Viagens, em Veículo, selecionar "RENAULT - SANDERO - FSN9561 DT2121"
    Em Cadastrar Viagens, em Horário Inicial De, inserir "06:00"
    Em Cadastrar Viagens, em Horário Inicial Até, inserir "08:00"
    Em Cadastrar Viagens, em Horário Final De, inserir "12:00"
    Em Cadastrar Viagens, em Horário Final Até, inserir "14:00"
    Em Cadastrar Viagens, em Dia da Semana, clicar em "TODOS"
    Em Cadastrar Viagens, clicar em Salvar
    Em Cadastrar Viagens, clicar em OK no modal
    Em Viagens, em Nome, inserir "VIAGEM AUTOMACAO"
    Em Cadastrar Viagens, clicar em Pesquisar
    Em Cadastrar Viagens, verificar se a viagem foi cadastrada
    Em Cadastrar Viagens, clicar em Ações e Editar
    Em Viagens, em Nome, inserir "VIAGEM AUTOMACAO EDITADO"
    Em Cadastrar Viagens, clicar em Salvar
    Em Cadastrar Viagens, clicar em OK no modal
    Em Viagens, em Nome, inserir "VIAGEM AUTOMACAO EDITADO"
    Em Cadastrar Viagens, clicar em Pesquisar
    Em Cadastrar Viagens, verificar se a viagem foi cadastrada
    Em Cadastrar Viagens, clicar em Ações e Excluir
    Em Cadastrar Viagens, clicar em Sim no modal
    Em Cadastrar Viagens, clicar em OK no modal
    Em Viagens, clicar em Cadastrar
    Em Viagens, em Nome, inserir "VIAGEM AUTOMACAO"
    Em Cadastrar Viagens, em Rota, selecionar "AUTOMACAO ROTA"
    Em Cadastrar Viagens, em Vigência Inicial, inserir "01/01/2022"
    Em Cadastrar Viagens, em Vigência Final, inserir "31/12/2022"
    Em Cadastrar Viagens, em Frota, selecionar "FROTA INTERNA"
    Em Cadastrar Viagens, em Veículo, selecionar "RENAULT - SANDERO - FSN9561 DT2121"
    Em Cadastrar Viagens, em Horário Inicial De, inserir "06:00"
    Em Cadastrar Viagens, em Horário Inicial Até, inserir "08:00"
    Em Cadastrar Viagens, em Horário Final De, inserir "12:00"
    Em Cadastrar Viagens, em Horário Final Até, inserir "14:00"
    Em Cadastrar Viagens, em Dia da Semana, clicar em "TODOS"
    Em Cadastrar Viagens, clicar em Salvar
    Em Cadastrar Viagens, clicar em OK no modal
    Em Viagens, em Nome, inserir "VIAGEM AUTOMACAO"
    Em Cadastrar Viagens, clicar em Pesquisar
    Em Cadastrar Viagens, verificar se a viagem foi cadastrada
    
Cenário 75: Funcionalidade Solicitação de Transporte - Infantil
    [Documentation]    Esse teste verifica se é possível solicitar um Transporte
    ...                pela Escola, para um educando da Etapa Infantil        
    [Tags]             Solicitação de Transporte - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Solicitação de Transporte"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Educação Infantil"
    Em Solicitação de Transporte, selecionar o curso "Pré-Escola"
    Em Solicitação de Transporte, selecionar a Situação "Sem solicitação"
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em um aluno para solicitar transporte
    Em Solicitação de Transporte, salvar o nome do aluno
    Em Solicitação de Transporte, clicar em Enviar para Análise
    Em Solicitação de Transporte, clicar em Sim no modal
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, clicar no perfil e em Trocar Perfil
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Gestão de Solicitação de Transporte"
    Em Solicitação de Transporte, selecionar a Situação "Aguardando Análise"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Educação Infantil"
    Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em Ações e Analisar Solicitação
    Em Solicitação de Transporte, clicar Deferir
    Em Solicitação de Transporte, clicar em Sim no modal
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, clicar no perfil e em Trocar Perfil
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Solicitação de Transporte"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Educação Infantil"
    Em Solicitação de Transporte, selecionar a Situação "Deferida sem Veiculo"
    Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em Ações e Editar
    Em Solicitação de Transporte, selecionar uma linha
    Em Solicitação de Transporte, clicar em Inserir
    Em Solicitação de Transporte, clicar em Salvar
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, selecionar a Situação "Deferida"
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, verificar se a solicitação foi deferida

Cenário 76: Funcionalidade Solicitação de Transporte - Fundamental
    [Documentation]    Esse teste verifica se é possível solicitar um Transporte
    ...                pela Escola, para um educando da Etapa Infantil        
    [Tags]             Solicitação de Transporte - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Solicitação de Transporte"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Ensino Fundamental"
    Em Solicitação de Transporte, selecionar a Situação "Sem solicitação"
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em um aluno para solicitar transporte
    Em Solicitação de Transporte, salvar o nome do aluno
    Em Solicitação de Transporte, clicar em Enviar para Análise
    Em Solicitação de Transporte, clicar em Sim no modal
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, clicar no perfil e em Trocar Perfil
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Gestão de Solicitação de Transporte"
    Em Solicitação de Transporte, selecionar a Situação "Aguardando Análise"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Ensino Fundamental"
    Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em Ações e Analisar Solicitação
    Em Solicitação de Transporte, clicar Deferir
    Em Solicitação de Transporte, clicar em Sim no modal
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, clicar no perfil e em Trocar Perfil
    Pesquisar "VOLPI" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Solicitação de Transporte"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Ensino Fundamental"
    Em Solicitação de Transporte, selecionar a Situação "Deferida sem Veiculo"
    Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em Ações e Editar
    Em Solicitação de Transporte, selecionar uma linha
    Em Solicitação de Transporte, clicar em Inserir
    Em Solicitação de Transporte, clicar em Salvar
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, selecionar a Situação "Deferida"
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, verificar se a solicitação foi deferida

Cenário 77: Funcionalidade Gestão de Solicitação de Transporte - Infantil
    [Documentation]    Esse teste verifica se é possível solicitar um Transporte
    ...                pela Escola, para um educando da Etapa Infantil        
    [Tags]             Solicitação de Transporte - Infantil | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Gestão de Solicitação de Transporte"
    Em Solicitação de Transporte, selecionar a Situação "Sem solicitação"
    Em Solicitação de Transporte, selecionar a escola "EPG ALFREDO VOLPI"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Educação Infantil"
    Em Solicitação de Transporte, selecionar o ciclo "Estágio II"
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em um aluno para solicitar transporte
    Em Solicitação de Transporte, salvar o nome do aluno
    Em Solicitação de Transporte, selecionar o Tipo de Transporte "TEG"
    Em Solicitação de Transporte, clicar Deferir
    Em Solicitação de Transporte, clicar em Sim no modal
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, selecionar a Situação "Deferida sem Veiculo"
    Em Solicitação de Transporte, selecionar a escola "EPG ALFREDO VOLPI"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Educação Infantil"
    Em Solicitação de Transporte, selecionar o ciclo "Estágio II"
    Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em Ações e Editar
    Em Solicitação de Transporte, selecionar uma linha
    Em Solicitação de Transporte, clicar em Inserir
    Em Solicitação de Transporte, clicar em Salvar
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, selecionar a Situação "Deferida"
    Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, verificar se a solicitação foi deferida

Cenário 78: Funcionalidade Gestão de Solicitação de Transporte - Fundamental
    [Documentation]    Esse teste verifica se é possível solicitar um Transporte
    ...                pela Escola, para um educando da Etapa Fundamental        
    [Tags]             Solicitação de Transporte - Fundamental | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Verificar se aparece o texto "Operação"
    Entrar no módulo "Transportes"
    Entrar na funcionalidade "Gestão de Solicitação de Transporte"
    Em Solicitação de Transporte, selecionar a Situação "Sem solicitação"
    Em Solicitação de Transporte, selecionar a escola "EPG ALFREDO VOLPI"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Ensino Fundamental"
    Em Solicitação de Transporte, selecionar o ciclo "5º Ano"
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em um aluno para solicitar transporte
    Em Solicitação de Transporte, salvar o nome do aluno
    Em Solicitação de Transporte, selecionar o Tipo de Transporte "TEG"
    Em Solicitação de Transporte, clicar Deferir
    Em Solicitação de Transporte, clicar em Sim no modal
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, selecionar a Situação "Deferida sem Veiculo"
    Em Solicitação de Transporte, selecionar a escola "EPG ALFREDO VOLPI"
    Em Solicitação de Transporte, selecionar a Etapa/Modalidade "Ensino Fundamental"
    Em Solicitação de Transporte, selecionar o ciclo "5º Ano"
    Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, clicar em Ações e Editar
    Em Solicitação de Transporte, selecionar uma linha
    Em Solicitação de Transporte, clicar em Inserir
    Em Solicitação de Transporte, clicar em Salvar
    Em Solicitação de Transporte, clicar em OK no modal
    Em Solicitação de Transporte, selecionar a Situação "Deferida"
    Em Solicitação de Transporte, inserir o nome do aluno solicitado
    Em Solicitação de Transporte, clicar em Pesquisar
    Em Solicitação de Transporte, verificar se a solicitação foi deferida

Cenário 79: Funcionalidade Aprendizagem
    [Documentation]    Esse teste efetua o cadastro, edição e exclusão de Aprendizem     
    [Tags]             Aprendizagem | Fluxo Positivo
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

Cenário 80: Funcionalidade Grupos de Pergunta
    [Documentation]    Esse teste efetua o cadastro, edição e exclusão de Aprendizem     
    [Tags]             Grupos de Pergunta | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Grupos de Pergunta"
    Em Grupos de Pergunta, clicar em Cadastrar
    Em Grupos de Pergunta, em Descrição inserir "GRUPO DE PERGUNTA AUTOMACAO"
    Em Grupos de Pergunta, em Sigla inserir "AUT"
    Em Grupos de Pergunta, clicar em Salvar
    Em Grupos de Pergunta, clicar em OK no modal
    Em Grupos de Pergunta, em Descrição inserir a descrição cadastrada
    Em Grupos de Pergunta, clicar em Pesquisar
    Em Grupos de Pergunta, clicar em Ações e Editar
    Em Grupos de Pergunta, em Descrição inserir "GRUPO DE PERGUNTA AUTOMACAO EDITADO"
    Em Grupos de Pergunta, clicar em Salvar
    Em Grupos de Pergunta, clicar em OK no modal
    Em Grupos de Pergunta, em Descrição inserir a descrição cadastrada
    Em Grupos de Pergunta, clicar em Pesquisar
    Em Grupos de Pergunta, clicar em Ações e Excluir
    Em Grupos de Pergunta, clicar em Sim no modal
    Em Grupos de Pergunta, clicar em OK no modal
    Em Grupos de Pergunta, em Descrição inserir a descrição cadastrada
    Em Grupos de Pergunta, clicar em Pesquisar
    Em Grupos de Pergunta, verificar se o cadastro foi excluído
    Em Grupos de Pergunta, clicar em OK no modal
    Em Grupos de Pergunta, clicar em Cadastrar
    Em Grupos de Pergunta, em Descrição inserir "GRUPO DE PERGUNTA AUTOMACAO"
    Em Grupos de Pergunta, em Sigla inserir "AUT"
    Em Grupos de Pergunta, clicar em Salvar
    Em Grupos de Pergunta, clicar em OK no modal
    Em Grupos de Pergunta, em Descrição inserir a descrição cadastrada
    Em Grupos de Pergunta, clicar em Pesquisar
    Em Grupos de Pergunta, verificar se o cadastro foi efetuado

Cenário 81: Funcionalidade Banco de Questões - Texto
    [Documentation]    Esse teste efetua o cadastro, edição e exclusão de Banco de Questões     
    [Tags]             Banco de Questões | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Banco de Questões"
    Em Banco de Questões, clicar em Cadastrar
    Em Banco de Questões, em Utilização da Questão, selecionar "Avaliação Educacional"
    Em Banco de Questões, em Texto Base para a Pergunta, inserir "Texto base pergunta 01 - Automação"
    Em Banco de Questões, em Pergunta, inserir "Pergunta Texto 01 - Automação"
    Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 1
    Em Banco de Questões, clicar em Anexar
    Em Banco de Questões, em Sigla, inserir "AUT01"
    Em Banco de Questões, em Tipo de Resposta, selecionar "ÚNICA RESPOSTA"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "GRUPO DE PERGUNTA AUTOMACAO"
    Em Banco de Questões, em Peso, inserir "20"
    Em Banco de Questões, em Nível da Questão, selecionar "Média"
    Em Banco de Questões, em Sigla Descrição de Aprendizagem, selecionar "TST01-2022"
    Em Banco de Questões, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Banco de Questões, em Ano/Ciclo, selecionar "5º Ano"
    Em Banco de Questões, em Respostas Permitidas, selecionar Texto
    Em Banco de Questões, em Resposta, inserir "RESPOSTA A"
    Em Banco de Questões, em Sigla Resposta, inserir "A"
    Em Banco de Questões, em Resposta Correta, selecionar SIM
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA CORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA B"
    Em Banco de Questões, em Sigla Resposta, inserir "B"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA C"
    Em Banco de Questões, em Sigla Resposta, inserir "C"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA D"
    Em Banco de Questões, em Sigla Resposta, inserir "D"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, clicar em Salvar
    Em Banco de Questões, clicar em OK no modal
    Em Banco de Questões, clicar em Cadastrar
    Em Banco de Questões, em Utilização da Questão, selecionar "Avaliação Educacional"
    Em Banco de Questões, em Texto Base para a Pergunta, inserir "Texto base pergunta 02 - Automação"
    Em Banco de Questões, em Pergunta, inserir "Pergunta Texto 02 - Automação"
    Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 2
    Em Banco de Questões, clicar em Anexar
    Em Banco de Questões, em Sigla, inserir "AUT02"
    Em Banco de Questões, em Tipo de Resposta, selecionar "ÚNICA RESPOSTA"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "GRUPO DE PERGUNTA AUTOMACAO"
    Em Banco de Questões, em Peso, inserir "20"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "Média"
    Em Banco de Questões, em Sigla Descrição de Aprendizagem, selecionar "TST02-2022"
    Em Banco de Questões, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Banco de Questões, em Ano/Ciclo, selecionar "5º Ano"
    Em Banco de Questões, em Respostas Permitidas, selecionar Texto
    Em Banco de Questões, em Resposta, inserir "RESPOSTA A"
    Em Banco de Questões, em Sigla Resposta, inserir "A"
    Em Banco de Questões, em Resposta Correta, selecionar SIM
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA CORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA B"
    Em Banco de Questões, em Sigla Resposta, inserir "B"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA C"
    Em Banco de Questões, em Sigla Resposta, inserir "C"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA D"
    Em Banco de Questões, em Sigla Resposta, inserir "D"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, clicar em Salvar
    Em Banco de Questões, clicar em OK no modal
    Em Banco de Questões, clicar em Cadastrar
    Em Banco de Questões, em Utilização da Questão, selecionar "Avaliação Educacional"
    Em Banco de Questões, em Texto Base para a Pergunta, inserir "Texto base pergunta 03 - Automação"
    Em Banco de Questões, em Pergunta, inserir "Pergunta Texto 03 - Automação"
    Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 3
    Em Banco de Questões, clicar em Anexar
    Em Banco de Questões, em Sigla, inserir "AUT03"
    Em Banco de Questões, em Tipo de Resposta, selecionar "ÚNICA RESPOSTA"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "GRUPO DE PERGUNTA AUTOMACAO"
    Em Banco de Questões, em Peso, inserir "20"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "Média"
    Em Banco de Questões, em Sigla Descrição de Aprendizagem, selecionar "TST03-2022"
    Em Banco de Questões, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Banco de Questões, em Ano/Ciclo, selecionar "5º Ano"
    Em Banco de Questões, em Respostas Permitidas, selecionar Texto
    Em Banco de Questões, em Resposta, inserir "RESPOSTA A"
    Em Banco de Questões, em Sigla Resposta, inserir "A"
    Em Banco de Questões, em Resposta Correta, selecionar SIM
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA CORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA B"
    Em Banco de Questões, em Sigla Resposta, inserir "B"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA C"
    Em Banco de Questões, em Sigla Resposta, inserir "C"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA D"
    Em Banco de Questões, em Sigla Resposta, inserir "D"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, clicar em Salvar
    Em Banco de Questões, clicar em OK no modal
    Em Banco de Questões, clicar em Cadastrar
    Em Banco de Questões, em Utilização da Questão, selecionar "Avaliação Educacional"
    Em Banco de Questões, em Texto Base para a Pergunta, inserir "Texto base pergunta 04 - Automação"
    Em Banco de Questões, em Pergunta, inserir "Pergunta Texto 04 - Automação"
    Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 4
    Em Banco de Questões, clicar em Anexar
    Em Banco de Questões, em Sigla, inserir "AUT04"
    Em Banco de Questões, em Tipo de Resposta, selecionar "ÚNICA RESPOSTA"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "GRUPO DE PERGUNTA AUTOMACAO"
    Em Banco de Questões, em Peso, inserir "20"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "Média"
    Em Banco de Questões, em Sigla Descrição de Aprendizagem, selecionar "TST04-2022"
    Em Banco de Questões, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Banco de Questões, em Ano/Ciclo, selecionar "5º Ano"
    Em Banco de Questões, em Respostas Permitidas, selecionar Texto
    Em Banco de Questões, em Resposta, inserir "RESPOSTA A"
    Em Banco de Questões, em Sigla Resposta, inserir "A"
    Em Banco de Questões, em Resposta Correta, selecionar SIM
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA CORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA B"
    Em Banco de Questões, em Sigla Resposta, inserir "B"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA C"
    Em Banco de Questões, em Sigla Resposta, inserir "C"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA D"
    Em Banco de Questões, em Sigla Resposta, inserir "D"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, clicar em Salvar
    Em Banco de Questões, clicar em OK no modal
    Em Banco de Questões, clicar em Cadastrar
    Em Banco de Questões, em Utilização da Questão, selecionar "Avaliação Educacional"
    Em Banco de Questões, em Texto Base para a Pergunta, inserir "Texto base pergunta 05 - Automação"
    Em Banco de Questões, em Pergunta, inserir "Pergunta Texto 05 - Automação"
    Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 5
    Em Banco de Questões, clicar em Anexar
    Em Banco de Questões, em Sigla, inserir "AUT05"
    Em Banco de Questões, em Tipo de Resposta, selecionar "ÚNICA RESPOSTA"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "GRUPO DE PERGUNTA AUTOMACAO"
    Em Banco de Questões, em Peso, inserir "20"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "Média"
    Em Banco de Questões, em Sigla Descrição de Aprendizagem, selecionar "TST05-2022"
    Em Banco de Questões, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Banco de Questões, em Ano/Ciclo, selecionar "5º Ano"
    Em Banco de Questões, em Respostas Permitidas, selecionar Texto
    Em Banco de Questões, em Resposta, inserir "RESPOSTA A"
    Em Banco de Questões, em Sigla Resposta, inserir "A"
    Em Banco de Questões, em Resposta Correta, selecionar SIM
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA CORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA B"
    Em Banco de Questões, em Sigla Resposta, inserir "B"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA C"
    Em Banco de Questões, em Sigla Resposta, inserir "C"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Resposta, inserir "RESPOSTA D"
    Em Banco de Questões, em Sigla Resposta, inserir "D"
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, clicar em Salvar
    Em Banco de Questões, clicar em OK no modal
    
Cenário 82: Funcionalidade Banco de Questões - Imagem
    [Documentation]    Esse teste efetua o cadastro, edição e exclusão de Banco de Questões     
    [Tags]             Banco de Questões | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Banco de Questões"
    Em Banco de Questões, clicar em Cadastrar
    Em Banco de Questões, em Utilização da Questão, selecionar "Avaliação Educacional"
    Em Banco de Questões, em Texto Base para a Pergunta, inserir "Texto base pergunta 01 - Automação"
    Em Banco de Questões, em Pergunta, inserir "Pergunta Imagem 01 - Automação"
    Em Banco de Questões, em Inserir Imagem na Pergunta, inserir a imagem da questão 1
    Em Banco de Questões, clicar em Anexar
    Em Banco de Questões, em Sigla, inserir "AUT01"
    Em Banco de Questões, em Tipo de Resposta, selecionar "ÚNICA RESPOSTA"
    Em Banco de Questões, em Grupo de Pergunta, selecionar "GRUPO DE PERGUNTA AUTOMACAO"
    Em Banco de Questões, em Peso, inserir "20"
    Em Banco de Questões, em Nível da Questão, selecionar "Média"
    Em Banco de Questões, em Sigla Descrição de Aprendizagem, selecionar "TST01-2022"
    Em Banco de Questões, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Banco de Questões, em Ano/Ciclo, selecionar "5º Ano"
    Em Banco de Questões, em Respostas Permitidas, selecionar Imagem
    Em Banco de Questões, em Resposta Correta, selecionar SIM
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA CORRETA AUTOMAÇÃO"
    Em Banco de Questões, em Inserir Imagem na Resposta, inserir a imagem da questão 1
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, em Texto Explicativo da Resposta, inserir "RESPOSTA INCORRETA AUTOMAÇÃO"
    Em Banco de Questões, em Inserir Imagem na Resposta, inserir a imagem da questão 2
    Em Banco de Questões, clicar em Adicionar
    Em Banco de Questões, clicar em Salvar
    Em Banco de Questões, clicar em OK no modal

Cenário 83: Funcionalidade Configurar Avaliação
    [Documentation]    Esse teste efetua o cadastro, edição e exclusão de uma Configuração de Avaliação     
    [Tags]             Configurar Avaliação | Fluxo Positivo
    Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
    Entrar com as credenciais "02867439817" e "12345678"
    Verificar se aparece o texto "Estrutura"
    Pesquisar "SECRETARIA" e selecionar o primeiro resultado
    Entrar no módulo "Configuração"
    Entrar no módulo "Avaliações Educacionais"
    Entrar na funcionalidade "Configurar Avaliação"
    Em Configurar Avaliação, clicar em Cadastrar
    Em Configurar Avaliação, em Nome da Avaliação, inserir "AVALIAÇÃO AUTOMAÇÃO"
    Em Configurar Avaliação, em Tipo de Lançamento, selecionar Consolidado
    Em Configurar Avaliação, em Aplicação da Avaliação, selecionar On Line
    Em Configurar Avaliação, em Proposta da Avaliação, inserir "PROPOSTA AVALIAÇÃO AUTOMAÇÃO" 
    Em Configurar Avaliação, em Modelo de Avaliação, selecionar "AVALIA MAIS - COMUNICAÇÃO E EXPRESSÃO" 
    Em Configurar Avaliação, em Periodo de Avaliação, selecionar "2º SEMESTRE" 
    Em Configurar Avaliação, em Situação, selecionar Ativo 
    Em Configurar Avaliação, em Situação, selecionar Individual Por Periodo 
    Em Configurar Avaliação, em Pergunta, inserir "PERGUNTA"
    Em Configurar Avaliação, em Resposta, inserir "RESPOSTA"
    Em Configurar Avaliação, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Configurar Avaliação, em Curso, selecionar "CICLO II"
    Em Configurar Avaliação, em Ano/Ciclo, selecionar "5º Ano"
    Em Configurar Avaliação, em Nível, selecionar "ABAIXO DO NÍVEL 1"
    Em Configurar Avaliação, em Pontuação de, inserir "0"
    Em Configurar Avaliação, em Pontuação até, inserir "125"
    Em Configurar Avaliação, em Regra de pontuação, inserir "MENOR OU IGUAL A 125."  
    Em Configurar Avaliação, em Critérios de correção, inserir "O EDUCANDO, NESTE NÍVEL, DEMONSTRA DESENVOLVIMENTO DOS SABERES E APRENDIZAGENS INSUFICIENTES PARA A SÉRIE/ANO."
    Em Configurar Avaliação, clicar em Adicionar
    Em Configurar Avaliação, em Nível, selecionar "NÍVEL 1"
    Em Configurar Avaliação, em Pontuação de, inserir "126"
    Em Configurar Avaliação, em Pontuação até, inserir "200"
    Em Configurar Avaliação, em Regra de pontuação, inserir "MAIOR QUE 125, MENOR OU IGUAL A 200."  
    Em Configurar Avaliação, em Critérios de correção, inserir "O EDUCANDO, NESTE NÍVEL, DEMONSTRA POUCO DESENVOLVIMENTO DOS SABERES E APRENDIZAGENS PARA A SÉRIE/ANO."
    Em Configurar Avaliação, clicar em Adicionar
    Em Configurar Avaliação, em Nível, selecionar "NÍVEL 2"
    Em Configurar Avaliação, em Pontuação de, inserir "201"
    Em Configurar Avaliação, em Pontuação até, inserir "275"
    Em Configurar Avaliação, em Regra de pontuação, inserir "MAIOR QUE 200, MENOR OU IGUAL A 275."  
    Em Configurar Avaliação, em Critérios de correção, inserir "O EDUCANDO, NESTE NÍVEL, DEMONSTRA DESENVOLVIMENTO ADEQUADO DOS SABERES E APRENDIZAGENS PARA A SÉRIE/ANO."
    Em Configurar Avaliação, clicar em Adicionar
    Em Configurar Avaliação, em Nível, selecionar "NÍVEL 3"
    Em Configurar Avaliação, em Pontuação de, inserir "276"
    Em Configurar Avaliação, em Pontuação até, inserir "350"
    Em Configurar Avaliação, em Regra de pontuação, inserir "MAIOR QUE 275, MENOR OU IGUAL A 350."  
    Em Configurar Avaliação, em Critérios de correção, inserir "O EDUCANDO, NESTE NÍVEL, DEMONSTRA DESENVOLVIMENTO DESEJÁVEL DOS SABERES E APRENDIZAGENS PARA A SÉRIE/ANO."
    Em Configurar Avaliação, clicar em Adicionar
    Em Configurar Avaliação, em Nível, selecionar "ACIMA DO NÍVEL 3"
    Em Configurar Avaliação, em Pontuação de, inserir "351"
    Em Configurar Avaliação, em Pontuação até, inserir "450"
    Em Configurar Avaliação, em Regra de pontuação, inserir "MAIOR QUE 350, MENOR OU IGUAL A 450."  
    Em Configurar Avaliação, em Critérios de correção, inserir "O EDUCANDO, NESTE NÍVEL, DEMONSTRA DESENVOLVIMENTO QUE EXCEDE AS EXPECTATIVAS DOS SABERES E APRENDIZAGENS PARA A SÉRIE/ANO."
    Em Configurar Avaliação, clicar em Adicionar
    Em Configurar Avaliação, clicar em Salvar
    Em Configurar Avaliação, clicar em OK no modal
    Em Configurar Avaliação, Cadastrar Questões, inserir a pergunta "Pergunta Imagem 01 - Automação"
    Em Configurar Avaliação, Cadastrar Questões, selecionar a Etapa/Modalidade "Ensino Fundamental"
    



    Em Configurar Avaliação, em Nome da Avaliação, inserir "AVALIAÇÃO AUTOMAÇÃO"
    Em Configurar Avaliação, em Etapa/Modalidade, selecionar "Ensino Fundamental"
    Em Configurar Avaliação, clicar em Pesquisar
    Em Configurar Avaliação, clicar em Ações e Questões
    Em Configurar Avaliação, em Pergunta, inserir "Pergunta Imagem 01 - Automação"
    Em Configurar Avaliação, em Etapa/Modalidade, selecionar "Pergunta Imagem 01 - Automação"
    



# Cenário 48: Funcionalidade Agendamento Avaliação
#     [Documentation]    Esse teste efetua o cadastro, edição e exclusão de um Agendamento de Avaliação     
#     [Tags]             Agendamento Avaliação | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "SECRETARIA" e selecionar o primeiro resultado
#     Entrar no módulo "Operação"
#     Entrar no módulo "Gestão de Avaliações"
#     Entrar na funcionalidade "Agendamento Avaliação"

# Cenário 49: Prova Online
#     [Documentation]    Esse teste efetua a prova online para um educando da Etapa - Fundamental     
#     [Tags]             Prova Online - Fundamental | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "4282670" e "4282670"
#     Clicar na Prova "Prova de Educação Qa"

# Cenário 50: Lançamento Individualizado
#     [Documentation]    Esse teste consulta e finaliza um Lançamento Individualizado     
#     [Tags]             Lançamento Individualizado | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "SECRETARIA" e selecionar o primeiro resultado
#     Entrar no módulo "Operação"
#     Entrar no módulo "Gestão de Avaliações"
#     Entrar na funcionalidade "Lançamento Individualizado"

# Cenário 51: Avaliações Educacionais Realizadas
#     [Documentation]    Esse teste efetua a consulta de uma Avaliação Educacional Realizada,
#     ...                validando os relatórios para uma escola
#     [Tags]             Avaliações Educacionais Realizadas | Fluxo Positivo
#     Acessar o ambiente "https://guarulhoshomolog.gier.com.br/"
#     Entrar com as credenciais "02867439817" e "12345678"
#     Verificar se aparece o texto "Estrutura"
#     Pesquisar "SECRETARIA" e selecionar o primeiro resultado
#     Entrar no módulo "Operação"
#     Entrar no módulo "Gestão de Avaliações"
#     Entrar na funcionalidade "Avaliações Educacionais Realizadas"
*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary

*** Variables ***


*** Keywords ***
Clicar no botão para solicitação de pré-inscrição Infantil 
Clicar no processo de demandas inicial 
Viualizar as informações importantes 
Clicar no botão Iniciar Inscrição para o Ensino Infantil 
Clicar em Data de Nascimento e informar "00/00/0000"
Visualizar a mensagem: DATA DE NASCIMENTO INVÁLIDA
Clicar em Data de Nascimento e informar "24/04/1993"
Clicar em Cep e informar 07032-000
Clicar em Número da Residência e informar 134
Clicar no botão Pesquisar Escolas 
Visualizar a mensagem: NÃO EXISTEM ESCOLAS DISPONÍVEIS A PARTIR DOS DADOS INFORMADOS
Clicar em Cep e informar 00000-002
Visualizar a mensagem: NÃO FOI POSSÍVEL LOCALIZAR A COORDENADA PARA LISTAR ESCOLAS, FAVOR ENTRAR EM CONTATO COM ADMINISTRADOR DO SERVIÇO.
Clicar em Data de Nascimento e informar "24/04/2021"
Clicar em Cep e informar 07032-000
Clicar em Número da Residência e informar 134
Clicar no botão Pesquisar Escolas 
Selecionar a escola na pesquisa realizada
Clicar no botão Selecionar Escolas(s)
Clicar no botão Próximo
Preencher os checks dos termos de responsabilidade
Visualizar a mensagem: EXISTEM CAMPOS OBRIGATÓRIOS NÃO PREENCHIDOS
Clicar em CPF do responsável e informar "000.000.000-00"
Visualizar a mensagem: O CPF INFORMADO É INVÁLIDO
Clicar em Data de Nascimento do responsável e informar "00/00/0000"
Visualizar a mensagem: CPF NÃO INFORMADO
Clicar em CPF do responsável e informar "891.290.380-22"
Clicar em Nome Completo do responsável e informar "Teste Nome Responavel"
Clicar em Data de Nascimento do responsável e informar "00/00/0000"
Visualizar a mensagem: DATA DE NASCIMENTO INVÁLIDA
Clicar em Data de Nascimento do responsável e informar "10/01/1965"
Visualizar a mensagem: NÃO É POSSÍVEL CONTINUAR COM A INSCRIÇÃO, DIRIJA -SE PESSOALMENTE À ESCOLA MAIS PRÓXIMA COM OS DOCUMENTOS
Clicar em Nome Completo do responsável e informar "Teste Nome Responavel Automacao"
Clicar em Data de Nascimento do responsável e informar "10/01/1965"
Clicar em Sexo do responsavel e selecionar "Masculino"
Preencher os checks dos termos de responsabilidade
Visualizar a mensagem: EXISTEM CAMPOS OBRIGATÓRIOS NÃO PREENCHIDOS
Clicar em Nacionalidade e selecionar "Brasileira"
Clicar em Nome Completo do cadidato e informar "Teste Nome Candidato"
Clicar em Sexo do candidato e selecionar "Feminino"
Clicar em Certidão de Nascimento, selecionar "Nova" e informar "0"
Visualizar a mensagem: NÚMERO DE CERTIDÃO DE NASCIMENTO INVÁLIDO. VERIFIQUE O NÚMERO CADASTRADO.
Clicar em Certidão de Nascimento, selecionar "Nova" e informar "11246201552019194299537624703623"
Clicar em Data de Emissão do candidato e informar "00/00/0000"
Clicar em Telefone 1 e informar "11999999999"
Preencher os checks dos termos de responsabilidade
Visualizar a mensagem: DATA DE EMISSÃO DA CERTIDÃO É INVÁLIDA
Clicar em Data de Emissão do candidato e informar "24/04/2021"
Preencher os checks dos termos de responsabilidade
Visualizar a mensagem: DATA DE EMISSÃO DA CERTIDÃO DE NASCIMENTO NÃO PODE SER MENOR OU IGUAL QUE A DATA DE NASCIMENTO
Clicar em Data de Emissão do candidato e informar "25/04/2021"
Preencher os checks dos termos de responsabilidade
Visualizar a mensagem: NÃO É POSSÍVEL CONTINUAR COM A INSCRIÇÃO, DIRIJA -SE PESSOALMENTE À ESCOLA MAIS PRÓXIMA COM OS DOCUMENTOS
Clicar em Nome Completo do cadidato e informar "Teste Nome Candidato Automacao"
Preencher os checks dos termos de responsabilidade
Visualizar a mensgem: A PESSOA TESTE NOME CANDIDATO AUTOMACAO JÁ ESTÁ INSCRITO(A) NA REDE DE ENSINO!
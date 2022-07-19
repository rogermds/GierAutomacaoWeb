*** Settings ***
Resource    ../../1-Hooks/1-Principal.robot
Library     SeleniumLibrary
Library     FakerLibrary
Library     DateTime

*** Variables ***
${botaoCadastrarLayout}                  btnCadastraLayout
${botaoSalvarPrimeiroPasso}              btnAvancaPrimeiroPasso
${botaoSalvarSegundoPasso}               btnAvancaSegundoPasso
${botaoSalvarTerceiroPasso}              btnAvancaTerceiroPasso
${botaoSalvarQuartoPasso}                btnAvancaQuartoPasso
${botaoInserirQuintoPasso}               btnInserirComprovante
${campoDescricao}                        txtDescricao
${botaoIncluirWeb}                       fupArquivoWeb
${botaoIncluirMobile}                    btnIncluirMobile
${campoDataWeb}                          txtDataInicioWeb
${campoDataMovel}                        txtDataInicioMobile
${campoArquivoWeb}                       btnBuscarArquivoWeb
${campoArquivoMovel}                     btnBuscarArquivoMobile
${AnoLetivo}                             ddlAnoLetivo

*** Keywords ***
Clicar em Cadastrar Layout
    Execute JavaScript  document.getElementById("${botaoCadastrarLayout}").click();
    Sleep    3

Clicar em Salvar e Próximo no passo 1
    Execute JavaScript  document.getElementById("${botaoSalvarPrimeiroPasso}").click();
    Sleep    3

Visualizar a mensagem: NECESSÁRIO PREENCHER O CAMPO DESCRIÇÃO DO PROCESSO PARA PROSSEGUIR.
    Wait Until Page Contains Element    //div[@class='msg left'][contains(.,'Necessário preencher o campo Descrição do Processo para prosseguir.')]
    Sleep    3

Em Descrição do Processo, inserir "${descricao}"
    Execute JavaScript  document.getElementById("${campoDescricao}").click();
    Input Text    ${campoDescricao}    ${descricao}
    Sleep    3
    
Visualizar a mensagem: NÃO É POSSÍVEL SALVAR O LAYOUT. JÁ EXISTE OUTRO LAYOUT CADASTRADO PARA O ANO LETIVO SELECIONADO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Não é possível salvar o layout. Já existe outro layout cadastrado para o ano letivo selecionado.')]
    Sleep    3    

Em Ano Letivo, selecionar o Ano Letivo Seguinte
    ${anoAtual}     Get Current Date    result_format=%Y
    ${anoSeguinte}    Evaluate     ${anoAtual}+1
    Execute JavaScript   $('#${AnoLetivo}').val("${anoSeguinte}").trigger('chosen:updated');
    Execute JavaScript   $('#${AnoLetivo}').trigger('change');

Em Banner Web clicar em Inserir
    Execute JavaScript  document.getElementById("${botaoIncluirWeb}").click(); 

Visualizar a mensagem: SELECIONE O ARQUIVO ANTES DE INCLUI-LO.
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'Selecione o arquivo antes de inclui-lo.')]
    Sleep    3
    
Em inserir Documento Web, inserir o arquivo "Crianças1.jpg"
    Choose File    ${campoArquivoWeb}    C:\Users\amanda.diniz\Pictures\Crianças1.jpg
    
Em Aplicar no Portal Web, inserir "${data}"
    Execute JavaScript  document.getElementById("${campoDataWeb}").click();
    Input Text    ${campoDataWeb}    ${data}
    
Visualizar a mensagem: DATA DE INÍCIO DA VIGÊNCIA DO BANNER INVÁLIDA. 
    Wait Until Page Contains Element    //span[contains(.,'Data de início da vigência do banner inválida.')]
    Sleep    3

Em Aplicar no Portal Web, inserir a data do dia atual
    Execute JavaScript  document.getElementById("${campoDataWeb}").click();
    Clear Element Text    ${campoDataWeb}
    Execute JavaScript  xPathResult = document.evaluate("${botaoDataHoje}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Sleep   2

Em inserir Documento móvel, inserir o arquivo "Crianças1.jpg"
    Execute JavaScript  document.getElementById("${campoArquivoMovel}").click();

Em Aplicar no Portal móvel, inserir "${data}" 
    Execute JavaScript  document.getElementById("${campoDataWeb}").click();
    Input Text    ${campoDataMovel}    ${data}
    Sleep   3
    
Em Banner móvel clicar em Inserir
    Execute JavaScript  document.getElementById("${botaoIncluirMobile}").click();
    Sleep   3

Em Aplicar no Portal móvel, inserir a data do dia atual
    Execute JavaScript  document.getElementById("${campoDataMovel}").click();
    Clear Element Text    ${campoDataMovel}
    Execute JavaScript  xPathResult = document.evaluate("${botaoDataHoje}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null);
    Execute JavaScript  xPathResult.singleNodeValue.click()
    Sleep   3
    
Clicar em Salvar e Próximo no passo 2
    Execute JavaScript  document.getElementById("${botaoSalvarSegundoPasso}").click();
    Sleep   3
    
Clicar em Salvar e Próximo no passo 3
    Execute JavaScript  document.getElementById("${botaoSalvarTerceiroPasso}").click();
    Sleep   3

Clicar em Salvar e Próximo no passo 4
    Execute JavaScript  document.getElementById("${botaoSalvarQuartoPasso}").click();
    Sleep   3

Clicar em inserir no passo 5    
    Execute JavaScript  document.getElementById("${botaoInserirQuintoPasso}").click();
    Sleep   3

Visualizar a mensagem: É NECESSÁRIO INFORMAR A OBSERVAÇÃO DO COMPROVANTE DE INSCRIÇÃO
    Wait Until Page Contains Element    //div[@class='divConteudo'][contains(.,'É necessário informar a observação do comprovante de inscrição')]
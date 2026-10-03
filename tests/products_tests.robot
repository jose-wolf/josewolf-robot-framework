*** Settings ***

Documentation    Testa na página de produtos no saucedemo.
Resource         ../resources/base.resource
Test Setup       Iniciar sessão de teste
Test Teardown    Encerrar sessão de teste

*** Test Cases ***

Cenário 1: Adicionar um item e validar o contador
    [Documentation]    Valida o acréscimo de 1 item no carrinho com a mochila.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Verificar se a página de produtos carregou
    Adicionar a mochila ao carrinho
    Validar contador no carrinho                1

Cenário 2: Adicionar múltiplos itens e conferir acumulação
    [Documentation]    Valida que mochila e bicicleta somam 2 itens no contador.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Verificar se a página de produtos carregou
    Adicionar a mochila ao carrinho
    Adicionar a bicicleta ao carrinho
    Validar contador no carrinho                2

Cenário 3: Validar detalhes da mochila e retorno à vitrine
    [Documentation]    Acessa a descrição detalhada do produto, valida o preço de $29.99 e volta à página principal.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Verificar se a página de produtos carregou
    Validar descrição do produto                $29.99
    Verificar se a página de produtos carregou

Cenário 4: Ordenar produtos do menor para o maior preço
    [Documentation]    Valida se a ordenação 'lohi' posiciona o item mais barato no topo.
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Verificar se a página de produtos carregou
    Ordenar produtos do menor ao maior valor    lohi
    Validar menor preço exibido no primeiro produto    $7.99
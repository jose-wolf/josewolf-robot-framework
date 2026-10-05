*** Settings ***

Documentation    Testes da página de carrinho (Your Cart) do SauceDemo.
Resource    ../resources/base.resource
Test Setup    Iniciar sessão de teste
Test Teardown    Encerrar sessão de teste

*** Test Cases ***

Cenário 1: Validar produtos exibidos no carrinho e ir para a próxima página
    [Documentation]    Adiciona mochila e bicicleta, acessa o carrinho e valida se os itens constam na lista.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Verificar se a página de produtos carregou
    Adicionar a bicicleta ao carrinho
    Adicionar a mochila ao carrinho
    Validar contador no carrinho                2
    Acessar o carrinho de compras
    Verificar se está na página do carrinho
    Validar produto presente no carrinho        Sauce Labs Backpack
    Validar produto presente no carrinho        Sauce Labs Bike Light
    Clicar em checkout


Cenário 2: Remove um produto do carrinho e atualiza contador
    [Documentation]    Valida a remoção de um produto e verifica o contador
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Verificar se a página de produtos carregou
    Adicionar a bicicleta ao carrinho
    Adicionar a mochila ao carrinho
    Validar contador no carrinho                2
    Acessar o carrinho de compras
    Verificar se está na página do carrinho
    Remover bicicleta do carrinho
    Validar que a bicicleta não está no carrinho
    Validar contador no carrinho    1

Cenário 3: Remove todos os protudos do carrinho e verificar contador
    [Documentation]    Valida a remoção dos produtos e verifica o contador
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Verificar se a página de produtos carregou
    Adicionar a bicicleta ao carrinho
    Adicionar a mochila ao carrinho
    Validar contador no carrinho                2
    Acessar o carrinho de compras
    Verificar se está na página do carrinho
    Remover bicicleta do carrinho
    Validar que a bicicleta não está no carrinho
    Remover mochila do carrinho
    Validar que a mochila não está no carrinho
    Validar que o carrinho está vazio

Cenário 4: Retornar à vitrine através do Continue Shopping
    [Documentation]    Garante que o botão Continue Shopping redireciona de volta para a tela de produtos.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Acessar o carrinho de compras
    Verificar se está na página do carrinho
    Clicar em continuar comprando
    Verificar se a página de produtos carregou

Cenário 5: Bloquear acesso direto à rota do carrinho sem login
    [Documentation]    Garante que a rota privada /cart.html exige login ativo conforme requisitos de segurança.
    ...    - Cenário negativo
    Tentar acessar a página do carrinho diretamente
    Validar bloqueio na sessão Cart por falta de autenticação
*** Settings ***
Documentation    Testes da página Checkout: Overview (Resumo do Pedido) no SauceDemo.
Resource         ../resources/base.resource
Test Setup       Iniciar sessão de teste
Test Teardown    Encerrar sessão de teste

*** Test Cases ***
Cenário 1: Validar título da página, subtotal, taxa e valor total dos produtos
    [Documentation]    Adiciona Mochila ($29.99) e Bicicleta ($9.99) e valida se os cálculos do resumo estão corretos.
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a bicicleta ao carrinho
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Preencher informações de checkout           Jose    Silva    87000-000
    Clicar no botão continuar
    Verificar se a página checkout overview carregou
    Validar produto presente no carrinho        Sauce Labs Backpack
    Validar produto presente no carrinho        Sauce Labs Bike Light
    Validar subtotal dos produtos               $39.98
    Validar valor da taxa                       $3.20
    Validar valor total final                   $43.18

Cenário 2: Finalizar compra com sucesso e ir para a confirmação
    [Documentation]    Clica no botão Finish e valida o avanço para a página de pedido concluído.
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Preencher informações de checkout           Jose    Silva    87000-000
    Clicar no botão continuar
    Verificar se a página checkout overview carregou
    Clicar no botão finalizar
    Wait Until Page Contains                    Checkout: Complete!

Cenário 3: Cancelar pedido no overview e retornar à vitrine
    [Documentation]    Garante que o botão Cancel na tela de overview redireciona de volta para a vitrine de produtos.
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Preencher informações de checkout           Jose    Silva    87000-000
    Clicar no botão continuar
    Verificar se a página checkout overview carregou
    Clicar no botão cancelar no overview
    Verificar se a página de produtos carregou

Cenário 4: Bloquear acesso direto à página de overview sem autenticação
    [Documentation]    Garante que a rota /checkout-step-two.html exige autenticação prévia.
    ...    - Cenário negativo
    Tentar acessar a página checkout overview diretamente
    Validar bloqueio de acesso ao checkout overview sem autenticação
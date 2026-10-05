*** Settings ***
Documentation    Testes na página Checkout: Complete! no SauceDemo.
Resource         ../resources/base.resource
Test Setup       Iniciar sessão de teste
Test Teardown    Encerrar sessão de teste

*** Test Cases ***
Cenário 1: Validar mensagens de confirmação e retornar à vitrine via Back Home
    [Documentation]    Realiza a compra completa, valida as mensagens de sucesso e retorna ao catálogo pelo botão Back Home.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Preencher informações de checkout           Jose    Silva    87000-000
    Clicar no botão continuar
    Clicar no botão finalizar
    Verificar se a página checkout complete carregou
    Validar mensagens de confirmação do pedido
    Clicar no botão voltar para a home
    Verificar se a página de produtos carregou

Cenário 2: Bloquear acesso direto à página de confirmação sem autenticação
    [Documentation]    Garante que a rota /checkout-complete.html exige autenticação prévia.
    ...    - Cenário negativo
    Tentar acessar a página checkout complete diretamente
    Validar bloqueio de acesso ao checkout complete sem autenticação
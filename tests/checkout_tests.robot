*** Settings ***

Documentation    Testes na página de Checkout: Your Information no SauceDemo.
Resource         ../resources/base.resource
Test Setup       Iniciar sessão de teste
Test Teardown    Encerrar sessão de teste

*** Test Cases ***
Cenário 1: Validar título da página e avanço com dados válidos
    [Documentation]    Preenche First Name, Last Name e Zip Code com dados válidos e avança para a visão geral.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Verificar se a página de checkout carregou
    Preencher informações de checkout           Jose    Silva    87000-000
    Clicar no botão continuar
    Wait Until Page Contains                    Checkout: Overview

Cenário 2: Cancelar checkout e retornar ao carrinho
    [Documentation]    Garante que o botão Cancel redireciona o usuário de volta para a tela de carrinho.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Verificar se a página de checkout carregou
    Clicar no botão cancelar
    Verificar se está na página do carrinho

Cenário Negativo 1: Validar erro ao submeter formulário sem First Name
    [Documentation]    Tenta continuar deixando o First Name em branco e valida a mensagem de erro.
    ...    - Cenário positivo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Verificar se a página de checkout carregou
    Preencher informações de checkout           ${EMPTY}    Silva    87000-000
    Clicar no botão continuar
    Verificar mensagem de erro no checkout      ${MSG_ERROR_FIRST_NAME}

Cenário 2: Validar erro ao submeter formulário sem Last Name
    [Documentation]    Tenta continuar deixando o Last Name em branco e valida a mensagem de erro.
    ...    - Cenário negativo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Verificar se a página de checkout carregou
    Preencher informações de checkout           Jose    ${EMPTY}    87000-000
    Clicar no botão continuar
    Verificar mensagem de erro no checkout      ${MSG_ERROR_LAST_NAME}

Cenário 3: Validar erro ao submeter formulário sem Zip/Postal Code
    [Documentation]    Tenta continuar deixando o Postal Code em branco e valida a mensagem de erro.
    ...    - Cenário negativo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Verificar se a página de checkout carregou
    Preencher informações de checkout           Jose    Silva    ${EMPTY}
    Clicar no botão continuar
    Verificar mensagem de erro no checkout      ${MSG_ERROR_POSTAL_CODE}

Cenário Negativo 4: Validar erro ao submeter formulário totalmente vazio
    [Documentation]    Tenta continuar com todos os campos em branco e valida a mensagem do primeiro campo obrigatório.
    ...    - Cenário negativo
    Preencher credenciais de acesso             standard_user    secret_sauce
    Submeter formulário de login
    Adicionar a mochila ao carrinho
    Acessar o carrinho de compras
    Clicar em checkout
    Verificar se a página de checkout carregou
    Preencher informações de checkout           ${EMPTY}    ${EMPTY}    ${EMPTY}
    Clicar no botão continuar
    Verificar mensagem de erro no checkout      ${MSG_ERROR_FIRST_NAME}

Cenário 5: Bloquear acesso direto à página de checkout sem autenticação
    [Documentation]    Garante que a rota /checkout-step-one.html exige autenticação prévia.
    ...    - Cenário negativo
    Tentar acessar a página de checkout diretamente
    Validar bloqueio de acesso ao checkout sem autenticação
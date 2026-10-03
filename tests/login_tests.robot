*** Settings ***

Resource         ../resources/base.resource
Test Setup       Iniciar sessão de teste
Test Teardown    Encerrar sessão de teste

*** Test Cases ***

Cenário 1: Realizar login com credenciais válidas
    [Documentation]    (cenário positivo)    Valida o acesso de um usuário padrão ao catálogo.
    Preencher credenciais de acesso    standard_user    secret_sauce
    Submeter formulário de login
    Wait Until Page Contains           Products

Cenário 2: Exibir erro ao informar senha incorreta
    [Documentation]    (cenário negativo)    Valida a mensagem informativa quando a senha não confere.
    Preencher credenciais de acesso    standard_user    senha_incorreta
    Submeter formulário de login
    Verificar mensagem de erro de autenticação    Username and password do not match

Cenário 3: username vazio e password correto 
    [Documentation]    (cenário negativo)    Valida mensagem de erro quando só tem username vazio.
    Preencher apenas a senha    secret_sauce
    Submeter formulário de login
    Verificar mensagem de erro de autenticação    Epic sadface: Username is required

Cenário 4: username preenchido e password vazio
    [Documentation]    (cenário negativo)    Valida mensagem de erro quando somente tem password vazio.
    Preencher apenas o username    standard_user
    Submeter formulário de login
    Verificar mensagem de erro de autenticação    Epic sadface: Password is required

    
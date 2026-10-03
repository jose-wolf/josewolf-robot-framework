*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}            https://www.saucedemo.com
${LOGIN_FIREFOX_BIN}    /snap/firefox/current/usr/lib/firefox/firefox

# Seletores com data-test (Padrão Ouro)
${INPUT_USER}           css:[data-test="username"]
${INPUT_PASSWORD}       css:[data-test="password"]
${BTN_LOGIN}            css:[data-test="login-button"]
${TXT_ERROR}            css:[data-test="error"]

*** Keywords ***
Preencher credenciais de acesso
    [Arguments]    ${usuario}    ${senha}
    Wait Until Element Is Visible    ${INPUT_USER}
    Input Text                       ${INPUT_USER}        ${usuario}
    Input Password                   ${INPUT_PASSWORD}    ${senha}

Preencher apenas a senha
    [Arguments]    ${senha}
    Wait Until Element Is Visible    ${INPUT_PASSWORD}
    Input Password    ${INPUT_PASSWORD}    ${senha}

Preencher apenas o username
    [Arguments]    ${usuario}
    Wait Until Element Is Visible    ${INPUT_USER}
    Input Text    ${INPUT_USER}    ${usuario}

Submeter formulário de login
    Click Button    ${BTN_LOGIN}

Verificar mensagem de erro de autenticação
    [Arguments]    ${mensagem_esperada}
    Wait Until Element Is Visible    ${TXT_ERROR}
    Element Should Contain           ${TXT_ERROR}    ${mensagem_esperada}
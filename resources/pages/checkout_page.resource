*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CHECKOUT_URL}             https://www.saucedemo.com/checkout-step-one.html
${CHECKOUT_TITLE}           css:[data-test="title"]
${INPUT_FIRST_NAME}         css:[data-test="firstName"]
${INPUT_LAST_NAME}          css:[data-test="lastName"]
${INPUT_POSTAL_CODE}        css:[data-test="postalCode"]
${BTN_CANCEL}               css:[data-test="cancel"]
${BTN_CONTINUE}             css:[data-test="continue"]
${ERROR_CONTAINER}          css:[data-test="error"]

${MSG_ERROR_FIRST_NAME}     Error: First Name is required
${MSG_ERROR_LAST_NAME}      Error: Last Name is required
${MSG_ERROR_POSTAL_CODE}    Error: Postal Code is required
${MSG_ERROR_AUTH_CHECKOUT}  Epic sadface: You can only access '/checkout-step-one.html' when you are logged in.

*** Keywords ***
Verificar se a página de checkout carregou
    Wait Until Element Is Visible    ${CHECKOUT_TITLE}
    Element Text Should Be           ${CHECKOUT_TITLE}    Checkout: Your Information

Preencher informações de checkout
    [Arguments]    ${first_name}    ${last_name}    ${postal_code}
    Input Text     ${INPUT_FIRST_NAME}     ${first_name}
    Input Text     ${INPUT_LAST_NAME}      ${last_name}
    Input Text     ${INPUT_POSTAL_CODE}    ${postal_code}

Clicar no botão continuar
    Wait Until Element Is Visible    ${BTN_CONTINUE}
    Click Button                     ${BTN_CONTINUE}

Clicar no botão cancelar
    Wait Until Element Is Visible    ${BTN_CANCEL}
    Click Button                     ${BTN_CANCEL}

Verificar mensagem de erro no checkout
    [Arguments]    ${mensagem_esperada}
    Wait Until Element Is Visible    ${ERROR_CONTAINER}
    Element Text Should Be           ${ERROR_CONTAINER}    ${mensagem_esperada}

Tentar acessar a página de checkout diretamente
    Go To                            ${CHECKOUT_URL}

Validar bloqueio de acesso ao checkout sem autenticação
    Verificar mensagem de erro no checkout    ${MSG_ERROR_AUTH_CHECKOUT}
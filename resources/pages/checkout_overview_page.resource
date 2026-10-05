*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${OVERVIEW_URL}              https://www.saucedemo.com/checkout-step-two.html
${OVERVIEW_TITLE}            css:[data-test="title"]
${LABEL_SUBTOTAL}            css:[data-test="subtotal-label"]
${LABEL_TAX}                 css:[data-test="tax-label"]
${LABEL_TOTAL}               css:[data-test="total-label"]
${BTN_FINISH}                css:[data-test="finish"]
${BTN_CANCEL_OVERVIEW}       css:[data-test="cancel"]
${ERROR_CONTAINER}           css:[data-test="error"]

${MSG_ERROR_AUTH_OVERVIEW}   Epic sadface: You can only access '/checkout-step-two.html' when you are logged in.

*** Keywords ***
Verificar se a página checkout overview carregou
    Wait Until Element Is Visible    ${OVERVIEW_TITLE}
    Element Text Should Be           ${OVERVIEW_TITLE}    Checkout: Overview

Validar subtotal dos produtos
    [Arguments]    ${subtotal_esperado}
    Wait Until Element Is Visible    ${LABEL_SUBTOTAL}
    Element Text Should Be           ${LABEL_SUBTOTAL}    Item total: ${subtotal_esperado}

Validar valor da taxa
    [Arguments]    ${taxa_esperada}
    Wait Until Element Is Visible    ${LABEL_TAX}
    Element Text Should Be           ${LABEL_TAX}    Tax: ${taxa_esperada}

Validar valor total final
    [Arguments]    ${total_esperado}
    Wait Until Element Is Visible    ${LABEL_TOTAL}
    Element Text Should Be           ${LABEL_TOTAL}    Total: ${total_esperado}

Clicar no botão finalizar
    Wait Until Element Is Visible    ${BTN_FINISH}
    Click Button                     ${BTN_FINISH}

Clicar no botão cancelar no overview
    Wait Until Element Is Visible    ${BTN_CANCEL_OVERVIEW}
    Click Button                     ${BTN_CANCEL_OVERVIEW}

Tentar acessar a página checkout overview diretamente
    Go To                            ${OVERVIEW_URL}

Validar bloqueio de acesso ao checkout overview sem autenticação
    Wait Until Element Is Visible    ${ERROR_CONTAINER}
    Element Text Should Be           ${ERROR_CONTAINER}    ${MSG_ERROR_AUTH_OVERVIEW}
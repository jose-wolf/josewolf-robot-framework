*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${COMPLETE_URL}              https://www.saucedemo.com/checkout-complete.html
${COMPLETE_TITLE}            css:[data-test="title"]
${COMPLETE_HEADER}           css:[data-test="complete-header"]
${COMPLETE_TEXT}             css:[data-test="complete-text"]
${BTN_BACK_HOME}             css:[data-test="back-to-products"]
${ERROR_CONTAINER}           css:[data-test="error"]

${MSG_TITLE_COMPLETE}        Checkout: Complete!
${MSG_HEADER_COMPLETE}       Thank you for your order!
${MSG_TEXT_COMPLETE}         Your order has been dispatched, and will arrive just as fast as the pony can get there!
${MSG_ERROR_AUTH_COMPLETE}   Epic sadface: You can only access '/checkout-complete.html' when you are logged in.

*** Keywords ***
Verificar se a página checkout complete carregou
    Wait Until Element Is Visible    ${COMPLETE_TITLE}
    Element Text Should Be           ${COMPLETE_TITLE}     ${MSG_TITLE_COMPLETE}

Validar mensagens de confirmação do pedido
    Wait Until Element Is Visible    ${COMPLETE_HEADER}
    Element Text Should Be           ${COMPLETE_HEADER}    ${MSG_HEADER_COMPLETE}
    Wait Until Element Is Visible    ${COMPLETE_TEXT}
    Element Text Should Be           ${COMPLETE_TEXT}      ${MSG_TEXT_COMPLETE}

Clicar no botão voltar para a home
    Wait Until Element Is Visible    ${BTN_BACK_HOME}
    Click Button                     ${BTN_BACK_HOME}

Tentar acessar a página checkout complete diretamente
    Go To                            ${COMPLETE_URL}

Validar bloqueio de acesso ao checkout complete sem autenticação
    Wait Until Element Is Visible    ${ERROR_CONTAINER}
    Element Text Should Be           ${ERROR_CONTAINER}    ${MSG_ERROR_AUTH_COMPLETE}
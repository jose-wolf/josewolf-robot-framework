*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${TITLE_CART}    css:[data-test="title"]
${ITEM_NAME_BACKPACK}    css:[data-test="item-4-title-link"] [data-test="inventory-item-name"]
${ITEM_NAME_BIKE}    css:[data-test="item-0-title-link"] [data-test="inventory-item-name"]
${BTN_REMOVE_BACKPACK}    css:[data-test="remove-sauce-labs-backpack"]
${BTN_REMOVE_BIKE}    css:[data-test="remove-sauce-labs-bike-light"]
${BTN_CONTINUE_SHOPPING}    css:[data-test="continue-shopping"]
${BTN_CHECKOUT}    css:[data-test="checkout"]
${BADGE_CART}    css:[data-test="shopping-cart-badge"]
${CART_URL}                  https://www.saucedemo.com/cart.html
${ROUTE_ERROR_CONTAINER}     css:[data-test="error"]
${CART_AUTH_ERROR_MSG}       Epic sadface: You can only access '/cart.html' when you are logged in.


*** Keywords ***
Verificar se está na página do carrinho
    Wait Until Element Is Visible    ${TITLE_CART}
    Element Text Should Be           ${TITLE_CART}    Your Cart

Validar produto presente no carrinho
    [Arguments]    ${nome_produto}
    Wait Until Page Contains         ${nome_produto}

Remover mochila do carrinho
    Wait Until Element Is Visible    ${BTN_REMOVE_BACKPACK}
    Click Button                     ${BTN_REMOVE_BACKPACK}

Remover bicicleta do carrinho
    Wait Until Element Is Visible    ${BTN_REMOVE_BIKE}
    Click Button                     ${BTN_REMOVE_BIKE}

Validar que a mochila não está no carrinho
    Wait Until Page Does Not Contain Element    ${BTN_REMOVE_BACKPACK}


Validar que a bicicleta não está no carrinho
    Wait Until Page Does Not Contain Element    ${BTN_REMOVE_BIKE}

Clicar em continuar comprando
    Wait Until Element Is Visible    ${BTN_CONTINUE_SHOPPING}
    Click Button                     ${BTN_CONTINUE_SHOPPING}

Clicar em checkout
    Wait Until Element Is Visible    ${BTN_CHECKOUT}
    Click Button                     ${BTN_CHECKOUT}

Validar que o carrinho está vazio
    Wait Until Page Does Not Contain Element    ${BADGE_CART}

Tentar acessar a página do carrinho diretamente
    Go To                            ${CART_URL}

Validar bloqueio na sessão Cart por falta de autenticação
    Wait Until Element Is Visible    ${ROUTE_ERROR_CONTAINER}
    Element Text Should Be           ${ROUTE_ERROR_CONTAINER}    ${CART_AUTH_ERROR_MSG}

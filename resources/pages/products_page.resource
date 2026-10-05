*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${TITLE}        css:[data-test="title"]
${ADD_LABS_BACKPACK}    css:[data-test="add-to-cart-sauce-labs-backpack"]
${ADD_LABS_BIKE}        css:[data-test="add-to-cart-sauce-labs-bike-light"]
${COUNT_CART_BADGE}    css:[data-test="shopping-cart-badge"]
${DESCRIPTION_LABS_BACKPACK}    css:[data-test="inventory-item-sauce-labs-backpack-img"]
${DESCRIPTION_PRICE_LABS_BACKPACK}    css:[data-test="inventory-item-price"]
${BACK_TO_PAGE_PRODUCTS}    css:[data-test="back-to-products"] 
${SELECT_SORT}              css:[data-test="product-sort-container"]
${FIRST_ITEM_PRICE}      css:.inventory_item:first-child [data-test="inventory-item-price"]   
${LINK_CARRINHO}    css:[data-test="shopping-cart-link"]
${INVENTORY_URL}             https://www.saucedemo.com/inventory.html
${ROUTE_ERROR_CONTAINER}     css:[data-test="error"]
${INVENTORY_AUTH_ERROR_MSG}  Epic sadface: You can only access '/inventory.html' when you are logged in.

*** Keywords ***

Verificar se a página de produtos carregou
    Wait Until Element Is Visible    ${TITLE}
    Element Text Should Be    ${TITLE}    Products

Adicionar a mochila ao carrinho
    Wait Until Element Is Visible    ${ADD_LABS_BACKPACK}
    Click Button    ${ADD_LABS_BACKPACK}

Adicionar a bicicleta ao carrinho
    Wait Until Element Is Visible    ${ADD_LABS_BIKE}
    Click Button    ${ADD_LABS_BIKE}

Validar contador no carrinho
    [Arguments]    ${quantidade}
    Wait Until Element Is Visible    ${COUNT_CART_BADGE}
    Element Text Should Be    ${COUNT_CART_BADGE}    ${quantidade}

Validar descrição do produto
    [Arguments]    ${descricao_preco_mochila}
    Wait Until Element Is Visible    ${DESCRIPTION_LABS_BACKPACK}
    Click Element    ${DESCRIPTION_LABS_BACKPACK}
    Wait Until Element Is Visible    ${DESCRIPTION_PRICE_LABS_BACKPACK}
    Element Text Should Be    ${DESCRIPTION_PRICE_LABS_BACKPACK}    ${descricao_preco_mochila}
    Click Button    ${BACK_TO_PAGE_PRODUCTS}

Voltar para a página de produtos
    Wait Until Element Is Visible    ${BACK_TO_PAGE_PRODUCTS}
    Click Button    ${BACK_TO_PAGE_PRODUCTS}

Ordenar produtos do menor ao maior valor
    [Arguments]    ${criterio}
    Wait Until Element Is Visible    ${SELECT_SORT}
    Select From List By Value        ${SELECT_SORT}    ${criterio}

Validar menor preço exibido no primeiro produto
    [Arguments]    ${preco_esperado}
    Wait Until Element Is Visible    ${FIRST_ITEM_PRICE}
    Element Text Should Be           ${FIRST_ITEM_PRICE}    ${preco_esperado}

Acessar o carrinho de compras
    Wait Until Element Is Visible    ${LINK_CARRINHO}
    Click Element                    ${LINK_CARRINHO}

Tentar acessar a página dos produtos diretamente
    Go To                            ${INVENTORY_URL}

Validar bloqueio na sessão Products por falta de autenticação
    Wait Until Element Is Visible    ${ROUTE_ERROR_CONTAINER}
    Element Text Should Be           ${ROUTE_ERROR_CONTAINER}    ${INVENTORY_AUTH_ERROR_MSG}
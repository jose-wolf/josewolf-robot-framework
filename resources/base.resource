*** Settings ***

Library    SeleniumLibrary
Resource    pages/login_page.resource
Resource    pages/products_page.resource
Resource    pages/cart_page.resource
Resource    pages/checkout_page.resource
Resource    pages/checkout_overview_page.resource
Resource    pages/checkout_complete_page.resource

*** Variables ***

${BROWSER}    firefox

*** Keywords ***

Iniciar sessão de teste
    Open Browser    ${LOGIN_URL}    ${BROWSER}  
    Maximize Browser Window

Encerrar sessão de teste
    Close Browser
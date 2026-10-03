*** Settings ***

Library    SeleniumLibrary
Resource   pages/login_page.resource

*** Keywords ***

Iniciar sessão de teste
    Open Browser    ${LOGIN_URL}    firefox    options=binary_location="${LOGIN_FIREFOX_BIN}"
    Maximize Browser Window

Encerrar sessão de teste
    Close Browser
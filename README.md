# Testes automatizados do SauceDemo com Robot Framework

Este projeto contém testes automatizados de interface (UI) da aplicação [SauceDemo](https://www.saucedemo.com/), desenvolvidos com Robot Framework e SeleniumLibrary, com o objetivo de validar seus principais fluxos funcionais.

## Tecnologias e Ferramentas utilizadas

- **Linguagem**: Python 3.12
- **Navegador**: Mozilla Firefox
- **Framework de Automatização**: Robot Framework v7.5
- **Biblioteca:** SeleniumLibrary

## Estrutura do projeto

```text
josewolf-robot-framework/
├── resources/
│   ├── base.resource
│   └── pages/
│       ├── login_page.resource
│       ├── products_page.resource
│       ├── cart_page.resource
│       ├── checkout_page.resource
│       ├── checkout_overview_page.resource
│       └── checkout_complete_page.resource
├── tests/
│   ├── login_tests.robot
│   ├── products_tests.robot
│   ├── cart_tests.robot
│   ├── checkout_tests.robot
│   ├── checkout_overview_tests.robot
│   └── checkout_complete_page_tests.robot
├── requirements.txt
└── README.md
```

- **resources/base.resource**: centraliza os recursos utilizados pelas suítes e o início/fim das sessões de teste.
- **resources/pages/**: contém as keywords e elementos relacionados a cada página da aplicação.
- **tests/**: contém as suítes e os cenários de teste automatizados.
- **requirements.txt:** contém as dependências necessárias para executar o projeto.

## Pré-requisitos

Antes de executar o projeto, é necessário ter instalado:

- Python 3.12
- Git
- Mozilla Firefox
- pip

## Como executar o projeto

1. Clonar o repositório

```bash
git clone https://github.com/jose-wolf/josewolf-robot-framework.git
cd josewolf-robot-framework
```

2. Criar e Ativar o ambiente Virtual (`.venv`)
- Linux
```Bash
python3 -m venv .venv
source .venv/bin/activate
```

- Windows no powershell
```Bash
python -m venv .venv
.venv\Scripts\activate
```

- Windows no Git Bash
```
python -m venv .venv
source .venv/Scripts/activate
```

3. Instalar as dependências
```Bash
pip install -r requirements.txt
```

4.  Executando os testes

- Executar todos os testes:
```Bash
robot -d results tests/
```

- Executar apenas uma suíte específica
```Bash
robot -d results tests/login_tests.robot
```

## Cenários cobertos

### Login

| ID | Cenário | Tipo | Resultado esperado |
| --- | --- | --- | --- |
| LOGIN-001 | Login com credenciais válidas | Positivo | Usuário acessa a página de produtos |
| LOGIN-002 | Login com senha incorreta | Negativo | Sistema exibe mensagem de erro de autenticação |
| LOGIN-003 | Login sem username | Negativo | Sistema informa que o username é obrigatório |
| LOGIN-004 | Login sem password | Negativo | Sistema informa que o password é obrigatório |

### Produtos

| ID | Cenário | Tipo | Resultado esperado |
| --- | --- | --- | --- |
| PROD-001 | Adicionar um item ao carrinho | Positivo | Contador do carrinho é atualizado para 1 |
| PROD-002 | Adicionar múltiplos itens | Positivo | Contador do carrinho é atualizado para 2 |
| PROD-003 | Visualizar detalhes de um produto | Positivo | Informações e preço do produto são exibidos corretamente |
| PROD-004 | Ordenar produtos do menor para o maior preço | Positivo | Produto de menor preço aparece primeiro |
| PROD-005 | Acessar catálogo diretamente sem login | Negativo | Sistema bloqueia o acesso e exige autenticação |

### Carrinho

| ID | Cenário | Tipo | Resultado esperado |
| --- | --- | --- | --- |
| CART-001 | Validar produtos adicionados ao carrinho | Positivo | Produtos selecionados aparecem no carrinho |
| CART-002 | Remover um produto do carrinho | Positivo | Produto é removido e contador é atualizado |
| CART-003 | Remover todos os produtos | Positivo | Carrinho fica vazio |
| CART-004 | Retornar à vitrine pelo Continue Shopping | Positivo | Usuário retorna à página de produtos |
| CART-005 | Acessar carrinho diretamente sem login | Negativo | Sistema bloqueia o acesso |

### Checkout — Informações

| ID | Cenário | Tipo | Resultado esperado |
| --- | --- | --- | --- |
| CHECKOUT-001 | Avançar com dados válidos | Positivo | Usuário é direcionado para Checkout Overview |
| CHECKOUT-002 | Cancelar checkout | Positivo | Usuário retorna ao carrinho |
| CHECKOUT-003 | Continuar sem First Name | Negativo | Sistema informa que First Name é obrigatório |
| CHECKOUT-004 | Continuar sem Last Name | Negativo | Sistema informa que Last Name é obrigatório |
| CHECKOUT-005 | Continuar sem Postal Code | Negativo | Sistema informa que Postal Code é obrigatório |
| CHECKOUT-006 | Continuar com formulário vazio | Negativo | Sistema apresenta erro de campo obrigatório |
| CHECKOUT-007 | Acessar checkout diretamente sem login | Negativo | Sistema bloqueia o acesso |

### Checkout — Overview

| ID | Cenário | Tipo | Resultado esperado |
| --- | --- | --- | --- |
| OVERVIEW-001 | Validar subtotal, taxa e total | Positivo | Valores calculados são apresentados corretamente |
| OVERVIEW-002 | Finalizar uma compra | Positivo | Usuário é direcionado para a confirmação do pedido |
| OVERVIEW-003 | Cancelar pedido no overview | Positivo | Usuário retorna à página de produtos |
| OVERVIEW-004 | Acessar overview diretamente sem login | Negativo | Sistema bloqueia o acesso |

### Checkout — Complete

| ID | Cenário | Tipo | Resultado esperado |
| --- | --- | --- | --- |
| COMPLETE-001 | Validar confirmação da compra e retornar à home | Positivo | Mensagem de sucesso é exibida e usuário retorna aos produtos |
| COMPLETE-002 | Acessar confirmação diretamente sem login | Negativo | Sistema bloqueia o acesso |

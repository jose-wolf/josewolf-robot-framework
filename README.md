# SauceDemo Test automatizado com Robot Framework

Este repositório contém testes para a aplicação no ![SauceDemo](https://www.saucedemo.com/).

## Tecnologias e Ferramentas utilizadas

- **Linguagem**: Python 3.12
- **Navegador**: Mozilla Firefox
- **Framework de Automatização**: Robot Framework v7.5
- **Bibliotecas**: Selenium Library

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

- Windows
```Bash
python -m venv .venv
.venv\Scripts\activate
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

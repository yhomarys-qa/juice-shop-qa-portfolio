# language: pt
Funcionalidade: Autenticação de Usuário (Login)
  Como um cliente cadastrado do OWASP Juice Shop
  Quero inserir minhas credenciais na tela de login
  Para acessar minha conta, visualizar meu perfil e finalizar compras

  Contexto: Instalação do Sistema
    Dado que estou na tela de login da aplicação

  Cenário: Login com sucesso
    Quando insiro um e-mail válido e cadastrado
    E insiro a senha correta correspondente
    E clico no botão "Log in"
    Então devo ser redirecionado para a página inicial (Homepage)
    E devo visualizar o meu perfil como autenticado

  Cenário: Submissão com campos vazios
    Quando deixo os campos "Email" e "Senha" em branco
    E tento submeter o formulário
    Então as mensagens de obrigatoriedade dos campos devem ser exibidas
    E o botão "Log in" deve permanecer desabilitado

  Cenário: Validação de formato de e-mail inválido
    Quando insiro um texto fora do formato padrão "usuario@dominio.com" no campo "Email"
    Então o sistema deve exibir uma mensagem de erro impeditiva
    E o botão "Log in" deve ser desabilitado

  Cenário: Tentativa de login com credenciais incorretas
    Quando insiro um e-mail não cadastrado ou uma senha incorreta
    E clico no botão "Log in"
    Então o sistema deve exibir a mensagem de erro genérica "Invalid email or password"
    E o acesso à conta deve ser impedido

  Cenário: Mascaramento e alternância de visibilidade da senha
    Quando digito os caracteres no campo "Senha"
    Então o texto deve ser mascarado por padrão por asteriscos ou bolinhas
    Quando clico no botão de alternância (ícone do olho)
    Então o texto da senha deve ser revealed em formato aberto

  Cenário: Submissão do formulário via teclado
    Quando preencho os campos "Email" e "Senha" com dados válidos
    E pressiono a tecla "Enter" no teclado
    Então o formulário deve ser submetido exatamente como se tivesse clicado em "Log in"

  Cenário: Navegação para fluxos alternativos
    Quando visualizo a parte inferior da tela de login
    Então devo conseguir clicar nos links "Forgot Password" e "Not yet a customer?" para ser redirecionado às respectivas telas

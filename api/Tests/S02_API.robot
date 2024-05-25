*** Settings ***
Documentation
Resource        ../Resources/POST_Resource.robot

*** Test Cases ***

CT01: Realizar uma requisição POST de inclusão de usuário
    [Tags]      S02CT01 - code 200
    [Documentation]     CARD - 001
    Dado que estou conectado na API     usuarios
    Quando envio a requisição para adicionar usuário
    Então a requisição deve retornar status     201
    E a mensagem     Cadastro realizado com sucesso

CT02: Realizar uma requisição POST de inclusão de usuário já existente
    [Tags]      S02CT02 - code 400
    [Documentation]     CARD - 002
    Dado que estou conectado na API     usuarios
    Quando envio a requisição para adicionar usuário já existente
    Então a requisição deve retornar status     400
    E a mensagem     Este email já está sendo usado    
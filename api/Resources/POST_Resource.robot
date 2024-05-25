*** Settings ***
Documentation
Library        RequestsLibrary

*** Variables ***
${base_url}    https://serverest.dev/
&{headers}=     Content-Type=application/json

*** Keywords ***

# --- DADO ---
Dado que estou conectado na API
    [Arguments]       ${endpoint}
    Create Session    alias=server_rest    url=${base_url}  headers=${headers}
    Session Exists     alias=server_rest

# --- QUANDO ---
Quando envio a requisição para adicionar usuário
    ${RESPONSE}     POST On Session      alias=server_rest    url=/usuarios   data={"nome": "Fulano da Silva","email": "teste34@qa.com.br", "password": "teste","administrador": "true"}
    Set Test Variable   ${RESPONSE}

Quando envio a requisição para adicionar usuário já existente
    ${RESPONSE}     POST On Session      alias=server_rest    url=/usuarios   data={"nome": "Fulano da Silva","email": "teste32@qa.com.br", "password": "teste","administrador": "true"}    expected_status=400
    Set Test Variable   ${RESPONSE}

# --- ENTÃO ---
Então a requisição deve retornar status
    [Arguments]     ${status_code}
    Status Should Be    ${status_code}

# --- E ---
E a mensagem
    [Arguments]     ${msg}
    Should Be Equal     ${RESPONSE.json()['message']}   ${msg}
    Log     ${RESPONSE.json()['message']}
    
    
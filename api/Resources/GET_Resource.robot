*** Settings ***
Documentation
Library            RequestsLibrary

*** Variables ***
${base_url}     https://reqres.in/api


*** Keywords ***

# --- DADO ---
Dado que estou conectado na API
    [Arguments]     ${endpoint}
    ${ALIAS}     Create Session      alias=lista_users   url=${base_url}/${endpoint}
    Session Exists      alias=lista_users

# --- QUANDO ---
Quando envio a requisição para consultar usuários
    ${RESPONSE}     Get on Session      alias=lista_users   url=${base_url}/users?page=2
    Set Test Variable   ${RESPONSE}

# --- ENTÃO ---
Então a requisição deve ocorrer com sucesso
    [Arguments]     ${status_code}
    Status Should Be    ${status_code}

# --- E ---
E deve ser retornado a quantidade de registros corretamente
    [Arguments]    ${qtde_esperada}
    #${qtde_retornada}   Get Length      ${RESPONSE.json()['data']}
    Should Be Equal     ${RESPONSE.json()['data'][0]['email']}    ${qtde_esperada}
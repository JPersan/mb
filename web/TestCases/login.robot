*** Settings ***
Resource    ../Pages/login.robot

*** Keywords ***

CT: Login com sucesso
    Dado que o usuário esteja na home
    Quando informar credenciais válidas
    Então realizara login com sucesso
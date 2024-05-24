*** Settings ***
Library     SeleniumLibrary
Resource    ../Resources/login.robot

*** Keywords ***

Dado que o usuário esteja na home
    Open Browser    https://www.saucedemo.com/  Chrome
    Maximize Browser Window
    Sleep   3s

Quando informar credenciais válidas
    Input Text  //input[@id='user-name']    standard_user
    Input Text  //input[@id='password']     secret_sauce
    Sleep   3s

Então realizara login com sucesso
    Click Button    //input[@id='login-button']
    Wait Until Element Is Visible   //div[@class='app_logo'][contains(.,'Swag Labs')]   5s
    Sleep   3s
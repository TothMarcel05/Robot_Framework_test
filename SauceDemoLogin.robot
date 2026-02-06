*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Login with standard user
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

login with standard_user wrong password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_saucee
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

login with wrong username and valid password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_userr
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

login without username
    Open Browser    https://www.saucedemo.com/    firefox 
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

Login without password
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Click Button    //*[@id="login-button"]
    Page Should Contain Element    //*[@id="shopping_cart_container"]/a
    Close Browser

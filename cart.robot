*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Add multiple products
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]
    Close Browser

# ---------------------------------------
# 1. Shopping cart functionality
#     
#     Remove products from the shopping cart
#     Check the contents of the shopping cart
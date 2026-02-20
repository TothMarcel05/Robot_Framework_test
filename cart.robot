*** Settings ***
Library           Selenium2Library

*** Keywords ***
Login to SauceDemo
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]

*** Test Cases ***
Add multiple products
    Login to SauceDemo
    Sleep   3s
    Click Button    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Sleep   1s    
    Click Button    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Sleep    1s
    Close Browser 

Remove products from the shopping cart
    Login to SauceDemo
    Sleep   3s
    Click Button    //*[@id="add-to-cart-sauce-labs-bolt-t-shirt"]
    Sleep   1s    
    Click Button    //*[@id="add-to-cart-sauce-labs-fleece-jacket"]
    Sleep    1s
    Click Button    //*[@id="remove-sauce-labs-bolt-t-shirt"]
    Sleep   1s    
    Click Button    //*[@id="remove-sauce-labs-fleece-jacket"]
    Sleep    1s
    Close Browser 

Check the contents of the shopping cart
    Login to SauceDemo
    Sleep   3s
    ${item_count}=  Get Element Count #cart_con
    Close Browser  
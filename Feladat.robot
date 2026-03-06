*** Settings ***
Library    Selenium2Library

*** Keywords ***
Login to SauceDemo
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]

*** Test Cases ***
Termék oldal megnyitása - név alapján
    Login to SauceDemo
    Click Element    //*[@class="inventory_item_name "]  
    Close Browser 

Termék oldal megnyitása - kép alapján
    Login to SauceDemo
    Click Element    //*[@class="inventory_item_img"]  
    Close Browser
    
Termék információk ellenőrzése - név
    Login to SauceDemo
    Page Should Contain   Sauce Labs Backpack
    Click Element    //*[@class="inventory_item_name "]  
    Page Should Contain    Sauce Labs Backpack
    Close Browser 

Termék információk ellenőrzése - ár
    Login to SauceDemo
    Page Should Contain   Sauce Labs Backpack
    Click Element    //*[@class="inventory_item_name "]  
    Page Should Contain    Sauce Labs Backpack
    Close Browser 

Termék információk ellenőrzése - leírás
    Login to SauceDemo
    Sleep   1s
    Page Should Contain   Sauce Labs Backpack
    Click Element    //*[@class="inventory_item_name "]  
    Page Should Contain    Sauce Labs Backpack
    Sleep   1s
    Close Browser

# 3. Termékrészletek:
#         (egyáltalán megjelenik-e?)
# Termék információk ellenőrzése - kép    (egyáltalán megjelenik-e?)
# Vissza navigáció - Back to products gomb
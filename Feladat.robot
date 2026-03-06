*** Settings ***
Library    Selenium2Library

*** Keywords ***
Login to SauceDemo
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]

*** Test Cases ***
#Termékrészletek:
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
    Page Should Contain   $29.99
    Click Element    //*[@class="inventory_item_price"]  
    Page Should Contain    $29.99
    Close Browser 

Termék információk ellenőrzése - leírás
    Login to SauceDemo
    Click Element    //*[@class="inventory_item_name "]  
    Page Should Contain    text=carry.allTheThings() with the sleek, streamlined Sly Pack that melds uncompromising style with unequaled laptop and tablet protection.
    Close Browser

Termék információk ellenőrzése - kép
    Login to SauceDemo    
    Click Element    //*[@class="inventory_item_name "] 
    Page Should Contain Image    //*[@class="inventory_details_img"]   
    Close Browser    

Vissza navigáció - Back to products gomb
    Login to SauceDemo
    Click Element    //*[@class="inventory_item_name "] 
    Click Button    //*[@id="back-to-products"]    
    Close Browser   

#Checkout validáció:

# Üres mezők ellenőrzése - név
# Üres mezők ellenőrzése - cím
# Üres mezők ellenőrzése - minden mező üres
# Érvénytelen adatok kezelése - túl hosszú név        ${long_name}=    Evaluate    "A" * 100
# Érvénytelen adatok kezelése - speciális karakterek
# Érvénytelen adatok kezelése - csak számok a névben
# Checkout megszakítása - Cancel gombbal    (Ellenőrzni, hogy a Cancel gomb megnyomásakor visszatér-e a kosár oldalra)
# Érvényes adatokkal sikeres checkout folytatás
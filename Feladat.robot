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
Üres mezők ellenőrzése - név
    Login to SauceDemo    
    Click Element    //*[@class="shopping_cart_container"] 
    Click Element    //*[@class="btn btn_action btn_medium checkout_button "] 
    Input Text    //*[@id="postal-code"]    6100      
    Click Element    //*[@class="submit-button btn btn_primary cart_button btn_action"] 
    Close Browser  

Üres mezők ellenőrzése - cím
    Login to SauceDemo    
    Click Element    //*[@class="shopping_cart_container"] 
    Click Element    //*[@class="btn btn_action btn_medium checkout_button "] 
    Input Text    //*[@id="first-name"]    Toth      
    Input Text    //*[@id="last-name"]    Marcel      
    Click Element    //*[@class="submit-button btn btn_primary cart_button btn_action"] 
    Close Browser

Üres mezők ellenőrzése - minden mező üres
    Login to SauceDemo    
    Click Element    //*[@class="shopping_cart_container"] 
    Click Element    //*[@class="btn btn_action btn_medium checkout_button "]     
    Click Element    //*[@class="submit-button btn btn_primary cart_button btn_action"] 
    Close Browser

Érvénytelen adatok kezelése - túl hosszú név
    Login to SauceDemo    
    Click Element    //*[@class="shopping_cart_container"] 
    Click Element    //*[@class="btn btn_action btn_medium checkout_button "]
    ${long_name}=    Evaluate    "A" * 10000   
    Input Text    //*[@id="first-name"]    ${long_name}      
    Input Text    //*[@id="last-name"]    ${long_name}
    Input Text    //*[@id="postal-code"]    6100
    Click Element    //*[@class="submit-button btn btn_primary cart_button btn_action"] 
    Sleep    5s
    Close Browser

Érvénytelen adatok kezelése - speciális karakterek
    Login to SauceDemo    
    Click Element    //*[@class="shopping_cart_container"] 
    Click Element    //*[@class="btn btn_action btn_medium checkout_button "]     
    Input Text    //*[@id="first-name"]    Toth$      
    Input Text    //*[@id="last-name"]    Marcel$
    Input Text    //*[@id="postal-code"]    6100$ 
    Click Element    //*[@class="submit-button btn btn_primary cart_button btn_action"] 
    Close Browser

Érvénytelen adatok kezelése - csak számok a névben
    Login to SauceDemo    
    Click Element    //*[@class="shopping_cart_container"] 
    Click Element    //*[@class="btn btn_action btn_medium checkout_button "]     
    Input Text    //*[@id="first-name"]    3213      
    Input Text    //*[@id="last-name"]    5668
    Input Text    //*[@id="postal-code"]    6100
    Click Element    //*[@class="submit-button btn btn_primary cart_button btn_action"] 
    Close Browser

Checkout megszakítása - Cancel gombbal
    Login to SauceDemo    
    Click Element    //*[@class="shopping_cart_container"] 
    Click Element    //*[@class="btn btn_action btn_medium checkout_button "]     
    Input Text    //*[@id="first-name"]    Toth      
    Input Text    //*[@id="last-name"]    Marcel
    Input Text    //*[@id="postal-code"]    6100
    Click Element    //*[@class="submit-button btn btn_primary cart_button btn_action"] 
    Click Element    //*[@id="cancel"]
    Close Browser

Érvényes adatokkal sikeres checkout folytatás
    Login to SauceDemo    
    Click Element    //*[@class="shopping_cart_container"] 
    Click Element    //*[@class="btn btn_action btn_medium checkout_button "]     
    Input Text    //*[@id="first-name"]    Toth      
    Input Text    //*[@id="last-name"]    Marcel
    Input Text    //*[@id="postal-code"]    6100
    Click Element    //*[@class="submit-button btn btn_primary cart_button btn_action"] 
    Click Element    //*[@id="finish"]
    Close Browser




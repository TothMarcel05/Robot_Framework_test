

*** Settings ***
Library           Selenium2Library

*** Keywords ***
Login to Parking Garage App
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element     //*[@class="button primary svelte-amvzu1"]
    Input Text    //*[@id="email"]    deakdani@gmail.com
    Input Password    //*[@id="password"]    a
    Click Button    //*[@id="login-button"]
    Sleep    1s
    

*** Test Cases ***
# 1. Bejelentkezes ellenorzese
# - Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
    Login to Parking Garage App
    Close Browser
 
# - Sikertelen bejelentkezes hibas jelszo eseten
Sikertelen bejelentkezes hibas jelszo eseten
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element     //*[@class="button primary svelte-amvzu1"]
    Input Text    //*[@id="email"]    deakdani@gmail.com
    Input Password    //*[@id="password"]    b
    Click Button    //*[@id="login-button"]
    Close Browser

# - Sikertelen bejelentkezes nem letezo felhasznaloval
Sikertelen bejelentkezes nem letezo felhasznaloval
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element     //*[@class="button primary svelte-amvzu1"]
    Input Text    //*[@id="email"]    deakdaniel@gmail.com
    Input Password    //*[@id="password"]    a
    Click Button    //*[@id="login-button"]
    Close Browser

# - Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element     //*[@class="button primary svelte-amvzu1"]
    Click Button    //*[@id="login-button"]
    Close Browser

# - Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
    Open Browser    https://parking-garage-app.netlify.app/    firefox
    Click Element     //*[@class="button primary svelte-amvzu1"]
    Input Text    //*[@id="email"]    deakdaniel@gmail.com
    Input Password    //*[@id="password"]    a
    Click Button    //*[@id="login-button"]
    Close Browser

# - Kijelentkezes utan vedett oldalak eleresenek tiltasa
Kijelentkezes utan vedett oldalak eleresenek tiltasa
    Login to Parking Garage App
    Click Element     //*[@class="nav-button logout-button svelte-d9gtjo"]
    Close Browser

# 2. Uj auto rogzitese
# - Sikeres uj auto felvitele (happy path)
Sikeres uj auto felvitele (happy path)
    Login to Parking Garage App
    Click Element     //*[@class="bi bi-car-front svelte-d9gtjo"]
    Sleep    1s
    Click Element     //*[@id="cars-link"]
    Sleep    1s
    Click Element     //*[@class="add-button svelte-1inzpfz"]
    Sleep    1s
    Input Text    //*[@id="brand"]    a   
    Input Text    //*[@id="model"]    a   
    Input Text    //*[@id="licensePlate"]    a    
    Click Element     //*[@class="submit-button svelte-1inzpfz"]
    Close Browser

    
# - Kotelezo mezok ellenorzese mentes elott
Kotelezo mezok ellenorzese mentes elott
    Login to Parking Garage App
    Click Element     //*[@class="bi bi-car-front svelte-d9gtjo"]
    Sleep    1s
    Click Element     //*[@id="cars-link"]
    Sleep    1s
    Click Element     //*[@class="add-button svelte-1inzpfz"]
    Sleep    1s  
    Click Element     //*[@class="submit-button svelte-1inzpfz"]
    Close Browser

# - Hibasan megadott rendszam formatum kezelese
Hibasan megadott rendszam formatum kezelese
    Login to Parking Garage App
    Click Element     //*[@class="bi bi-car-front svelte-d9gtjo"]
    Sleep    1s
    Click Element     //*[@id="cars-link"]
    Sleep    1s
    Click Element     //*[@class="add-button svelte-1inzpfz"]
    Sleep    1s  
    Input Text    //*[@id="licensePlate"]    $
    Click Element     //*[@class="submit-button svelte-1inzpfz"]
    Close Browser

# - Duplikalt rendszam mentesenek kezelese
Duplikalt rendszam mentesenek kezelese
    Login to Parking Garage App
    Click Element     //*[@class="bi bi-car-front svelte-d9gtjo"]
    Sleep    1s
    Click Element     //*[@id="cars-link"]
    Sleep    1s
    Click Element     //*[@class="add-button svelte-1inzpfz"]
    Sleep    1s  
    Input Text    //*[@id="licensePlate"]    ABC-123ABC-123
    Click Element     //*[@class="submit-button svelte-1inzpfz"]


# 3. Modositas es torles
# - Auto adatainak sikeres modositasa
Auto adatainak sikeres modositasa
    Login to Parking Garage App
    Click Element     //*[@class="bi bi-car-front svelte-d9gtjo"]
    Sleep    1s
    Click Element     //*[@id="cars-link"]
    Sleep    1s
    Click Element     //*[@class="add-button svelte-1inzpfz"]
    Sleep    1s
    Input Text    //*[@id="brand"]    a   
    Input Text    //*[@id="model"]    a   
    Input Text    //*[@id="licensePlate"]    a    
    Click Element     //*[@class="submit-button svelte-1inzpfz"]
# - Torles megerosito ablakkal
Torles megerosito ablakkal
    Login to Parking Garage App

# - Torles megszakitasa (Megse folyamattal)
Torles megszakitasa (Megse folyamattal)
    Login to Parking Garage App

# - Megerosito ablak gombjainak helyes mukodese
Megerosito ablak gombjainak helyes mukodese
    Login to Parking Garage App
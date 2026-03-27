

*** Settings ***
Library           Selenium2Library

*** Keywords ***
Login to Parking Garage App
    Open Browser    https://www.saucedemo.com/    firefox
    Input Text    //*[@id="user-name"]    standard_user
    Input Password    //*[@id="password"]    secret_sauce
    Click Button    //*[@id="login-button"]

*** Keywords ***
# 1. Bejelentkezes ellenorzese
# - Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
Sikeres bejelentkezes ervenyes felhasznalonevvel es jelszoval
    Login to Parking Garage App
 


# - Sikertelen bejelentkezes hibas jelszo eseten
# - Sikertelen bejelentkezes nem letezo felhasznaloval
# - Kotelezo mezok ellenorzese ures bejelentkezesi adatoknal
# - Hibauzenet helyes megjelenitese sikertelen bejelentkezesnel
# - Kijelentkezes utan vedett oldalak eleresenek tiltasa

# 2. Uj auto rogzitese
# - Sikeres uj auto felvitele (happy path)
# - Kotelezo mezok ellenorzese mentes elott
# - Hibasan megadott rendszam formatum kezelese
# - Duplikalt rendszam mentesenek kezelese

# 3. Modositas es torles
# - Auto adatainak sikeres modositasa
# - Torles megerosito ablakkal
# - Torles megszakitasa (Megse folyamattal)
# - Megerosito ablak gombjainak helyes mukodese
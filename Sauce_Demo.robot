*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Open Sauce Demo
    Open Browser    https://www.saucedemo.com/    firefox
    Sleep    3s
    Close Browser

Open Sauce Demo
    Open Browser    https://www.saucedemo.com/    chrome
    Sleep    3s
    Close Browser
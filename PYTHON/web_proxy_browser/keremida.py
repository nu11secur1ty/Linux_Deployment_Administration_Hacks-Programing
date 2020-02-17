#!/usr/bin/python3
from selenium import webdriver

print("Give a proxy for example: 0.0.0.0:1245\n")
PROXY = input() # IP:PORT or HOST:PORT

chrome_options = webdriver.ChromeOptions()
chrome_options.add_argument('--proxy-server=%s' % PROXY)

chrome = webdriver.Chrome(options=chrome_options)
chrome.get("http://whatismyipaddress.com")

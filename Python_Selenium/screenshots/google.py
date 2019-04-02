#!/usr/bin/python
# author @nu11secur1ty
from selenium import webdriver
#import os
#import datetime

chromedriver = '/usr/bin/chromedriver'
options = webdriver.ChromeOptions()

# No interface
options.add_argument('headless')

# Display size
options.add_argument('window-size=1200x600') # optional
browser = webdriver.Chrome(executable_path=chromedriver, chrome_options=options)
 
browser.get('https://www.google.com')
 
browser.save_screenshot('google.png')
#os.system("date > date.txt")
browser.quit()

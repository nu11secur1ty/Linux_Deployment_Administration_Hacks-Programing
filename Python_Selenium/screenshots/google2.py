from selenium import webdriver
from selenium.webdriver.chrome.options import Options
import time
 
# Provide a list of urls to create screenshots from
links = ['https://www.google.com','https://www.google.fr/']
 
# The Chrome and ChromeDriver Paths will vary based on your Operating System. 
# This example shows how to configure ChromeDriver for Mac
CHROME_PATH = '/path/to/your/google-chrome-stable'
CHROMEDRIVER_PATH = '/path/to/your/chromedriver'
 
# Set the Browser Size
WINDOW_SIZE = "1200,1200"
 
# Configure Chrome Options
chrome_options = Options()
chrome_options.add_argument("--headless")
chrome_options.add_argument("--window-size=%s" % WINDOW_SIZE)
chrome_options.binary_location = CHROME_PATH
 
driver = webdriver.Chrome(executable_path=CHROMEDRIVER_PATH,
                          options=chrome_options)
 
# Loop through the list of urls and save the screenshot
for link in links:
    driver.get(link)
 
    # sleep for 2 seconds to allow the page to fully load.
    time.sleep(2)
 
    # create a clean filename from the url
    str = link.split('://')[1]
    filename = str.replace('/','__')
    image = filename.replace('.','_') + ".png" 
 
    # save the screenshot
    driver.save_screenshot(image)
 
# Close Selenium
driver.close()

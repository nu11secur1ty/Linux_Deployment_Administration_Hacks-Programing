from bs4 import BeautifulSoup
import requests

source = requests.get('https://www.bet365.com/#/HO/').text
soup = BeautifulSoup(source, 'lxml')
bukluci = soup.find('script')
print(bukluci)
#print(soup.prettify)

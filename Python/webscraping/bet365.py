from bs4 import BeautifulSoup
import requests

source = requests.get('https://www.bet365.com/#/HO/').text
soup = BeautifulSoup(source, 'lxml')

# Print all content from <script></script>
# Ebasi tupotiqta :D
bukluci = soup.find('script')

# Da viim boklucite
print(bukluci)

# Da podredim vslichki bokluci v supata :D
#print(soup.prettify)

# author nu11secur1ty
from bs4 import BeautifulSoup
import urllib.request

# url investigated
urlpage = 'https://softuni.bg/blog/interview-ines-ivanova-python-development-module?fbclid=IwAR1d-panjpa9QMMNEfLG5VKxqcXtQoQkMxv0bfPwHsdw3OJBNBcJffbHucc'
page = urllib.request.urlopen(urlpage)
soup = BeautifulSoup(page, 'html.parser')
er = soup.find('div', attrs={'class': 'col-md-8 col-sm-12 col-xs-12 news-content detail'})
er1 = soup.find_all('h3')
print("\n")
print("Please check all bg text\n\n\n", er)
print("\n")
print("Specially\n\n\n", er1)

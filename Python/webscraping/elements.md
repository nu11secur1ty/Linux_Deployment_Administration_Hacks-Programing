Dealing with children and other descendants
In computer science and some branches of mathematics, you often hear about
horrible things done to children: moving them, storing them, removing them, and
even killing them. Fortunately, in BeautifulSoup, children are treated differently.
In the BeautifulSoup library, as well as many other libraries, there is a distinction
drawn between children and descendants: much like in a human family tree,
children are always exactly one tag below a parent, whereas descendants can be at
any level in the tree below a parent. For example, the tr tags are children of the

---------------------------------------------------------------------------------

table tag, whereas tr, th, td, img, and span are all descendants of the table tag
(at least in our example page). All children are descendants, but not all descendants
are children.
In general, BeautifulSoup functions will always deal with the descendants of the
current tag selected. For instance, bsObj.body.h1 selects the first h1 tag that is a
descendant of the body tag. It will not find tags located outside of the body.
Similarly, bsObj.div.findAll("img") will find the first div tag in the document,
then retrieve a list of all img tags that are descendants of that div tag.
If you want to find only descendants that are children, you can use the .children
tag:

```python
from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("http://www.pythonscraping.com/pages/page3.html")
bsObj = BeautifulSoup(html)

for child in bsObj.find("table",{"id":"giftList"}).children:
    print(child)

````
-----------------------------------------------------------------------------------

This code prints out the list of product rows in the giftList table. If you were to
write it using the descendants() function instead of the children() function,
about two dozen tags would be found within the table and printed, including img
tags, span tags, and individual td tags. It’s definitely important to differentiate
between children and descendants!
Dealing with siblings
The BeautifulSoup next_siblings() function makes it trivial to collect data from
tables, especially ones with title rows:


```python
from urllib.request import urlopen
from bs4 import BeautifulSoup

html = urlopen("http://www.pythonscraping.com/pages/page3.html")
bsObj = BeautifulSoup(html)
for sibling in bsObj.find("table",{"id":"giftList"}).tr.next_siblings:
    print(sibling)
```



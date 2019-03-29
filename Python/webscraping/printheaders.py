import requests
d = requests.get('https://www.bet365.com/#/HO/')
print(d.headers)

# Output
# {'Cache-Control': 'private', 'Content-Type': 'text/html; charset=utf-8', 'X-AspNetMvc-Version': '5.2', 'Set-Cookie': 'aps03=lng=19&ct=31&cg=1&cst=0; expires=Thu, 29-Mar-2029 13:52:52 GMT; path=/, pstk=9C8402A119484C5D86C7D630FA5DB33E000003; domain=bet365.com; path=/', 'Strict-Transport-Security': 'max-age=2592000; includeSubDomains', 'X-XSS-Protection': '1; mode=block', 'X-Content-Type-Options': 'nosniff', 'Referrer-Policy': 'strict-origin-when-cross-origin', 'Date': 'Fri, 29 Mar 2019 14:52:52 GMT', 'Cteonnt-Length': '33914', 'Content-Encoding': 'gzip', 'Content-Length': '8793'}


If you enable verbose mode with -v when talking to a proxy, you will see that curl connects to the proxy instead of the remote server, and you will see that it uses a slightly different request line.

curl -v 0.0.0.0:00 http://www.example.com/

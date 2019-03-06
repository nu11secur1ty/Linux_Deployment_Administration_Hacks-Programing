# HTTP

An HTTP proxy is a proxy that the client speaks HTTP with to get the transfer done. curl will, by default, assume that a host you point out with -x or --proxy is an HTTP proxy, and unless you also specify a port number it will default to port 3128 (and the reason for that particular port number is purely historical).

If you want to request the example.com web page using a proxy on 192.168.0.1 port 8080, a command line could look like:
```bash
curl -x 0.0.0.0:00 http:/example.com/
```


If you enable verbose mode with ***-v*** when talking to a proxy, you will see that curl connects to the proxy instead of the remote server, and you will see that it uses a slightly different request line.

```bash
curl -v 0.0.0.0:00 http://example.com/
```

-----------------------------------------------------------------------------------------------------------

# HTTPS and proxy

HTTPS was designed to allow and provide secure and safe end-to-end privacy from the client to the server (and back). In order to provide that when speaking to an HTTP proxy, the HTTP protocol has a special request that curl uses to setup a tunnel through the proxy that it then can encrypt and verify. This HTTP method is known as CONNECT.

When the proxy tunnels encrypted data through to the remote server after a CONNECT method sets it up, the proxy cannot see nor modify the traffic without breaking the encryption:


```bash
curl -x proxy.example.com:80 https://example.com/
```

















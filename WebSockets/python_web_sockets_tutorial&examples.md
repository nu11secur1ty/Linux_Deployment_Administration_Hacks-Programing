# Getting started:


# Warning
```txt
This documentation is written for Python ≥ 3.5. If you’re using Python 3.4, you will have to adapt the code samples.
```
# Installation:
- websockets requires Python ≥ 3.4. Install it with:

```bash
pip install websockets
```
# Basic example:
- This section assumes Python ≥ 3.5. For older versions, read below.
  Here’s a WebSocket server example. It reads a name from the client, sends a greeting, and closes the connection.

```python
#!/usr/bin/env python

import asyncio
import websockets

async def hello(websocket, path):
    name = await websocket.recv()
    print("< {}".format(name))

    greeting = "Hello {}!".format(name)
    await websocket.send(greeting)
    print("> {}".format(greeting))

start_server = websockets.serve(hello, 'localhost', 8765)

asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()
```
- On the server side, the handler coroutine hello is executed once for each WebSocket connection. 
  The connection is  automatically closed when the handler returns.

# Here’s a corresponding client example.

```python
#!/usr/bin/env python

import asyncio
import websockets

async def hello():
    async with websockets.connect('ws://localhost:8765') as websocket:
        name = input("What's your name? ")
        await websocket.send(name)
        print("> {}".format(name))

        greeting = await websocket.recv()
        print("< {}".format(greeting))

asyncio.get_event_loop().run_until_complete(hello())
```

- async and await aren’t available in Python < 3.5. Here’s how to adapt the client example for older Python versions.

```python
#!/usr/bin/env python

import asyncio
import websockets

@asyncio.coroutine
def hello():
    websocket = yield from websockets.connect('ws://localhost:8765/')

    try:
        name = input("What's your name? ")
        yield from websocket.send(name)
        print("> {}".format(name))

        greeting = yield from websocket.recv()
        print("< {}".format(greeting))

    finally:
        yield from websocket.close()

asyncio.get_event_loop().run_until_complete(hello())
```

# Browser-based example:

- Here’s an example of how to run a WebSocket server and connect from a browser.
  Run this script in a console:

```python
#!/usr/bin/env python

import asyncio
import datetime
import random
import websockets

async def time(websocket, path):
    while True:
        now = datetime.datetime.utcnow().isoformat() + 'Z'
        await websocket.send(now)
        await asyncio.sleep(random.random() * 3)

start_server = websockets.serve(time, '127.0.0.1', 5678)

asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()
```


- Then open this HTML file in a browser.


```html
<!DOCTYPE html>
<html>
    <head>
        <title>WebSocket demo</title>
    </head>
    <body>
        <script>
            var ws = new WebSocket("ws://127.0.0.1:5678/"),
                messages = document.createElement('ul');
            ws.onmessage = function (event) {
                var messages = document.getElementsByTagName('ul')[0],
                    message = document.createElement('li'),
                    content = document.createTextNode(event.data);
                message.appendChild(content);
                messages.appendChild(message);
            };
            document.body.appendChild(messages);
        </script>
    </body>
</html>
```
# Common patterns:

You will usually want to process several messages during the lifetime of a connection. Therefore you must write a loop. Here are the basic patterns for building a WebSocket server.

# Consumer

- For receiving messages and passing them to a consumer coroutine:

```python
async def consumer_handler(websocket, path):
    async for message in websocket:
        await consumer(message)
```
Iteration terminates when the client disconnects.

Asynchronous iteration isn’t available in Python < 3.6; here’s the same code for earlier Python versions:

```python
async def consumer_handler(websocket, path):
    while True:
        message = await websocket.recv()
        await consumer(message)
```

recv() raises a ConnectionClosed exception when the client disconnects, which breaks out of the while True loop.


# Producer:

For getting messages from a producer coroutine and sending them:

```python
async def producer_handler(websocket, path):
    while True:
        message = await producer()
        await websocket.send(message)
```

send() raises a ConnectionClosed exception when the client disconnects, which breaks out of the while True loop.

# Both

You can read and write messages on the same connection by combining the two patterns shown above and running the two tasks in parallel:

```python
async def handler(websocket, path):
    consumer_task = asyncio.ensure_future(consumer_handler(websocket))
    producer_task = asyncio.ensure_future(producer_handler(websocket))
    done, pending = await asyncio.wait(
        [consumer_task, producer_task],
        return_when=asyncio.FIRST_COMPLETED,
    )

    for task in pending:
        task.cancel()
```

# Registration

If you need to maintain a list of currently connected clients, you must register clients when they connect and unregister them when they disconnect.


```python
connected = set()

async def handler(websocket, path):
    global connected
    # Register.
    connected.add(websocket)
    try:
        # Implement logic here.
        await asyncio.wait([ws.send("Hello!") for ws in connected])
        await asyncio.sleep(10)
    finally:
        # Unregister.
        connected.remove(websocket)
```

This simplistic example keeps track of connected clients in memory. This only works as long as you run a single process. In a practical application, the handler may subscribe to some channels on a message broker, for example.

# That’s all!

The design of the websockets API was driven by simplicity.

You don’t have to worry about performing the opening or the closing handshake, answering pings, or any other behavior required by the specification.

websockets handles all this under the hood so you don’t have to.


# Python < 3.5

- This documentation uses the await and async syntax introduced in Python 3.5.
  If you’re using Python 3.4, you must substitute:

```python
async def ...
```
with:

```python
@asyncio.coroutine
def ...
```
and:

```python
await ...
```
with:

```python
yield from ...
```

# Otherwise you will encounter a SyntaxError.

# Have fun... ;)




























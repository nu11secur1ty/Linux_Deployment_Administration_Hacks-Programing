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








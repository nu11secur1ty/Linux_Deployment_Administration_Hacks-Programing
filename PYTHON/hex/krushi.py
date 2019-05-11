#!/usr/bin/python
# by @nu11secur1ty
import base64
kratofe ='4E69207375207A616E696D61616169746965207320676C75706F737469207765206D6F6D6369203A29'
mamule = str(base64.b16decode(kratofe))[2:-1]
print (mamule)

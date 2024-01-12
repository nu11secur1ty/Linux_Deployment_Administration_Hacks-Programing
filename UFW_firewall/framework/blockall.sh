#!/bin/bash
# ufw default deny all # block everything
ufw default deny incoming
ufw default deny outgoing
ufw reload
ufw status

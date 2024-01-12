#!/usr/bin/bash
ufw default allow incoming
ufw default allow outgoing
ufw reload
ufw enable
ufw status

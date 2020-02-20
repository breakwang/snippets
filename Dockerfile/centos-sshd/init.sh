#!/bin/bash

change_passwd() {

local SSH_USERPASS=xxx

echo -e "$SSH_USERPASS\n$SSH_USERPASS" | (passwd --stdin root)
echo ssh user password: $SSH_USERPASS

}

change_passwd

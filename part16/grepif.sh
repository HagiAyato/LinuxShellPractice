#!/bin/bash

if grep -q 'bash' /etc/passwd; then
	echo 'bash found'
fi

#!/bin/bash

$datadir=/home

if [ ! -d "$datadir" ]; then
	echo "$datadir がありません"
else
	echo "$datadir はあります"
fi

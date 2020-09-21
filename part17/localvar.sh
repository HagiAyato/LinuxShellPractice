#!/bin/bash

func1()
{
	echo "func1: message = $message"
	local message="Guten tag"

}

message="Hello"
echo "main(1st): message = $message"
func1
echo "main(2nd): message = $message"

#!/bin/bash

if [ ! -d "for-touch" ]; then
	mkdir "for-touch"
fi

for i in $(seq 1 5)
do
	touch "for-touch/000${i}.txt"
done

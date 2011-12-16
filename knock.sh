#!/bin/sh

for i in "$@"; do
nc localhost -w 1 -q 1 "$i" < /dev/null > /dev/null 2> /dev/null &
sleep .05
done

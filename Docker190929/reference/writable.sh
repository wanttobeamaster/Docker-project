#!/bin/sh
for i in /home/test/test/*;do
    (ulimit -t 5;bash -x "$i")
    rm -f "$i"
done

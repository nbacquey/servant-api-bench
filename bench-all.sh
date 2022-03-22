#!/bin/bash
for i in  1 8 16 32 64 ; do ./bench-api.sh $i 18.5; ./bench-api.sh $i 19.0; done

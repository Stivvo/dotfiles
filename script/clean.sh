#!/bin/bash

#trizen -Syu
trizen -Rscn $(trizen -Qdtq)
trizen -c
paccache -ruk0
trizen -Scc


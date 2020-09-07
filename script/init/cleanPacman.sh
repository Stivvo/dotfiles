#!/bin/dash

pikaur -Rscn $(pikaur -Qdtq)
paccache -rk 2
paccache -ruk 2
pikaur -Scc

#!/bin/bash

pacaur -Rscn $(pacaur -Qdtq)
paccache -rk 2
paccache -ruk 2
pacaur -Scc

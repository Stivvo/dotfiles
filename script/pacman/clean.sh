#!/bin/bash

#pacaur -Syu
pacaur --noedit --noconfirm -Rscn $(pacaur -Qdtq)
pacaur --noedit --noconfirm
paccache -ruk0
pacaur --noedit --noconfirm -Scc


#!/bin/bash

echo "$(tr "\n" " " < packages.txt)"
trizen -S --needed "$(tr "\n" " " < packages.txt)"

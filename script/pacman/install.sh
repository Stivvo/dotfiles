#!/bin/bash

echo "$(tr "\n" " " < packages.txt)"
pacaur -S --needed "$(tr "\n" " " < packages.txt)"
